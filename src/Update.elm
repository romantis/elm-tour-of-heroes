module Update exposing (..)

import Messages exposing (Msg(..))
import Models exposing (Model, Hero)

import Navigation
import Routing
import String




update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        LocationUpd location ->
            ( { model 
                | route = Routing.parser location
                , selected = Nothing
                , newHero = ""
                , search = ""
                , updHero = Nothing
                }
            , Cmd.none
            )

        Navigate url ->
            ( model
            , Navigation.newUrl url
            ) 
        
        SelectHero hero ->
            ( { model | selected = Just hero } 
            , Cmd.none
            )

        
        DeleteHero hero ->
            ( { model 
                | heroes = List.filter (\h -> h /= hero ) model.heroes
                , selected = Nothing 
                }
            , Cmd.none
            )

        
        InputHeroName name ->
            ( {model | newHero = name}
            , Cmd.none
            ) 
                    
            
        AddHero ->
            let
                isValid =
                    String.length (String.trim model.newHero) >= 2

                newModel =
                    case isValid of
                        True ->  
                            { model 
                                | newHero = ""
                                , heroes = 
                                    model.heroes ++ [ Hero model.nextId (String.trim model.newHero)]
                                , nextId = model.nextId + 1 
                            }
                        False ->  
                            model 
            in 
                ( newModel
                , Cmd.none
                )
        
        UpdHeroName hero name ->
            ( { model 
                | updHero =Just {hero | name = name} 
              }
            , Cmd.none
            ) 
        
        ChangeName ->
            let 
                updName : Hero -> Hero -> Hero
                updName updated current  =
                    if updated.id /= current.id
                        then current 
                        else updated

                newModel =
                    case model.updHero of
                        Just updated -> 
                            { model 
                                | selected = model.updHero
                                , heroes = 
                                    List.map (updName updated) model.heroes 
                            }      
                        Nothing -> 
                            model
                
            in 
                ( newModel
                , Navigation.back 1
                )
        
        NavigateBack ->
            ( model, Navigation.back 1)
        

        Search s ->
            ( {model | search = s}
            , Cmd.none
            )

        
        GetHeroes ( Ok heroes) ->
            ( {model | heroes = heroes}
            , Cmd.none
            )

        GetHeroes ( Err _) ->
            (model, Cmd.none)