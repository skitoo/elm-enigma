module Enigma.Utils exposing (..)

import Char


baseAlphabet : String
baseAlphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"


isValidChar : Char -> Bool
isValidChar char =
  Char.isUpper char

