# elm-sifter

## Overview
`elm-sifter` is a library for contextually searching and sorting arrays of Elm
records. The user supplies a configuration that describes which fields to search
and some search rules and sifter returns a filtered list of records sorted by
most relevant. This library is specifically designed for auto-complete and is
inspired by [brianreavis/sifter.js](https://github.com/brianreavis/sifter.js).

## Demo
You can see a working demo of this library working with real city/state data at:
http://elm-sifter-demo.s3-website-us-east-1.amazonaws.com/

## Usage
```
type alias Place =
    { city : String
    , stateAbbrev : String
    , state : String
    }

config : Sifter.Config Place
config =
    { extractors = [ .city, .stateAbbrev, .state ]
    , limit = 15
    , sort = Nothing
    , filter = True
    , conjunction = Sifter.Or
    , respectWordBoundaries = False
    }

data =
    [
      { city = "Baltimore", stateAbbrev = "MD", state = "Maryland"}
    , { city = "Boston", stateAbbrev = "MA", state = "Massachusetts"}
    , { city = "Chicago", stateAbbrev = "IL", state = "Illinois"}
    ]


sifter config "b" data ==
    [
      { city = "Baltimore", stateAbbrev = "MD", state = "Maryland"}
    , { city = "Boston", stateAbbrev = "MA", state = "Massachusetts"}
    ]

sifter config "bos" data ==
    [{ city = "Boston", stateAbbrev = "MA", state = "Massachusetts"}]

```

