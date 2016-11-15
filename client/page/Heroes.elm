module Page.Heroes exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, href, classList, type_, placeholder, value)
import Html.Events exposing (onClick, onInput)
import Http

import Models exposing (Hero)
import Messages exposing (Msg(..))

import String

(=>) = (,)

view: Maybe Hero -> List Hero -> String -> Html Msg
view mselected heroes newHero = 
    div [class ""] 
        [ h2 []  [text "My Heroes"]
        , addHeroViev newHero
        , ul [ class "heroes"]
            (heroesList mselected heroes)
        , myHeroView mselected
        ]

heroesList: Maybe Hero -> List Hero -> List (Html Msg)
heroesList mselected =
    List.sortBy .id >>
    List.map 
        (\h -> li [] 
            [ strong 
                [ class "badge"] 
                [ text <| toString h.id ]
            , text " "
            , span 
                [ onClick <| SelectHero h
                , classList 
                    [ "selected" => (isSelected h mselected)
                    , "text" => True 
                    ]
                ] 
                [ text h.name ]
            , text " "
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
    div [] 
        [ label [] [ text "Hero name"]
        , input 
            [ onInput InputHeroName
            , type_ "text"
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