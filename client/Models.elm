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
    , rating : Int 
    }
    


initialModel : Routing.Route -> Model
initialModel route =
    { heroes = 
        [ Hero 1 "Batman" 7
        , Hero 2 "Superman" 10
        , Hero 3 "Hulk" 10
        , Hero 4 "Spiderman" 8
        , Hero 5 "Magneto" 6
        , Hero 6 "Mistique" 2
        , Hero 7 "Wolverine" 5
        , Hero 8 "Apocalypse" 10
        , Hero 9 "Thor" 10
        , Hero 11 "Ironman" 7
        , Hero 12 "Quicksilver" 4
        , Hero 13 "Cyclops" 3
        , Hero 14 "Storm" 4
        , Hero 15 "Rogue" 5
        , Hero 17 "Beast" 3
        , Hero 18 "Hawkeye" 2
        , Hero 19 "Nightcrawler" 4
        , Hero 20 "Angel" 3
        , Hero 21 "Vision" 10
        , Hero 22 "Ultron" 8
        , Hero 23 "BlackWidow" 2
        ]
    , selected = Nothing
    , menuItems  =["dashboard", "heroes"]
    , newHero = ""
    , nextId = 111
    , route = route
    , search = ""
    , updHero = Nothing
    }
