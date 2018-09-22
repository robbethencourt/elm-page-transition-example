module Pages.Page1 exposing (view)

import Html exposing (Html, div, a, text)
import Html.Attributes exposing (class)
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
            , a
                [ class "btn login"
                , Route.href <| Route.Page2 Route.Show "authedUser"
                ]
                []
            ]
