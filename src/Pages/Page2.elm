module Pages.Page2 exposing (view)

import Html exposing (Html, div, text, a)
import Html.Attributes exposing (class)
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


profileNav : (Route.Page -> msg) -> Html msg
profileNav transitionPage =
    div [ class "profile-nav" ]
        [ div [ class "bucket" ]
            [ div [ class "heading" ] []
            , div [ class "content" ] []
            ]
        , div [ class "bucket" ]
            [ div [ class "heading" ] []
            , a
                [ class "btn content"
                , Route.href <| Route.Page3 Route.Show 555
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
