module Shared.Header exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, classList, style,  href, id, type')
import Html.Events exposing (onClick)
import Shared.Helpers exposing (hrefClick)

import Navigation

(=>) : a -> b -> ( a, b )
(=>) = (,)



type alias Model =
    { pageRoute : String
    , menuItems : List String
    }


menuItems : List String
menuItems = 
    ["dashboard", "heroes"]


init : String -> Model
init route = 
    Model route menuItems

type Msg 
    = Navigate String

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        
        Navigate url ->
            ( model
            , Navigation.newUrl url
            )
        



view : Model -> Html Msg
view model =
  header [ id "header"]
    [ h1 [] [ text "Tour of Heroes"]
    , hr [] []
    , nav [ class "navbar navbar-default" ]
        (List.map (navItem model.pageRoute) model.menuItems)        
    ]


navItem : String -> String -> Html Msg
navItem currentRoute route =
    let
        url = 
            "/" ++ route
    in
        a 
            [ classList ["active" => (currentRoute == route) ]
            , hrefClick Navigate url
            , href url
            ]
            [ text route ]

        


