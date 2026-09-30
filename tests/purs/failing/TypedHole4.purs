-- @shouldFailWith HoleInferredType
-- @shouldFailWith HoleInferredType
-- @shouldFailWith HoleSummary
module Main where

data F = X | Y

f :: forall a. F -> a -> a
f X b = ?help
f Y b = ?help
