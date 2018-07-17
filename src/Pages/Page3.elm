module Pages.Page3 exposing (..)

import Html exposing (Html, div, text)
import Html.Attributes exposing (class)


view : Html msg
view =
    post


post : Html msg
post =
    div [ class "post" ]
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
