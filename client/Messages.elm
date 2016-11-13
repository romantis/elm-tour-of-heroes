module Messages exposing (..)
import Models exposing (Hero)

type Msg
  = Navigate String
  | SelectHero Hero
  | DeleteHero Hero
  | InputHeroName String 
  | AddHero
  | UpdHeroName Hero String
  | ChangeName
  | NavigateBack
