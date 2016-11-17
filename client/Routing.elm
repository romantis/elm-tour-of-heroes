module Routing exposing (..)

import String
import Navigation
import UrlParser exposing (..)


type Route
    = NotFoundRoute 
    | DashboardRoute
    | HeroesRoute
    | HeroProfileRoute String


routeString : Route -> String
routeString route =
    case route of 
        DashboardRoute ->
            "dashboard"
        HeroesRoute ->
            "heroes"
        _ ->
            ""
        

matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ format DashboardRoute (s "") 
        , format DashboardRoute (s "dashboard")
        , format HeroesRoute (s "heroes")
        , format HeroProfileRoute (s "heroes" </> string)
        ]



pathParser : Navigation.Location -> Result String Route
pathParser location =
    location.pathname
        |> String.dropLeft 1
        |> parse identity matchers



parser : Navigation.Parser (Result String Route)
parser =
    Navigation.makeParser pathParser


routeFromResult : Result String Route -> Route
routeFromResult result =
    case result of
        Ok route ->
            route

        Err string ->
            NotFoundRoute 
