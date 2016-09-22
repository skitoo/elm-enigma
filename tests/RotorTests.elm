module RotorTests exposing (all)

import Test exposing (..)
import Expect
import Enigma.Rotor exposing (buildRotor, Rotor)

rotor : Rotor
rotor =
  { alphabet = "JGDQOXUSCAMIFRVTPNEWKBLZYH"
  , position = Nothing
  , turnover = 'Q'
  }


all : Test
all =
  describe "Rotor"
    [ test "buildRotor" <|
        \() ->
          buildRotor "JGDQOXUSCAMIFRVTPNEWKBLZYH" 'Q'
            |> Expect.equal rotor
    ]
