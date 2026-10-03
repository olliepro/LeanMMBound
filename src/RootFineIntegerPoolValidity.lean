module

public import SuppliedRootFineRoot4IntegerValidity

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Exact source totals certify complete integer root mixtures and compatibility pools. -/
namespace MatrixBounds.Numeric.RootFineIntegerPools

open scoped BigOperators
noncomputable section
set_option exponentiation.threshold 1000

variable (parent4 : RootFineCachedRootExpression.Parent4Values)
  (sourceEq : ∀ parent axis orbit, parent4 parent axis orbit =
    SuppliedRootFineParent4Integers.numerator parent axis orbit)

include sourceEq

/-- Every cached root child law is nonnegative when its source identities are checked. -/
theorem law_nonnegative (axis : Fin 2) (column : Fin 153) (orbit : Fin 231) :
    0 ≤ law parent4 axis column orbit := by
  rw [law, RootFineCachedRootExpression.rootNumerator_eq parent4 sourceEq]
  exact SuppliedRootFineRoot4Integers.numerator_nonnegative _ _ _

/-- Every complete cached root child retains its exact original total. -/
theorem law_normalized (axis : Fin 2) (column : Fin 153) :
    ∑ orbit, law parent4 axis column orbit = (2:ℤ)^406 := by
  simp only [law, RootFineCachedRootExpression.rootNumerator_eq parent4 sourceEq]
  exact SuppliedRootFineRoot4Integers.numerator_normalized _ _

/-- Each source-weighted original child is coordinatewise nonnegative. -/
theorem contribution_nonnegative (axis : Fin 2) (column : Fin 153) (orbit : Fin 231) :
    0 ≤ contribution parent4 axis column orbit := by
  exact mul_nonneg (Int.natCast_nonneg _) (law_nonnegative parent4 sourceEq axis column orbit)

/-- Each complete weighted child has its original integer coefficient times the common total. -/
theorem contribution_normalized (axis : Fin 2) (column : Fin 153) :
    ∑ orbit, contribution parent4 axis column orbit = (weight column : ℤ)*(2:ℤ)^406 := by
  simp only [contribution, ← Finset.mul_sum, law_normalized parent4 sourceEq]

/-- The unpartitioned integer root mixture is coordinatewise nonnegative. -/
theorem mixture_nonnegative (axis : Fin 2) (orbit : Fin 231) :
    0 ≤ mixture parent4 axis orbit := by
  exact Finset.sum_nonneg (fun column _ => contribution_nonnegative parent4 sourceEq axis column orbit)

/-- The original complete root coefficient normalization gives the exact product denominator. -/
theorem mixture_normalized (axis : Fin 2) :
    ∑ orbit, mixture parent4 axis orbit = (2:ℤ)^450 := by
  simp only [mixture]
  rw [Finset.sum_comm]
  simp only [contribution_normalized parent4 sourceEq, ← Finset.sum_mul]
  simp only [weight]
  rw [← Nat.cast_sum, TypedProbabilityRow.numerator_total]
  norm_num

omit sourceEq in
/-- Complete original root coefficient mass retained by each singleton or coordinate sector. -/
def poolWeight (axis : Fin 2) (sector : Fin 170) : ℕ :=
  match finSumFinEquiv.symm sector with
  | Sum.inl selected => if RootFineExecutablePools.isolated axis selected then weight selected else 0
  | Sum.inr selected => ∑ column : Fin 153, if RootFineExecutablePools.isolated axis column then 0 else
      if RootFineExecutablePools.coordinate axis column = selected then weight column else 0

/-- Every complete original integer compatibility pool is coordinatewise nonnegative. -/
theorem pool_nonnegative (axis : Fin 2) (sector : Fin 170) (orbit : Fin 231) :
    0 ≤ pool parent4 axis sector orbit := by
  unfold pool
  cases (finSumFinEquiv.symm sector : Fin 153 ⊕ Fin 17) with
  | inl selected =>
    dsimp only
    split_ifs
    · exact contribution_nonnegative parent4 sourceEq axis selected orbit
    · exact le_rfl
  | inr selected =>
    dsimp only
    apply Finset.sum_nonneg
    intro column _
    split_ifs
    · exact le_rfl
    · exact contribution_nonnegative parent4 sourceEq axis column orbit
    · exact le_rfl

/-- Every complete original pool retains exactly its selected root weight times the orbit denominator. -/
theorem pool_normalized (axis : Fin 2) (sector : Fin 170) :
    ∑ orbit, pool parent4 axis sector orbit = (poolWeight axis sector : ℤ)*(2:ℤ)^406 := by
  unfold pool poolWeight
  cases (finSumFinEquiv.symm sector : Fin 153 ⊕ Fin 17) with
  | inl selected =>
    dsimp only
    split_ifs <;> simp only [contribution_normalized parent4 sourceEq, Nat.cast_zero,
      Finset.sum_const_zero, zero_mul]
  | inr selected =>
    dsimp only
    rw [Finset.sum_comm, Nat.cast_sum, Finset.sum_mul]
    apply Finset.sum_congr rfl
    intro column _
    split_ifs <;> simp only [contribution_normalized parent4 sourceEq, Nat.cast_zero,
      Finset.sum_const_zero, zero_mul]

end
end MatrixBounds.Numeric.RootFineIntegerPools
