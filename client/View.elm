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

import Shared.Header as Header
import Shared.Footer as Footer


view : Model -> Html Msg
view model =
  div [] 
    [ App.map HeaderMsg ( Header.view model.header)
    , page model
    , Footer.view 
    ] 


page : Model -> Html Msg
page model = 
    case model.route of 
        DashboardRoute ->
            Dashboard.view
        
        HeroesRoute ->
            Heroes.view 
        
        NotFoundRoute ->
            NotFound.view
