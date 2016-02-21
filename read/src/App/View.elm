module App.View where

import List exposing (map)
import Html exposing (Html, div, ul, li)
import App.Model exposing (Model)
import App.Update exposing (Action)
import Components.Thought

view : Signal.Address Action -> Model -> Html
view address model =
  div
    []
    [ ul [] (map (\t -> li [] [ Components.Thought.view t ]) model.thoughts) ]
