module

public import SuppliedPairedCoarseExpressions

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! The complete supplied paired coarse expressions are the actual stage rates,
including every positive source label and every original role allocation. -/
namespace MatrixBounds.Numeric.SuppliedPairedCoarse

open Tensor Tensor.CW Interface SuppliedPopulationWeights
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
set_option maxRecDepth 5000
set_option maxHeartbeats 2000000
attribute [local irreducible] sourceExpression3 sourceExpression4

/-- The actual level-4 coarse rate includes every original source and physical role. -/
theorem original_rate4 : SuppliedFixedStages.level4.rates 0 =
    ∑ label : SuppliedStage4.Source × AxisOrder, (role4Weight label : ℝ)*
      (SuppliedStage4.split label.1 label.2).coarseRetention (SuppliedStage4.potential label.1 label.2 0)
        (SuppliedStage4.potential label.1 label.2 1) (SuppliedStage4.potential label.1 label.2 2) := by
  have equality := sum_positive_weights role4Weight (fun label =>
    (SuppliedStage4.split label.1 label.2).coarseRetention (SuppliedStage4.potential label.1 label.2 0)
      (SuppliedStage4.potential label.1 label.2 1) (SuppliedStage4.potential label.1 label.2 2))
  simpa only [SuppliedFixedStages.level4, SuppliedRationalStages.stage4,
    Mixed.RationalStage.rates, Matrix.cons_val_zero] using equality

/-- Exact expression for the actual full level-4 coarse rate at the common root population scale. -/
theorem stage4_rate_expression : SuppliedFixedStages.level4.rates 0 =
    (rootWeight : ℝ)*rationalLogValue expression4 := by
  rw [original_rate4]
  simp only [Fintype.sum_prod_type]
  conv_rhs => simp only [expression4, finiteLogSum_value, scaleLogExpression_value, Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro source _
  conv_lhs => rw [← SuppliedRoleIndex.orderEquiv.sum_comp]
  apply Finset.sum_congr rfl
  intro role _
  rw [← mul_assoc, mass4_eq, sourceExpression4_value]
  rfl

/-- The actual level-3 coarse rate includes every original source and physical role. -/
theorem original_rate3 : SuppliedFixedStages.level3.rates 0 =
    ∑ label : SuppliedStage3.Source × AxisOrder, (role3Weight label : ℝ)*
      (SuppliedStage3.split label.1 label.2).coarseRetention (SuppliedStage3.potential label.1 label.2 0)
        (SuppliedStage3.potential label.1 label.2 1) (SuppliedStage3.potential label.1 label.2 2) := by
  have equality := sum_positive_weights role3Weight (fun label =>
    (SuppliedStage3.split label.1 label.2).coarseRetention (SuppliedStage3.potential label.1 label.2 0)
      (SuppliedStage3.potential label.1 label.2 1) (SuppliedStage3.potential label.1 label.2 2))
  simpa only [SuppliedFixedStages.level3, SuppliedRationalStages.stage3,
    Mixed.RationalStage.rates, Matrix.cons_val_zero] using equality

/-- Exact expression for the actual full level-3 coarse rate at the common root population scale. -/
theorem stage3_rate_expression : SuppliedFixedStages.level3.rates 0 =
    (rootWeight : ℝ)*rationalLogValue expression3 := by
  rw [original_rate3]
  simp only [Fintype.sum_prod_type]
  conv_rhs => simp only [expression3, finiteLogSum_value, scaleLogExpression_value, Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro node _
  apply Finset.sum_congr rfl
  intro strategy _
  conv_lhs => rw [← SuppliedRoleIndex.orderEquiv.sum_comp]
  apply Finset.sum_congr rfl
  intro role _
  rw [← mul_assoc, mass3_eq, sourceExpression3_value]
  rfl

/-- Full original level-four history labels have the same exact root-normalized coarse expression. -/
theorem normalized_stage4 : (SuppliedPathStages.fixed .level4).rates 0/(rootWeight : ℝ) = rationalLogValue expression4 := by
  change SuppliedFixedStages.level4.rates 0/(rootWeight : ℝ) = _
  rw [stage4_rate_expression]
  have nonzero : (rootWeight : ℝ) ≠ 0 := by exact_mod_cast SuppliedScaledRoot.rootWeight_positive.ne'
  exact mul_div_cancel_left₀ _ nonzero

/-- Full original level-three history labels have the same exact root-normalized coarse expression. -/
theorem normalized_stage3 : SuppliedPathStages.level3.rates 0/(rootWeight : ℝ) = rationalLogValue expression3 := by
  rw [SuppliedPathStages.level3_rates, stage3_rate_expression]
  have nonzero : (rootWeight : ℝ) ≠ 0 := by exact_mod_cast SuppliedScaledRoot.rootWeight_positive.ne'
  exact mul_div_cancel_left₀ _ nonzero

end
end MatrixBounds.Numeric.SuppliedPairedCoarse
