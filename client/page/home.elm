module Page.Home exposing (..)

import Html exposing (Html, Attribute, div, h1, text)
import Html.Attributes exposing (class)
-- import Html.App as App


view : Html msg
view  = 
    div [class "container act-min-height"] 
        [ h1 []  [text "Amazon Comparable Tables"]]
