module Main where

import Prelude
import Effect (Effect)
import Effect.Console (log)
import Test.Assert (assert)
import Prim.Variant (Variant)

-- `.label binder` matches one case of a variant and binds its payload (the
-- elimination dual of the `.label` injector). Exhaustiveness is not yet
-- type-directed for variants, so a `_` catch-all is required.

describe :: Variant ( ok :: Int, err :: String ) -> String
describe v = case v of
  .ok n -> "ok:" <> show n
  .err e -> "err:" <> e
  _ -> "?"

-- a nested `.foo.bar` pattern mirrors the chain injector
unwrapNested :: Variant ( foo :: Variant ( bar :: Int ) ) -> Int
unwrapNested v = case v of
  .foo.bar n -> n
  _ -> 0

-- round-trips with the injector
ok :: Variant ( ok :: Int, err :: String )
ok = .ok 42

err :: Variant ( ok :: Int, err :: String )
err = .err "boom"

nested :: Variant ( foo :: Variant ( bar :: Int ) )
nested = .foo.bar 7

main :: Effect Unit
main = do
  assert (describe ok == "ok:42")
  assert (describe err == "err:boom")
  assert (unwrapNested nested == 7)
  log "Done"
