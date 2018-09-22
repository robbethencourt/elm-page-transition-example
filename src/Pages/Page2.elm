module Pages.Page2 exposing (view)

import Html exposing (Html, div, text, a)
import Html.Attributes exposing (class)
import Route


-- public


view : Route.Transition -> String -> (Route.Page -> msg) -> Html msg
view transition userName transitionPage =
    let
        transitionClassName =
            transition |> toString |> String.toLower
    in
        div [ class <| "profile-page " ++ transitionClassName ]
            [ header transitionPage
            , profile
            , profileNav transitionPage userName
            ]



-- private


header : (Route.Page -> msg) -> Html msg
header transitionPage =
    div [ class "header" ]
        [ a
            [ class "btn logout"
            , Route.href <| Route.Page1 Route.Show
            ]
            []
        ]


profile : Html msg
profile =
    div [ class "profile" ]
        [ div [ class "avatar" ] []
        , div [ class "username" ] []
        ]


profileNav : (Route.Page -> msg) -> String -> Html msg
profileNav transitionPage userName =
    div [ class "profile-nav" ]
        [ div [ class "bucket" ]
            [ div [ class "heading" ] []
            , div [ class "content" ] []
            ]
        , div [ class "bucket" ]
            [ div [ class "heading" ] []
            , a
                [ class "btn content"
                , Route.href <| Route.Page3 Route.Show userName
                ]
                []
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
