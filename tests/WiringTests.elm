module WiringTests exposing (all)

import Test exposing (..)
import Expect
import Enigma.Wiring as Wiring


all : Test
all =
    describe "Wiring"
        [ describe "initWire"
            [ test "should return Wire" <|
                \() ->
                    Wiring.initWire 'A' 'C'
                        |> Expect.equal { input = 'A', output = 'C' }
            ]
        , describe "initWiring"
            [ test "shoud return Nothing if string length are different" <|
                \() ->
                    Wiring.initWiring "ABCDE" "ZYX"
                        |> Expect.equal Nothing
            , test "should return Nothing" <|
                \() ->
                    Wiring.initWiring "AACD" "ZXYZ"
                        |> Expect.equal Nothing
            , test "should return a Wiring record" <|
                \() ->
                    let
                        expectedValue =
                            [ { input = 'A', output = 'Z' }
                            , { input = 'B', output = 'Y' }
                            , { input = 'C', output = 'X' }
                            , { input = 'D', output = 'W' }
                            , { input = 'E', output = 'V' }
                            ]
                    in
                        Wiring.initWiring "ABCDE" "ZYXWV"
                            |> Expect.equal (Just expectedValue)
            ]
        , describe "signal"
            [ test "should return Nothing" <|
                \() ->
                    let
                        maybeWiring =
                            Wiring.initWiring "ABCDE" "ZXYWV"
                    in
                        case maybeWiring of
                            Just wiring ->
                                Wiring.signal 'G' wiring False
                                    |> Expect.equal Nothing

                            Nothing ->
                                Expect.fail "should be fail"
            , test "should return 'Z'" <|
                \() ->
                    let
                        maybeWiring =
                            Wiring.initWiring "ABCDE" "ZXYWV"
                    in
                        case maybeWiring of
                            Just wiring ->
                                Wiring.signal 'A' wiring False
                                    |> Expect.equal (Just 'Z')

                            Nothing ->
                                Expect.fail "should be fail"
            , test "should return 'A'" <|
                \() ->
                    let
                        maybeWiring =
                            Wiring.initWiring "ABCDE" "ZXYWV"
                    in
                        case maybeWiring of
                            Just wiring ->
                                Wiring.signal 'Z' wiring True
                                    |> Expect.equal (Just 'A')

                            Nothing ->
                                Expect.fail "should be fail"
            ]
        , describe "inputPlug"
            [ test "should return 'A'" <|
                \() ->
                    Wiring.initWire 'A' 'Z'
                        |> Wiring.inputPlug
                        |> Expect.equal 'A'
            ]
        , describe "outputPlug"
            [ test "should return 'Z'" <|
                \() ->
                    Wiring.initWire 'Z' 'A'
                        |> Wiring.inputPlug
                        |> Expect.equal 'Z'
            ]
        , describe "inputAlphabet"
            [ test "should return ABC" <|
                \() ->
                    Maybe.withDefault [] (Wiring.initWiring "ABC" "ZYX")
                        |> Wiring.inputAlphabet
                        |> Expect.equal "ABC"
            ]
        , describe "outputAlphabet"
            [ test "should return ZYX" <|
                \() ->
                    Maybe.withDefault [] (Wiring.initWiring "ABC" "ZYX")
                        |> Wiring.outputAlphabet
                        |> Expect.equal "ZYX"
            ]
        ]
