module View exposing (view)

import Html exposing (Html, div, text, h1)
-- import Html.Attributes exposing (class)
import Html.App as App

import Messages exposing (Msg(..))
import Models exposing (Model)
import Routing exposing (Route(..), routeString)

import Page.NotFound as NotFound
import Page.Dashboard as Dashboard
import Page.Heroes as Heroes
import Page.HeroDetails as HeroDetails 

import Shared.Header as Header
import Shared.Footer as Footer

-- import String


view : Model -> Html Msg
view model =
    let
        route = 
            routeString model.route
    in
        div [] 
            [ Header.view route model.menuItems
            , page model
            , Footer.view 
            ] 


page : Model -> Html Msg
page model = 
    case model.route of 
        DashboardRoute ->
            Dashboard.view model.heroes
        
        HeroesRoute ->
            Heroes.view model.selected model.heroes model.newHero
        
        HeroDetailsRoute hero ->
            model.heroes
                |> List.filter (\h -> h.name == hero)
                |> List.head
                |> viewDetailsHelper

        
        NotFoundRoute ->
            NotFound.view 

viewDetailsHelper mhero =
    case mhero of 
        Just hero -> 
            HeroDetails.view hero 
        Nothing ->
            NotFound.view
