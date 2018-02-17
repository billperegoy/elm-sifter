module ScoreTests exposing (..)

import Test exposing (..)
import Expect
import Sifter exposing (..)


all : Test
all =
    describe "A Test Suite"
        [ test "Score 1" <|
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
                    Expect.equal (computeScore "abc" matchResult) 1.5
        , test "Score 2" <|
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
