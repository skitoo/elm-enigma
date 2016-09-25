module ReflectorTests exposing (all)

import Test exposing (..)
import Expect

import Enigma exposing (reflectorB)
import Enigma.Reflector exposing (signal)



all : Test
all =
  describe "Reflector"
    [
      describe "signal"
        [ test "should return 'U'" <|
            \() ->
              signal 'C' reflectorB
                |> Expect.equal (Just 'U')
        , test "should return 'C'" <|
            \() ->
              signal 'U' reflectorB
                |> Expect.equal (Just 'C')
        , test "should return Nothing" <|
            \() ->
              signal '3' reflectorB
                |> Expect.equal Nothing
        ]
    ]
