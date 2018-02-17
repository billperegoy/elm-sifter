module Sifter exposing (..)

import Regex


type SortOrder
    = Ascending
    | Descending


type ConjunctionType
    = And
    | Or


type alias ScoredResult a =
    ( Float, a )


type alias SortField a =
    { field : Extractor a
    , order : SortOrder
    }


type alias Config a =
    { extractors : List (Extractor a)
    , limit : Int
    , sort : Maybe (SortField a)
    , filter : Bool
    , conjunction : ConjunctionType
    , respectWordBoundaries : Bool
    }


type alias Extractor a =
    a -> String


orReducer : List (ScoredResult a) -> Float
orReducer list =
    List.foldl (\result accum -> accum + Tuple.first result) 0.0 list
        / (toFloat <| List.length list)


reducer : ConjunctionType -> List (ScoredResult a) -> Float
reducer conjunction list =
    case conjunction of
        Or ->
            orReducer list

        And ->
            if List.all (\result -> Tuple.first result > 0.0) list then
                orReducer list
            else
                0.0


matchAgainstAllExtractors : ConjunctionType -> String -> a -> List (Extractor a) -> ScoredResult a
matchAgainstAllExtractors conjunction string elem extractors =
    let
        score =
            extractors
                |> List.map (\extractor -> matchTokens conjunction extractor string elem)
                |> reducer Or
    in
        ( score, elem )


tokenizeString : String -> List String
tokenizeString string =
    String.words string


matchTokens : ConjunctionType -> Extractor a -> String -> a -> ScoredResult a
matchTokens conjunction extractor string elem =
    let
        score =
            string
                |> tokenizeString
                |> List.map (\token -> matchOne extractor token elem)
                |> reducer conjunction
    in
        ( score, elem )


matchOne : Extractor a -> String -> a -> ScoredResult a
matchOne extractor string elem =
    let
        matcher =
            string
                |> Regex.regex
                |> Regex.caseInsensitive

        matchResult =
            Regex.find (Regex.AtMost 1) matcher (extractor elem)
    in
        ( computeScore string matchResult, elem )


startOfWordScore : Regex.Match -> Float
startOfWordScore matchResult =
    if matchResult.index == 0 then
        0.5
    else
        0.0


baseMatchScore : String -> Regex.Match -> Float
baseMatchScore string matchResult =
    (toFloat <| String.length (matchResult.match))
        / (toFloat <| String.length (string))


computeScore : String -> List Regex.Match -> Float
computeScore string matchResult =
    case matchResult of
        [] ->
            0.0

        elem :: _ ->
            baseMatchScore string elem + startOfWordScore elem


sifter : Config a -> String -> List a -> List a
sifter config string data =
    if String.length string == 0 then
        []
    else
        siftData config string data


siftData : Config a -> String -> List a -> List a
siftData config string data =
    data
        |> scoreDataSet config string
        |> filterZeroScores config.filter
        |> sortResults config.sort
        |> extractResults
        |> limitResults config.limit


filterZeroScores : Bool -> List (ScoredResult a) -> List (ScoredResult a)
filterZeroScores filter results =
    let
        filter_fn =
            if filter then
                \result -> Tuple.first result > 0
            else
                \result -> True
    in
        List.filter (\result -> filter_fn result) results



-- FIXNE - This may very well be backwards


sortFunction : SortField a -> ScoredResult a -> ScoredResult a -> Order
sortFunction sortField a b =
    if (Tuple.first a) == (Tuple.first b) then
        case sortField.order of
            Descending ->
                compare (sortField.field (Tuple.second a)) (sortField.field (Tuple.second b))

            Ascending ->
                compare (sortField.field (Tuple.second b)) (sortField.field (Tuple.second a))
    else
        compare (Tuple.first a) (Tuple.first b)


sortByField : SortField a -> List (ScoredResult a) -> List (ScoredResult a)
sortByField field results =
    results
        |> List.sortWith (\a b -> sortFunction field a b)
        |> List.reverse


sortResults : Maybe (SortField a) -> List (ScoredResult a) -> List (ScoredResult a)
sortResults sortField results =
    case sortField of
        Nothing ->
            results
                |> List.sortBy Tuple.first

        Just field ->
            sortByField field results


extractResults : List (ScoredResult a) -> List a
extractResults results =
    List.map Tuple.second results


limitResults : Int -> List a -> List a
limitResults limit results =
    List.take limit results


scoreDataSet : Config a -> String -> List a -> List (ScoredResult a)
scoreDataSet config string data =
    List.map (\datum -> matchAgainstAllExtractors config.conjunction string datum config.extractors) data
