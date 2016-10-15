module Enigma.Wiring exposing (..)

import String
import List
import Enigma.Utils as Utils


{-| Define Plug.
-}
type alias Plug =
    Char


{-| Define Wire.
-}
type alias Wire =
    { input : Plug
    , output : Plug
    }


{-| Initialize a Wire with 2 Plugs.
-}
initWire : Plug -> Plug -> Wire
initWire input output =
    { input = input
    , output = output
    }


{-| Define Wiring.
-}
type alias Wiring =
    List Wire


{-| Initialize a Wiring with 2 Strings.
-}
initWiring : String -> String -> Maybe Wiring
initWiring inputAlphabet outputAlphabet =
    if String.length inputAlphabet == String.length outputAlphabet then
        let
            inputs =
                String.toList inputAlphabet

            outputs =
                String.toList outputAlphabet
        in
            if Utils.hasDuplicates inputs || Utils.hasDuplicates outputs then
                Nothing
            else
                Just (List.map2 initWire inputs outputs)
    else
        Nothing


{-| Send signal in Wiring.
-}
signal : Plug -> Wiring -> Bool -> Maybe Plug
signal plug wiring reverse =
    let
        outputFilter : Wire -> Bool
        outputFilter wire =
            wire.output == plug

        inputFilter : Wire -> Bool
        inputFilter wire =
            wire.input == plug

        maybeWire =
            List.filter
                (if reverse then
                    outputFilter
                 else
                    inputFilter
                )
                wiring
                |> List.head
    in
        case maybeWire of
            Just wire ->
                Just
                    (if reverse then
                        wire.input
                     else
                        wire.output
                    )

            Nothing ->
                Nothing


{-| Extract alphabet from Wiring.
-}
extractAlphabet : (Wire -> Plug) -> Wiring -> String
extractAlphabet func wiring =
    List.map func wiring
        |> List.map String.fromChar
        |> String.join ""


{-| Return input Plug of a Wire.
-}
inputPlug : Wire -> Plug
inputPlug wire =
    wire.input


{-| Return input alphabet from Wiring.
-}
inputAlphabet : Wiring -> String
inputAlphabet wiring =
    extractAlphabet inputPlug wiring


{-| Return output Plug of a Wire.
-}
outputPlug : Wire -> Plug
outputPlug wire =
    wire.output


{-| Return output alphabet from Wiring.
-}
outputAlphabet : Wiring -> String
outputAlphabet wiring =
    extractAlphabet outputPlug wiring


findWireByInput : Plug -> Wiring -> Maybe Wire
findWireByInput plug wiring =
    List.filter (\wire -> inputPlug wire == plug) wiring
        |> List.head


findWireByOutput : Plug -> Wiring -> Maybe Wire
findWireByOutput plug wiring =
    List.filter (\wire -> outputPlug wire == plug) wiring
        |> List.head
