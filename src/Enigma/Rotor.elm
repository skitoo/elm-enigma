module Enigma.Rotor exposing (..)


{-| Define a Rotor type. -}
type alias Rotor =
  { alphabet: String
  , position: Maybe Char
  , turnover: Char
  }

