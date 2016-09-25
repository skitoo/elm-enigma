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
    , test "init" <|
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
    , describe "signal"
      [ test "should return 'J'" <|
          \() ->
            Rotor.signal rotor 'A' False
              |> Expect.equal (Just 'J')
      , test "should return 'H'" <|
          \() ->
            Rotor.signal rotor 'Z' False
              |> Expect.equal (Just 'H')
      , test "should return Nothing" <|
          \() ->
            Rotor.signal rotor '@' False
              |> Expect.equal Nothing
      , test "should return 'A'" <|
          \() ->
            Rotor.signal rotor 'J' True
              |> Expect.equal (Just 'A')
      , test "should return 'Z'" <|
          \() ->
            Rotor.signal rotor 'H' True
              |> Expect.equal (Just 'Z')
      ]
    ]
