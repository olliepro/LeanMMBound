import RootFineParent3WindowCache
import RootFineCachedParent4
import SuppliedRootFineParent4IntegerValidity

/-! Independently checked source windows suffice for complete exact parent4 numerical verification. -/
namespace MatrixBounds.Numeric.RootFineParent4FromWindow

open scoped BigOperators

/-- Evaluate the complete original parent4 law through a checked parent3 source window. -/
def numerator {start count : ℕ} (table : RootFineParent3CacheTable start count)
    (parent : Fin 105) (axis : Fin 3) (orbit : Fin 231) : ℤ :=
  RootFineCachedParent4.numerator (RootFineParent3WindowCache.numerator table) parent axis orbit

/-- Window acceleration preserves the complete exact original parent4 integer law. -/
theorem numerator_eq {start count : ℕ} (table : RootFineParent3CacheTable start count)
    (parent : Fin 105) (axis : Fin 3) (orbit : Fin 231) :
    numerator table parent axis orbit = SuppliedRootFineParent4Integers.numerator parent axis orbit :=
  RootFineCachedParent4.numerator_eq _ (RootFineParent3WindowCache.numerator_eq table) parent axis orbit

/-- Complete window-evaluated parent4 numerators remain nonnegative. -/
theorem numerator_nonnegative {start count : ℕ} (table : RootFineParent3CacheTable start count)
    (parent : Fin 105) (axis : Fin 3) (orbit : Fin 231) : 0 ≤ numerator table parent axis orbit := by
  rw [numerator_eq]
  exact SuppliedRootFineParent4Integers.numerator_nonnegative parent axis orbit

/-- Complete window-evaluated parent4 vectors retain their exact denominator2^406 total. -/
theorem numerator_normalized {start count : ℕ} (table : RootFineParent3CacheTable start count)
    (parent : Fin 105) (axis : Fin 3) : ∑ orbit, numerator table parent axis orbit = (2:ℤ)^406 := by
  simp only [numerator_eq]
  exact SuppliedRootFineParent4Integers.numerator_normalized parent axis

end MatrixBounds.Numeric.RootFineParent4FromWindow
