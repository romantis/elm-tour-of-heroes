module Update exposing (..)

import Messages exposing (Msg(..))
import Models exposing (Model, Hero)

import Navigation
import String

import Shared.Header as Header 



update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of

        Navigate url ->
            ( model
            , Navigation.newUrl url
            ) 
        
        SelectHero hero ->
            ( { model 
                | selected = Just hero
                , updHero = Just hero
                }
            , Cmd.none
            )

        
        DeleteHero hero ->
            ( { model 
                | heroes = List.filter (\h -> h /= hero ) model.heroes 
                }
            , Cmd.none
            )

        
        InputHeroName name ->
            ( {model | newHero = String.trim name}
            , Cmd.none
            ) 
                    
            
        AddHero ->
            let
                isValid =
                    String.length model.newHero >= 2

                newModel =
                    case isValid of
                        True ->  
                            { model 
                                | newHero = ""
                                , heroes = 
                                    model.heroes ++ [Hero model.newHero 0] 
                            }
                        False ->  
                            model 
            in 
                ( newModel
                , Cmd.none
                )
        
        UpdHeroName name ->
            ( { model 
                | updHero = 
                    Maybe.map 
                        (\h -> {h | name = String.trim name}) 
                        model.updHero
              }
            , Cmd.none
            ) 
        
        ChangeName ->
            let 
                updName : String -> Hero -> Hero
                updName nn h  =
                    if nn /= h.name
                        then h 
                        else {h | name = nn}

                newModel =
                    case model.updHero of
                        Just h -> 
                            { model 
                                | selected = model.updHero
                                , heroes = 
                                    List.map (updName h.name) model.heroes 
                            }      
                        Nothing -> 
                            model
                
            in 
                ( newModel
                , Cmd.none
                )