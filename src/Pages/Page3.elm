module Pages.Page3 exposing (..)

import Html exposing (Html, div, text)
import Html.Attributes exposing (class)
import Route


view : Route.Transition -> Html msg
view transition =
    post transition


post : Route.Transition -> Html msg
post transition =
    let
        transitionClassName =
            transition |> toString |> String.toLower
    in
        div [ class <| "post " ++ transitionClassName ]
            [ div [ class "post-image" ] []
            , div [ class "post-heading" ] []
            , div [ class "post-content" ]
                (List.map postContentLine (List.range 1 5))
            , div [ class "post-content" ]
                (List.map postContentLine (List.range 1 2))
            , div [ class "post-content" ]
                (List.map postContentLine (List.range 1 7))
            ]


postContentLine : Int -> Html msg
postContentLine _ =
    div [ class "post-content-line" ] []
