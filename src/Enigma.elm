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

import Enigma.Rotor as Rotor exposing (Rotor)
import Enigma.Reflector exposing (..)


{-| Define rotorI -}
rotorI : Rotor
rotorI = Rotor.build "EKMFLGDQVZNTOWYHXUSPAIBRCJ" 'Q'


{-| Define rotorII -}
rotorII : Rotor
rotorII = Rotor.build "AJDKSIRUXBLHWTMCQGZNPYFVOE" 'E'


{-| Define rotorIII -}
rotorIII : Rotor
rotorIII = Rotor.build "BDFHJLCPRTXVZNYEIWGAKMUSQO" 'V'


{-| Define rotorIV -}
rotorIV : Rotor
rotorIV = Rotor.build "ESOVPZJAYQUIRHXLNFTGKDCMWB" 'J'


{-| Define rotorV -}
rotorV : Rotor
rotorV = Rotor.build "VZBRGITYUPSDNHLXAWMJQOFECK" 'Z'


{-| Define reflectorB -}
reflectorB : Reflector
reflectorB = "YRUHQSLDPXNGOKMIEBFZCWVJAT"


{-| Define reflectorC -}
reflectorC : Reflector
reflectorC = "FVPJIAOYEDRZXWGCTKUQSBNMHL"

