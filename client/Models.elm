module Models exposing (..)
import Json.Decode as Json

import Routing


type alias Model =
    { heroes : List Hero
    , menuItems :List String
    , newHero : String
    , nextId : Int
    , route : Routing.Route
    , search : String
    , selected : Maybe Hero
    , updHero : Maybe Hero
    }


type alias Hero =
    { id : Int
    , name : String
    }
    


jsonHeroes = """[
  { "id": 11, "name": "Mr. Nice" },
  { "id": 12, "name": "Narco" },
  { "id": 13, "name": "Bombasto" },
  { "id": 14, "name": "Celeritas" },
  { "id": 15, "name": "Magneta" },
  { "id": 16, "name": "RubberMan" },
  { "id": 17, "name": "Dynama" },
  { "id": 18, "name": "Dr IQ" },
  { "id": 19, "name": "Magma" },
  { "id": 20, "name": "Tornado" }
]
"""


heroDecoder =
    Json.list
        (Json.map2 Hero
            (Json.field "id" Json.int)
            (Json.field "name" Json.string)
        )

encodedHeroes =
    jsonHeroes
        |> Json.decodeString heroDecoder
        |> Result.mapError (Debug.log "Json decode Error: ")
        |> Result.withDefault [] 



initialModel : Routing.Route -> Model
initialModel route =
    { heroes = encodedHeroes
    , selected = Nothing
    , menuItems  =["dashboard", "heroes"]
    , newHero = ""
    , nextId = 21
    , route = route
    , search = ""
    , updHero = Nothing
    }
