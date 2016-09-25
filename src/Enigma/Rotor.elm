module Enigma.Rotor exposing (..)


{-| Define a Rotor type. -}
type alias Rotor =
  { alphabet: String
  , position: Maybe Char
  , turnover: Char
  }


{-| Build a Rotor. -}
build: String -> Char -> Rotor
build alphabet turnover =
  { alphabet = alphabet
  , position = Nothing
  , turnover = turnover
  }


{-| Initialize a Rotor to a position. -}
init: Rotor -> Char -> Rotor
init rotor position =
  { rotor | position = Just position }
