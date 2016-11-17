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
    

initialModel : Routing.Route -> Model
initialModel route =
    { heroes = []
    , selected = Nothing
    , menuItems  =["dashboard", "heroes"]
    , newHero = ""
    , nextId = 21
    , route = route
    , search = ""
    , updHero = Nothing
    }


heroDecoder : Json.Decoder (List Hero)
heroDecoder =
    Json.list
        (Json.map2 Hero
            (Json.field "id" Json.int)
            (Json.field "name" Json.string)
        )
