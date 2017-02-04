module Model exposing (..)
import Utils.Data exposing (..)

type alias Model =
  {
    data: Planets,
    currentPlanet: Int,
    scaledSize: Bool
  }

model : Model
model = Model planets 0 False
