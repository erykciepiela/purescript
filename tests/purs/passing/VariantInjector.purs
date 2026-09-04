module Main where

import Prelude
import Effect (Effect)
import Effect.Console (log)
import Prim.Variant (Variant)

-- `.label x` builds an (open) variant; bare `.label` is the injector function
-- (the value-level dual of the record accessor section `_.label`).

mkOk :: forall r. Int -> Variant ( ok :: Int | r )
mkOk = .ok

closed :: Variant ( ok :: Int, err :: String )
closed = .ok 42

-- injector section used as a first-class function
mapped :: Array (Variant ( ok :: Int | () ))
mapped = map (.ok) [1, 2, 3]

-- a dot-chain `.foo.bar` nests injectors: `.foo (.bar x)`
nested :: Variant ( foo :: Variant ( bar :: String ) )
nested = .foo.bar "abc"

-- bare chain is the composed injector function
mkNested :: forall r s. Int -> Variant ( a :: Variant ( b :: Int | s ) | r )
mkNested = .a.b

main :: Effect Unit
main = log "Done"
