module UtilsTests exposing (all)

import Test exposing (..)
import Expect
import Enigma.Utils exposing
  ( baseAlphabet
  , isValidChar
  , getPosition
  )


all : Test
all =
  describe "Utils"
    [ describe "isValidChar"
        [ test "is valid" <|
            \() ->
              isValidChar 'A'
                |> Expect.true "Expected the char to be valid"
        , test "is not valid 1" <|
            \() ->
              isValidChar 'a'
                |> Expect.false "Expected the char to not be valid"
        , test "is not valid 2" <|
            \() ->
              isValidChar '4'
                |> Expect.false "Expected the char to not be valid"
        , test "is not valid 3" <|
            \() ->
              isValidChar 'À'
                |> Expect.false "Expected the char to not be valid"
        ]
    , describe "getPosition"
      [ test "A position" <|
          \() ->
            getPosition 'A' baseAlphabet
              |> Expect.equal (Just 0)
      , test "Z position" <|
          \() ->
            getPosition 'Z' baseAlphabet
              |> Expect.equal (Just 25)
      , test "z position" <|
          \() ->
            getPosition 'z' baseAlphabet
              |> Expect.equal Nothing
      ]
    ]
