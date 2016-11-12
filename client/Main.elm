module Main exposing (main)

import Navigation

import Messages exposing (Msg(..))
import Models exposing (Model, initialModel)
import View exposing (view)
import Update exposing (update)
import Routing exposing (Route(..), routeString)



init : Result String Route -> ( Model, Cmd Msg )
init result =
    let
        currentRoute =
            Routing.routeFromResult result
        model =
            initialModel currentRoute

    in
        ( model
        , updCmd model 
        )



urlUpdate : Result String Route -> Model -> ( Model, Cmd Msg )
urlUpdate result oldModel =
    let
        currentRoute =
            Routing.routeFromResult result
        
        model =
            updModel 
                {oldModel | route = currentRoute }  
    in
        ( model
        , updCmd model 
        )

updModel : Model -> Model
updModel model =
    case model.route of
        _ ->  model


updCmd : Model -> Cmd Msg
updCmd model =
    case model.route of 
        _ ->
            Cmd.none 



subscriptions : Model -> Sub Msg 
subscriptions _ =
    Sub.none 




main : Program Never
main =
    Navigation.program Routing.parser
        { init = init
        , view = view
        , update = update
        , urlUpdate = urlUpdate
        , subscriptions = subscriptions
        }