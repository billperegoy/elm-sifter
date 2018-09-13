module ScoreTests exposing (..)

import Test exposing (..)
import Expect
import Sifter exposing (..)


all : Test
all =
    describe "A Test Suite"
        [ test "A complete match from te string beginning scores 1.5" <|
            \() ->
                let
                    matchResult =
                        [ { match = "abc"
                          , submatches = []
                          , index = 0
                          , number = 1
                          }
                        ]
                in
                    Expect.within (Expect.Absolute 0.01) (computeScore "abc" matchResult) 1.5
        , test "A match of half the string not at the string start scores 0.5" <|
            \() ->
                let
                    matchResult =
                        [ { match = "cd"
                          , submatches = []
                          , index = 2
                          , number = 1
                          }
                        ]
                in
                    Expect.within (Expect.Absolute 0.01) (computeScore "abcd" matchResult) 0.5
        , test "A match of half the string at the string start scores 1.0" <|
            \() ->
                let
                    matchResult =
                        [ { match = "ab"
                          , submatches = []
                          , index = 0
                          , number = 1
                          }
                        ]
                in
                    Expect.equal (computeScore "abcd" matchResult) 1.0
        ]
