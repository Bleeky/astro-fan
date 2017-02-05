import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

import List.Extra exposing (..)

import Model exposing (..)
import Components.Planet exposing ( renderPlanet )
import Components.PlanetData exposing ( renderPlanetData )
import Utils.Data exposing ( getPlanet )

-- APP
main : Program Never Model Msg
main =
  Html.beginnerProgram { model = model, view = view, update = update }


-- UPDATE
type Msg = NoOp | NextPlanet | ScaleSize | ShowData

update : Msg -> Model -> Model
update msg model =
  case msg of
    NoOp -> model
    NextPlanet -> nextPlanet model
    ScaleSize -> {model | scaledSize = not model.scaledSize}
    ShowData -> {model | showData = not model.showData}

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
      div [] [
        button [ class ("btn hvr-sweep-to-right"), onClick NextPlanet ] [
          Html.span[][ text "Next planet" ]
        ]
        , button [ class ("btn hvr-sweep-to-right " ++ ((\n -> if (n == True) then "active" else "") model.scaledSize)), onClick ScaleSize ] [
          Html.span[][ text "Scaled Size" ]
        ]
        , button [ class ("btn hvr-sweep-to-right " ++ ((\n -> if (n == True) then "active" else "") model.showData)), onClick ShowData ] [
          Html.span[][ text "Show Data" ]
        ]
      ]
      ,div [ class "planetContainer" ] [
        div [ class "planetTitle" ] [
          Html.text (getPlanet (List.Extra.getAt model.currentPlanet model.data)).title
        ]
        , renderPlanetData ((getPlanet (List.Extra.getAt model.currentPlanet model.data))).data model.showData
        , renderPlanet (getPlanet (List.Extra.getAt model.currentPlanet model.data)) model.scaledSize
      ]
  ]
