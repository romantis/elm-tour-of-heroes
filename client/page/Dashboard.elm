module Page.Dashboard exposing (..)

import Html exposing (Html, Attribute, div, h1, text, ul, li, a)
import Html.Attributes exposing (class, href)
import Models exposing (Hero)
import Messages exposing (Msg(..))
import Shared.Helpers exposing (hrefClick)

import String exposing (toLower)


       


view: List Hero -> Html Msg
view heroes = 
    div [class "container th-min-height"] 
        [ h1 []  [text "Dashboard Page"]
        , ul []
            (topHeroes <| bestHeroes heroes)
        ]

topHeroes: List Hero -> List (Html Msg)
topHeroes =
    List.map 
        (\h -> li []
            [ a
                [ hrefClick Navigate <| "/profile/" ++ toLower h.name  
                , href <| "/profile/" ++ toLower h.name
                ]
                [text h.name] 
            ] 
        )
         
bestHeroes : List Hero -> List Hero
bestHeroes =
    List.sortWith flippedComparison >> List.take 5


flippedComparison a b =
    case compare a.rating b.rating of
      LT -> GT
      EQ -> EQ
      GT -> LT