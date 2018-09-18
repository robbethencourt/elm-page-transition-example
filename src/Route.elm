module Route
    exposing
        ( Page(..)
        , Transition(..)
        , transitionFromPage
        , updatePageTransition
        , locationToPage
        , href
        )

import Process
import Task
import Time
import Html exposing (Attribute)
import Html.Attributes as Attr
import Navigation exposing (Location)
import UrlParser as Url exposing (Parser, oneOf, parseHash)


-- public


type Page
    = Page1 Transition
    | Page2 Transition
    | Page3 Transition


type Transition
    = Show
    | Remove


transitionFromPage : Page -> msg -> Cmd msg
transitionFromPage page msg =
    let
        time =
            page |> pageTransitionTime >> (*) Time.millisecond
    in
        Process.sleep time
            |> Task.andThen (always <| Task.succeed msg)
            |> Task.perform identity


updatePageTransition : Page -> Page
updatePageTransition page =
    case page of
        Page1 transition ->
            Page1 <| toggleTransition transition

        Page2 transition ->
            Page2 <| toggleTransition transition

        Page3 transition ->
            Page3 <| toggleTransition transition


locationToPage : Navigation.Location -> Page
locationToPage location =
    case Url.parseHash route location of
        Nothing ->
            {--if no page then send user to the login screen
               ideally a 404 page, but for this example app we'll just use page 1
            --}
            Page1 Show

        Just page ->
            page


href : Page -> Attribute msg
href page =
    Attr.href (pageToHash page)



-- private


pageTransitionTime : Page -> Float
pageTransitionTime page =
    case page of
        Page1 transition ->
            650

        Page2 transition ->
            250

        Page3 transition ->
            250


toggleTransition : Transition -> Transition
toggleTransition transition =
    case transition of
        Show ->
            Remove

        Remove ->
            Show


route : Parser (Page -> a) a
route =
    Url.oneOf
        [ Url.map (Page1 Show) (Url.s "page1")
        , Url.map (Page2 Show) (Url.s "page2")
        , Url.map (Page3 Show) (Url.s "page3")
        ]


pageToHash : Page -> String
pageToHash page =
    case page of
        Page1 transition ->
            "/#page1"

        Page2 transition ->
            "/#page2"

        Page3 transition ->
            "#/page3"
