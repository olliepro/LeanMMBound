module

public import IntegerLogParameter
public import FixedLogGrid

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! A logarithm witness whose executable checks and arithmetic use integers
only. Its interpretation is the actual logarithm of an exact rational input. -/
namespace MatrixBounds.Numeric

/-- An exact positive rational mantissa times a signed binary power, with a small parameter witness. -/
structure IntegerLogQuery where
  numerator : ℕ
  denominator : ℕ
  exponent : ℤ
  grid : Fin 256
  parameter : FixedBounds

/-- The exact rational number represented by this witness, without a floating-point approximation. -/
def IntegerLogQuery.input (query : IntegerLogQuery) : ℚ :=
  ((query.numerator : ℚ)/query.denominator)*(2 : ℚ)^query.exponent

/-- Integer numerator after dividing the mantissa by the selected grid point. -/
def IntegerLogQuery.localNumerator (query : IntegerLogQuery) : ℤ := (query.numerator : ℤ)*256

/-- Integer denominator after dividing the mantissa by the selected grid point. -/
def IntegerLogQuery.localDenominator (query : IntegerLogQuery) : ℤ :=
  (query.denominator : ℤ)*(256+query.grid.val)

/-- Exact integer acceptance check for the positive input and its complete analytic parameter witness. -/
def IntegerLogQuery.check (query : IntegerLogQuery) : Bool :=
  integerLogParameterCheck query.localNumerator query.localDenominator query.parameter

/-- Previously proved log-two bounds, rounded outward once to the common integer scale. -/
def integerLogTwo : FixedBounds := ⟨799144290325165978, 799144290325165980⟩

/-- The integer log-two enclosure contains the exact analytic constant. -/
theorem integerLogTwo_sound : (integerLogTwo.interval (2^60)).Contains (Real.log 2) :=
  Interval.encloses_sound (by decide +kernel :
    (integerLogTwo.interval (2^60)).encloses logTwoInterval = true) logTwoInterval_sound

/-- Compute the full logarithm enclosure using only integer operations and a proved integer grid lookup. -/
def IntegerLogQuery.bounds (query : IntegerLogQuery) : FixedBounds :=
  ((fixedCubicLogBounds query.parameter).add (FixedLogGrid.bounds query.grid)).add
    (FixedBounds.scaleRatio query.exponent 1 integerLogTwo)

/-- The selected grid point and binary power give exactly the checked local rational input. -/
theorem IntegerLogQuery.localRatio (query : IntegerLogQuery) :
    tableLogRatio query.input query.exponent (1+(query.grid.val : ℚ)/256) =
      (query.localNumerator : ℚ)/query.localDenominator := by
  have nonzero : (2 : ℚ)^query.exponent ≠ 0 := zpow_ne_zero _ (by norm_num)
  have gridPositive : (0 : ℚ) < 256+query.grid.val := by positivity
  simp only [tableLogRatio, input, localNumerator, localDenominator, Int.cast_mul,
    Int.cast_add, Int.cast_ofNat, Int.cast_natCast]
  field_simp

/-- Integer acceptance certifies the actual logarithm of the complete rational input. -/
theorem IntegerLogQuery.sound (query : IntegerLogQuery) (checked : query.check = true) :
    (query.bounds.interval (2^60)).Contains (Real.log (query.input : ℝ)) := by
  have localChecked := integerLogParameterCheck_sound query.localNumerator query.localDenominator query.parameter checked
  have facts := of_decide_eq_true localChecked
  have ratioPositive : (0 : ℝ) < tableLogRatio query.input query.exponent (1+(query.grid.val : ℚ)/256) := by
    rw [query.localRatio]
    exact_mod_cast facts.1
  have basePositive : (0 : ℝ) < (1+(query.grid.val : ℚ)/256 : ℚ) := by
    push_cast
    positivity
  rw [tableLogarithm query.input query.exponent _ basePositive ratioPositive, query.localRatio]
  have localSound := fixedCubicLogBounds_sound _ query.parameter localChecked
  have exponentSound := FixedBounds.scaleRatio_sound query.exponent (show 0 < 1 by decide)
    (show 0 < (2 : ℕ)^60 by positivity) integerLogTwo_sound
  simpa only [bounds, Nat.cast_one, div_one] using
    FixedBounds.add_sound (FixedBounds.add_sound localSound (FixedLogGrid.sound query.grid)) exponentSound

end MatrixBounds.Numeric
