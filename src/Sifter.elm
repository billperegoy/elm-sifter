module Sifter exposing (..)

import Regex


type SortOrder
    = Ascending
    | Descending


type ConjunctionType
    = And
    | Or


type alias SortFields a =
    { fields : List (a -> String)
    , order : SortOrder
    }


type alias Config a =
    { extractors : List (a -> String)
    , limit : Int
    , sort : SortFields a
    , filter : Bool
    , conjunction : ConjunctionType
    , respectWordBoundaries : Bool
    }


matchOne : (a -> String) -> String -> a -> ( Bool, a )
matchOne extractor string elem =
    let
        matcher =
            string
                |> Regex.regex
                |> Regex.caseInsensitive

        matchResult =
            Regex.contains matcher (extractor elem)
    in
        ( matchResult, elem )


sifter : List a -> Config a -> String -> List a
sifter data config string =
    let
        matcher =
            Regex.regex (string)

        extractor =
            config.extractors |> List.head
    in
        case extractor of
            Just e ->
                data
                    |> List.map (matchOne e string)
                    |> List.filter Tuple.first
                    |> List.map Tuple.second

            Nothing ->
                []
