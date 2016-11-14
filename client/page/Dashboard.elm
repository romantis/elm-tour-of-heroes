module Page.Dashboard exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, href, placeholder, value)
import Html.Events exposing (onInput)
import Regex exposing (regex, caseInsensitive)

import Models exposing (Hero)
import Messages exposing (Msg(..))
import Shared.Helpers exposing (hrefClick)



       


view: String -> List Hero -> Html Msg
view sq heroes = 
    section [class "container th-min-height"] 
        [ h1 []  [text "Top 5 Heroes"]
        , ul []
            (viewListHeroes <| bestHeroes heroes)
        , section []
            [ label []
                [ text "Hero Search"
                , input 
                    [ placeholder" Name"
                    , onInput Search 
                    , value sq
                    ] []
                ]
            , viewSearchResults sq heroes
            ]
        ]

viewListHeroes: List Hero -> List (Html Msg)
viewListHeroes =
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


viewSearchResults: String -> List Hero -> Html Msg
viewSearchResults sq heroes =
    if String.length sq > 1 && String.trim sq /=  "" 
        then  
            heroes 
                |> List.filter 
                    (\h -> Regex.contains (caseInsensitive <| regex sq) h.name)
                |> viewListHeroes
                |> ul []   
        else 
            text ""


flippedComparison : Hero -> Hero -> Order
flippedComparison a b =
    case compare a.rating b.rating of
      LT -> GT
      EQ -> EQ
      GT -> LT