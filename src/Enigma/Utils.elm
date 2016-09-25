module Enigma.Utils exposing (..)

import Char
import String
import Array


baseAlphabet : String
baseAlphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"


isValidChar : Char -> Bool
isValidChar char =
  Char.isUpper char


getIndex : Char -> String -> Maybe Int
getIndex char alphabet =
  let index =
    String.indexes (String.fromChar char) alphabet
  in
    List.head index


getChar : Int -> String -> Maybe Char
getChar index string =
  String.toList string
    |> Array.fromList
    |> Array.get index
