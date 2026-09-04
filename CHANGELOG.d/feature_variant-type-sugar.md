* Add square-bracket syntax sugar for variant types

  `[ a :: X, b :: Y | r ]` is now sugar for `Variant ( a :: X, b :: Y | r )`,
  mirroring how `{ a :: X | r }` is sugar for `Record ( a :: X | r )`. `Variant`
  is a new built-in type constructor `Prim.Variant.Variant :: Row Type -> Type`
  (the dual of `Prim.Record`). The sugar is two-way: variant types are also
  pretty-printed back using the `[ ... ]` syntax in errors, docs, and the REPL.

* Typed holes are now reported alongside constraint-solving failures in the
  same binding group, instead of being swallowed by them; each reported hole's
  type is wrapped in the unsolved constraints it shares unknowns with, so one
  message shows the hole's shape and the row it draws from under a single
  unknown numbering.
