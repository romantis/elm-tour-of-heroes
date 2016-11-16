module Page.Dashboard exposing (..)

import Html exposing (..)
import Html.Attributes exposing (id, class, href, placeholder, value)
import Html.Events exposing (onInput)
import Http
import Regex exposing (regex, caseInsensitive)

import Models exposing (Hero)
import Messages exposing (Msg(..))
import Shared.Helpers exposing (hrefClick)



       


view: String -> List Hero -> Html Msg
view sq heroes = 
    div [class "dashboard"] 
        [ h3 []  [text "Top Heroes"]
        , div [ class "grid grid-pad" ]
            (viewTopHeroes <| bestHeroes heroes)
        , div [ id "search-component"]
            [ h4 [] [ text "Hero Search" ]
            , input 
                [ id "search-box"
                , placeholder" Name"
                , onInput Search 
                , value sq
                ] []
            , viewSearchResults sq heroes
            ]
        ]


viewTopHeroes: List Hero -> List (Html Msg)
viewTopHeroes =
    List.map 
        (\h -> 
            a 
                [ class "col-1-4"
                , href <| "/details/" ++ Http.encodeUri h.name
                , hrefClick Navigate <| "/details/" ++ Http.encodeUri h.name
                ] 
                [ div [class "module hero"]
                    [ h4 [] [text h.name]
                    ]
                ]
        )





viewListHeroes: List Hero -> List (Html Msg)
viewListHeroes =
    List.map 
        (\h -> div [ class "search-result"]
            [ a
                [ hrefClick Navigate <| "/details/" ++ Http.encodeUri h.name  
                , href <| "/details/" ++ Http.encodeUri h.name
                ]
                [text h.name] 
            ] 
        )
         
bestHeroes : List Hero -> List Hero
bestHeroes =
    List.drop 1 >> List.take 4


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


