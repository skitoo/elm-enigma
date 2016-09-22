module Enigma.Reflector exposing (..)

import Enigma.Utils exposing (baseAlphabet, getPosition, isValidChar)
import String

{-| Define a Reflector type -}
type alias Reflector = String


{-| Compute a Char in given reflector -}
computeReflector : Reflector -> Char -> Maybe Char
computeReflector reflector entry =
  case (getPosition entry baseAlphabet) of
    Just value ->
      String.slice value (value + 1) reflector
        |> String.toList
        |> List.head
    Nothing ->
      Nothing