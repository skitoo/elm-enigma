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


signal: Plug -> Wiring -> Bool -> Maybe Plug
signal plug wiring reverse =
  let
    outputFilter: Wire -> Bool
    outputFilter wire =
      wire.output == plug

    inputFilter: Wire -> Bool
    inputFilter wire =
        wire.input == plug
    
    maybeWire = List.filter (if reverse then outputFilter else inputFilter) wiring
                  |> List.head
  in
    case maybeWire of
      Just wire ->
        Just (if reverse then wire.input else wire.output)
      Nothing ->
        Nothing


extractAlphabet: (Wire -> Plug) -> Wiring -> String
extractAlphabet func wiring =
  List.map func wiring
    |> List.map String.fromChar
    |> String.join ""


inputPlug: Wire -> Plug
inputPlug wire =
    wire.input


inputAlphabet: Wiring -> String
inputAlphabet wiring =
  extractAlphabet inputPlug wiring


outputPlug: Wire -> Plug
outputPlug wire =
  wire.output


outputAlphabet: Wiring -> String
outputAlphabet wiring =
  extractAlphabet outputPlug wiring
