import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

import List.Extra exposing (..)

import Model exposing (..)
import Components.Planet exposing ( renderPlanet )
import Utils.Data exposing ( getPlanet )

-- APP
main : Program Never Model Msg
main =
  Html.beginnerProgram { model = model, view = view, update = update }


-- UPDATE
type Msg = NoOp | NextPlanet | ScaleSize

update : Msg -> Model -> Model
update msg model =
  case msg of
    NoOp -> model
    NextPlanet -> nextPlanet model
    ScaleSize -> {model | scaledSize = not model.scaledSize}

nextPlanet : Model -> Model
nextPlanet model =
  if List.length model.data == model.currentPlanet + 1 then
    {model | currentPlanet = 0}
  else
    {model | currentPlanet = model.currentPlanet + 1}

-- VIEW
view : Model -> Html Msg
view model =
  div [ class "appContainer" ][
    -- div [ class "row" ][
    --   div [ class "col-xs-12" ][
    --     div [ class "jumbotron" ][
    --       text (getPlanet (List.Extra.getAt model.currentPlanet model.data)).title
    --       , img [ src (getPlanet (List.Extra.getAt model.currentPlanet model.data)).texture] []
    --       ]
    --     ]
    --   ]
      button [ class "btn btn-primary btn-lg", onClick NextPlanet ] [
        Html.span[][ text "Next planet" ]
      ]
      , button [ class "btn btn-primary btn-lg", onClick ScaleSize ] [
        Html.span[][ text "Scaled Size" ]
      ]
      ,div [ class "planetContainer" ] [
        div [ class "planetInfos" ] [
          Html.text (getPlanet (List.Extra.getAt model.currentPlanet model.data)).title
        ]
        , renderPlanet (getPlanet (List.Extra.getAt model.currentPlanet model.data)) model.scaledSize
      ]
  ]
