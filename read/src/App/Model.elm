module App.Model where

type alias Model =
  { thoughts : List Thought }

type alias Thought =
  { important : Bool
  , longTerm : Bool
  , urls : List Url
  , body : String }

type Url = Url String (Maybe SiteMetadata)

type alias SiteMetadata =
  { title : Maybe String
  , image : Maybe String
  , description: Maybe String }

linkSaverModel : Model
linkSaverModel =
  { thoughts =
    [ { important = False
      , longTerm = False
      , urls = []
      , body = "Find and read an article on GraphQL" }
    , { important = False
      , longTerm = True
      , urls = [Url "http://www.stilldrinking.org/programming-sucks" Nothing]
      , body = "" } ] }
