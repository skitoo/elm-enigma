module WiringTests exposing (all)

import Test exposing (..)
import Expect
import Enigma.Wiring as Wiring


all: Test
all =
  describe "Wiring"
    [ describe "initWire"
      [ test "should return Wire" <|
          \() ->
            Wiring.initWire 'A' 'C'
              |> Expect.equal { input = 'A', output = 'C' }
      ]
    , describe "initWiring"
      [ test "shoud return Nothing" <|
          \() ->
            Wiring.initWiring "ABCDE" "ZYX"
              |> Expect.equal Nothing
      , test "should return a Wiring record" <|
          \() ->
            let expectedValue =
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
    ]
