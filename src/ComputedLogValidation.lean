import ComputedLogBounds
import CertifiedLogTraces

/-! Concrete kernel checks exercise the deterministic logarithm evaluator,
including the large-denominator case needed for deep derived parent masses. -/
namespace MatrixBounds.Numeric.ComputedLogValidation

set_option maxRecDepth 100000
set_option maxHeartbeats 16000000

/-- The deterministic normalized computation for five has the certified narrow output interval. -/
theorem five_checked : CertifiedLogTraces.Five.bounds.encloses
    (computedLogBounds CertifiedLogTraces.Five.input 2 40 80) = true := by decide +kernel

/-- The actual logarithm of five is certified through the deterministic evaluator. -/
theorem log_five : CertifiedLogTraces.Five.bounds.Contains (Real.log 5) := by
  have inside := Interval.encloses_sound five_checked
    (computedLogBounds_sound CertifiedLogTraces.Five.input 2 40 80 (by decide +kernel))
  simpa [CertifiedLogTraces.Five.input] using inside

/-- The deterministic normalized computation for seven has the certified narrow output interval. -/
theorem seven_checked : CertifiedLogTraces.Seven.bounds.encloses
    (computedLogBounds CertifiedLogTraces.Seven.input 2 40 80) = true := by decide +kernel

/-- The actual logarithm of seven is certified through the deterministic evaluator. -/
theorem log_seven : CertifiedLogTraces.Seven.bounds.Contains (Real.log 7) := by
  have inside := Interval.encloses_sound seven_checked
    (computedLogBounds_sound CertifiedLogTraces.Seven.input 2 40 80 (by decide +kernel))
  simpa [CertifiedLogTraces.Seven.input] using inside

/-- A denominator of two to the four-hundredth power remains covered by the same exact numerical checks. -/
theorem small_checked : CertifiedLogTraces.SmallDyadic.bounds.encloses
    (computedLogBounds CertifiedLogTraces.SmallDyadic.input (-354) 40 80) = true := by decide +kernel

/-- The actual small rational logarithm is certified without storing any input-specific power sequence. -/
theorem log_small : CertifiedLogTraces.SmallDyadic.bounds.Contains
    (Real.log (CertifiedLogTraces.SmallDyadic.input : ℝ)) :=
  Interval.encloses_sound small_checked (computedLogBounds_sound _ _ _ _ (by decide +kernel))

end MatrixBounds.Numeric.ComputedLogValidation
