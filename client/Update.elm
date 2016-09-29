module Update exposing (..)

import Messages exposing (Msg(..))
import Models exposing (Model)

import Shared.Header as Header 



update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of

        HeaderMsg subMsg ->
            let 
                (subModel, subCmd) = 
                    Header.update subMsg model.header 
            in
                ( {model | header = subModel}
                , Cmd.map HeaderMsg subCmd 
                ) 
