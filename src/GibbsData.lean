import Mathlib.Data.Rat.Cast.Order
import Mathlib.Data.Rat.Cast.Lemmas
import Mathlib.Data.Real.Basic
import Mathlib.Tactic.Positivity

/-! Exact positive binary rationals encode all supplied Gibbs potentials.
Their real values and strict positivity do not depend on floating point. -/
namespace MatrixBounds.Numeric

/-- An exact binary rational with an integer numerator and power-of-two denominator. -/
structure BinaryRational where
  numerator : ℕ
  denominatorPower : ℕ
  deriving DecidableEq

/-- The exact rational represented by the binary numerator and exponent. -/
def BinaryRational.rational (entry : BinaryRational) : ℚ :=
  (entry.numerator : ℚ)/(2 : ℚ)^entry.denominatorPower

/-- Interpret the supplied binary rational as a real number. -/
noncomputable def BinaryRational.value (entry : BinaryRational) : ℝ :=
  (entry.numerator : ℝ)/(2 : ℝ)^entry.denominatorPower

/-- The rational and real interpretations agree exactly. -/
theorem BinaryRational.cast_rational (entry : BinaryRational) : (entry.rational : ℝ) = entry.value := by
  simp only [rational, value, Rat.cast_div, Rat.cast_natCast, Rat.cast_pow, Rat.cast_ofNat]

/-- A positive integer numerator makes the represented Gibbs potential strictly positive. -/
theorem BinaryRational.value_positive (entry : BinaryRational) (positive : 0 < entry.numerator) : 0 < entry.value := by
  exact div_pos (by exact_mod_cast positive) (by positivity)

/-- One complete coordinate-potential vector at one supplied split row. -/
structure GibbsRow where
  entries : List BinaryRational
  deriving DecidableEq

/-- Read a complete potential coordinate from its exact supplied binary representation. -/
noncomputable def GibbsRow.potential (row : GibbsRow) (symbol : Fin row.entries.length) : ℝ :=
  row.entries[symbol.val].value

/-- The executable certificate checks that every potential is strictly positive. -/
def GibbsRow.check (row : GibbsRow) : Bool := row.entries.all (fun entry => decide (0 < entry.numerator))

/-- Every accepted row supplies strictly positive real potentials on its whole coordinate alphabet. -/
theorem GibbsRow.potential_positive {row : GibbsRow} (checked : row.check = true) (symbol : Fin row.entries.length) :
    0 < row.potential symbol := by
  have positive := (List.all_eq_true.mp checked) row.entries[symbol.val] (List.getElem_mem symbol.isLt)
  exact BinaryRational.value_positive _ (of_decide_eq_true positive)

end MatrixBounds.Numeric
