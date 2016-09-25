module RotorTests exposing (all)

import Test exposing (..)
import Expect
import Enigma.Rotor exposing (build, initRotor, Rotor)

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
          build "JGDQOXUSCAMIFRVTPNEWKBLZYH" 'Q'
            |> Expect.equal rotor
    , test "initRotor" <|
        \() ->
          initRotor rotor 'C'
            |> Expect.equal { rotor | position = Just 'C' }
    ]
