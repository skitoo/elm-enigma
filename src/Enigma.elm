module Enigma exposing 
  ( rotorI
  , rotorII
  , rotorIII
  , rotorIV
  , rotorV
  , reflectorB
  , reflectorC
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

-}

import Enigma.Rotor exposing
  ( Rotor
  , buildRotor
  , initRotor
  )
import Enigma.Reflector exposing (..)


{-| Define rotorI -}
rotorI : Rotor
rotorI = buildRotor "EKMFLGDQVZNTOWYHXUSPAIBRCJ" 'Q'


{-| Define rotorII -}
rotorII : Rotor
rotorII = buildRotor "AJDKSIRUXBLHWTMCQGZNPYFVOE" 'E'


{-| Define rotorIII -}
rotorIII : Rotor
rotorIII = buildRotor "BDFHJLCPRTXVZNYEIWGAKMUSQO" 'V'


{-| Define rotorIV -}
rotorIV : Rotor
rotorIV = buildRotor "ESOVPZJAYQUIRHXLNFTGKDCMWB" 'J'


{-| Define rotorV -}
rotorV : Rotor
rotorV = buildRotor "VZBRGITYUPSDNHLXAWMJQOFECK" 'Z'


{-| Define reflectorB -}
reflectorB : Reflector
reflectorB = "YRUHQSLDPXNGOKMIEBFZCWVJAT"


{-| Define reflectorC -}
reflectorC : Reflector
reflectorC = "FVPJIAOYEDRZXWGCTKUQSBNMHL"

