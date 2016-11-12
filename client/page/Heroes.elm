module Page.Heroes exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, href, classList, type', placeholder, value)
import Html.Events exposing (onClick, onInput)

import Models exposing (Hero)
import Messages exposing (Msg(..))

import String

(=>) = (,)

view: Maybe Hero -> List Hero -> String -> Html Msg
view mselected heroes newHero = 
    div [class "container th-min-height"] 
        [ h1 []  [text "My Heroes"]
        , addHeroViev newHero
        , ul []
            (heroesList mselected heroes)
        , myHeroView mselected
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

myHeroView mhero =
    case mhero of 
        Just h ->
            div []
                [ h2 [] [ text <| String.toUpper h.name ++ " is my hero"]
                , button 
                    [ onClick <| Navigate ("/details/" ++ h.name)] 
                    [ text "View Details"] 
                ]
            
        Nothing -> 
            text ""

addHeroViev newHero =
    div [] 
        [ input 
            [ onInput InputHeroName
            , type' "text"
            , value newHero
            , placeholder "Name" 
            ] []
        , button 
            [ onClick AddHero
            , class "th-btn"
            ] 
            [ text "add Hero"]
        ]



isSelected hero mselected =
    case mselected of 
        Just h -> 
            hero == h 
        Nothing ->
            False