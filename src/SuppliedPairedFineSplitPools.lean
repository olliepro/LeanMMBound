module

public import SuppliedPairedFineSingletonLabels

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Separately labelled child columns and physical coordinate pools evaluate every paired fine
compatibility sector from exact integer inputs, in the symbolic form of the numerical certificates. -/
namespace MatrixBounds.Numeric.SuppliedPairedFine

open Tensor Tensor.CW Entropy
open scoped BigOperators
noncomputable section
set_option maxRecDepth 3000

/-- Exact integer pooled masses of one physical coordinate sector, skipping isolated and unweighted columns. -/
def coordinatePoolNumerator {columns children coordinates : ℕ} (isolated : Fin columns → Bool)
    (coordinate : Fin columns → Fin coordinates) (weight : Fin columns → ℕ)
    (mass : Fin columns → Fin children → ℤ) (sector : Fin coordinates) (orbit : Fin children) : ℤ :=
  ∑ column, if weight column = 0 ∨ isolated column = true then 0 else
    if coordinate column = sector then 2*(weight column : ℤ)*mass column orbit else 0

/-- One separately labelled child column contributes twice its weight times its complete orbit expression. -/
def isolatedExpression {columns children : ℕ} (isolated : Fin columns → Bool) (weight : Fin columns → ℕ)
    (weightDenominator : ℕ) (mass : Fin columns → Fin children → ℤ) (massDenominator : ℕ)
    (sizes : Fin children → ℕ) (column : Fin columns) : RationalLogExpression :=
  if weight column = 0 ∨ isolated column = false then [] else
    scaleLogExpression (2*((weight column : ℚ)/weightDenominator))
      (orbitMassEntropyExpression (fun orbit => (mass column orbit : ℚ)/massDenominator) sizes)

/-- All separately labelled columns and all physical coordinate pools of one fine axis. -/
def splitPoolsExpression {columns children coordinates : ℕ} (isolated : Fin columns → Bool)
    (coordinate : Fin columns → Fin coordinates) (weight : Fin columns → ℕ) (weightDenominator : ℕ)
    (mass : Fin columns → Fin children → ℤ) (massDenominator : ℕ) (sizes : Fin children → ℕ) :
    RationalLogExpression :=
  finiteLogSum (isolatedExpression isolated weight weightDenominator mass massDenominator sizes) ++
    finiteLogSum (fun sector : Fin coordinates => orbitMassEntropyExpression
      (fun orbit => (coordinatePoolNumerator isolated coordinate weight mass sector orbit : ℚ)/
        ((weightDenominator : ℚ)*massDenominator)) sizes)

/-- The real value of an orbit mass expression, without any decoding assumption. -/
theorem orbitMassEntropyExpression_real {n : ℕ} (mass : Fin n → ℚ) (sizes : Fin n → ℕ) :
    rationalLogValue (orbitMassEntropyExpression mass sizes) =
      massEntropy (fun index => (mass index : ℝ)) + ∑ index, (mass index : ℝ)*Real.log (sizes index) := by
  simp only [orbitMassEntropyExpression, rationalLogValue_append, massEntropyLogExpression_value,
    orbitCorrectionExpression_value]

/-- Scaling every mass scales the complete orbit mass expression. -/
theorem orbitMassEntropyExpression_scaled {n : ℕ} (scale : ℚ) (mass : Fin n → ℚ) (sizes : Fin n → ℕ) :
    rationalLogValue (orbitMassEntropyExpression (fun index => scale*mass index) sizes) =
      (scale : ℝ)*rationalLogValue (orbitMassEntropyExpression mass sizes) := by
  simp only [orbitMassEntropyExpression_real, Rat.cast_mul, massEntropy_scaled, Finset.mul_sum,
    mul_add, mul_assoc]

/-- A zero pool has no logarithmic value. -/
theorem orbitMassEntropyExpression_zero {n : ℕ} (sizes : Fin n → ℕ) :
    rationalLogValue (orbitMassEntropyExpression (fun _ : Fin n => (0:ℚ)) sizes) = 0 := by
  have identity := orbitMassEntropyExpression_scaled 0 (fun _ : Fin n => (0:ℚ)) sizes
  simpa only [zero_mul, Rat.cast_zero] using identity

/-- Separated and pooled sectors together evaluate every labelled compatibility sector exactly. -/
theorem splitPoolsExpression_value {columns children coordinates : ℕ} (isolated : Fin columns → Bool)
    (coordinate : Fin columns → Fin coordinates) (weight : Fin columns → ℕ) (weightDenominator : ℕ)
    (mass : Fin columns → Fin children → ℤ) (massDenominator : ℕ) (sizes : Fin children → ℕ)
    (label : Fin columns → Fin (columns+coordinates))
    (labelEq : ∀ column, label column = finSumFinEquiv (singletonPoolLabel isolated coordinate column)) :
    rationalLogValue (splitPoolsExpression isolated coordinate weight weightDenominator mass massDenominator sizes) =
      ∑ sector : Fin (columns+coordinates), rationalLogValue (orbitMassEntropyExpression
        (columnPool (fun column => (weight column : ℚ)/weightDenominator)
          (fun column orbit => (mass column orbit : ℚ)/massDenominator) label sector) sizes) := by
  rw [Fin.sum_univ_add]
  simp only [splitPoolsExpression, rationalLogValue_append, finiteLogSum_value]
  congr 1
  · apply Finset.sum_congr rfl
    intro column _
    have poolEq : columnPool (fun column => (weight column : ℚ)/weightDenominator)
        (fun column orbit => (mass column orbit : ℚ)/massDenominator) label (Fin.castAdd coordinates column) =
        fun orbit => if isolated column = true then
          2*((weight column : ℚ)/weightDenominator)*((mass column orbit : ℚ)/massDenominator) else 0 := by
      funext orbit
      unfold columnPool
      simp only [labelEq, ← finSumFinEquiv_apply_left, Equiv.apply_eq_iff_eq]
      exact singletonPool_value isolated coordinate
        (fun column => 2*((weight column : ℚ)/weightDenominator)*((mass column orbit : ℚ)/massDenominator)) column
    rw [poolEq]
    unfold isolatedExpression
    by_cases separated : isolated column = true
    · by_cases zero : weight column = 0
      · simp only [separated, zero, if_true, true_or, Nat.cast_zero, zero_div, mul_zero, zero_mul,
          rationalLogValue, List.map_nil, List.sum_nil]
        exact (orbitMassEntropyExpression_zero sizes).symm
      · simp only [separated, zero, if_true, false_or, Bool.true_eq_false, if_false, scaleLogExpression_value]
        exact (orbitMassEntropyExpression_scaled (2*((weight column : ℚ)/weightDenominator))
          (fun orbit => (mass column orbit : ℚ)/massDenominator) sizes).symm
    · have notSeparated : isolated column = false := by simpa using separated
      simp only [notSeparated, or_true, if_true, Bool.false_eq_true, if_false,
        rationalLogValue, List.map_nil, List.sum_nil]
      exact (orbitMassEntropyExpression_zero sizes).symm
  · apply Finset.sum_congr rfl
    intro sector _
    have poolEq : columnPool (fun column => (weight column : ℚ)/weightDenominator)
        (fun column orbit => (mass column orbit : ℚ)/massDenominator) label (Fin.natAdd columns sector) =
        fun orbit => (coordinatePoolNumerator isolated coordinate weight mass sector orbit : ℚ)/
          ((weightDenominator : ℚ)*massDenominator) := by
      funext orbit
      unfold columnPool coordinatePoolNumerator
      simp only [labelEq, ← finSumFinEquiv_apply_right, Equiv.apply_eq_iff_eq]
      rw [coordinatePool_value isolated coordinate
        (fun column => 2*((weight column : ℚ)/weightDenominator)*((mass column orbit : ℚ)/massDenominator)) sector]
      rw [Int.cast_sum, Finset.sum_div]
      apply Finset.sum_congr rfl
      intro column _
      by_cases separated : isolated column = true
      · simp only [separated, if_true, or_true, Int.cast_zero, zero_div]
      · by_cases zero : weight column = 0
        · simp only [separated, zero, Bool.false_eq_true, true_or, Int.cast_zero,
            zero_div, Nat.cast_zero, mul_zero, zero_mul, ite_self]
        · simp only [separated, zero, Bool.false_eq_true, if_false, false_or]
          split_ifs
          · simp only [Int.cast_mul, Int.cast_ofNat, Int.cast_natCast]
            ring
          · simp only [Int.cast_zero, zero_div]
    rw [poolEq]

end
end MatrixBounds.Numeric.SuppliedPairedFine
