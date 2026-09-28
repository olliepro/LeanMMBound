import RootFineParent3CacheTable

/-! Any checked consecutive original-node window can immediately accelerate higher source convolutions. -/
namespace MatrixBounds.Numeric.RootFineParent3WindowCache

/-- Read a checked original-node window and retain the exact source formula outside its bounds. -/
def numerator {start count : ℕ} (table : RootFineParent3CacheTable start count)
    (node : Fin 945) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if present : start ≤ node.val ∧ node.val < start+count then
    table.lookup ⟨node.val-start, by omega⟩ strategy axis orbit
  else SuppliedRootFineParent3Integers.numerator node strategy axis orbit

/-- Every window lookup and every source fallback equals the complete original parent3 law. -/
theorem numerator_eq {start count : ℕ} (table : RootFineParent3CacheTable start count)
    (node : Fin 945) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) :
    numerator table node strategy axis orbit = SuppliedRootFineParent3Integers.numerator node strategy axis orbit := by
  unfold numerator
  split_ifs with present
  · refine (table.checked ⟨node.val-start, by omega⟩ strategy axis orbit).trans ?_
    rw [SuppliedRootFineParent3Columns.numerator_eq]
    congr 1
    apply Fin.ext
    dsimp only
    omega
  · rfl

end MatrixBounds.Numeric.RootFineParent3WindowCache
