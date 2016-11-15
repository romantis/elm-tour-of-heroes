module Shared.Header exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, classList, style,  href, id)
import Messages exposing(Msg(..))
-- import Html.Events exposing (onClick)
import Shared.Helpers exposing (hrefClick)


(=>) : a -> b -> ( a, b )
(=>) = (,)



type alias PageRoute = String

type alias MenuItems = List String




view : PageRoute -> MenuItems -> Html Msg
view route items =
  header [ id "header"]
    [ h1 [] [ text "Tour of Heroes"]
    , nav [ class "navbar navbar-default" ]
        (List.map (navItem route) items)        
    ]


navItem : PageRoute -> PageRoute -> Html Msg
navItem currentRoute route =
    let
        url = 
            "/" ++ route
    in
        a 
            [ classList ["active" => (currentRoute == route) ]
            , hrefClick Navigate url
            , href url
            ]
            [ text route ]

        


