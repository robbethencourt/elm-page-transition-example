module Pages.Page2 exposing (..)

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
        div [ class <| "posts " ++ transitionClassName ]
            (List.map (post transitionPage) (List.range 1 5))


post : (Route.Page -> msg) -> Int -> Html msg
post transitionPage _ =
    div [ class "post" ]
        [ div [ class "post-image" ] []
        , div [ class "post-heading" ] []
        , div [ class "post-content" ]
            (List.map postContentLine (List.range 1 5))
        , div [ class "btn post-read-more", onClick <| transitionPage <| Route.Page3 Route.Show ] []
        ]


postContentLine : Int -> Html msg
postContentLine _ =
    div [ class "post-content-line" ] []
