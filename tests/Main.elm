port module Main exposing (..)

import Test exposing (Test, describe)
import Test.Runner.Node exposing (run)
import Json.Encode exposing (Value)
import RotorTests
import ReflectorTests
import UtilsTests
import WiringTests
import PlugboardTests


all : Test
all =
    describe "Enigma tests"
        [ UtilsTests.all
        , WiringTests.all
        , ReflectorTests.all
        , RotorTests.all
        , PlugboardTests.all
        ]


main : Program Value
main =
    run emit all


port emit : ( String, Value ) -> Cmd msg
