module Enigma.Rotor exposing (..)

import Enigma.Utils exposing (..)
import String


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


{-| Rotate a Rotor. -}
rotate: Rotor -> Rotor
rotate rotor =
  case rotor.position of
    Just char ->
      let
        pos = getIndex char rotor.alphabet
      in
        case pos of
          Just index ->
            let
              newIndex = (index + 1) % String.length rotor.alphabet
              newPosition = getChar newIndex  rotor.alphabet
            in
              { rotor | position = newPosition }
          Nothing ->
            rotor
    Nothing ->
      rotor
