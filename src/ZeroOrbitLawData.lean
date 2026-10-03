module

public import DyadicOrbitSupport

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! A supplied zero-coordinate orbit row records its exact probability masses
and its required coarse total. Its complete validity is decidably checked. -/
namespace MatrixBounds.Numeric

open scoped BigOperators

/-- A sparse orbit probability row together with its intended nonzero-axis coarse total. -/
structure ZeroOrbitRow where
  row : DyadicRow
  total : ℕ
  deriving DecidableEq

/-- Check exact normalization, the intended orbit alphabet, and every nonzero entry's coarse total. -/
def ZeroOrbitRow.check (entry : ZeroOrbitRow) (orbits denominator : ℕ) (statistic : ℕ → ℕ) : Bool :=
  entry.row.check denominator && decide (entry.row.width = orbits) && entry.row.supportCheck statistic entry.total

/-- Accepted zero-leaf rows have exact normalized integer orbit masses and correct coarse support. -/
theorem ZeroOrbitRow.check_sound {entry : ZeroOrbitRow} {orbits denominator : ℕ}
    (statistic : ℕ → ℕ) (orbitStatistic : Fin orbits → ℕ)
    (agrees : ∀ orbit, statistic orbit.val = orbitStatistic orbit)
    (checked : entry.check orbits denominator statistic = true) :
    (∑ orbit : Fin orbits, entry.row.orbitNumerator orbit) = denominator ∧
      ∀ orbit, orbitStatistic orbit ≠ entry.total → entry.row.orbitNumerator orbit = 0 := by
  have facts : (entry.row.check denominator = true ∧ entry.row.width = orbits) ∧
      entry.row.supportCheck statistic entry.total = true := by
    simpa only [check, Bool.and_eq_true, decide_eq_true_eq] using checked
  exact ⟨entry.row.orbitNumerator_total facts.1.2 facts.1.1,
    entry.row.orbitNumerator_support statistic orbitStatistic agrees facts.2⟩

end MatrixBounds.Numeric
