import RootFineParent3CacheTable

/-! A checked prefix may be consumed immediately while preserving exact source laws outside that prefix. -/
namespace MatrixBounds.Numeric.RootFinePartialParent3Cache

/-- Use a verified consecutive source prefix and the exact source formula at all remaining original nodes. -/
def numerator {count : ℕ} (table : RootFineParent3CacheTable 0 count)
    (node : Fin 945) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if before : node.val < count then table.lookup ⟨node.val, before⟩ strategy axis orbit
  else SuppliedRootFineParent3Integers.numerator node strategy axis orbit

/-- A partially cached hierarchy is equal to the complete original source hierarchy at every coordinate. -/
theorem numerator_eq {count : ℕ} (table : RootFineParent3CacheTable 0 count)
    (node : Fin 945) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) :
    numerator table node strategy axis orbit = SuppliedRootFineParent3Integers.numerator node strategy axis orbit := by
  unfold numerator
  split_ifs with before
  · have identity := table.checked ⟨node.val, before⟩ strategy axis orbit
    simpa only [Nat.zero_add, SuppliedRootFineParent3Columns.numerator_eq] using identity
  · rfl

end MatrixBounds.Numeric.RootFinePartialParent3Cache
