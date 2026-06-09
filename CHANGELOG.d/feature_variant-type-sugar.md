* Add square-bracket syntax sugar for variant types

  `[ a :: X, b :: Y | r ]` is now sugar for `Variant ( a :: X, b :: Y | r )`,
  mirroring how `{ a :: X | r }` is sugar for `Record ( a :: X | r )`. `Variant`
  is a new built-in type constructor `Prim.Variant.Variant :: Row Type -> Type`
  (the dual of `Prim.Record`). The sugar is two-way: variant types are also
  pretty-printed back using the `[ ... ]` syntax in errors, docs, and the REPL.
