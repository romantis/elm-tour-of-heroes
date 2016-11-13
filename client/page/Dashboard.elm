module Page.Dashboard exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, href, placeholder)
import Models exposing (Hero)
import Messages exposing (Msg(..))
import Shared.Helpers exposing (hrefClick)



       


view: List Hero -> Html Msg
view heroes = 
    section [class "container th-min-height"] 
        [ h1 []  [text "Top 5 Heroes"]
        , ul []
            (topHeroes <| bestHeroes heroes)
        , section []
            [ label []
                [ text "Hero Search"
                , input 
                    [ placeholder" Name"
                    ] []
                ]
            ]
        ]

topHeroes: List Hero -> List (Html Msg)
topHeroes =
    List.map 
        (\h -> li []
            [ a
                [ hrefClick Navigate <| "/details/" ++ h.name  
                , href <| "/details/" ++ h.name
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