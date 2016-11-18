module Helpers exposing (..)

import Html exposing (Attribute)
import Html.Events exposing (onWithOptions, defaultOptions)
import Json.Decode as Json exposing (succeed)
import String



hrefClick : (String -> msg) -> String -> Attribute msg
hrefClick msg url =
    onWithOptions 
        "click"  
        {defaultOptions | preventDefault = True }
        (succeed (msg url))


capitalize : String -> String
capitalize s =
    (String.toUpper <| String.left 1 s) ++ String.dropLeft 1 s