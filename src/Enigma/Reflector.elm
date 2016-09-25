module Enigma.Reflector exposing (..)

import Enigma.Utils exposing (baseAlphabet)
import Enigma.Wiring as Wiring exposing (Wiring, Plug)


{-| Define a Reflector type -}
type alias Reflector = Wiring


{-| Initialize a Reflector. -}
init: String -> Maybe Reflector
init alphabet =
  Wiring.initWiring baseAlphabet alphabet


{-| Compute a Plug in given reflector -}
signal : Plug -> Reflector -> Maybe Plug
signal plug reflector =
  Wiring.signal plug reflector False
