module Models exposing (..)

import Routing


type alias Model =
    { route : Routing.Route
    , menuItems :List String
    , heroes : List Hero
    }


type alias Hero =
    { name : String
    , rating : Int 
    }
    


initialModel : Routing.Route -> Model
initialModel route =
    { route = route
    , menuItems  =["dashboard", "heroes"]
    , heroes = 
        [ Hero "Batman" 0
        , Hero "superman" 0
        , Hero "Hulk" 0
        ]
    }
