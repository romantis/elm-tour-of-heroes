module Messages exposing (..)

import Http
import Navigation exposing (Location)

import Models exposing (Hero)

type Msg
  = LocationUpd Location
  | Navigate String
  | SelectHero Hero
  | DeleteHero Hero
  | InputHeroName String 
  | AddHero
  | UpdHeroName Hero String
  | ChangeName
  | NavigateBack
  | Search String
  | GetHeroes (Result Http.Error (List Hero))