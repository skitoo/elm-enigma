module Enigma.Plugboard
    exposing
        ( Plugboard
        , init
        , signal
        , defaultPlugboard
        )

import Enigma.Wiring as Wiring exposing (Wire, Wiring, Plug)
import Enigma.Utils exposing (baseAlphabet, hasDuplicates)
import String


type alias Plugboard =
    Wiring


defaultPlugboard : Plugboard
defaultPlugboard =
    Wiring.initWiring baseAlphabet baseAlphabet
        |> Maybe.withDefault []


init : String -> String -> Maybe Plugboard
init inputs outputs =
    if String.length inputs > 10 then
        Nothing
    else if hasDuplicates (String.toList (String.append inputs outputs)) then
        Nothing
    else
        let
            maybeWiring =
                Wiring.initWiring inputs outputs
                    |> concatWiring (Wiring.initWiring outputs inputs)
        in
            case maybeWiring of
                Just wiring ->
                    Just (mergeWiring defaultPlugboard wiring)

                Nothing ->
                    Nothing


concatWiring : Maybe Wiring -> Maybe Wiring -> Maybe Wiring
concatWiring a b =
    case a of
        Just wiringA ->
            case b of
                Just wiringB ->
                    Just (List.append wiringA wiringB)

                Nothing ->
                    Nothing

        Nothing ->
            Nothing


mergeWiring : Wiring -> Wiring -> Wiring
mergeWiring a b =
    let
        ( principal, secondary ) =
            if List.length a > List.length b then
                ( a, b )
            else
                ( b, a )

        merge wire =
            let
                maybeWire =
                    List.filter (\w -> w.input == wire.input) secondary
                        |> List.head
            in
                case maybeWire of
                    Just w ->
                        w

                    Nothing ->
                        wire
    in
        List.map merge principal


signal : Plug -> Plugboard -> Maybe Plug
signal plug plugboard =
    Wiring.signal plug plugboard False
