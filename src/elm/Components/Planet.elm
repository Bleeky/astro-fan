module Components.Planet exposing (..)

import Html exposing (..)
import Svg exposing (Svg,Attribute)
import Svg.Attributes as Attributes exposing (x,y,width,height,fill,fontFamily,textAnchor)
import Utils.Data exposing (..)

renderPlanet: Planet -> Bool -> Html planet
renderPlanet planet scaledSize =
      Svg.svg [ Attributes.width "800px", Attributes.height "400", Attributes.class "svg" ] [
        Svg.defs [] [
          Svg.pattern
          [
          Attributes.width "100%"
          , Attributes.height "100%"
          , Attributes.id "planetTexture"
          , Attributes.patternUnits "userSpaceOnUse"
          , Attributes.patternTransform "translate(1)"
          ][
            Svg.animateTransform [
              Attributes.dur "60s"
              , Attributes.attributeName "patternTransform"
              , Attributes.from "0"
              , Attributes.to "500"
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
          , Attributes.fill "url(#planetTexture)"
          , Attributes.class ((\n -> if (n == True) then planet.title else "") scaledSize)
          ][]
      ]
