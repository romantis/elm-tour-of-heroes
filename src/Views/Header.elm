module Views.Header exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, classList, style,  href, id)
import Messages exposing(Msg(..))

import Helpers exposing (hrefClick, capitalize)


(=>) : a -> b -> ( a, b )
(=>) = (,)



type alias PageRoute = String

type alias MenuItems = List String




view : PageRoute -> MenuItems -> Html Msg
view route items =
  header []
    [ h1 [] [ text "Tour of Heroes"]
    , nav [ class "navbar navbar-default" ]
        (List.map (navItem route) items)        
    ]


navItem : PageRoute -> PageRoute -> Html Msg
navItem currentRoute route =
    a 
        [ classList ["active" => (currentRoute == route) ]
        , hrefClick Navigate route
        , href route
        ]
        [ text <| capitalize route ]

        


