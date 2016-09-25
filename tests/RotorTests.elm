module RotorTests exposing (all)

import Test exposing (..)
import Expect
import Enigma.Rotor as Rotor exposing (Rotor)

rotor : Rotor
rotor =
  { alphabet = "JGDQOXUSCAMIFRVTPNEWKBLZYH"
  , position = Nothing
  , turnover = 'Q'
  }


all : Test
all =
  describe "Rotor"
    [ test "build" <|
        \() ->
          Rotor.build "JGDQOXUSCAMIFRVTPNEWKBLZYH" 'Q'
            |> Expect.equal rotor
    , test "initRotor" <|
        \() ->
          Rotor.init rotor 'C'
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
    ]
