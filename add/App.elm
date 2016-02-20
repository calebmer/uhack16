module App where

import Html exposing (div, text)
import StartApp.Simple as StartApp

app =
  StartApp.start
    { model = model
    , view = view
    , update = update }

main = app

model : Bool
model = True

view address model =
  div [] [text "Hello world"]

update address model = True
