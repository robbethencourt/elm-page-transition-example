module Pages.Page1 exposing (..)

import Html exposing (Html, div, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Route


view : (Route.Page -> msg) -> Html msg
view changePage =
    div [ class "login-container" ]
        [ div [ class "username" ] []
        , div [ class "password" ] []
        , div [ class "btn login", onClick <| changePage Route.Page2 ] []
        ]
