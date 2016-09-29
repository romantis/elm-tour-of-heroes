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
    , navbarCollapsed: Bool
    }


menuItems : List String
menuItems = 
    ["home"]


init : String -> Model
init route = 
    Model route menuItems False

type Msg 
    = Navigate String
    | ToggleCollapseNovbar

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        
        Navigate url ->
            ( model
            , Navigation.newUrl url
            )
        
        ToggleCollapseNovbar ->
            ( { model | navbarCollapsed = not model.navbarCollapsed}
            , Cmd.none
            )



view : Model -> Html Msg
view model =
  header [ id "header"]
    [ nav [ class "navbar navbar-default" ]
        [ div [ class "container-fluid" ]
            [ div [ class "navbar-header" ]
                [ button 
                    [ class "navbar-toggle collapsed"
                    , type' "button"
                    , onClick ToggleCollapseNovbar 
                    ]
                    [ span [ class "sr-only" ] [ text "Toggle navigation" ]
                    , span [ class "icon-bar" ] []
                    , span [ class "icon-bar" ] []
                    , span [ class "icon-bar" ] []
                    ]
                , a 
                    [ class "navbar-brand"
                    , href "/"
                    , hrefClick Navigate "/"
                    ]
                    [ text "ACT" ]
                ]

            , div 
                [ classList
                     [("collapse navbar-collapse", True)
                     , ("in", model.navbarCollapsed)
                     ]
                ]
                [ ul [ class "nav navbar-nav" ]
                    (List.map (navItem model.pageRoute) model.menuItems)
                    
                , ul [ class "nav navbar-nav navbar-right" ]
                    [ li []
                        [ button [ class "btn btn-primary navbar-btn"]
                            [ text "Sign Up" ]
                        ]
                    ]
                ]
            ]
        ]
    ]


navItem : String -> String -> Html Msg
navItem currentRoute route =
    let
        url = 
            "/" ++ route
    in
        li [ classList ["active" => (currentRoute == route) ] ]
            [ a 
                [ hrefClick Navigate url
                , href url
                ]
                [ text route ]
            ]

        


