module Utils.Data exposing (..)

type alias Planets = List {title: String, texture: String}

planets: List {title: String, texture: String}
planets = [
  {
    title = "Venus",
    texture = "./static/img/venus.jpg"
  },
  {
    title = "Earth",
    texture = "./static/img/earth.jpg"
  },
  {
    title = "Saturn",
    texture = "./static/img/saturn.jpg"
  }]
