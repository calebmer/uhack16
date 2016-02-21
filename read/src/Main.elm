import StartApp.Simple as StartApp
import App.Model exposing (linkSaverModel)
import App.View exposing (view)
import App.Update exposing (update)

app =
  StartApp.start
    { model = linkSaverModel
    , view = view
    , update = update }

main = app
