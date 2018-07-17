module Pages.Page2 exposing (..)

import Html exposing (Html, div, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Route


view : (Route.Page -> msg) -> Html msg
view changePage =
    div [ class "posts" ]
        (List.map (post changePage) (List.range 1 5))


post : (Route.Page -> msg) -> Int -> Html msg
post changePage _ =
    div [ class "post" ]
        [ div [ class "post-image" ] []
        , div [ class "post-heading" ] []
        , div [ class "post-content" ]
            (List.map postContentLine (List.range 1 5))
        , div [ class "btn post-read-more", onClick <| changePage Route.Page3 ] []
        ]


postContentLine : Int -> Html msg
postContentLine _ =
    div [ class "post-content-line" ] []
