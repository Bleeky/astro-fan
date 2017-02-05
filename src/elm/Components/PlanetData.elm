module Components.PlanetData exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

import Utils.Data exposing (..)

renderPlanetData: PlanetData -> Bool -> Html planetData
renderPlanetData planetData show =
  if (show == True) then
    div[ class "planetData" ] [
      table [] [
        tr [] [
          th [] [
            Html.text ("Info")
          ]
          , th [] [
            Html.text ("Value")
          ]
        ]
        ,tr [] [
          td [ class "infoField"] [
            Html.text ("Planet Mass")
          ]
          , td [ class "valueField" ] [
            Html.text (planetData.mass ++ " Kg")
          ]
        ]
        ,tr [] [
          td [class "infoField"] [
            Html.text ("Average Temperature")
          ]
          , td [class "valueField"] [
            Html.text (planetData.averageTemp ++ "°C")
          ]
        ]
        ,tr [] [
          td [class "infoField"] [
            Html.text ("Age")
          ]
          , td [class "valueField"] [
            Html.text (planetData.age ++ " Billion Years")
          ]
        ]
        ,tr [] [
          td [class "infoField"] [
            Html.text ("Orbital Period")
          ]
          , td [class "valueField"] [
            Html.text (planetData.orbitalPeriod ++ " Days")
          ]
        ]
        ,tr [] [
          td [class "infoField"] [
            Html.text ("Number of Moons")
          ]
          , td [class "valueField"] [
            Html.text (planetData.moons)
          ]
        ]
      ]
    ]
  else
    div[] []
