module Messages exposing (..)
import Models exposing (Hero)

type Msg
  = Navigate String
  | SelectHero Hero
  | DeleteHero Hero
  
