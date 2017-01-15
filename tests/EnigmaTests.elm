module EnigmaTests exposing (all)

import Test exposing (..)
import Expect

import Enigma exposing (Enigma, init, reflectorB, rotorI, rotorII, rotorIII)
import Enigma.Plugboard as Plugboard exposing (Plugboard)


plugboard : Plugboard
plugboard = Maybe.withDefault [] (Plugboard.init "ABCD" "WXYZ")


expectedEnigma : Enigma
expectedEnigma =
    { plugboard = plugboard
    , rotors = [ rotorI, rotorII, rotorIII ]
    , reflector = reflectorB
    }


all : Test
all =
    describe "Enigma"
        [ describe "init"
            [ test "should initialize an Enigma machine" <|
                \() ->
                    Enigma.init plugboard [ rotorI, rotorII, rotorIII ] reflectorB
                        |> Expect.equal (Just expectedEnigma)
            , test "should not initialize an Enigma machine with no rotor" <|
                \() ->
                    Enigma.init plugboard [] reflectorB
                        |> Expect.equal Nothing
            ]
        ]
