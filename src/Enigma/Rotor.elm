module Enigma.Rotor exposing (..)

import Enigma.Utils exposing (..)
import Enigma.Wiring as Wiring exposing (Wiring, Plug)
import String
import List

{-| Define a Rotor type. -}
type alias Rotor =
  { wiring: Wiring
  , position: Maybe Plug
  , turnover: Plug
  }


{-| Initialize a Rotor. -}
init: String -> Plug -> Rotor
init alphabet turnover =
  { wiring = Maybe.withDefault [] (Wiring.initWiring baseAlphabet alphabet)
  , position = Nothing
  , turnover = turnover
  }


{-| Set Rotor position. -}
setPosition: Rotor -> Plug -> Rotor
setPosition rotor position =
  { rotor | position = Just position }


{-| Rotate a Rotor. -}
rotate: Rotor -> Rotor
rotate rotor =
  case rotor.position of
    Just char ->
      let
        alphabet = Wiring.outputAlphabet rotor.wiring
        pos = getIndex char alphabet
      in
        case pos of
          Just index ->
            let
              newIndex = (index + 1) % String.length alphabet
              newPosition = getChar newIndex alphabet
            in
              { rotor | position = newPosition }
          Nothing ->
            rotor
    Nothing ->
      rotor


{-| Pass a signal into Rotor. -}
signal: Plug -> Rotor -> Bool -> Maybe Plug
signal plug rotor reverse =
  Wiring.signal plug rotor.wiring reverse
