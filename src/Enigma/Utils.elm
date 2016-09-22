module Enigma.Utils exposing (..)

import Char
import String


baseAlphabet : String
baseAlphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"


isValidChar : Char -> Bool
isValidChar char =
  Char.isUpper char


getPosition : Char -> String -> Maybe Int
getPosition char alphabet =
  let index =
    String.indexes (String.fromChar char) alphabet
  in
    List.head index
