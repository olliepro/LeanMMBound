import FixedIntegerIntervals
import CubicParameterWitness

/-! The small logarithm polynomial is evaluated entirely with integers. These
proofs connect the integer arithmetic to the previously proved analytic bounds. -/
namespace MatrixBounds.Numeric

/-- Integer numerator of the logarithm cubic at a parameter with the given fixed denominator. -/
def fixedCubicNumerator (parameter : ℤ) (scale : ℕ) : ℤ :=
  6*parameter*(scale : ℤ)^2+2*parameter^3

/-- Exact quotient representation of the real cubic at an integer-scaled parameter. -/
theorem fixedCubicNumerator_value (parameter : ℤ) {scale : ℕ} (positive : 0 < scale) :
    ((fixedCubicNumerator parameter scale : ℤ) : ℝ)/(3*(scale : ℝ)^3) =
      (logCubic ((parameter : ℚ)/scale) : ℝ) := by
  have nonzero : (scale : ℝ) ≠ 0 := by exact_mod_cast Nat.ne_of_gt positive
  simp only [fixedCubicNumerator, logCubic, Int.cast_add, Int.cast_mul, Int.cast_ofNat,
    Int.cast_pow, Int.cast_natCast, Rat.cast_add, Rat.cast_mul, Rat.cast_div,
    Rat.cast_pow, Rat.cast_ofNat, Rat.cast_intCast, Rat.cast_natCast]
  field_simp
  ring

/-- Outward integer bounds for the logarithm cubic at one dyadic parameter endpoint. -/
def fixedCubicEndpoint (parameter : ℤ) : FixedBounds :=
  FixedBounds.quotient (fixedCubicNumerator parameter (2^44)) (3*(2^44)^3) (2^60)

/-- The integer endpoint computation encloses the actual exact rational cubic. -/
theorem fixedCubicEndpoint_sound (parameter : ℤ) :
    ((fixedCubicEndpoint parameter).interval (2^60)).Contains (logCubic ((parameter : ℚ)/2^44) : ℝ) := by
  have quotient := FixedBounds.quotient_sound (fixedCubicNumerator parameter (2^44))
    (show 0 < 3*(2^44)^3 by positivity) (show 0 < 2^60 by positivity)
  have identity := fixedCubicNumerator_value parameter (show 0 < (2 : ℕ)^44 by positivity)
  simp only [Nat.cast_pow, Nat.cast_ofNat] at identity
  simpa only [Nat.cast_mul, Nat.cast_pow, Nat.cast_ofNat, identity, fixedCubicEndpoint] using quotient

/-- Symmetric 60-bit remainder interval containing the complete radius-1/512 series remainder. -/
def fixedCubicRemainder : FixedBounds := ⟨-65665, 65665⟩

/-- The fixed remainder bound is a checked outward enclosure of the exact analytic error constant. -/
theorem fixedCubicRemainder_checked :
    (fixedCubicRemainder.interval (2^60)).encloses
      ⟨-radiusLogError (1/512) 4, radiusLogError (1/512) 4⟩ = true := by decide +kernel

/-- Combine lower and upper endpoint cubics with the proved common analytic remainder. -/
def fixedCubicLogBounds (parameter : FixedBounds) : FixedBounds :=
  (⟨(fixedCubicEndpoint parameter.lower).lower,
    (fixedCubicEndpoint parameter.upper).upper⟩ : FixedBounds).add fixedCubicRemainder

/-- The integer-only cubic enclosure bounds the actual logarithm whenever its small parameter witness is valid. -/
theorem fixedCubicLogBounds_sound (input : ℚ) (parameter : FixedBounds)
    (checked : cubicWitnessCheck input (parameter.interval (2^44)) (1/512) = true) :
    ((fixedCubicLogBounds parameter).interval (2^60)).Contains (Real.log (input : ℝ)) := by
  have analytic := cubicWitnessBounds_sound input (parameter.interval (2^44)) (1/512) checked
  have lower := (fixedCubicEndpoint_sound parameter.lower).1
  have upper := (fixedCubicEndpoint_sound parameter.upper).2
  have remainder :
      (fixedCubicRemainder.interval (2^60)).Contains (radiusLogError (1/512) 4 : ℝ) :=
    Interval.encloses_sound fixedCubicRemainder_checked
      ⟨by norm_num [radiusLogError], le_rfl⟩
  unfold fixedCubicLogBounds
  rw [FixedBounds.add_interval]
  unfold Interval.Contains Interval.add at *
  simp only [cubicWitnessBounds, FixedBounds.interval] at analytic lower upper remainder ⊢
  simp only [Rat.cast_add, Rat.cast_sub, Rat.cast_div, Rat.cast_intCast, Rat.cast_natCast]
    at analytic lower upper remainder ⊢
  change _ ≤ _ ∧ _ ≤ _
  norm_num only [fixedCubicRemainder, Int.cast_neg, Int.cast_ofNat] at remainder ⊢
  constructor <;> linarith [analytic.1, analytic.2, remainder.2]

end MatrixBounds.Numeric
