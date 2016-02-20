module App where

import Html exposing (Html, text, div, form, label, textarea, input, button)
import Html.Attributes exposing (action, value, type', checked)
import Html.Events exposing (onSubmit, on, targetValue, targetChecked)
import StartApp.Simple as StartApp

app =
  StartApp.start
    { model = model
    , view = view
    , update = update }

main = app

type alias Model = 
  { text : String
  , important : Bool }

model : Model
model =
  { text = ""
  , important = False }

view : Signal.Address Action -> Model -> Html
view address model =
  form
    [ onSubmit address AddThought
    , action "javascript:void(0);" ]
    [ div
        []
        [ label [] [ text "Thought" ] ]
        , textarea
          [ value model.text
          , on "input" targetValue (\text -> Signal.message address (UpdateText text)) ]
          []
    , div
        []
        [ label
            []
            [ input
                [ type' "checkbox"
                , checked model.important
                , on "input" targetChecked (\important -> Signal.message address (UpdateImportant important)) ]
                []
            , text " Important" ] ]
    , button
        []
        [ text "Add" ] ]

type Action =
    UpdateText String
  | UpdateImportant Bool
  | AddThought

update : Action -> Model -> Model
update action model =
  case action of
    UpdateText text -> { model | text = text }
    UpdateImportant important -> { model | important = important }
    AddThought -> model
