module

public import OrbitLogExpressions

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Singleton entropy expressions may factor out their original source coefficient exactly. -/
namespace MatrixBounds.Numeric

open scoped BigOperators
noncomputable section

/-- Scaling every orbit mass scales its complete unnormalized entropy by exactly the same amount. -/
theorem orbitMassEntropyExpression_scaled_value {width : ℕ}
    (scale : ℚ) (mass : Fin width → ℚ) (sizes : Fin width → ℕ) :
    rationalLogValue (orbitMassEntropyExpression (fun orbit => scale*mass orbit) sizes) =
      (scale : ℝ)*rationalLogValue (orbitMassEntropyExpression mass sizes) := by
  simp only [orbitMassEntropyExpression, rationalLogValue_append, massEntropyLogExpression_value,
    orbitCorrectionExpression_value, Rat.cast_mul, Entropy.massEntropy_scaled,
    mul_add, Finset.mul_sum, mul_assoc]

/-- A complete normalized orbit law has the same normalized and unnormalized entropy expression value. -/
theorem orbitMassEntropyExpression_of_normalized {width : ℕ}
    (mass : Fin width → ℚ) (sizes : Fin width → ℕ) (normalized : ∑ orbit, mass orbit = 1) :
    rationalLogValue (orbitMassEntropyExpression mass sizes) =
      rationalLogValue (orbitEntropyExpression mass sizes) := by
  have realNormalized : ∑ orbit, (mass orbit : ℝ) = 1 := by exact_mod_cast normalized
  simp only [orbitMassEntropyExpression, orbitEntropyExpression, rationalLogValue_append,
    massEntropyLogExpression_value, entropyLogExpression_value,
    Entropy.massEntropy_of_normalized _ realNormalized]

/-- A singleton compatibility sector contributes precisely its original coefficient times the child entropy. -/
theorem orbitMassEntropyExpression_scaled_normalized {width : ℕ}
    (scale : ℚ) (mass : Fin width → ℚ) (sizes : Fin width → ℕ)
    (normalized : ∑ orbit, mass orbit = 1) :
    rationalLogValue (orbitMassEntropyExpression (fun orbit => scale*mass orbit) sizes) =
      rationalLogValue (scaleLogExpression scale (orbitEntropyExpression mass sizes)) := by
  rw [orbitMassEntropyExpression_scaled_value,
    orbitMassEntropyExpression_of_normalized mass sizes normalized, scaleLogExpression_value]

/-- Zero-weight singleton sectors need no normalization assumption on their absent child law. -/
theorem orbitMassEntropyExpression_scaled_normalized_of_nonzero {width : ℕ}
    (scale : ℚ) (mass : Fin width → ℚ) (sizes : Fin width → ℕ)
    (normalized : scale ≠ 0 → ∑ orbit, mass orbit = 1) :
    rationalLogValue (orbitMassEntropyExpression (fun orbit => scale*mass orbit) sizes) =
      rationalLogValue (scaleLogExpression scale (orbitEntropyExpression mass sizes)) := by
  by_cases zero : scale = 0
  · rw [orbitMassEntropyExpression_scaled_value, scaleLogExpression_value, zero]
    simp only [Rat.cast_zero, zero_mul]
  · exact orbitMassEntropyExpression_scaled_normalized scale mass sizes (normalized zero)

end
end MatrixBounds.Numeric
