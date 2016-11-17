module Main exposing (main)

import Navigation exposing (Location)

import Messages exposing (Msg(..))
import Models exposing (Model, initialModel)
import View exposing (view)
import Update exposing (update)
import Routing exposing (Route(..), routeString)
import Commands exposing (getHeroes)



init : Location -> ( Model, Cmd Msg )
init location =
    let
        currentRoute =
            Routing.parser location
        model =
            initialModel currentRoute

    in
        ( model
        , getHeroes 
        )



subscriptions : Model -> Sub Msg 
subscriptions _ =
    Sub.none 




main : Program Never Model Msg
main =
    Navigation.program LocationUpd
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }