module Enigma.Reflector exposing (..)

import Enigma.Utils exposing (baseAlphabet, transpose)


{-| Define a Reflector type -}
type alias Reflector = String


{-| Compute a Char in given reflector -}
signal : Reflector -> Char -> Maybe Char
signal reflector entry =
  transpose entry baseAlphabet reflector
