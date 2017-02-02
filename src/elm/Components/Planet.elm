module Components.Planet exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
-- import Html.Events exposing (..)
import Svg exposing (Svg,Attribute)
import Svg.Attributes as Attributes exposing (x,y,width,height,fill,fontFamily,textAnchor)

renderPlanet: {title: String, texture: String} -> Html planet
renderPlanet planet =
  div [ class "row" ][
    div [ class "col-xs-12" ][
      Svg.svg [ Attributes.width "100%", Attributes.height "400", style [("position", "absolute"), ("left", "0"), ("right", "0"), ("margin-left", "auto"),("margin-right", "auto")] ] [
        Svg.defs [] [
          Svg.pattern
          [
          Attributes.width "100%"
          , Attributes.height "100%"
          , Attributes.id "keke"
          , Attributes.patternUnits "userSpaceOnUse"
          , Attributes.patternTransform "translate(1)"
          ][
            Svg.animateTransform [
              Attributes.dur "60s"
              , Attributes.attributeName "patternTransform"
              , Attributes.from "0"
              , Attributes.to "6000"
              , Attributes.repeatCount "indefinite"
              , Attributes.type_ "translate"
            ] []
            , Svg.image[
              Attributes.xlinkHref planet.texture
              , Attributes.height "400"
              , Attributes.y "0"
              , Attributes.x "0"
              , Attributes.id "image"
            ][]
          ]
        ],
        Svg.circle
          [ Attributes.cx "50%"
          , Attributes.cy "200"
          , Attributes.id "top"
          , Attributes.r "200"
          , Attributes.fill "url(#keke)"
          ][]
      ]
    ]
  ]
