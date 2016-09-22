port module Main exposing (..)

import Test exposing (Test, describe)
import Test.Runner.Node exposing (run)
import Json.Encode exposing (Value)

import UtilsTests


all : Test
all =
  describe "Enigma tests"
    [ UtilsTests.all
    ]


main : Program Value
main =
    run emit all

port emit : ( String, Value ) -> Cmd msg