module ReflectorTests exposing (all)

import Test exposing (..)
import Expect

import Enigma exposing (reflectorB)
import Enigma.Reflector exposing (computeReflector)



all : Test
all =
  describe "Reflector"
    [
      describe "compute 'C'"
        [ test "computeReflector" <|
            \() ->
              computeReflector reflectorB 'C'
                |> Expect.equal (Just 'U')
        , test "compute 'U'" <|
            \() ->
              computeReflector reflectorB 'U'
                |> Expect.equal (Just 'C')
        , test "compute '3'" <|
            \() ->
              computeReflector reflectorB '3'
                |> Expect.equal Nothing
        ]
    ]
