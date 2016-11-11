module Models exposing (..)

import Routing exposing (routeString)
import Shared.Header as Header



type alias Model =
    { route : Routing.Route
    , header : Header.Model
    , heroes : List Hero
    }


type alias Hero =
    { name : String
    , rating : Int 
    }
    


initialModel : Routing.Route -> Model
initialModel route =
    { route = route
    , header = Header.init (routeString route)
    , heroes = 
        [ Hero "Batman" 0
        , Hero "superman" 0
        , Hero "Hulk" 0
        ]
    }
