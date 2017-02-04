module Utils.Data exposing (..)

type alias Planets = List {title: String, texture: String}

planets: List {title: String, texture: String}
planets = [
  {
    title = "Mercury",
    texture = "./static/img/mercury.jpg"
  },
  {
    title = "Venus",
    texture = "./static/img/venus.jpg"
  },
  {
    title = "Earth",
    texture = "./static/img/earth.jpg"
  },
  {
    title = "Mars",
    texture = "./static/img/mars.jpg"
  },
  {
    title = "Jupiter",
    texture = "./static/img/jupiter.jpg"
  },
  {
    title = "Saturn",
    texture = "./static/img/saturn.jpg"
  },
  {
    title = "Uranus",
    texture = "./static/img/uranus.jpg"
  },
  {
    title = "Neptune",
    texture = "./static/img/neptune.jpg"
  }]


getPlanet: Maybe {title: String, texture: String} -> {title: String, texture: String}
getPlanet planet =
  case planet of
    Nothing ->
      {title = "Empty planet", texture = "Empty"}

    Just planet ->
      planet
