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


reducer : ConjunctionType -> List ( Bool, a ) -> Bool
reducer conjunction list =
    case conjunction of
        Or ->
            List.foldl (\e accum -> accum || Tuple.first (e)) False list

        And ->
            List.foldl (\e accum -> accum && Tuple.first (e)) True list


matchAll : ConjunctionType -> String -> a -> List (Extractor a) -> ( Bool, a )
matchAll conjunction string elem extractors =
    let
        hasMatch =
            List.map (\e -> matchOne e string elem) extractors
                |> reducer conjunction
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
            |> List.map (\e -> matchAll config.conjunction string e config.extractors)
            |> List.filter Tuple.first
            |> List.map Tuple.second
            |> List.take config.limit
