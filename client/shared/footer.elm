module Shared.Footer exposing (..)

import Html exposing (footer, div, text, Html)
import Html.Attributes exposing (class, href, style, id)


(=>) : a -> b -> ( a, b )
(=>) = (,)

view : Html msg
view =
  footer 
    [ id "footer"
    , class "th-footer__dark"
    , style ["padding" => "2.5rem 0"]
    ]
    [ div [ class "container text-center"] 
        [ text " © 2016 Tour of heroes "
        ]
    ]

