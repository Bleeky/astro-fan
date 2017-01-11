import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing ( onClick )

-- component import example
import Components.Hello exposing ( hello )

-- APP
main : Program Never Model Msg
main =
  Html.beginnerProgram { model = model, view = view, update = update }


-- MODEL
type alias Model =
  {number: Int,
  elements: List String
  }

model : Model
model = Model 0 ["Hey Kek"]


-- UPDATE
type Msg = NoOp | Increment | AddElem

update : Msg -> Model -> Model
update msg model =
  case msg of
    NoOp -> model
    Increment -> {model | number = model.number + 1}
    AddElem -> {model | elements = "Hell yeah" :: model.elements}


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
          , p [] [ text ( "Elm Webpack Starter" ) ]
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
  ]

renderList: List String -> Html Msg
renderList lst =
  ul[]
    (List.map (\element -> li [] [text element]) lst)


-- CSS STYLES
styles : { img : List ( String, String ) }
styles =
  {
    img =
      [ ( "width", "33%" )
      , ( "border", "4px solid #337AB7")
      ]
  }
