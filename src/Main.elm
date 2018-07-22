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
    ( Route.Page1 Route.Show, Cmd.none )



-- MESSAGES


type Msg
    = TransitionPage Route.Page
    | SetPage Route.Page



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        TransitionPage page ->
            ( Route.updatePageTransition model, Route.transitionFromPage model <| SetPage page )

        SetPage page ->
            ( page, Cmd.none )



-- VIEW


view : Model -> Html Msg
view model =
    div [ class "container" ]
        [ case model of
            Route.Page1 transition ->
                Page1.view transition TransitionPage

            Route.Page2 transition ->
                Page2.view transition TransitionPage

            Route.Page3 transition ->
                Page3.view transition TransitionPage
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
