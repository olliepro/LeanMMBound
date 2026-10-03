module

public import RootFineExecutablePools

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Exact integer root mixtures and pools postpone all rational division until after summation. -/
namespace MatrixBounds.Numeric.RootFineIntegerPools

open scoped BigOperators
noncomputable section
set_option exponentiation.threshold 1000
set_option maxRecDepth 100000
set_option maxHeartbeats 32000000

/-- Original complete root coefficients, before division by their common denominator. -/
def weight (column : Fin 153) : ℕ := SuppliedTypedParameters.rootDistribution.numerator column

/-- Complete original integer orbit law on either physical root fine axis. -/
def law (parent4 : RootFineCachedRootExpression.Parent4Values) (axis : Fin 2)
    (column : Fin 153) (orbit : Fin 231) : ℤ :=
  RootFineCachedRootExpression.rootNumerator parent4 column
    (SuppliedRootStage.axes (SuppliedRootFine.physicalAxis axis)) orbit

/-- Source-weighted integer contribution of one complete original root child. -/
def contribution (parent4 : RootFineCachedRootExpression.Parent4Values) (axis : Fin 2)
    (column : Fin 153) (orbit : Fin 231) : ℤ :=
  (weight column : ℤ)*law parent4 axis column orbit

/-- Exact product-denominator arithmetic agrees with the original rational contribution. -/
theorem contribution_value (parent4 : RootFineCachedRootExpression.Parent4Values) (axis : Fin 2)
    (column : Fin 153) (orbit : Fin 231) :
    (contribution parent4 axis column orbit : ℚ)/(2:ℚ)^450 =
      SuppliedRootCoarse.mass column*RootFineCachedRootExpression.mass parent4 axis column orbit := by
  have denominator : (2:ℚ)^450 = (17592186044416:ℚ)*(2:ℚ)^406 := by norm_num
  simp only [contribution, law, weight, SuppliedRootCoarse.mass, TypedProbabilityRow.rational,
    RootFineCachedRootExpression.mass, Int.cast_mul, Int.cast_natCast, Nat.cast_ofNat]
  rw [denominator, mul_div_mul_comm]

/-- Complete unpartitioned root integer mixture, at denominator2^450. -/
def mixture (parent4 : RootFineCachedRootExpression.Parent4Values) (axis : Fin 2)
    (orbit : Fin 231) : ℤ :=
  ∑ column, contribution parent4 axis column orbit

/-- The complete integer mixture represents exactly the original rational mixture. -/
theorem mixture_value (parent4 : RootFineCachedRootExpression.Parent4Values) (axis : Fin 2)
    (orbit : Fin 231) :
    (mixture parent4 axis orbit : ℚ)/(2:ℚ)^450 =
      RootFineCachedRootExpression.mixture parent4 axis orbit := by
  simp only [mixture, Int.cast_sum, Finset.sum_div, contribution_value,
    RootFineCachedRootExpression.mixture]

/-- Exact integer compatibility pools retain every singleton and coordinate sector. -/
def pool (parent4 : RootFineCachedRootExpression.Parent4Values) (axis : Fin 2)
    (sector : Fin 170) (orbit : Fin 231) : ℤ :=
  match finSumFinEquiv.symm sector with
  | Sum.inl selected => if RootFineExecutablePools.isolated axis selected then
      contribution parent4 axis selected orbit else 0
  | Sum.inr selected => ∑ column : Fin 153, if RootFineExecutablePools.isolated axis column then 0 else
      if RootFineExecutablePools.coordinate axis column = selected then
        contribution parent4 axis column orbit else 0

/-- Each complete integer pool agrees with its original labelled rational pool. -/
theorem pool_value (parent4 : RootFineCachedRootExpression.Parent4Values) (axis : Fin 2)
    (sector : Fin 170) (orbit : Fin 231) :
    (pool parent4 axis sector orbit : ℚ)/(2:ℚ)^450 =
      RootFineExecutablePools.pool parent4 axis sector orbit := by
  unfold pool RootFineExecutablePools.pool
  cases (finSumFinEquiv.symm sector : Fin 153 ⊕ Fin 17) with
  | inl selected =>
    dsimp only
    split_ifs <;> simp only [contribution_value, Int.cast_zero, zero_div]
  | inr selected =>
    dsimp only
    rw [Int.cast_sum, Finset.sum_div]
    apply Finset.sum_congr rfl
    intro column _
    split_ifs <;> simp only [contribution_value, Int.cast_zero, zero_div]

/-- The original complete fine expression evaluated with division only after integer summation. -/
def expression (parent4 : RootFineCachedRootExpression.Parent4Values) (axis : Fin 2) : RationalLogExpression :=
  orbitEntropyExpression (fun orbit => (mixture parent4 axis orbit : ℚ)/(2:ℚ)^450) OrbitLevel4.sizes++
    scaleLogExpression (-1) (finiteLogSum (fun sector =>
      orbitMassEntropyExpression (fun orbit => (pool parent4 axis sector orbit : ℚ)/(2:ℚ)^450)
        OrbitLevel4.sizes))

/-- Integer evaluation preserves all terms in the supplied root fine-rate expression. -/
theorem expression_eq (parent4 : RootFineCachedRootExpression.Parent4Values) (axis : Fin 2) :
    expression parent4 axis = RootFineExecutablePools.expression parent4 axis := by
  simp only [expression, mixture_value, pool_value, RootFineExecutablePools.expression]

end
end MatrixBounds.Numeric.RootFineIntegerPools
