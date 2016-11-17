module Commands exposing(..)

import Http
import Models exposing(heroDecoder)
import Messages exposing(Msg(..))


getHeroes : Cmd Msg
getHeroes =
    Http.get "data/heroes.json" heroDecoder
        |> Http.send GetHeroes