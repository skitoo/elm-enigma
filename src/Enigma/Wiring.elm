module Enigma.Wiring exposing (..)

import String
import List

type alias Plug = Char

type alias Wire =
  { input: Plug
  , output: Plug
  }

initWire: Plug -> Plug -> Wire
initWire input output =
  { input = input
  , output = output
  }


type alias Wiring =
  List Wire


initWiring: String -> String -> Maybe Wiring
initWiring inputAlphabet outputAlphabet =
  if String.length inputAlphabet == String.length outputAlphabet then
    let
      inputs = String.toList inputAlphabet
      outputs = String.toList outputAlphabet
    in
     Just (List.map2 initWire inputs outputs)
  else
    Nothing
