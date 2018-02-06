module Sifter exposing (..)

import Regex


matchOne : a -> (a -> String) -> String -> ( Bool, a )
matchOne elem extractor string =
    let
        matcher =
            string
                |> Regex.regex
                |> Regex.caseInsensitive
    in
        ( Regex.contains matcher (extractor elem), elem )


sifter : List a -> (a -> String) -> String -> List a
sifter data config string =
    let
        matcher =
            Regex.regex (string)
    in
        data
            |> List.map (\elem -> matchOne elem config string)
            |> List.filter Tuple.first
            |> List.map Tuple.second
