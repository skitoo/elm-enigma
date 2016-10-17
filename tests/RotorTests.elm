module RotorTests exposing (all)

import Test exposing (..)
import Expect
import Enigma.Rotor as Rotor exposing (Rotor)
import Enigma.Wiring as Wiring
import Enigma.Utils exposing (baseAlphabet)


rotor : Rotor
rotor =
    { wiring = Maybe.withDefault [] (Wiring.initWiring baseAlphabet "JGDQOXUSCAMIFRVTPNEWKBLZYH")
    , position = Nothing
    , turnover = 'Q'
    }


initializedRotor : Rotor
initializedRotor =
    { wiring = Maybe.withDefault [] (Wiring.initWiring baseAlphabet "JGDQOXUSCAMIFRVTPNEWKBLZYH")
    , position = Just 'I'
    , turnover = 'Q'
    }


all : Test
all =
    describe "Rotor"
        [ test "build" <|
            \() ->
                Rotor.init "JGDQOXUSCAMIFRVTPNEWKBLZYH" 'Q'
                    |> Expect.equal rotor
        , test "setPosition" <|
            \() ->
                Rotor.setPosition rotor 'C'
                    |> Expect.equal { rotor | position = Just 'C' }
        , describe "rotate"
            [ test "should be nothing" <|
                \() ->
                    Rotor.rotate rotor
                        |> Expect.equal rotor
            , test "should pass position to X" <|
                \() ->
                    { rotor | position = Just 'O' }
                        |> Rotor.rotate
                        |> Expect.equal { rotor | position = Just 'X' }
            , test "should pass position to J" <|
                \() ->
                    { rotor | position = Just 'H' }
                        |> Rotor.rotate
                        |> Expect.equal { rotor | position = Just 'J' }
            ]
        , describe "signal"
            [ test "should return Nothing if rotor has not position" <|
                \() ->
                    Rotor.signal 'A' rotor False
                        |> Expect.equal Nothing
            , test "should return Nothing" <|
                \() ->
                    Rotor.signal '@' initializedRotor False
                        |> Expect.equal Nothing
            , test "should return 'I'" <|
                \() ->
                    Rotor.signal 'A' initializedRotor False
                        |> Expect.equal (Just 'I')
            , test "should return 'M'" <|
                \() ->
                    Rotor.signal 'Z' initializedRotor False
                        |> Expect.equal (Just 'M')
            , test "should return 'H'" <|
                \() ->
                    Rotor.signal 'O' initializedRotor False
                        |> Expect.equal (Just 'H')

            , test "should return 'A'" <|
                \() ->
                    Rotor.signal 'I' initializedRotor True
                        |> Expect.equal (Just 'A')
            , test "should return 'Z'" <|
                \() ->
                    Rotor.signal 'M' initializedRotor True
                        |> Expect.equal (Just 'Z')
            , test "should return 'O'" <|
                \() ->
                    Rotor.signal 'H' initializedRotor True
                        |> Expect.equal (Just 'O')
            ]
        ]
