module

public import SuppliedPairedFineSourceExpressions

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Original paired fine rates with every source, strategy, and physical-role allocation. -/
namespace MatrixBounds.Numeric.SuppliedPairedFine

open Tensor Tensor.CW Interface SuppliedPopulationWeights DyadicPopulationArithmetic
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
set_option maxRecDepth 3000
set_option maxHeartbeats 4000000
attribute [local irreducible] sourceExpression3 sourceExpression4
  SuppliedStage3.split SuppliedStage3.law SuppliedStage4.split SuppliedStage4.law
  role3Weight role4Weight

/-- Root-normalized exact population of one level-three source, strategy, and physical role. -/
def sourceMass3 (label : SuppliedStage3.Source × AxisOrder) : ℚ :=
  ((strategyNumerator label.1 * SuppliedRoleIndex.allocation3 label.1.1 label.1.2 label.2 : ℕ) : ℚ) /
    (denominator^4 : ℕ)

/-- Root-normalized exact population of one level-four source and physical role. -/
def sourceMass4 (label : SuppliedStage4.Source × AxisOrder) : ℚ :=
  ((rootNumerator label.1 * SuppliedRoleIndex.allocation4 label.1 label.2 : ℕ) : ℚ) /
    (denominator^2 : ℕ)

/-- Original node, strategy, and source-role columns enumerate every actual level-three label once. -/
def sourceEquiv3 : Fin 945 × Fin 6 × Fin 6 ≃ SuppliedStage3.Source × AxisOrder :=
  (Equiv.prodAssoc _ _ _).symm.trans (Equiv.prodCongr (Equiv.refl _) SuppliedRoleIndex.orderEquiv)

/-- Original source-role columns enumerate every actual level-four physical label once. -/
def sourceEquiv4 : Fin 105 × Fin 6 ≃ SuppliedStage4.Source × AxisOrder :=
  Equiv.prodCongr (Equiv.refl _) SuppliedRoleIndex.orderEquiv

/-- Complete exact original level-three fine expression, including all zero-weight source labels. -/
def expression3 (axis : Fin 2) : RationalLogExpression :=
  finiteLogSum (fun node : Fin 945 => finiteLogSum (fun strategy : Fin 6 => finiteLogSum (fun role : Fin 6 =>
    scaleLogExpression (sourceMass3 ((node, strategy), SuppliedRoleIndex.order role))
      (sourceExpression3 (node, strategy) (SuppliedRoleIndex.order role) axis))))

/-- Complete exact original level-four fine expression, including all zero-weight source labels. -/
def expression4 (axis : Fin 2) : RationalLogExpression :=
  finiteLogSum (fun node : Fin 105 => finiteLogSum (fun role : Fin 6 =>
    scaleLogExpression (sourceMass4 (node, SuppliedRoleIndex.order role))
      (sourceExpression4 node (SuppliedRoleIndex.order role) axis)))

/-- The level-three rational source expression is exactly its original physical-label sum. -/
theorem expression3_value (axis : Fin 2) : rationalLogValue (expression3 axis) =
    ∑ label : SuppliedStage3.Source × AxisOrder,
      (sourceMass3 label : ℝ)*rationalLogValue (sourceExpression3 label.1 label.2 axis) := by
  conv_rhs => rw [← Equiv.sum_comp sourceEquiv3 (fun label =>
    (sourceMass3 label : ℝ)*rationalLogValue (sourceExpression3 label.1 label.2 axis))]
  simp only [expression3, finiteLogSum_value, scaleLogExpression_value, Fintype.sum_prod_type,
    sourceEquiv3, Equiv.trans_apply, Equiv.prodAssoc_symm_apply, Equiv.prodCongr_apply, Equiv.refl_apply, Prod.map_apply]
  rfl

/-- The level-four rational source expression is exactly its original physical-label sum. -/
theorem expression4_value (axis : Fin 2) : rationalLogValue (expression4 axis) =
    ∑ label : SuppliedStage4.Source × AxisOrder,
      (sourceMass4 label : ℝ)*rationalLogValue (sourceExpression4 label.1 label.2 axis) := by
  conv_rhs => rw [← Equiv.sum_comp sourceEquiv4 (fun label =>
    (sourceMass4 label : ℝ)*rationalLogValue (sourceExpression4 label.1 label.2 axis))]
  simp only [expression4, finiteLogSum_value, scaleLogExpression_value, Fintype.sum_prod_type,
    sourceEquiv4, Equiv.trans_apply, Equiv.prodAssoc_symm_apply, Equiv.prodCongr_apply, Equiv.refl_apply, Prod.map_apply]
  rfl

/-- Root reserves clear an exact source denominator without evaluating the source numerator. -/
theorem reserved_mass (left right value : ℕ) :
    (denominator : ℝ)^(left+right)*((value : ℝ)/(denominator : ℝ)^right) =
      (denominator : ℝ)^left*(value : ℝ) := by
  have positive : (denominator : ℝ) ≠ 0 := by norm_num [denominator]
  rw [pow_add, mul_assoc, ← mul_div_assoc, mul_div_cancel_left₀ _ (pow_ne_zero right positive)]

/-- Reserved root scaling gives the exact allocated integer level-three population. -/
theorem rootWeight_mass3 (label : SuppliedStage3.Source × AxisOrder) :
    (rootWeight : ℝ)*(sourceMass3 label : ℝ) = (role3Weight label : ℝ) := by
  simpa only [rootWeight, sourceMass3, role3Weight, scaled, Nat.cast_mul, Nat.cast_pow,
    Rat.cast_div, Rat.cast_natCast, Rat.cast_mul, Rat.cast_pow] using reserved_mass 4 4
      (strategyNumerator label.1 * SuppliedRoleIndex.allocation3 label.1.1 label.1.2 label.2)

/-- Reserved root scaling gives the exact allocated integer level-four population. -/
theorem rootWeight_mass4 (label : SuppliedStage4.Source × AxisOrder) :
    (rootWeight : ℝ)*(sourceMass4 label : ℝ) = (role4Weight label : ℝ) := by
  simpa only [rootWeight, sourceMass4, role4Weight, scaled, Nat.cast_mul, Nat.cast_pow,
    Rat.cast_div, Rat.cast_natCast, Rat.cast_mul, Rat.cast_pow] using reserved_mass 6 2
      (rootNumerator label.1 * SuppliedRoleIndex.allocation4 label.1 label.2)

theorem rates_one' {T : Type*} [Fintype T] {length : T → ℕ} {d : ℕ} (s : Mixed.RationalStage T length d) :
    s.rates 1 = ∑ type, (s.weight type : ℝ)*(s.splits type).fineRetention yClass (s.law type 1) := rfl
theorem rates_two' {T : Type*} [Fintype T] {length : T → ℕ} {d : ℕ} (s : Mixed.RationalStage T length d) :
    s.rates 2 = ∑ type, (s.weight type : ℝ)*(s.splits type).fineRetention zClass (s.law type 2) := rfl

/-- Full inherited-history level-three rates equal the complete original weighted source expression. -/
theorem original_rate3 (axis : Fin 2) : SuppliedPathStages.level3.rates (physicalAxis axis) =
    ∑ label : SuppliedStage3.Source × AxisOrder,
      (role3Weight label : ℝ)*rationalLogValue (sourceExpression3 label.1 label.2 axis) := by
  rw [SuppliedPathStages.level3_rates]
  simp_rw [sourceExpression3_value]
  have equality := sum_positive_weights role3Weight (fun label =>
    (SuppliedStage3.split label.1 label.2).fineRetention (actualClass axis)
      (SuppliedStage3.law label.1 label.2 (physicalAxis axis)))
  fin_cases axis
  · refine Eq.trans ?_ equality
    rw [show physicalAxis ((fun i => i) ⟨0, by decide⟩ : Fin 2) = 1 from rfl, rates_one']
    convert rfl using 3 <;> rfl
  · refine Eq.trans ?_ equality
    rw [show physicalAxis ((fun i => i) ⟨1, by decide⟩ : Fin 2) = 2 from rfl, rates_two']
    convert rfl using 3 <;> rfl

/-- Full level-four rates equal the complete original weighted source expression. -/
theorem original_rate4 (axis : Fin 2) : SuppliedFixedStages.level4.rates (physicalAxis axis) =
    ∑ label : SuppliedStage4.Source × AxisOrder,
      (role4Weight label : ℝ)*rationalLogValue (sourceExpression4 label.1 label.2 axis) := by
  simp_rw [sourceExpression4_value]
  have equality := sum_positive_weights role4Weight (fun label =>
    (SuppliedStage4.split label.1 label.2).fineRetention (actualClass axis)
      (SuppliedStage4.law label.1 label.2 (physicalAxis axis)))
  fin_cases axis
  · refine Eq.trans ?_ equality
    rw [show physicalAxis ((fun i => i) ⟨0, by decide⟩ : Fin 2) = 1 from rfl, rates_one']
    convert rfl using 3 <;> rfl
  · refine Eq.trans ?_ equality
    rw [show physicalAxis ((fun i => i) ⟨1, by decide⟩ : Fin 2) = 2 from rfl, rates_two']
    convert rfl using 3 <;> rfl

/-- Actual level-three fine retention is its exact original logarithmic source expression at root scale. -/
theorem stage_rate_expression3 (axis : Fin 2) :
    SuppliedPathStages.level3.rates (physicalAxis axis) = (rootWeight : ℝ)*rationalLogValue (expression3 axis) := by
  rw [original_rate3]
  conv_rhs => rw [expression3_value, Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro label _
  rw [← mul_assoc, rootWeight_mass3]

/-- Actual level-four fine retention is its exact original logarithmic source expression at root scale. -/
theorem stage_rate_expression4 (axis : Fin 2) :
    SuppliedFixedStages.level4.rates (physicalAxis axis) = (rootWeight : ℝ)*rationalLogValue (expression4 axis) := by
  rw [original_rate4]
  conv_rhs => rw [expression4_value, Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro label _
  rw [← mul_assoc, rootWeight_mass4]

/-- The normalized actual level-three fine rate equals its complete exact source expression. -/
theorem normalized_stage_rate3 (axis : Fin 2) :
    SuppliedPathStages.level3.rates (physicalAxis axis)/(rootWeight : ℝ) = rationalLogValue (expression3 axis) := by
  rw [stage_rate_expression3]
  exact mul_div_cancel_left₀ _ (by norm_num [rootWeight, denominator])

/-- The normalized actual level-four fine rate equals its complete exact source expression. -/
theorem normalized_stage_rate4 (axis : Fin 2) :
    SuppliedFixedStages.level4.rates (physicalAxis axis)/(rootWeight : ℝ) = rationalLogValue (expression4 axis) := by
  rw [stage_rate_expression4]
  exact mul_div_cancel_left₀ _ (by norm_num [rootWeight, denominator])

end
end MatrixBounds.Numeric.SuppliedPairedFine
