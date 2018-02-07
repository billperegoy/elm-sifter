module Tests exposing (..)

import Test exposing (..)
import Expect
import String
import Sifter exposing (..)


type alias Element =
    { firstName : String
    , lastName : String
    , address : String
    }


elem1 : Element
elem1 =
    { firstName = "Joe", lastName = "Johnson", address = "123 Hill Road" }


elem2 : Element
elem2 =
    { firstName = "Jane", lastName = "Bachman", address = "47 Blueberry Court" }


elem3 : Element
elem3 =
    { firstName = "Nancy", lastName = "Filmann", address = "1 Heartland Drive" }


data : List Element
data =
    [ elem1
    , elem2
    , elem3
    ]


config : Config Element
config =
    { extractors =
        [ .firstName
        , .lastName
        , .address
        ]
    , limit = 3
    , sort = { fields = [ .lastName, .firstName ], order = Descending }
    , filter = False
    , conjunction = Or
    , respectWordBoundaries = False
    }


extractor : Element -> String
extractor =
    .firstName


all : Test
all =
    describe "A Test Suite"
        [ test "Can perform a simple match in first field" <|
            \() ->
                Expect.equal (sifter data config "Joe") [ elem1 ]
        , test "Can perform a case insensitive match" <|
            \() ->
                Expect.equal (sifter data config "joe") [ elem1 ]
        , test "Can match address field" <|
            \() ->
                Expect.equal (sifter data config "blue") [ elem2 ]
        , test "Can return more than one match" <|
            \() ->
                Expect.equal (sifter data config "man") [ elem2, elem3 ]
        , test "Properly limits results" <|
            \() ->
                let
                    newConfig =
                        { config | limit = 1 }
                in
                    Expect.equal (sifter data newConfig "man") [ elem2 ]
        ]
