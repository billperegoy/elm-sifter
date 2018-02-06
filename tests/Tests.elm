module Tests exposing (..)

import Test exposing (..)
import Expect
import String
import Sifter


type alias Element =
    { firstName : String
    , lastName : String
    , address : String
    }


elem1 =
    { firstName = "Joe", lastName = "Johnson", address = "123 Hill Road" }


elem2 =
    { firstName = "Jane", lastName = "Bachman", address = "47 Blueberry Court" }


elem3 =
    { firstName = "Nancy", lastName = "Filmann", address = "1 Heartland Drive" }


data =
    [ elem1
    , elem2
    , elem3
    ]


config =
    { extractors =
        [ .firstName
        , .lastName
        , .address
        ]
    }


extractor =
    .firstName


all : Test
all =
    describe "A Test Suite"
        [ test "Can perform a simple match" <|
            \() ->
                Expect.equal (Sifter.sifter data extractor "Joe") [ elem1 ]
        , test "Can perform a case insensitive match" <|
            \() ->
                Expect.equal (Sifter.sifter data extractor "joe") [ elem1 ]
        ]
