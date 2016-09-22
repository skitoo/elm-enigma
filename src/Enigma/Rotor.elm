module Enigma.Rotor exposing (..)


{-| Define a Rotor type. -}
type alias Rotor =
  { alphabet: String
  , position: Maybe Char
  , turnover: Char
  }


{-| Build a Rotor. -}
buildRotor : String -> Char -> Rotor
buildRotor alphabet turnover =
  { alphabet = alphabet
  , position = Nothing
  , turnover = turnover
  }


{-| Initialize a Rotor to a position. -}
initRotor : Rotor -> Char -> Rotor
initRotor rotor position =
  { rotor | position = Just position }
