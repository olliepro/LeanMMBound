module

public import SuppliedPairedFineSourceExpressions

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Exact finite-column and integer evaluation preserves every paired compatibility sector. -/
namespace MatrixBounds.Numeric.SuppliedPairedFine

open Tensor.CW Entropy
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
set_option maxRecDepth 3000

/-- A complete paired expression can use any independently identified parent entropy expression. -/
def expressionWithParent {length denominator children sectors : ℕ}
    (split : RationalSplit length denominator)
    (partition : OrbitMap (Fin length → Fin 3) (Fin children))
    (mass : ShapeAlphabet (2*length) → Fin children → ℚ)
    (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
    (enumeration : Fin sectors ≃ CompatibilityClass (2*length))
    (parentExpression : RationalLogExpression) : RationalLogExpression :=
  parentExpression ++ scaleLogExpression (-1) (finiteLogSum (fun sector =>
    orbitMassEntropyExpression (splitPoolMass split mass axisClass (enumeration sector)) partition.size))

/-- Replacing only the parent entropy leaves the complete original fine retention unchanged. -/
theorem expressionWithParent_value {length denominator children sectors : ℕ}
    (split : RationalSplit length denominator)
    (partition : OrbitMap (Fin length → Fin 3) (Fin children))
    (mass : ShapeAlphabet (2*length) → Fin children → ℚ)
    (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
    (enumeration : Fin sectors ≃ CompatibilityClass (2*length))
    (parentExpression : RationalLogExpression)
    (parentValue : rationalLogValue parentExpression =
      entropy (split.parentLaw (fun child => partition.decode (fun orbit => (mass child orbit : ℝ))))) :
    rationalLogValue (expressionWithParent split partition mass axisClass enumeration parentExpression) =
      split.fineRetention axisClass (fun child => partition.decode (fun orbit => (mass child orbit : ℝ))) := by
  simp only [expressionWithParent, rationalLogValue_append, scaleLogExpression_value,
    finiteLogSum_value, parentValue, Rat.cast_neg, Rat.cast_one, neg_one_mul,
    RationalSplit.fineRetention, sub_eq_add_neg]
  congr 1
  congr 1
  conv_rhs => rw [← Equiv.sum_comp enumeration]
  apply Finset.sum_congr rfl
  intro sector _
  rw [orbitMassEntropyExpression_value, split.pooledLaw_decode]
  congr 1
  exact congrArg partition.decode (funext (splitPoolMass_cast split mass axisClass (enumeration sector)))

/-- Original column weights and masses retain each exact compatibility label and both children. -/
def columnPool {columns children sectors : ℕ} (weight : Fin columns → ℚ)
    (mass : Fin columns → Fin children → ℚ) (label : Fin columns → Fin sectors)
    (sector : Fin sectors) (orbit : Fin children) : ℚ :=
  ∑ column, if label column = sector then 2*weight column*mass column orbit else 0

/-- Any exact column enumeration evaluates the original full separately labelled pool. -/
theorem columnPool_eq {length denominator columns children sectors : ℕ}
    (split : RationalSplit length denominator)
    (mass : ShapeAlphabet (2*length) → Fin children → ℚ)
    (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
    (childrenEquiv : Fin columns ≃ ShapeAlphabet (2*length))
    (sectorEquiv : Fin sectors ≃ CompatibilityClass (2*length))
    (sector : Fin sectors) (orbit : Fin children) :
    columnPool (fun column => (split.numerator (childrenEquiv column) : ℚ)/denominator)
      (fun column => mass (childrenEquiv column))
      (fun column => sectorEquiv.symm (axisClass (childrenEquiv column))) sector orbit =
      splitPoolMass split mass axisClass (sectorEquiv sector) orbit := by
  unfold columnPool splitPoolMass
  conv_rhs => rw [← Equiv.sum_comp childrenEquiv]
  apply Finset.sum_congr rfl
  intro column _
  have labelEq : sectorEquiv.symm (axisClass (childrenEquiv column)) = sector ↔
      axisClass (childrenEquiv column) = sectorEquiv sector :=
    sectorEquiv.symm_apply_eq
  simp only [labelEq]

/-- Integer compatibility sums skip only zero source coefficients before reading child masses. -/
def integerPool {columns children sectors : ℕ} (weight : Fin columns → ℕ)
    (mass : Fin columns → Fin children → ℤ) (label : Fin columns → Fin sectors)
    (sector : Fin sectors) (orbit : Fin children) : ℤ :=
  ∑ column, if weight column = 0 then 0 else
    if label column = sector then 2*(weight column : ℤ)*mass column orbit else 0

/-- Delaying division until after exact integer summation preserves every original column pool. -/
theorem integerPool_value {columns children sectors : ℕ} (weight : Fin columns → ℕ)
    (mass : Fin columns → Fin children → ℤ) (label : Fin columns → Fin sectors)
    (weightDenominator childDenominator : ℕ) (sector : Fin sectors) (orbit : Fin children) :
    (integerPool weight mass label sector orbit : ℚ)/
        ((weightDenominator : ℚ)*(childDenominator : ℚ)) =
      columnPool (fun column => (weight column : ℚ)/weightDenominator)
        (fun column child => (mass column child : ℚ)/childDenominator) label sector orbit := by
  unfold integerPool columnPool
  rw [Int.cast_sum, Finset.sum_div]
  apply Finset.sum_congr rfl
  intro column _
  split_ifs with zero selected selected
  · simp only [zero, Nat.cast_zero, zero_div, mul_zero, zero_mul, Int.cast_zero]
  · simp only [Int.cast_zero, zero_div]
  · simp only [Int.cast_mul, Int.cast_ofNat, Int.cast_natCast]
    ring
  · simp only [Int.cast_zero, zero_div]

end
end MatrixBounds.Numeric.SuppliedPairedFine
