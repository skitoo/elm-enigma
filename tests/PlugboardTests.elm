module PlugboardTests exposing (all)

import Test exposing (..)
import Expect
import Enigma.Plugboard as Plugboard exposing (Plugboard)
import Enigma.Wiring exposing (Wiring, initWire)


defaultWiring : Wiring
defaultWiring =
    [ initWire 'A' 'A'
    , initWire 'B' 'B'
    , initWire 'C' 'C'
    , initWire 'D' 'D'
    , initWire 'E' 'E'
    , initWire 'F' 'F'
    , initWire 'G' 'G'
    , initWire 'H' 'H'
    , initWire 'I' 'I'
    , initWire 'J' 'J'
    , initWire 'K' 'K'
    , initWire 'L' 'L'
    , initWire 'M' 'M'
    , initWire 'N' 'N'
    , initWire 'O' 'O'
    , initWire 'P' 'P'
    , initWire 'Q' 'Q'
    , initWire 'R' 'R'
    , initWire 'S' 'S'
    , initWire 'T' 'T'
    , initWire 'U' 'U'
    , initWire 'V' 'V'
    , initWire 'W' 'W'
    , initWire 'X' 'X'
    , initWire 'Y' 'Y'
    , initWire 'Z' 'Z'
    ]


wiring : Wiring
wiring =
    [ initWire 'A' 'W'
    , initWire 'B' 'X'
    , initWire 'C' 'Y'
    , initWire 'D' 'Z'
    , initWire 'E' 'E'
    , initWire 'F' 'F'
    , initWire 'G' 'G'
    , initWire 'H' 'H'
    , initWire 'I' 'I'
    , initWire 'J' 'J'
    , initWire 'K' 'K'
    , initWire 'L' 'L'
    , initWire 'M' 'M'
    , initWire 'N' 'N'
    , initWire 'O' 'O'
    , initWire 'P' 'P'
    , initWire 'Q' 'Q'
    , initWire 'R' 'R'
    , initWire 'S' 'S'
    , initWire 'T' 'T'
    , initWire 'U' 'U'
    , initWire 'V' 'V'
    , initWire 'W' 'A'
    , initWire 'X' 'B'
    , initWire 'Y' 'C'
    , initWire 'Z' 'D'
    ]


all : Test
all =
    describe "Plugboard"
        [ describe "defaultPlugboard"
            [ test "should return plugboard with base alphabet" <|
                \() ->
                    Expect.equal Plugboard.defaultPlugboard defaultWiring
            ]
        , describe "init"
            [ test "should return wiring with 'ABCD' invert with 'WXYZ' " <|
                \() ->
                    Plugboard.init "ABCD" "WXYZ"
                        |> Expect.equal (Just wiring)
            , test "should return Nothing if inputs and outputs length are different" <|
                \() ->
                    Plugboard.init "ABCD" "WXY"
                        |> Expect.equal Nothing
            , test "should return Nothing if length entries is superior than 10" <|
                \() ->
                    Plugboard.init "ABCDEFGHIJZ" "KLMNOPQRSTX"
                        |> Expect.equal Nothing
            , test "should return Nothing if plug was taken 2 or more time (first)" <|
                \() ->
                    Plugboard.init "ABCD" "ZEAX"
                        |> Expect.equal Nothing
            , test "should return Nothing if plug was taken 2 or more time (second)" <|
                \() ->
                    Plugboard.init "ABCA" "ZEUX"
                        |> Expect.equal Nothing
            ]
        ]
