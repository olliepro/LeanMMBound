module

public import FKLFine4.Static4
public import FKLFine3.Weight3
public import FKLBridge.Idx.DyadicAlloc4
public import SuppliedPairedFineStageExpressions

/-! Fast level-four role weights `rootNumerator × allocation4` at denominator `2^88`. -/

@[expose] public section

namespace MatrixBounds.Numeric.FKLFine4

open FKL FKLFine3 Tensor Tensor.CW SuppliedPairedFine SuppliedPopulationWeights

/-- Root mass numerator of source `p`. -/
noncomputable def fRoot (p : ℕ) : ℕ := FKLBridge.Dyadic.cell (ptGet FKLBridge.Idx.DyadicRootAlpha.tree 0 1 0) (rcol p)

/-- Role weight numerator of source `p`, role `r`. -/
noncomputable def fCr4 (p r : ℕ) : ℕ :=
  Nat.mul (fRoot p) (FKLBridge.Dyadic.cell (ptGet FKLBridge.Idx.DyadicAlloc4.tree 7 13 p) r)

theorem fRoot_eq (p : Fin 105) : fRoot p = rootNumerator p := by
  have hw := SuppliedTypedParameters.rootDistribution.width_eq
  have hg : ptGet FKLBridge.Idx.DyadicRootAlpha.tree 0 1 0 =
      (ParameterIndexData.DyadicRootAlpha.table.get 0).val := (FKLBridge.Idx.DyadicRootAlpha.get_eq 0).symm
  unfold fRoot
  rw [rcol_eq, hg, FKLBridge.Dyadic.cell_eq _ _ (by
      change (rootColumn p).val < SuppliedTypedParameters.rootDistribution.row.width
      rw [hw]; exact (rootColumn p).isLt)]
  rfl

theorem al4_eq (p : Fin 105) (r : Fin 6) :
    FKLBridge.Dyadic.cell (ptGet FKLBridge.Idx.DyadicAlloc4.tree 7 13 p) r =
      SuppliedRoleIndex.allocation4 p (SuppliedRoleIndex.order r) := by
  have hw := (SuppliedTypedParameters.allocation4 p).width_eq
  have hcol : SuppliedRoleIndex.column (SuppliedRoleIndex.order r) = r := by revert r; decide
  rw [← FKLBridge.Idx.DyadicAlloc4.get_eq, FKLBridge.Dyadic.cell_eq _ r (by
    change r.val < (SuppliedTypedParameters.allocation4 p).row.width; rw [hw]; exact r.isLt)]
  unfold SuppliedRoleIndex.allocation4
  rw [hcol]; rfl

theorem fCr4_eq (p : Fin 105) (r : Fin 6) :
    (fCr4 p r : ℝ) / 2 ^ 88 = (sourceMass4 (p, SuppliedRoleIndex.order r) : ℝ) := by
  have e : fCr4 p r = rootNumerator p * SuppliedRoleIndex.allocation4 p (SuppliedRoleIndex.order r) := by
    unfold fCr4; rw [fRoot_eq, al4_eq]; rfl
  rw [e, sourceMass4]
  push_cast
  congr 1
  rw [DyadicPopulationArithmetic.denominator]
  norm_num

end MatrixBounds.Numeric.FKLFine4
