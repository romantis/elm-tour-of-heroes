module Views.Heroes exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, href, classList, placeholder, value)
import Html.Events exposing (onClick, onInput)
import Http

import Models exposing (Hero)
import Messages exposing (Msg(..))

import String

(=>) = (,)

view: Maybe Hero -> List Hero -> String -> Html Msg
view mselected heroes newHero = 
    div [class "heroes"] 
        [ h2 []  [text "My Heroes"]
        , addHeroViev newHero
        , ul [ class ""]
            (heroesList mselected heroes)
        , myHeroView mselected
        ]

heroesList: Maybe Hero -> List Hero -> List (Html Msg)
heroesList mselected =
    List.sortBy .id >>
    List.map 
        (\h -> 
            li 
                [ classList
                    [ "selected" => (isSelected h mselected) ]
                ] 
                [ strong [ class "badge"] [ text <| toString h.id ] 
                , span 
                    [ onClick <| SelectHero h ] 
                    [ text h.name ] 
                , button 
                    [ onClick <| DeleteHero h
                    , class "delete"
                    ] 
                    [ text "x"]
                ] 
        )

myHeroView mhero =
    case mhero of 
        Just h ->
            div []
                [ h2 [] [ text <| String.toUpper h.name ++ " is my hero"]
                , button 
                    [ onClick <| Navigate ("/details/" ++ Http.encodeUri h.name)] 
                    [ text "View Details"] 
                ]
            
        Nothing -> 
            text ""

addHeroViev newHero =
    div [ class "add-hero"] 
        [ label [] [ text "Hero name:"]
        , input 
            [ onInput InputHeroName
            , value newHero
            , placeholder "Name" 
            ] []
        , button [ onClick AddHero ] [ text "Add"]
        ]


isSelected hero mselected =
    case mselected of 
        Just h -> 
            hero == h 
        Nothing ->
            False