module

public import CheckedIndexTable
public import GibbsData
public import CWRationalSplit
public import Mathlib.Logic.Equiv.Fin.Basic

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Fixed-width semantic views of accepted sparse parameters. The original
row payload is retained while its alphabet size is supplied by a checked binding. -/
namespace MatrixBounds.Numeric

open scoped BigOperators

/-- An accepted exact probability row on a specified finite alphabet. -/
structure TypedProbabilityRow (width denominator : ℕ) where
  /-- The original sparse input row. -/
  row : DyadicRow
  /-- Independent exact normalization and support certificate. -/
  accepted : row.check denominator = true
  /-- The declared input alphabet agrees with the original row width. -/
  width_eq : row.width = width

namespace TypedProbabilityRow

/-- The exact integer numerator of a specified alphabet symbol. -/
def numerator {width denominator : ℕ} (source : TypedProbabilityRow width denominator) (symbol : Fin width) : ℕ :=
  source.row.atColumn symbol.val

/-- Accepted fixed-width numerators have precisely the declared total mass. -/
theorem numerator_total {width denominator : ℕ} (source : TypedProbabilityRow width denominator) :
    (∑ symbol, source.numerator symbol) = denominator := by
  have identity := (source.row.sum_columns (DyadicRow.check_sound source.accepted).1).trans
    (DyadicRow.check_sound source.accepted).2
  have reindex := Equiv.sum_comp (finCongr source.width_eq) source.numerator
  exact reindex.symm.trans identity

/-- Exact rational probabilities preserve the original source numerators. -/
def rational {width denominator : ℕ} (source : TypedProbabilityRow width denominator) (symbol : Fin width) : ℚ :=
  (source.numerator symbol : ℚ)/denominator

/-- Casting fixed-width rational probabilities agrees with the original real row interpretation. -/
theorem cast_rational {width denominator : ℕ} (source : TypedProbabilityRow width denominator) (symbol : Fin width) :
    (source.rational symbol : ℝ) = source.row.probability denominator ((finCongr source.width_eq).symm symbol) := by
  simp only [rational, numerator, DyadicRow.probability, Rat.cast_div, Rat.cast_natCast]
  rfl

/-- Exact rational probabilities are nonnegative and have unit mass. -/
theorem rational_valid {width denominator : ℕ} (source : TypedProbabilityRow width denominator)
    (positive : 0 < denominator) :
    (∀ symbol, 0 ≤ source.rational symbol) ∧ ∑ symbol, source.rational symbol = 1 := by
  constructor
  · intro symbol
    exact div_nonneg (Nat.cast_nonneg _) (Nat.cast_nonneg _)
  · simp only [rational, ← Finset.sum_div, ← Nat.cast_sum, source.numerator_total]
    exact div_self (by exact_mod_cast positive.ne')

end TypedProbabilityRow

/-- An accepted Gibbs potential vector on a specified coordinate alphabet. -/
structure TypedGibbsRow (width : ℕ) where
  /-- The original exact binary rational entries. -/
  row : GibbsRow
  /-- Every supplied entry is strictly positive. -/
  accepted : row.check = true
  /-- The row covers exactly the declared coordinate alphabet. -/
  width_eq : row.entries.length = width

namespace TypedGibbsRow

/-- The exact rational potential on the declared alphabet. -/
def rational {width : ℕ} (source : TypedGibbsRow width) (symbol : Fin width) : ℚ :=
  (source.row.entries[symbol.val]'(by rw [source.width_eq]; exact symbol.isLt)).rational

/-- Every fixed-width rational Gibbs potential has a strictly positive real interpretation. -/
theorem rational_positive {width : ℕ} (source : TypedGibbsRow width) (symbol : Fin width) :
    0 < (source.rational symbol : ℝ) := by
  rw [rational, BinaryRational.cast_rational]
  exact source.row.potential_positive source.accepted ⟨symbol.val, by rw [source.width_eq]; exact symbol.isLt⟩

end TypedGibbsRow
end MatrixBounds.Numeric
