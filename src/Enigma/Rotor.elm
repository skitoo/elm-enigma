module Enigma.Rotor exposing (..)

import Enigma.Utils exposing (..)
import Enigma.Wiring as Wiring exposing (Wiring, Plug)
import String
import List
import Array


{-| Define a Rotor type.
-}
type alias Rotor =
    { wiring : Wiring
    , position : Maybe Plug
    , turnover : Plug
    }


{-| Initialize a Rotor.
-}
init : String -> Plug -> Rotor
init alphabet turnover =
    { wiring = Maybe.withDefault [] (Wiring.initWiring baseAlphabet alphabet)
    , position = Nothing
    , turnover = turnover
    }


{-| Set Rotor position.
-}
setPosition : Rotor -> Plug -> Rotor
setPosition rotor position =
    { rotor | position = Just position }


{-| Rotate a Rotor.
-}
rotate : Rotor -> Rotor
rotate rotor =
    case rotor.position of
        Just char ->
            let
                alphabet =
                    Wiring.outputAlphabet rotor.wiring

                pos =
                    getIndex char alphabet
            in
                case pos of
                    Just index ->
                        let
                            newIndex =
                                (index + 1) % String.length alphabet

                            newPosition =
                                getChar newIndex alphabet
                        in
                            { rotor | position = newPosition }

                    Nothing ->
                        rotor

        Nothing ->
            rotor


{-| Pass a signal into Rotor.
-}
signal : Plug -> Rotor -> Bool -> Maybe Plug
signal plug rotor reverse =
    case rotor.position of
        Just position ->
            let
                wiring = buildWiring position rotor.wiring
            in
                case wiring of
                    Just w ->
                        Wiring.signal plug w reverse
                    Nothing ->
                        Nothing
        Nothing ->
            Nothing


buildWiring : Plug -> Wiring -> Maybe Wiring
buildWiring position wiring =
    let
        inputAlphabet = Wiring.inputAlphabet wiring
        outputAlphabet = Wiring.outputAlphabet wiring
        stringPos = String.fromChar position
        temp = String.split stringPos outputAlphabet
            |> Array.fromList
        tail = Array.get 0 temp
        head = Array.get 1 temp
    in
        case tail of
            Just t ->
                case head of
                    Just h ->
                        Wiring.initWiring inputAlphabet (stringPos ++ h ++ t)
                    Nothing -> Nothing
            Nothing -> Nothing
