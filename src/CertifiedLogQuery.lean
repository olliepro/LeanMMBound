import CubicParameterWitness
import CertifiedLogGrid

/-! Small, independently checkable witnesses for arbitrary positive rational
logarithms. The supplied bounds are accepted only after exact kernel arithmetic. -/
namespace MatrixBounds.Numeric

/-- A rational input, its binary/grid reduction, and proposed outward-rounded logarithm bounds. -/
structure LogQuery where
  input : ℚ
  exponent : ℤ
  grid : Fin 256
  parameter : Interval
  bounds : Interval

/-- The exact rational grid point selected by a logarithm witness. -/
def LogQuery.base (query : LogQuery) : ℚ := 1+(query.grid.val : ℚ)/256

/-- Check both the analytic remainder condition and enclosure of the complete exact cubic computation. -/
def LogQuery.check (query : LogQuery) : Bool :=
  cubicWitnessCheck (tableLogRatio query.input query.exponent query.base) query.parameter (1/512) &&
    query.bounds.encloses (cubicWitnessTableBounds query.exponent query.parameter
      (CertifiedLogGrid.entry query.grid).bounds (1/512))

/-- An accepted witness encloses the actual logarithm of its supplied rational input. -/
theorem LogQuery.sound (query : LogQuery) (checked : query.check = true) :
    query.bounds.Contains (Real.log (query.input : ℝ)) := by
  have facts : cubicWitnessCheck (tableLogRatio query.input query.exponent query.base) query.parameter (1/512) = true ∧
      query.bounds.encloses (cubicWitnessTableBounds query.exponent query.parameter
        (CertifiedLogGrid.entry query.grid).bounds (1/512)) = true := by
    simpa only [LogQuery.check, Bool.and_eq_true] using checked
  have positiveBase : (0 : ℝ) < query.base := by
    simp only [base, Rat.cast_add, Rat.cast_div, Rat.cast_one, Rat.cast_natCast, Rat.cast_ofNat]
    positivity
  exact Interval.encloses_sound facts.2 (cubicWitnessTableBounds_sound _ _ _ _ _ _
    positiveBase (CertifiedLogGrid.bounds_sound query.grid) facts.1)

end MatrixBounds.Numeric
