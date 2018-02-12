module Main exposing (..)

import Html exposing (..)
import Html.Events exposing (..)
import Places exposing (..)
import Sifter exposing (..)


main : Program Never Model Msg
main =
    Html.beginnerProgram
        { model = init
        , view = view
        , update = update
        }



-- Model


type alias Place =
    { city : String
    , stateAbbrev : String
    , state : String
    }


type alias Model =
    { inputText : String
    , places : List Place
    }


init : Model
init =
    { inputText = ""
    , places = Places.all
    }



-- Update


type Msg
    = SetInputText String


update : Msg -> Model -> Model
update msg model =
    case msg of
        SetInputText text ->
            { model | inputText = text }



-- View


view : Model -> Html Msg
view model =
    let
        places =
            filteredPlaces model.inputText model.places
    in
        div []
            [ input [ onInput SetInputText ] []
            , ul []
                (List.map
                    (\e -> li [] [ text (e.city ++ ", " ++ e.stateAbbrev) ])
                    places
                )
            ]


config : Sifter.Config Place
config =
    { extractors = [ .city, .stateAbbrev, .state ]
    , limit = 15
    , sort =
        Just
            { field = .city
            , order = Sifter.Ascending
            }
    , filter = True
    , conjunction = Sifter.And
    , respectWordBoundaries = False
    }


filteredPlaces : String -> List Place -> List Place
filteredPlaces string places =
    Sifter.sifter config string places
