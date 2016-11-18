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
        , viewAddHero newHero
        , ul [ class ""]
            (heroesList mselected heroes)
        , viewSelected mselected
        ]



heroesList: Maybe Hero -> List Hero -> List (Html Msg)
heroesList mhero heroes =
    heroes
        |> List.sortBy .id
        |> List.map (viewListItem mhero) 
    
     


viewListItem : Maybe Hero -> Hero -> Html Msg
viewListItem mh h =
    li 
        [ classList
            [ "selected" => (isSelected h mh) ]
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



viewSelected: Maybe Hero -> Html Msg
viewSelected mhero =
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



viewAddHero : String -> Html Msg
viewAddHero newHero =
    div [ class "add-hero"] 
        [ label [] [ text "Hero name:"]
        , input 
            [ onInput InputHeroName
            , value newHero
            , placeholder "Name" 
            ] []
        , button [ onClick AddHero ] [ text "Add"]
        ]



isSelected : Hero -> Maybe Hero -> Bool
isSelected hero mselected =
    case mselected of 
        Just h -> 
            hero == h 
        Nothing ->
            False