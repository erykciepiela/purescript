-- @shouldFailWith HoleInferredType
module Main where

-- Only values the module can name are suggested: `negate`, imported
-- explicitly, and the module's own `double`, but not the rest of Prelude.
-- `unsafeCoerce` is in scope, but it fits every function hole, so it says
-- nothing about this one.

import Prelude (negate)
import Unsafe.Coerce (unsafeCoerce)

double :: Int -> Int
double n = n

step :: Int -> Int
step = ?step
