module Pages.Page3 exposing (view)

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
        div [ class <| "posts-page " ++ transitionClassName ]
            [ header transitionPage
            , post 3
            , postWithImage
            , post 2
            , post 4
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


post : Int -> Html msg
post endLine =
    div [ class <| "post" ]
        [ div [ class "avatar" ] []
        , div [ class "post-content" ]
            [ div [ class "content-container" ]
                (List.map contentLine (List.range 1 endLine))
            ]
        ]


postWithImage : Html msg
postWithImage =
    div [ class <| "post" ]
        [ div [ class "avatar" ] []
        , div [ class "post-content" ]
            [ div [ class "content-container" ]
                (List.map contentLine (List.range 1 1))
            , div [ class "image" ] []
            , div [ class "content-container" ]
                (List.map contentLine (List.range 1 2))
            ]
        ]


contentLine : Int -> Html msg
contentLine _ =
    div [ class "content-line" ] []
