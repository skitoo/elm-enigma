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
import Enigma.Reflector as Reflector exposing (Reflector)


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
reflectorB = Maybe.withDefault [] (Reflector.init "YRUHQSLDPXNGOKMIEBFZCWVJAT")


{-| Define reflectorC -}
reflectorC : Reflector
reflectorC = Maybe.withDefault [] (Reflector.init "FVPJIAOYEDRZXWGCTKUQSBNMHL")

