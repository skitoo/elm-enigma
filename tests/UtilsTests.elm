module UtilsTests exposing (all)

import Test exposing (..)
import Expect
import Enigma.Utils
    exposing
        ( baseAlphabet
        , isValidChar
        , getIndex
        , getChar
        , transpose
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
        , describe "getIndex"
            [ test "A position" <|
                \() ->
                    getIndex 'A' baseAlphabet
                        |> Expect.equal (Just 0)
            , test "Z position" <|
                \() ->
                    getIndex 'Z' baseAlphabet
                        |> Expect.equal (Just 25)
            , test "z position" <|
                \() ->
                    getIndex 'z' baseAlphabet
                        |> Expect.equal Nothing
            ]
        , describe "getChar"
            [ test "should return char at index 0" <|
                \() ->
                    getChar 0 baseAlphabet
                        |> Expect.equal (Just 'A')
            , test "should return char at index 25" <|
                \() ->
                    getChar 25 baseAlphabet
                        |> Expect.equal (Just 'Z')
            , test "should return Nothing" <|
                \() ->
                    getChar 1000 baseAlphabet
                        |> Expect.equal Nothing
            ]
        , describe "transpose"
            [ test "transpose" <|
                \() ->
                    transpose 'C' baseAlphabet "YRUHQSLDPXNGOKMIEBFZCWVJAT"
                        |> Expect.equal (Just 'U')
            , test "transpose 'U'" <|
                \() ->
                    transpose 'U' baseAlphabet "YRUHQSLDPXNGOKMIEBFZCWVJAT"
                        |> Expect.equal (Just 'C')
            , test "transpose '3'" <|
                \() ->
                    transpose '3' baseAlphabet "YRUHQSLDPXNGOKMIEBFZCWVJAT"
                        |> Expect.equal Nothing
            ]
        ]
