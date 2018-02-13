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
    { limit : String
    , inputText : String
    , places : List Place
    , config : Sifter.Config Place
    }


init : Model
init =
    { limit = "10"
    , inputText = ""
    , places = Places.all
    , config = config
    }



-- Update


type Msg
    = SetInputText String
    | SetLimit String


update : Msg -> Model -> Model
update msg model =
    case msg of
        SetInputText text ->
            { model | inputText = text }

        SetLimit text ->
            let
                limit =
                    text |> String.toInt |> Result.withDefault 0

                old_config =
                    model.config

                config =
                    { old_config | limit = limit }
            in
                { model | limit = text, config = config }



-- View


view : Model -> Html Msg
view model =
    let
        places =
            filteredPlaces model.config model.inputText model.places
    in
        div []
            [ label [] [ text "limit" ]
            , input [ onInput SetLimit ] []
            , showConfig model.config
            , input [ onInput SetInputText ] []
            , ul []
                (List.map
                    (\e -> li [] [ text (e.city ++ ", " ++ e.stateAbbrev) ])
                    places
                )
            ]


extractorsString : Sifter.Config Place -> String
extractorsString config =
    let
        extractorStrings =
            config.extractors
                |> List.map (\x -> getExtractorName x)
                |> String.join (", ")
    in
        "    { extractors = [ " ++ extractorStrings ++ " ]\n"


limitString : Sifter.Config Place -> String
limitString config =
    "    , limit = " ++ toString config.limit ++ "\n"


conjunctionString : Sifter.Config Place -> String
conjunctionString config =
    "    , conjunction = " ++ toString config.conjunction ++ "\n"


respectWordBoundariesString : Sifter.Config Place -> String
respectWordBoundariesString config =
    "    , respectWordBoundaries = " ++ toString config.respectWordBoundaries ++ "\n"


sortString : Sifter.Config Place -> String
sortString config =
    case config.sort of
        Nothing ->
            "    , sort = Nothing\n"

        Just sort ->
            "    , sort = Just { "
                ++ "field = "
                ++ getExtractorName sort.field
                ++ ", order = "
                ++ toString sort.order
                ++ " }\n"


filterString : Sifter.Config Place -> String
filterString config =
    "    , filter = " ++ toString config.filter ++ "\n"


getExtractorName : Extractor Place -> String
getExtractorName extractor =
    let
        place =
            { city = ".city"
            , stateAbbrev = ".stateAbbrev"
            , state = ".state"
            }
    in
        extractor place


showConfig : Sifter.Config Place -> Html Msg
showConfig config =
    pre []
        [ code []
            [ text
                ("    config =\n"
                    ++ extractorsString config
                    ++ limitString config
                    ++ conjunctionString config
                    ++ respectWordBoundariesString config
                    ++ sortString config
                    ++ filterString config
                    ++ "    }\n"
                )
            ]
        ]


config : Sifter.Config Place
config =
    { extractors = [ .city, .stateAbbrev, .state ]
    , limit = 10
    , sort =
        Just
            { field = .city
            , order = Sifter.Ascending
            }
    , filter = True
    , conjunction = Sifter.And
    , respectWordBoundaries = False
    }


filteredPlaces : Sifter.Config Place -> String -> List Place -> List Place
filteredPlaces config string places =
    Sifter.sifter config string places
