module Pages.Page2 exposing (view)

import Html exposing (Html, div, text, span)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Route


-- public


view : Route.Transition -> (Route.Page -> msg) -> Html msg
view transition transitionPage =
    let
        transitionClassName =
            transition |> toString |> String.toLower
    in
        div [ class <| "page-container " ++ transitionClassName ]
            [ header transitionPage
            , div [ class "posts" ]
                (List.map (post transitionPage) (List.range 1 5))
            ]



-- private


header : (Route.Page -> msg) -> Html msg
header transitionPage =
    div [ class "header" ]
        [ span
            [ class "user-profile" ]
            []
        , span
            [ class "btn logout"
            , onClick <| transitionPage <| Route.Page1 Route.Show
            ]
            []
        ]


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
