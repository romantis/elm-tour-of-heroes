module Page.HeroDetails exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, value)
import Html.Events exposing (onInput, onClick)

import Messages exposing (Msg(..))
import Models exposing (Hero)


view : Hero -> Maybe Hero -> Html Msg
view hero mupdHero  = 
    div 
        [ class "container th-min-height"
        ] 
        [ h1 []  
            [text <| heroNameHelper hero.name mupdHero ++ " Details"]
        , dl[]
            [ dt [] [ text "ID: "]
            , dd [] [ text <| toString hero.id]
            , dt [] [ text "Name"]
            , dd [] 
                [ input 
                    [ value <| heroNameHelper hero.name mupdHero
                    , onInput <| UpdHeroName hero
                    ] []
                ]
            ]
        , div [] 
            [ button 
                [ onClick NavigateBack
                ] 
                [text "Back"]
            , button 
                [ onClick ChangeName
                ] 
                [ text "Save"]
            ] 
        ]

heroNameHelper : String -> Maybe Hero -> String
heroNameHelper name mh =
    case mh of 
        Just h ->
            h.name 
        Nothing ->
            name