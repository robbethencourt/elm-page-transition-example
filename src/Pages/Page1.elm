module Pages.Page1 exposing (view)

import Html exposing (Html, div, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Route


view : Route.Transition -> (Route.Page -> msg) -> Html msg
view transition transitionPage =
    let
        transitionClassName =
            transition |> toString |> String.toLower
    in
        div [ class <| "login-container " ++ transitionClassName ]
            [ div [ class "username" ] []
            , div [ class "password" ] []
            , div
                [ class "btn login"
                , onClick <| transitionPage <| Route.Page2 Route.Show
                ]
                []
            ]
