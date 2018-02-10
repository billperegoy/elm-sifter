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


reducer : List (ScoredResult a) -> Float
reducer list =
    List.foldl (\e accum -> accum + Tuple.first (e)) 0.0 list
        / (toFloat <| List.length list)


matchAll : String -> a -> List (Extractor a) -> ScoredResult a
matchAll string elem extractors =
    let
        score =
            extractors
                |> List.map (\extractor -> matchTokens extractor string elem)
                |> reducer
    in
        ( score, elem )


matchTokens : Extractor a -> String -> a -> ScoredResult a
matchTokens extractor string elem =
    let
        splitRegex =
            Regex.regex " +"

        tokens =
            Regex.split Regex.All splitRegex string

        score =
            tokens
                |> List.map (\token -> matchOne extractor token elem)
                |> reducer
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


sifter : List a -> Config a -> String -> List a
sifter data config string =
    if String.length string == 0 then
        []
    else
        siftData data config string


siftData : List a -> Config a -> String -> List a
siftData data config string =
    data
        |> List.map (\e -> matchAll string e config.extractors)
        |> List.filter (\e -> Tuple.first e > 0)
        |> List.sortBy Tuple.first
        |> List.reverse
        |> List.map Tuple.second
        |> List.take config.limit
