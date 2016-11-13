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
                                    model.heroes ++ [ Hero model.nextId model.newHero 0]
                                , nextId = model.nextId + 1 
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
                updName : Hero -> Hero -> Hero
                updName uh ch  =
                    if uh.id /= ch.id
                        then ch 
                        else uh

                newModel =
                    case model.updHero of
                        Just uh -> 
                            { model 
                                | selected = model.updHero
                                , heroes = 
                                    List.map (updName uh) model.heroes 
                            }      
                        Nothing -> 
                            model
                
            in 
                ( newModel
                , Navigation.back 1
                )
