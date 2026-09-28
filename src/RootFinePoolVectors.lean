import RootFineIntegerPoolValidity
import RootFineFiniteVectorCache

/-! Complete root mixtures and coordinate pools retain a fixed enumeration of original source labels. -/
namespace MatrixBounds.Numeric.RootFinePoolVectors

open scoped BigOperators
noncomputable section

/-- Physical fine axis, retaining one mixture and all17 coordinate pool labels per axis. -/
def axis (row : Fin 36) : Fin 2 := ⟨row.val/18, by have := row.isLt; omega⟩

/-- Original coordinate-pool sector following each complete mixture row. -/
def sector (row : Fin 36) : Fin 170 := ⟨153+(row.val%18)-1, by omega⟩

/-- One complete root mixture or coordinate pool from the actual parent integer hierarchy. -/
def numerator (parent4 : RootFineCachedRootExpression.Parent4Values) (row : Fin 36) (orbit : Fin 231) : ℤ :=
  if row.val%18 = 0 then RootFineIntegerPools.mixture parent4 (axis row) orbit
  else RootFineIntegerPools.pool parent4 (axis row) (sector row) orbit

/-- Exact original source coefficient total of a complete mixture or coordinate pool. -/
def total (row : Fin 36) : ℤ :=
  if row.val%18 = 0 then (2:ℤ)^450
  else (RootFineIntegerPools.poolWeight (axis row) (sector row) : ℤ)*(2:ℤ)^406

/-- Source-identified complete root mixture and pool vectors are nonnegative. -/
theorem numerator_nonnegative (parent4 : RootFineCachedRootExpression.Parent4Values)
    (sourceEq : ∀ parent selected orbit, parent4 parent selected orbit =
      SuppliedRootFineParent4Integers.numerator parent selected orbit)
    (row : Fin 36) (orbit : Fin 231) : 0 ≤ numerator parent4 row orbit := by
  unfold numerator
  split_ifs
  · exact RootFineIntegerPools.mixture_nonnegative parent4 sourceEq _ _
  · exact RootFineIntegerPools.pool_nonnegative parent4 sourceEq _ _ _

/-- Every source-identified complete vector has its exact original coefficient total. -/
theorem numerator_normalized (parent4 : RootFineCachedRootExpression.Parent4Values)
    (sourceEq : ∀ parent selected orbit, parent4 parent selected orbit =
      SuppliedRootFineParent4Integers.numerator parent selected orbit)
    (row : Fin 36) : ∑ orbit, numerator parent4 row orbit = total row := by
  unfold numerator total
  split_ifs
  · exact RootFineIntegerPools.mixture_normalized parent4 sourceEq _
  · exact RootFineIntegerPools.pool_normalized parent4 sourceEq _ _

end
end MatrixBounds.Numeric.RootFinePoolVectors
