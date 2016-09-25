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
    ]
