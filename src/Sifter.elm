module Sifter exposing (..)

import Regex


type SortOrder
    = Ascending
    | Descending


type ConjunctionType
    = And
    | Or


type alias SortFields a =
    { fields : List (Extractor a)
    , order : SortOrder
    }


type alias Config a =
    { extractors : List (Extractor a)
    , limit : Int
    , sort : SortFields a
    , filter : Bool
    , conjunction : ConjunctionType
    , respectWordBoundaries : Bool
    }


type alias Extractor a =
    a -> String


reducer : List ( Bool, a ) -> Bool
reducer list =
    List.foldl (\e accum -> accum || Tuple.first (e)) False list


matchAll : String -> a -> List (Extractor a) -> ( Bool, a )
matchAll string elem extractors =
    let
        hasMatch =
            List.map (\e -> matchOne e string elem) extractors
                |> reducer
    in
        ( hasMatch, elem )


matchOne : Extractor a -> String -> a -> ( Bool, a )
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
    in
        data
            |> List.map (\e -> matchAll string e config.extractors)
            |> List.filter Tuple.first
            |> List.map Tuple.second
