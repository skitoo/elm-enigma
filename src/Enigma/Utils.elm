module Enigma.Utils exposing (..)

import Char
import String
import Array
import List
import Set


baseAlphabet : String
baseAlphabet =
    "ABCDEFGHIJKLMNOPQRSTUVWXYZ"


isValidChar : Char -> Bool
isValidChar char =
    Char.isUpper char


getIndex : Char -> String -> Maybe Int
getIndex char alphabet =
    let
        index =
            String.indexes (String.fromChar char) alphabet
    in
        List.head index


getChar : Int -> String -> Maybe Char
getChar index string =
    String.toList string
        |> Array.fromList
        |> Array.get index


transpose : Char -> String -> String -> Maybe Char
transpose inputChar inputAlphabet outputAlphabet =
    case (getIndex inputChar inputAlphabet) of
        Just value ->
            String.slice value (value + 1) outputAlphabet
                |> String.toList
                |> List.head

        Nothing ->
            Nothing


hasDuplicates : List comparable -> Bool
hasDuplicates list =
    let
        unifiedList =
            Set.fromList list
                |> Set.toList
    in
        List.length list /= List.length unifiedList
