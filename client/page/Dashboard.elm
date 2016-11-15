module Page.Dashboard exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, href, placeholder, value)
import Html.Events exposing (onInput)
import Http
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
                [ hrefClick Navigate <| "/details/" ++ Http.encodeUri h.name  
                , href <| "/details/" ++ Http.encodeUri h.name
                ]
                [text h.name] 
            ] 
        )
         
bestHeroes : List Hero -> List Hero
bestHeroes =
    List.drop 1 >> List.take 5


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


