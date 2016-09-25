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
    ]
