module Page.HeroProfile exposing (..)

import Html exposing (Html, Attribute, div, h1, text)
import Html.Attributes exposing (class)
import Models exposing (Hero)
-- import Html.App as App


view : List Hero -> Html msg
view xh  = 
    let 
        hero =
            case List.head xh of
                Just h -> h
                Nothing -> Hero "Unknown" 0

    in
        div [class "container th-min-height"] 
            [ h1 []  [text "Hero Name Page"]]
