import FixedCubicLogBounds

/-! Cross-multiplied integer inequalities certify the complete logarithm
parameter without computing reduced rational quotients in the kernel checker. -/
namespace MatrixBounds.Numeric

/-- Check a nonnegative small logarithm parameter by integer cross multiplication alone. -/
def integerLogParameterCheck (numerator denominator : ℤ) (parameter : FixedBounds) : Bool :=
  decide (0 < denominator ∧ denominator ≤ numerator ∧ 0 ≤ parameter.lower ∧
    parameter.upper*512 ≤ 2^44 ∧
    parameter.lower*(numerator+denominator) ≤ (numerator-denominator)*2^44 ∧
    (numerator-denominator)*2^44 ≤ parameter.upper*(numerator+denominator))

/-- Integer acceptance implies every analytic premise of the rational cubic-witness theorem. -/
theorem integerLogParameterCheck_sound (numerator denominator : ℤ) (parameter : FixedBounds)
    (checked : integerLogParameterCheck numerator denominator parameter = true) :
    cubicWitnessCheck ((numerator : ℚ)/denominator) (parameter.interval (2^44)) (1/512) = true := by
  have facts : 0 < denominator ∧ denominator ≤ numerator ∧ 0 ≤ parameter.lower ∧
      parameter.upper*512 ≤ 2^44 ∧
      parameter.lower*(numerator+denominator) ≤ (numerator-denominator)*2^44 ∧
      (numerator-denominator)*2^44 ≤ parameter.upper*(numerator+denominator) := of_decide_eq_true checked
  have denominatorPositive : (0 : ℚ) < denominator := by exact_mod_cast facts.1
  have numeratorPositive : (0 : ℚ) < numerator := by exact_mod_cast (lt_of_lt_of_le facts.1 facts.2.1)
  have sumPositive : (0 : ℚ) < (numerator : ℚ)+denominator := add_pos numeratorPositive denominatorPositive
  have parameterIdentity : (((numerator : ℚ)/denominator)-1)/(((numerator : ℚ)/denominator)+1) =
      ((numerator : ℚ)-denominator)/((numerator : ℚ)+denominator) := by
    field_simp
  have lower : (parameter.lower : ℚ)/(2^44) ≤
      ((numerator : ℚ)-denominator)/((numerator : ℚ)+denominator) := by
    rw [div_le_div_iff₀ (by norm_num : (0 : ℚ) < 2^44) sumPositive]
    exact_mod_cast facts.2.2.2.2.1
  have upper : ((numerator : ℚ)-denominator)/((numerator : ℚ)+denominator) ≤
      (parameter.upper : ℚ)/(2^44) := by
    rw [div_le_div_iff₀ sumPositive (by norm_num : (0 : ℚ) < 2^44)]
    exact_mod_cast facts.2.2.2.2.2
  have upperRadius : (parameter.upper : ℚ)/(2^44) ≤ 1/512 := by
    rw [div_le_div_iff₀ (by norm_num : (0 : ℚ) < 2^44) (by norm_num : (0 : ℚ) < 512)]
    simpa only [one_mul] using (show (parameter.upper : ℚ)*512 ≤ 2^44 by exact_mod_cast facts.2.2.2.1)
  unfold cubicWitnessCheck
  apply decide_eq_true
  simp only [FixedBounds.interval, Nat.cast_pow, Nat.cast_ofNat, parameterIdentity]
  exact ⟨div_pos numeratorPositive denominatorPositive,
    div_nonneg (by exact_mod_cast facts.2.2.1) (by norm_num), upperRadius,
    by norm_num, by norm_num, lower, upper⟩

end MatrixBounds.Numeric
