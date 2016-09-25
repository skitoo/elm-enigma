module Enigma.Reflector exposing (..)

import Enigma.Utils exposing (baseAlphabet, getIndex, isValidChar)
import String

{-| Define a Reflector type -}
type alias Reflector = String


{-| Compute a Char in given reflector -}
signal : Reflector -> Char -> Maybe Char
signal reflector entry =
  case (getIndex entry baseAlphabet) of
    Just value ->
      String.slice value (value + 1) reflector
        |> String.toList
        |> List.head
    Nothing ->
      Nothing
