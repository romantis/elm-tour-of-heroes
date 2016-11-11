module Page.Heroes exposing (..)

import Html exposing (Html, Attribute, div, h1, text)
import Html.Attributes exposing (class)
-- import Html.App as App


view : Html msg
view  = 
    div [class ""] 
        [ h1 []  [text "Heroes Page"]]
