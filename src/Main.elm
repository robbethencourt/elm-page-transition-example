module Main exposing (..)

import Html exposing (Html, div, text, program)
import Html.Attributes exposing (class)
import Route
import Pages.Page1 as Page1
import Pages.Page2 as Page2
import Pages.Page3 as Page3


-- MODEL


type alias Model =
    Route.Page


init : ( Model, Cmd Msg )
init =
    ( Route.Page1, Cmd.none )



-- MESSAGES


type Msg
    = ChangePage Route.Page



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ChangePage page ->
            ( page, Cmd.none )



-- VIEW


view : Model -> Html Msg
view model =
    div [ class "container" ]
        [ case model of
            Route.Page1 ->
                Page1.view ChangePage

            Route.Page2 ->
                Page2.view ChangePage

            Route.Page3 ->
                Page3.view
        ]



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- MAIN


main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
