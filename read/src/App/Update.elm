module App.Update where

import List
import Task
import Effects
import Http
import App.Model exposing (Model, SiteMetadata, Url(..), linkSaverModel)
import Crawl exposing (getSiteMetadata)

init : (Model, Effects.Effects Action)
init =
  ( linkSaverModel
  , loadUrlMetadata linkSaverModel )

type Action = LoadUrl (Maybe SiteMetadata)

update : Action -> Model -> Model
update action model = model

loadUrlMetadata : Model -> Effects.Effects Action
loadUrlMetadata model =
  let urls = List.concatMap (\t -> t.urls) model.thoughts
      isUnloaded (Url url maybeMetadata) = case maybeMetadata of
        Nothing -> True
        Just _ -> False
      fetchUrlMetadata (Url url _) = Http.getString url
        |> Task.map getSiteMetadata
        |> Task.toMaybe
        |> Task.map LoadUrl
        |> Effects.task
  in
    Effects.batch ((List.filter isUnloaded >> List.map fetchUrlMetadata) urls)
