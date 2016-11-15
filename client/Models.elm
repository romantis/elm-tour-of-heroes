module Models exposing (..)

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
    { heroes = 
        [ Hero 11 "Mr. Nice"
        , Hero 12 "Narco"
        , Hero 13 "Bombasto"
        , Hero 14 "Celeritas"
        , Hero 15 "Magneta"
        , Hero 16 "RubberMan"
        , Hero 17 "Dynama"
        , Hero 18 "Dr IQ"
        , Hero 19 "Magma"
        , Hero 20 "Tornado"
        ]
    , selected = Nothing
    , menuItems  =["dashboard", "heroes"]
    , newHero = ""
    , nextId = 111
    , route = route
    , search = ""
    , updHero = Nothing
    }
