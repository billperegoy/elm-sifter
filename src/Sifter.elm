module Sifter
    exposing
        ( sifter
        , computeScore
        , Config
        , Extractor
        , SortField
        , SortOrder(..)
        , ConjunctionType(..)
        )

{-| This library is intended to be used with autocompete. A user can supply a list
of arbitrary Elm structs and a config describing what criteria to use to sift the data.

@docs sifter, computeScore

@docs Config, Extractor, SortField, SortOrder, ConjunctionType

-}

import Dict
import Regex


{-| Configuation definition for a config used by sifter to define sifting properties.

extractors: List of functions used to etract string fields from the element to be sifted

limit: Integer representing maximum number ofifted results to return

sort: Structure representing sort properties for sifted data

filter: Boolean denoting whether to sift or not

conjunction: Should multi-word search terms require all or one to match? (And, Or)

respectWordBoundaries: Boolean indicating whether matches only "count" at beginning of words

-}
type alias Config a =
    { extractors : List (Extractor a)
    , limit : Int
    , sort : Maybe (SortField a)
    , filter : Bool
    , conjunction : ConjunctionType
    , respectWordBoundaries : Bool
    }


{-| Extractors are how we describe how we access field information for our specific data type.
These are functions that take in that data type and return a string.
-}
type alias Extractor a =
    a -> String


{-| This is how we define sort characteristics when records have equal scores. We can define
a search field and an order (Ascending or Descending).
-}
type alias SortField a =
    { field : Extractor a
    , order : SortOrder
    }


{-| Define sort order types
-}
type SortOrder
    = Ascending
    | Descending


{-| Conjunction type used when multiple words are provided as a search term.
-}
type ConjunctionType
    = And
    | Or


type alias ScoredResult a =
    ( Float, a )


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


matchAgainstAllExtractors : Config a -> String -> a -> ScoredResult a
matchAgainstAllExtractors config string elem =
    let
        score =
            case config.extractors of
                [] ->
                    0

                list ->
                    list
                        |> List.map (\extractor -> matchTokens config extractor string elem)
                        |> reducer Or
    in
        ( score, elem )


matchTokens : Config a -> Extractor a -> String -> a -> ScoredResult a
matchTokens config extractor string elem =
    let
        score =
            string
                |> String.words
                |> List.map (\token -> matchOne extractor config.respectWordBoundaries token elem)
                |> reducer config.conjunction
    in
        ( score, elem )


matchOne : Extractor a -> Bool -> String -> a -> ScoredResult a
matchOne extractor respectWordBoundaries string elem =
    let
        stringMatcher =
            if respectWordBoundaries then
                "^" ++ string
            else
                string

        matcher =
            stringMatcher
                |> String.split ("")
                |> List.map lookupDiacritic
                |> String.join ("")
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


{-| Needs documentation.
-}
computeScore : String -> List Regex.Match -> Float
computeScore string matchResult =
    case matchResult of
        [] ->
            0.0

        elem :: _ ->
            baseMatchScore string elem + startOfWordScore elem


{-| Needs documentation.
-}
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
                |> List.reverse

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
    List.map (\datum -> matchAgainstAllExtractors config string datum) data


diacriticsDict : Dict.Dict String String
diacriticsDict =
    Dict.fromList
        [ ( "a", "[aḀḁĂăÂâǍǎȺⱥȦȧẠạÄäÀàÁáĀāÃãÅåąĄÃąĄ]" )
        , ( "b", "[b␢βΒB฿𐌁ᛒ]" )
        , ( "c", "[cĆćĈĉČčĊċC̄c̄ÇçḈḉȻȼƇƈɕᴄＣｃ]" )
        , ( "d", "[dĎďḊḋḐḑḌḍḒḓḎḏĐđD̦d̦ƉɖƊɗƋƌᵭᶁᶑȡᴅＤｄð]" )
        , ( "e", "[eÉéÈèÊêḘḙĚěĔĕẼẽḚḛẺẻĖėËëĒēȨȩĘęᶒɆɇȄȅẾếỀềỄễỂểḜḝḖḗḔḕȆȇẸẹỆệⱸᴇＥｅɘǝƏƐε]" )
        , ( "f", "[fƑƒḞḟ]" )
        , ( "g", "[gɢ₲ǤǥĜĝĞğĢģƓɠĠġ]" )
        , ( "h", "[hĤĥĦħḨḩẖẖḤḥḢḣɦʰǶƕ]" )
        , ( "i", "[iÍíÌìĬĭÎîǏǐÏïḮḯĨĩĮįĪīỈỉȈȉȊȋỊịḬḭƗɨɨ̆ᵻᶖİiIıɪＩｉ]" )
        , ( "j", "[jȷĴĵɈɉʝɟʲ]" )
        , ( "k", "[kƘƙꝀꝁḰḱǨǩḲḳḴḵκϰ₭]" )
        , ( "l", "[lŁłĽľĻļĹĺḶḷḸḹḼḽḺḻĿŀȽƚⱠⱡⱢɫɬᶅɭȴʟＬｌ]" )
        , ( "n", "[nŃńǸǹŇňÑñṄṅŅņṆṇṊṋṈṉN̈n̈ƝɲȠƞᵰᶇɳȵɴＮｎŊŋ]" )
        , ( "o", "[oØøÖöÓóÒòÔôǑǒŐőŎŏȮȯỌọƟɵƠơỎỏŌōÕõǪǫȌȍՕօ]" )
        , ( "p", "[pṔṕṖṗⱣᵽƤƥᵱ]" )
        , ( "q", "[qꝖꝗʠɊɋꝘꝙq̃]" )
        , ( "r", "[rŔŕɌɍŘřŖŗṘṙȐȑȒȓṚṛⱤɽ]" )
        , ( "s", "[sŚśṠṡṢṣꞨꞩŜŝŠšŞşȘșS̈s̈]" )
        , ( "t", "[tŤťṪṫŢţṬṭƮʈȚțṰṱṮṯƬƭ]" )
        , ( "u", "[uŬŭɄʉỤụÜüÚúÙùÛûǓǔŰűŬŭƯưỦủŪūŨũŲųȔȕ∪]" )
        , ( "v", "[vṼṽṾṿƲʋꝞꝟⱱʋ]" )
        , ( "w", "[wẂẃẀẁŴŵẄẅẆẇẈẉ]" )
        , ( "x", "[xẌẍẊẋχ]" )
        , ( "y", "[yÝýỲỳŶŷŸÿỸỹẎẏỴỵɎɏƳƴ]" )
        , ( "z", "[zŹźẐẑŽžŻżẒẓẔẕƵƶ]" )
        ]


lookupDiacritic : String -> String
lookupDiacritic char =
    Dict.get char diacriticsDict
        |> Maybe.withDefault char
