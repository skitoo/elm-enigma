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
