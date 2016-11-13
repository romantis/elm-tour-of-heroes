module Models exposing (..)

import Routing


type alias Model =
    { route : Routing.Route
    , menuItems :List String
    , selected : Maybe Hero
    , newHero : String
    , updHero : Maybe Hero
    , nextId : Int
    , heroes : List Hero
    }


type alias Hero =
    { id : Int
    , name : String
    , rating : Int 
    }
    


initialModel : Routing.Route -> Model
initialModel route =
    { route = route
    , menuItems  =["dashboard", "heroes"]
    , selected = Nothing
    , newHero = ""
    , updHero = Nothing
    , nextId = 111
    , heroes = 
        [ Hero 1 "Batman" 7
        , Hero 2 "superman" 10
        , Hero 3 "Hulk" 10
        , Hero 4 "Spiderman" 8
        , Hero 5 "Magneto" 6
        , Hero 6 "Mistique" 2
        , Hero 7 "Wolverine" 5
        , Hero 8 "Apocalypse" 10
        , Hero 9 "Thor" 10
        , Hero 10 "Loki" 4
        , Hero 11 "Ironman" 7
        , Hero 12 "Quicksilver" 4
        , Hero 13 "Cyclops" 3
        , Hero 14 "Storm" 4
        , Hero 15 "Rogue" 5
        , Hero 16 "Iceman" 4
        , Hero 17 "Beast" 3
        , Hero 18 "Hawkeye" 2
        , Hero 19 "Nightcrawler" 4
        , Hero 20 "Angel" 3
        , Hero 21 "Vision" 10
        , Hero 22 "Ultron" 8
        , Hero 23 "BlackWidow" 2
        ]
    }
