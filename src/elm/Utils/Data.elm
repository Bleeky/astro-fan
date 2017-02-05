module Utils.Data exposing (..)

type alias Planets = List Planet
type alias Planet = {title: String, texture: String, data: PlanetData}
type alias PlanetData = {averageTemp: String, moons: String, age: String, mass: String, orbitalPeriod: String}

planets: List Planet
planets = [
  {
    title = "Mercury",
    texture = "./static/img/mercury.jpg",
    data = {
      mass = "3.30×10^23",
      averageTemp = "179.0",
      moons = "0",
      age = "4.5",
      orbitalPeriod = "87.96"
    }
  },
  {
    title = "Venus",
    texture = "./static/img/venus.jpg",
    data = {
      mass = "4.86×10^24",
      averageTemp = "460.0",
      moons = "0",
      age = "4.5",
      orbitalPeriod = "224.7"
    }
  },
  {
    title = "Earth",
    texture = "./static/img/earth.jpg",
    data = {
      mass = "5.97×10^24",
      averageTemp = "14.0",
      moons = "1",
      age = "4.5",
      orbitalPeriod = "365.2"
    }
  },
  {
    title = "Mars",
    texture = "./static/img/mars.jpg",
    data = {
      mass = "6.41×10^23",
      averageTemp = "-47.0",
      moons = "2",
      age = "4.5",
      orbitalPeriod = "686.97"
    }
  },
  {
    title = "Jupiter",
    texture = "./static/img/jupiter.jpg",
    data = {
      mass = "1.89×10^27",
      averageTemp = "-108.0",
      moons = "63",
      age = "4.5",
      orbitalPeriod = "4332.82"
    }
  },
  {
    title = "Saturn",
    texture = "./static/img/saturn.jpg",
    data = {
      mass = "5.68×10^26",
      averageTemp = "-139.0",
      moons = "61",
      age = "4.5",
      orbitalPeriod = "10755.7"
    }
  },
  {
    title = "Uranus",
    texture = "./static/img/uranus.jpg",
    data = {
      mass = "8.68×10^25",
      averageTemp = "-211.0",
      moons = "27",
      age = "4.5",
      orbitalPeriod = "30687.15"
    }
  },
  {
    title = "Neptune",
    texture = "./static/img/neptune.jpg",
    data = {
      mass = "1.02×10^26",
      averageTemp = "-209.0",
      moons = "14",
      age = "4.5",
      orbitalPeriod = "60190.03"
    }
  }]


getPlanet: Maybe Planet -> Planet
getPlanet planet =
  case planet of
    Nothing ->
      Planet "" "" {averageTemp = "", moons = "", age = "", mass = "", orbitalPeriod = ""}

    Just planet ->
      planet
