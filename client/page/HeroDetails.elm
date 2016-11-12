module Page.HeroDetails exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, value)
import Html.Events exposing (onInput)

import Messages exposing (Msg(..))
import Models exposing (Hero)


view : Maybe Hero -> Html Msg
view mhero  = 
    let 
        hero =
            case mhero of
                Just h -> h
                Nothing -> Hero "Unknown" 0

    in
        div [class "container th-min-height"] 
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
            ] 