module Page.Heroes exposing (..)

import Html exposing (Html, Attribute, div, h1, text, ul, li, a)
import Html.Attributes exposing (class, href)

import Models exposing (Hero)
import Messages exposing (Msg(..))
import Shared.Helpers exposing (hrefClick)
import String exposing (toLower)


view: List Hero -> Html Msg
view heroes = 
    div [class "container th-min-height"] 
        [ h1 []  [text "My Heroes"]
        , ul []
            (heroesList heroes)
        ]

heroesList: List Hero -> List (Html Msg)
heroesList =
    List.sortBy .name >>
    List.map 
        (\h -> li []
            [ a
                [ hrefClick Navigate <| "/profile/" ++ toLower h.name  
                , href <| "/profile/" ++ toLower h.name
                ]
                [text h.name] 
            ] 
        )
         


