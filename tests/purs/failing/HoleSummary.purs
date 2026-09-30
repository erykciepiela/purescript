-- @shouldFailWith HoleInferredType
-- @shouldFailWith HoleInferredType
-- @shouldFailWith HoleInferredType
-- @shouldFailWith HoleSummary
module Main where

-- Each hole's own message numbers its unknowns from t0, so `?load` and
-- `?parse` both read `-> t0`. The summary numbers them once: `?combine`
-- takes what `?load` returns as t0 and what `?parse` returns as t1.

total :: Int
total = ?combine (?load 1) (?parse "2")
