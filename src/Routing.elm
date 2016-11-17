module Routing exposing (..)

import Navigation
import UrlParser exposing (..)


type Route
    = NotFoundRoute 
    | DashboardRoute
    | HeroesRoute
    | HeroDetailsRoute String


routeString : Route -> String
routeString route =
    case route of 
        DashboardRoute ->
            "dashboard"
        HeroesRoute ->
            "heroes"
        _ ->
            ""
        

route : Parser (Route -> c) c
route =
    oneOf
        [ map DashboardRoute (s "") 
        , map DashboardRoute (s "dashboard")
        , map HeroesRoute (s "heroes")
        , map HeroDetailsRoute (s "details" </> string)
        ]


parser : Navigation.Location -> Route
parser location =
     case parsePath route location of
        Just route ->
            route

        Nothing ->
            NotFoundRoute    