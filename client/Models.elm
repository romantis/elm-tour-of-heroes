module Models exposing (..)

import Routing exposing (routeString)
import Shared.Header as Header



type alias Model =
    { route : Routing.Route
    , header : Header.Model
    }


initialModel : Routing.Route -> Model
initialModel route =
    { route = route
    , header = Header.init (routeString route)
    }
