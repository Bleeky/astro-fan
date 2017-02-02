import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

import Utils.Data exposing (..)

-- component import example
import Components.Hello exposing ( hello )
import Components.Planet exposing ( renderPlanet )

-- APP
main : Program Never Model Msg
main =
  Html.beginnerProgram { model = model, view = view, update = update }

-- MODEL
type alias Model =
  {
  number: Int,
  elements: List String,
  newElem: String,
  data: Planets
  }

type alias Entry =
  {
  title: String,
  id: Int
  }

model : Model
model = Model 0 ["Hey Kek"] "" planets

-- UPDATE
type Msg = NoOp | Increment | AddElem | RemoveElem Int | Change String

update : Msg -> Model -> Model
update msg model =
  case msg of
    NoOp -> model
    Change newContent -> {model | newElem = newContent}
    Increment -> {model | number = model.number + 1}
    AddElem -> {model | elements = model.newElem :: model.elements}
    RemoveElem id -> {model | elements = List.append (List.take id model.elements) (List.drop (id+1) model.elements)}


-- VIEW
-- Html is defined as: elem [ attribs ][ children ]
-- CSS can be applied via class names or inline style attrib
view : Model -> Html Msg
view model =
  div [ class "container", style [("margin-top", "30px"), ( "text-align", "center" )] ][
    div [ class "row" ][
      div [ class "col-xs-12" ][
        div [ class "jumbotron" ][
          img [ src "static/img/elm.jpg", style styles.img ] []
          , hello model.number
          , text (getPlanetTitle (List.head model.data)).title
          , img [ src (getPlanetTitle (List.head model.data)).texture, style styles.img ] []
          , p [] [ text ( "Elm Webpack Starter" ) ]
          , input [ placeholder "Text to reverse", onInput Change ] []
          , button [ class "btn btn-primary btn-lg", onClick Increment ] [
            span[ class "glyphicon glyphicon-star" ][]
            , span[][ text "FTW!" ]
          ]
          , button [ class "btn btn-primary btn-lg", onClick AddElem ] [
            span[][ text "FTW!" ]
          ],
          renderList model.elements
          ]
        ]
      ]
      , renderPlanet (getPlanetTitle (List.head model.data))
  ]

getPlanetTitle: Maybe {title: String, texture: String} -> {title: String, texture: String}
getPlanetTitle planet =
  case planet of
    Nothing ->
      {title = "Empty planet", texture = "Empty"}

    Just planet ->
      planet

renderList: List String -> Html Msg
renderList lst =
  ul[]
    (List.indexedMap (\index element -> li [] [
      p [] [text (element)]
      , button [ class "btn btn-primary btn-lg", onClick (RemoveElem index) ] [
        span [] [text "REMOVE"]
      ]
    ]) lst)

-- CSS STYLES
styles : { img : List ( String, String ) }
styles =
  {
    img =
      [ ( "width", "33%" )
      , ( "border", "4px solid #337AB7")
      ]
  }
