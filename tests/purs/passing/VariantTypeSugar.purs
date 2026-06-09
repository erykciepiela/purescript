module Main where

import Prelude
import Effect.Console (log)

-- The `[ ... ]` sugar desugars to `Prim.Variant.Variant ( ... )` and, like the
-- `{ ... }` record sugar, requires no import: `Prim.Variant` is implicitly
-- imported (qualified). These identity functions only type-check if the two
-- spellings denote the same type.

closed :: [ a :: Int, b :: String ] -> Prim.Variant.Variant ( a :: Int, b :: String )
closed x = x

closed' :: Prim.Variant.Variant ( a :: Int, b :: String ) -> [ a :: Int, b :: String ]
closed' x = x

open :: forall r. [ a :: Int | r ] -> Prim.Variant.Variant ( a :: Int | r )
open x = x

open' :: forall r. Prim.Variant.Variant ( a :: Int | r ) -> [ a :: Int | r ]
open' x = x

empty :: [] -> Prim.Variant.Variant ()
empty x = x

main = log "Done"
