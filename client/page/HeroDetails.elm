module Page.HeroDetails exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, value)
import Html.Events exposing (onInput, onClick)

import Messages exposing (Msg(..))
import Models exposing (Hero)


view : Hero -> Maybe Hero -> Html Msg
view hero mupdHero  = 
    div 
        [ class "hero-details"
        ] 
        [ h2 []  
            [text <| heroNameHelper hero.name mupdHero ++ " details!"]
        , div []
            [ label [] [ text "ID: "]
            , text <| toString hero.id
            ]
        , div []
            [ label [] [ text "Name:"]
            , input 
                [ value <| heroNameHelper hero.name mupdHero
                , onInput <| UpdHeroName hero
                ] []
            ]
        , button 
            [ onClick NavigateBack ] 
            [ text "Back"]
        , button 
            [ onClick ChangeName ] 
            [ text "Save"]
        ]

heroNameHelper : String -> Maybe Hero -> String
heroNameHelper name mh =
    case mh of 
        Just h ->
            h.name 
        Nothing ->
            name