module Models exposing (..)

import Routing


type alias Model =
    { route : Routing.Route
    , menuItems :List String
    , selected : Maybe Hero
    , newHero : String
    , updHero : Maybe Hero
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
    , selected = Nothing
    , newHero = ""
    , updHero = Nothing
    , heroes = 
        [ Hero "Batman" 7
        , Hero "superman" 10
        , Hero "Hulk" 10
        , Hero "Spiderman" 8
        , Hero "Magneto" 6
        , Hero "Mistique" 2
        , Hero "Wolverine" 5
        , Hero "Apocalypse" 10
        , Hero "Thor" 10
        , Hero "Loki" 4
        , Hero "Ironman" 7
        , Hero "Quicksilver" 4
        , Hero "Cyclops" 3
        , Hero "Storm" 4
        , Hero "Rogue" 5
        , Hero "Iceman" 4
        , Hero "Beast" 3
        , Hero "Hawkeye" 2
        , Hero "Nightcrawler" 4
        , Hero "Angel" 3
        , Hero "Vision" 10
        , Hero "Ultron" 8
        , Hero "BlackWidow" 2
        ]
    }
