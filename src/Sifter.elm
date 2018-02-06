module Sifter exposing (..)

import Regex


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


sifter : List a -> (a -> String) -> String -> List a
sifter data config string =
    let
        matcher =
            Regex.regex (string)
    in
        data
            |> List.map (matchOne config string)
            |> List.filter Tuple.first
            |> List.map Tuple.second
