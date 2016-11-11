module Page.Dashboard exposing (..)

import Html exposing (Html, Attribute, div, h1, text, ul, li)
import Html.Attributes exposing (class)
import Models exposing (Hero)
-- import Html.App as App



view: List Hero -> Html msg
view heroes = 
    div [class "container th-min-height"] 
        [ h1 []  [text "Dashboard Page"]
        , ul []
            (topHeroes heroes)
        ]

topHeroes: List Hero -> List (Html msg)
topHeroes =
    List.map 
        (\h -> li [] [text h.name]) 
     