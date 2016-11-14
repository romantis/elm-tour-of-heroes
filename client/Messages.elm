module Messages exposing (..)
import Models exposing (Hero)

import Navigation exposing (Location)

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