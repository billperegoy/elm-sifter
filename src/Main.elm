module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
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


type alias Place =
    { city : String
    , stateAbbrev : String
    , state : String
    }


type alias Model =
    { inputText : String
    , places : List Place
    , config : Sifter.Config Place
    }


init : Model
init =
    { inputText = ""
    , places = Places.all
    , config = initConfig
    }


type Msg
    = SetInputText String
    | SetLimit String
    | ToggleFilterCheckbox Bool
    | ToggleRespectWordBoundariesCheckbox Bool
    | ToggleSortCheckbox Bool
    | SetConjunction Sifter.ConjunctionType
    | SetSortOrder Sifter.SortOrder
    | UpdateExtractorList (Sifter.Extractor Place) Bool
    | SetFilterField (Sifter.Extractor Place)


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
                { model | config = config }

        ToggleFilterCheckbox value ->
            let
                old_config =
                    model.config

                config =
                    { old_config | filter = value }
            in
                { model | config = config }

        ToggleRespectWordBoundariesCheckbox value ->
            let
                old_config =
                    model.config

                config =
                    { old_config | respectWordBoundaries = value }
            in
                { model | config = config }

        SetConjunction value ->
            let
                old_config =
                    model.config

                config =
                    { old_config | conjunction = value }
            in
                { model | config = config }

        ToggleSortCheckbox value ->
            let
                old_config =
                    model.config

                config =
                    if value then
                        { old_config | sort = Just { field = .city, order = Sifter.Ascending } }
                    else
                        { old_config | sort = Nothing }
            in
                { model | config = config }

        SetSortOrder value ->
            let
                old_config =
                    model.config

                config =
                    case model.config.sort of
                        Nothing ->
                            old_config

                        Just s ->
                            let
                                new_sort =
                                    { s | order = value }
                            in
                                { old_config | sort = Just new_sort }
            in
                { model | config = config }

        UpdateExtractorList extractor value ->
            let
                old_config =
                    model.config
            in
                if value then
                    let
                        newExtractors =
                            extractor :: model.config.extractors

                        config =
                            { old_config | extractors = newExtractors }
                    in
                        { model | config = config }
                else
                    let
                        newExtractors =
                            List.filter
                                (\x -> not (extractorsEqual x extractor))
                                model.config.extractors

                        config =
                            { old_config | extractors = newExtractors }
                    in
                        { model | config = config }

        SetFilterField extractor ->
            let
                config =
                    model.config

                sort =
                    config.sort

                newSort =
                    case sort of
                        Nothing ->
                            sort

                        Just s ->
                            Just { s | field = extractor }

                newConfig =
                    { config | sort = newSort }
            in
                { model | config = newConfig }


view : Model -> Html Msg
view model =
    div [ class "container" ]
        [ header
        , mainBody model
        ]


header : Html Msg
header =
    div [ class "row" ]
        [ div [ class "col-12" ]
            [ div [ class "jumbotron jumbotron-fluid" ]
                [ div [ class "container" ]
                    [ h1 [ class "text-center" ] [ text "Elm-Sifter Demo Page" ]
                    ]
                ]
            ]
        ]


sideBar : Sifter.Config Place -> Html Msg
sideBar config =
    div [ class "col-8" ]
        [ limitInput config
        , fieldSelectCheckboxes config
        , filterCheckbox config
        , wordBoundariesCheckbox config
        , conjunctionRadio config
        , sortCheckbox config
        , sortDetails config
        , showConfig config
        ]


limitInput : Sifter.Config Place -> Html Msg
limitInput config =
    div [ class "form-group" ]
        [ label [ for "limit-input" ] [ text "limit" ]
        , input
            [ id "limit-input"
            , class "form-control"
            , value (toString config.limit)
            , onInput SetLimit
            ]
            []
        ]


extractorsEqual : Sifter.Extractor Place -> Sifter.Extractor Place -> Bool
extractorsEqual e1 e2 =
    let
        place =
            { city = "city"
            , stateAbbrev = "stateAbbrev"
            , state = "state"
            }
    in
        e1 place == e2 place


configContains : List (Sifter.Extractor Place) -> Sifter.Extractor Place -> Bool
configContains extractors extractor =
    let
        place =
            { city = "city"
            , stateAbbrev = "stateAbbrev"
            , state = "state"
            }
    in
        List.any (\x -> x place == extractor place) extractors


fieldSelectCheckboxes : Sifter.Config Place -> Html Msg
fieldSelectCheckboxes config =
    div []
        [ div [ class "form-check form-check-inline" ]
            [ input
                [ id "city-checkbox"
                , class "form-check-input"
                , type_ "checkbox"
                , checked (configContains config.extractors .city)
                , onCheck (UpdateExtractorList .city)
                ]
                []
            , label
                [ class "form-check-label"
                , for "city-checkbox"
                ]
                [ text "City" ]
            ]
        , div [ class "form-check form-check-inline" ]
            [ input
                [ id "state-abbrev-checkbox"
                , class "form-check-input"
                , type_ "checkbox"
                , checked (configContains config.extractors .stateAbbrev)
                , onCheck (UpdateExtractorList .stateAbbrev)
                ]
                []
            , label
                [ class "form-check-label"
                , for "state-abbrev-checkbox"
                ]
                [ text "State Abbrev" ]
            ]
        , div [ class "form-check form-check-inline" ]
            [ input
                [ id "state-checkbox"
                , class "form-check-input"
                , type_ "checkbox"
                , checked (configContains config.extractors .state)
                , onCheck (UpdateExtractorList .state)
                ]
                []
            , label
                [ class "form-check-label"
                , for "state-checkbox"
                ]
                [ text "State" ]
            ]
        ]


filterCheckbox : Sifter.Config Place -> Html Msg
filterCheckbox config =
    div [ class "form-check" ]
        [ input
            [ id "filter-checkbox"
            , class "form-check-input"
            , type_ "checkbox"
            , checked config.filter
            , onCheck ToggleFilterCheckbox
            ]
            []
        , label
            [ class "form-check-label"
            , for "filter-checkbox"
            ]
            [ text "Filter" ]
        ]


wordBoundariesCheckbox : Sifter.Config Place -> Html Msg
wordBoundariesCheckbox config =
    div [ class "form-check" ]
        [ input
            [ id "respect-word-boundaries-checkbox"
            , class "form-check-input"
            , type_ "checkbox"
            , checked config.respectWordBoundaries
            , onCheck ToggleRespectWordBoundariesCheckbox
            ]
            []
        , label
            [ class "form-check-label"
            , for "respect-word-boundaries-checkbox"
            ]
            [ text "Respect Word Boundaries" ]
        ]


sortFieldRadio : Sifter.Config Place -> Html Msg
sortFieldRadio config =
    let
        sortExtractor =
            case config.sort of
                Nothing ->
                    .city

                Just a ->
                    a.field
    in
        div []
            [ div [ class "form-check form-check-inline" ]
                [ input
                    [ id "filter-city-radio"
                    , name "filter-radio"
                    , class "form-check-input"
                    , type_ "radio"
                    , checked (extractorsEqual sortExtractor .city)
                    , onClick (SetFilterField .city)
                    ]
                    []
                , label
                    [ class "form-check-label"
                    , for "filter-city-radio"
                    ]
                    [ text "City" ]
                ]
            , div [ class "form-check form-check-inline" ]
                [ input
                    [ id "filter-stateAbbrev-radio"
                    , name "filter-radio"
                    , class "form-check-input"
                    , type_ "radio"
                    , checked (extractorsEqual sortExtractor .stateAbbrev)
                    , onClick (SetFilterField .stateAbbrev)
                    ]
                    []
                , label
                    [ class "form-check-label"
                    , for "filter-stateAbbrev-radio"
                    ]
                    [ text "State Abbrev" ]
                ]
            , div [ class "form-check form-check-inline" ]
                [ input
                    [ id "filter-state-radio"
                    , name "filter-radio"
                    , class "form-check-input"
                    , type_ "radio"
                    , checked (extractorsEqual sortExtractor .state)
                    , onClick (SetFilterField .state)
                    ]
                    []
                , label
                    [ class "form-check-label"
                    , for "filter-state-radio"
                    ]
                    [ text "State" ]
                ]
            ]


conjunctionRadio : Sifter.Config Place -> Html Msg
conjunctionRadio config =
    div []
        [ div [ class "form-check form-check-inline" ]
            [ input
                [ id "conjunction-and-radio"
                , name "conjunction-radio"
                , class "form-check-input"
                , type_ "radio"
                , checked (config.conjunction == Sifter.And)
                , onClick (SetConjunction Sifter.And)
                ]
                []
            , label
                [ class "form-check-label"
                , for "conjunction-and-radio"
                ]
                [ text "And" ]
            ]
        , div [ class "form-check form-check-inline" ]
            [ input
                [ id "conjunction-or-radio"
                , name "conjunction-radio"
                , class "form-check-input"
                , type_ "radio"
                , checked (config.conjunction == Sifter.Or)
                , onClick (SetConjunction Sifter.Or)
                ]
                []
            , label
                [ class "form-check-label"
                , for "conjunction-or-radio"
                ]
                [ text "Or" ]
            ]
        ]


sortCheckbox : Sifter.Config Place -> Html Msg
sortCheckbox config =
    div [ class "form-check" ]
        [ input
            [ id "sort-checkbox"
            , class "form-check-input"
            , type_ "checkbox"
            , checked (config.sort /= Nothing)
            , onCheck ToggleSortCheckbox
            ]
            []
        , label
            [ class "form-check-label"
            , for "sort-checkbox"
            ]
            [ text "Sort" ]
        ]


sortDetails : Sifter.Config Place -> Html Msg
sortDetails config =
    if config.sort /= Nothing then
        div []
            [ sortFieldRadio config
            , div [ class "form-check form-check-inline" ]
                [ input
                    [ id "sort-ascending-radio"
                    , name "sort-radio"
                    , class "form-check-input"
                    , type_ "radio"
                    , checked (orderChecked config.sort Sifter.Ascending)
                    , onClick (SetSortOrder Sifter.Ascending)
                    ]
                    []
                , label
                    [ class "form-check-label"
                    , for "sort-radio"
                    ]
                    [ text "Ascending" ]
                , input
                    [ id "sort-decending-radio"
                    , name "sort-radio"
                    , class "form-check-input"
                    , type_ "radio"
                    , checked (orderChecked config.sort Sifter.Descending)
                    , onClick (SetSortOrder Sifter.Descending)
                    ]
                    []
                , label
                    [ class "form-check-label"
                    , for "sort-radio"
                    ]
                    [ text "Descending" ]
                ]
            ]
    else
        div [] []


orderChecked : Maybe (SortField Place) -> Sifter.SortOrder -> Bool
orderChecked sort order =
    case sort of
        Nothing ->
            True

        Just s ->
            s.order == order


searchContent : Model -> Html Msg
searchContent model =
    let
        places =
            Sifter.sifter model.config model.inputText model.places
    in
        div [ class "col-4" ]
            [ div [ class "form-group" ]
                [ label [ for "seartch-input" ] [ text "Search" ]
                , input
                    [ id "search-input"
                    , class "form-control"
                    , onInput SetInputText
                    ]
                    []
                ]
            , ul []
                (List.map
                    (\e -> li [] [ text (e.city ++ ", " ++ e.stateAbbrev) ])
                    places
                )
            ]


mainBody : Model -> Html Msg
mainBody model =
    div [ class "row" ]
        [ sideBar model.config
        , searchContent model
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
    pre [ style [ ( "margin-top", "30px" ) ] ]
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


initConfig : Sifter.Config Place
initConfig =
    { extractors = [ .city, .stateAbbrev, .state ]
    , limit = 10
    , sort =
        Just
            { field = .state
            , order = Sifter.Ascending
            }
    , filter = True
    , conjunction = Sifter.And
    , respectWordBoundaries = False
    }
