module SiftTests exposing (..)

import Test exposing (..)
import Expect
import Sifter exposing (..)


type alias NameElement =
    { name : String
    }


nameConfig : Config NameElement
nameConfig =
    { extractors = [ .name ]
    , limit = 10
    , sort = Nothing
    , filter = True
    , conjunction = Or
    , respectWordBoundaries = False
    }


type alias MultiElement =
    { name : String
    , address : String
    }


multiConfig : Config MultiElement
multiConfig =
    { extractors = []
    , limit = 10
    , sort = Nothing
    , filter = True
    , conjunction = Or
    , respectWordBoundaries = False
    }


all : Test
all =
    describe "A Test Suite"
        [ test "Returns an empty list with no search string" <|
            \() ->
                let
                    result =
                        sifter nameConfig "" [ { name = "Joe" } ]
                in
                    Expect.equal result []
        , test "Can process a simple match" <|
            \() ->
                let
                    result =
                        sifter nameConfig "Joe" [ { name = "Joe" } ]
                in
                    Expect.equal result [ { name = "Joe" } ]
        , test "Search is case insensitive" <|
            \() ->
                let
                    result =
                        sifter nameConfig "joe" [ { name = "Joe" } ]
                in
                    Expect.equal result [ { name = "Joe" } ]
        , test "Returns empty list if no match" <|
            \() ->
                let
                    result =
                        sifter nameConfig "mary" [ { name = "Joe" } ]
                in
                    Expect.equal result []
        , test "Can return more than one  match" <|
            \() ->
                let
                    data =
                        [ { name = "Joe Johnson" }
                        , { name = "Joe Smith" }
                        , { name = "Jane Doe" }
                        ]

                    result =
                        sifter nameConfig "joe" data
                in
                    Expect.equal result
                        [ { name = "Joe Johnson" }
                        , { name = "Joe Smith" }
                        ]
        , test "Can limit results" <|
            \() ->
                let
                    config =
                        { nameConfig | limit = 1 }

                    data =
                        [ { name = "Joe Johnson" }
                        , { name = "Joe Smith" }
                        , { name = "Jane Doe" }
                        ]

                    result =
                        sifter config "joe" data
                in
                    Expect.equal result [ { name = "Joe Johnson" } ]
        , test "Can handle multiple tokens in a search string with Or conjunction" <|
            \() ->
                let
                    data =
                        [ { name = "Joe Johnson" }
                        , { name = "Joe Smith" }
                        , { name = "Jane Doe" }
                        ]

                    result =
                        sifter nameConfig "smith joe" data
                in
                    Expect.equal result [ { name = "Joe Johnson" }, { name = "Joe Smith" } ]
        , test "Can handle multiple tokens in a search string with And conjunction" <|
            \() ->
                let
                    config =
                        { nameConfig | conjunction = And }

                    data =
                        [ { name = "Joe Johnson" }
                        , { name = "Joe Smith" }
                        , { name = "Jane Doe" }
                        ]

                    result =
                        sifter config "smith joe" data
                in
                    Expect.equal result [ { name = "Joe Smith" } ]
        , test "Can search on multiple fields" <|
            \() ->
                let
                    config =
                        { multiConfig | extractors = [ .name, .address ] }

                    data =
                        [ { name = "Joe Johnson", address = "Hill St" }
                        , { name = "Jane Doe", address = "Johnson St" }
                        ]

                    result =
                        sifter config "johnson" data
                in
                    Expect.equal result
                        [ { name = "Joe Johnson", address = "Hill St" }
                        , { name = "Jane Doe", address = "Johnson St" }
                        ]
        , test "Only searches with supplied extractors" <|
            \() ->
                let
                    config =
                        { multiConfig | extractors = [ .address ] }

                    data =
                        [ { name = "Joe Johnson", address = "Hill St" }
                        , { name = "Jane Doe", address = "Johnson St" }
                        ]

                    result =
                        sifter config "johnson" data
                in
                    Expect.equal result
                        [ { name = "Jane Doe", address = "Johnson St" } ]
        , test "If no extractors are provided, returns an empty list" <|
            \() ->
                let
                    data =
                        [ { name = "Joe Johnson", address = "Hill St" }
                        , { name = "Jane Doe", address = "Johnson St" }
                        ]

                    result =
                        sifter multiConfig "johnson" data
                in
                    Expect.equal result []
        ]
