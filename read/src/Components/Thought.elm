module Components.Thought where

import List exposing (length, map)
import Html exposing (Html, text, div, ul, li, a)
import Html.Attributes exposing (href, target)
import App.Model exposing (Thought, Url(..), SiteMetadata)

view : Thought -> Html
view thought =
  if length thought.urls /= 0
  then
    ul
      []
      (flip map thought.urls (\(Url url maybeMetadata) ->
        li
          []
          [ a
            [ href url, target "_blank" ]
            ([ text url ] ++ maybeRender maybeMetadata (\metadata ->
              div
                []
                [ maybeRender metadata. ] ))]))
  else
    div
      []
      [ text thought.body ]

viewMetadata : SiteMetadata -> Html
viewMetadata metadata =
  div
    []
    toList (flip Maybe.map metadata. ())
    [ div
      []
      [ img [ src  ] ] ]

maybeRender : Maybe a -> (a -> Html) -> List Html
maybeRender maybe render = case maybe of
  Just value -> [render value]
  Nothing -> []
