module ReflectorTests exposing (all)

import Test exposing (..)
import Expect

import Enigma exposing (reflectorB)
import Enigma.Reflector exposing (signal)



all : Test
all =
  describe "Reflector"
    [
      describe "signal 'C'"
        [ test "signal" <|
            \() ->
              signal reflectorB 'C'
                |> Expect.equal (Just 'U')
        , test "signal 'U'" <|
            \() ->
              signal reflectorB 'U'
                |> Expect.equal (Just 'C')
        , test "signal '3'" <|
            \() ->
              signal reflectorB '3'
                |> Expect.equal Nothing
        ]
    ]
