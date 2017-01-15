module Enigma
    exposing
        ( rotorI
        , rotorII
        , rotorIII
        , rotorIV
        , rotorV
        , reflectorB
        , reflectorC
        , Enigma
        , init
        )

{-| This library is an implementation of an Enigma machine.

# Definition
@docs rotorI
@docs rotorII
@docs rotorIII
@docs rotorIV
@docs rotorV
@docs reflectorB
@docs reflectorC
@docs Enigma
@docs init

-}

import Enigma.Rotor as Rotor exposing (Rotor)
import Enigma.Reflector as Reflector exposing (Reflector)
import Enigma.Plugboard as Plugboard exposing (Plugboard)


{-| Define rotorI
-}
rotorI : Rotor
rotorI =
    Rotor.init "EKMFLGDQVZNTOWYHXUSPAIBRCJ" 'Q'


{-| Define rotorII
-}
rotorII : Rotor
rotorII =
    Rotor.init "AJDKSIRUXBLHWTMCQGZNPYFVOE" 'E'


{-| Define rotorIII
-}
rotorIII : Rotor
rotorIII =
    Rotor.init "BDFHJLCPRTXVZNYEIWGAKMUSQO" 'V'


{-| Define rotorIV
-}
rotorIV : Rotor
rotorIV =
    Rotor.init "ESOVPZJAYQUIRHXLNFTGKDCMWB" 'J'


{-| Define rotorV
-}
rotorV : Rotor
rotorV =
    Rotor.init "VZBRGITYUPSDNHLXAWMJQOFECK" 'Z'


{-| Define reflectorB
-}
reflectorB : Reflector
reflectorB =
    Maybe.withDefault [] (Reflector.init "YRUHQSLDPXNGOKMIEBFZCWVJAT")


{-| Define reflectorC
-}
reflectorC : Reflector
reflectorC =
    Maybe.withDefault [] (Reflector.init "FVPJIAOYEDRZXWGCTKUQSBNMHL")


{-| Define Enigma type
-}
type alias Enigma =
    { plugboard : Plugboard
    , rotors : List Rotor
    , reflector : Reflector
    }

{-| Initialize Enigma
-}
init : Plugboard -> List Rotor -> Reflector -> Maybe Enigma
init plugboard rotors reflector =
    if List.length rotors > 0 then
        Just
            { plugboard = plugboard
            , rotors = rotors
            , reflector = reflector
            }
    else
        Nothing


