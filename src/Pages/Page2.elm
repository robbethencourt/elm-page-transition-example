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
        div [ class <| "profile-page " ++ transitionClassName ]
            [ header transitionPage
            , profile
            , profileNav transitionPage
            ]



-- private


header : (Route.Page -> msg) -> Html msg
header transitionPage =
    div [ class "header" ]
        [ span
            [ class "btn logout"
            , onClick <| transitionPage <| Route.Page1 Route.Show
            ]
            []
        ]


profile : Html msg
profile =
    div [ class "profile" ]
        [ div [ class "avatar" ] []
        , div [ class "username" ] []
        ]


profileNav : (Route.Page -> msg) -> Html msg
profileNav transitionPage =
    div [ class "profile-nav" ]
        [ div [ class "bucket" ]
            [ div [ class "heading" ] []
            , div [ class "content" ] []
            ]
        , div [ class "bucket" ]
            [ div [ class "heading" ] []
            , div [ class "btn content", onClick <| transitionPage <| Route.Page3 Route.Show ] []
            ]
        , div [ class "bucket" ]
            [ div [ class "heading" ] []
            , div [ class "content" ] []
            ]
        , div [ class "bucket" ]
            [ div [ class "heading" ] []
            , div [ class "content" ] []
            ]
        ]
