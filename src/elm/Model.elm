module Model exposing (..)

type alias Model =
  { scene : Scene}

initialModel : Model
initialModel =
  { scene = initialScene }

type alias Scene = {
  width: Int,
  height: Int
}

initialScene : Scene
initialScene =
  {
    width = 200,
    height = 200
  }
