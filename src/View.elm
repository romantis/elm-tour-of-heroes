module View exposing (view)

import Html exposing (Html, div, text, h1)
import Html

import Messages exposing (Msg(..))
import Models exposing (Model, Hero)
import Routing exposing (Route(..), routeString)
import Http

import Views.NotFound as NotFound
import Views.Dashboard as Dashboard
import Views.Heroes as Heroes
import Views.HeroDetails as HeroDetails 
import Views.Header as Header


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
            ] 


page : Model -> Html Msg
page model = 
    case model.route of 
        DashboardRoute ->
            Dashboard.view model.search model.heroes
        

        HeroesRoute ->
            Heroes.view model.selected model.heroes model.newHero
        

        HeroDetailsRoute encodedHero ->
            let
                hero = 
                    Maybe.withDefault encodedHero (Http.decodeUri encodedHero)
            in
                model.heroes
                    |> List.filter (\h -> h.name == hero)
                    |> List.head
                    |> viewDetailsHelper model.updHero
        

        NotFoundRoute ->
            NotFound.view 



viewDetailsHelper : Maybe Hero -> Maybe Hero -> Html Msg
viewDetailsHelper mUpdated mAvailable  =
    case mAvailable of 
        Just hero -> 
            HeroDetails.view hero mUpdated 
        Nothing ->
            NotFound.view
