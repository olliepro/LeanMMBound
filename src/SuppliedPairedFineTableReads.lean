import RootFineParent3CacheTable

/-! Proof-free reads of the checked complete parent3 tables keep kernel evaluations small: no bound
proof is instantiated per lookup, and every read is still identified with the original integer law. -/
namespace MatrixBounds.Numeric.SuppliedPairedFine

/-- A default read of a complete 378-entry table equals its bounded read at the same coordinates. -/
theorem arrayRead_eq (values : Array ℤ) (size : values.size = 378) (strategy : Fin 6) (axis : Fin 3)
    (orbit : Fin 21) :
    values.getD (strategy.val*63+axis.val*21+orbit.val) 0 =
      values[(0 : Fin 1).val*378+strategy.val*63+axis.val*21+orbit.val]'(by
        have := strategy.isLt
        have := axis.isLt
        have := orbit.isLt
        simp only [size, Fin.val_zero, Nat.zero_mul, Nat.zero_add]
        omega) := by
  have inside : strategy.val*63+axis.val*21+orbit.val < values.size := by
    rw [size]
    have := strategy.isLt
    have := axis.isLt
    have := orbit.isLt
    omega
  simp only [Array.getD_eq_getD_getElem?, Array.getElem?_eq_getElem inside, Option.getD_some, Fin.val_zero,
    Nat.zero_mul, Nat.zero_add]

/-- A single checked node table read at its own node equals the complete original integer law. -/
theorem nodeRead_eq {start : ℕ} (table : RootFineParent3CacheTable start 1)
    (read : Fin 6 → Fin 3 → Fin 21 → ℤ)
    (readEq : ∀ strategy axis orbit, read strategy axis orbit = table.lookup 0 strategy axis orbit)
    (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) :
    read strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator ⟨start, by have := table.bounded; omega⟩ strategy axis orbit := by
  rw [readEq, table.checked, SuppliedRootFineParent3Columns.numerator_eq]
  congr 1

/-- Extend a complete parent3 lookup by one proof-free node read at its original node. -/
def extendParent3 (node : ℕ) (read : Fin 6 → Fin 3 → Fin 21 → ℤ)
    (rest : Fin 945 → Fin 6 → Fin 3 → Fin 21 → ℤ) : Fin 945 → Fin 6 → Fin 3 → Fin 21 → ℤ :=
  fun source strategy axis orbit =>
    if source.val = node then read strategy axis orbit else rest source strategy axis orbit

/-- An extension by an exact node read stays exact everywhere. -/
theorem extendParent3_eq (node : ℕ) (bound : node < 945) (read : Fin 6 → Fin 3 → Fin 21 → ℤ)
    (readEq : ∀ strategy axis orbit, read strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator ⟨node, bound⟩ strategy axis orbit)
    (rest : Fin 945 → Fin 6 → Fin 3 → Fin 21 → ℤ)
    (restEq : ∀ source strategy axis orbit, rest source strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator source strategy axis orbit) :
    ∀ source strategy axis orbit, extendParent3 node read rest source strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator source strategy axis orbit := by
  intro source strategy axis orbit
  unfold extendParent3
  split_ifs with selected
  · rw [readEq]
    congr 1
    exact Fin.ext selected.symm
  · exact restEq source strategy axis orbit

end MatrixBounds.Numeric.SuppliedPairedFine
