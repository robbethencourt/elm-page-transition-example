module Route exposing (Page(..), Transition(..), transitionFromPage, updatePageTransition)

import Process
import Task
import Time


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
