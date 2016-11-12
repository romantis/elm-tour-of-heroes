module Update exposing (..)

import Messages exposing (Msg(..))
import Models exposing (Model)

import Navigation

import Shared.Header as Header 



update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of

        Navigate url ->
            ( model
            , Navigation.newUrl url
            ) 
