module Page.Heroes exposing (..)

import Html exposing (Html, Attribute, div, h1, text, ul, li, strong, button, span)
import Html.Attributes exposing (class, href, classList)
import Html.Events exposing (onClick)

import Models exposing (Hero)
import Messages exposing (Msg(..))


(=>) = (,)

view: Maybe Hero -> List Hero -> Html Msg
view mselected heroes = 
    div [class "container th-min-height"] 
        [ h1 []  [text "My Heroes"]
        , ul []
            (heroesList mselected heroes)
        ]

heroesList: Maybe Hero -> List Hero -> List (Html Msg)
heroesList mselected =
    List.sortBy .name >>
    List.map 
        (\h -> li [] 
            
            [ strong [] [ text <| toString h.rating ]
            , text " "
            , span 
                [ onClick <| SelectHero h
                , classList 
                    [ "selected" => (isSelected h mselected) ]
                ] 
                [ text h.name ]
            , text " "
            , button 
                [ onClick <| DeleteHero h] 
                [ text "Delete"]
            ] 
        )

isSelected hero mselected =
    case mselected of 
        Just h -> 
            hero == h 
        Nothing ->
            False