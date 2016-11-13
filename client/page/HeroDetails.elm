module Page.HeroDetails exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, value)
import Html.Events exposing (onInput, onClick)

import Messages exposing (Msg(..))
import Models exposing (Hero)


view : Hero -> Html Msg
view hero  = 
    div 
        [ class "container th-min-height"
        ] 
        [ h1 []  
            [text <|  hero.name ++ " Details"]
        , dl[]
            [ dt [] [ text "Rating: "]
            , dd [] [ text <| toString hero.rating]
            , dt [] [ text "Name"]
            , dd [] 
                [ input 
                    [ value hero.name
                    , onInput UpdHeroName
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