module

public import Mathlib.Analysis.SpecialFunctions.Log.Deriv
public import Mathlib.Tactic.Linarith
public import Mathlib.Tactic.FieldSimp
public import Mathlib.Tactic.Ring
public import Mathlib.Tactic.NormNum

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Finite-series logarithm enclosures with kernel-checked remainder bounds.
These lemmas support rational numerical certificates; they do not trust a
floating-point logarithm or an external verifier's reported endpoints. -/
namespace MatrixBounds.Numeric

open scoped BigOperators
noncomputable section

/-- Truncated logarithm-ratio series. The even powers cancel automatically. -/
def logSeries (y : ℝ) (terms : ℕ) : ℝ :=
  (∑ i ∈ Finset.range terms, y ^ (i+1) / (i+1)) -
    (∑ i ∈ Finset.range terms, (-y) ^ (i+1) / (i+1))

/-- Explicit error allowance for subtracting the two logarithm series. -/
def logError (y : ℝ) (terms : ℕ) : ℝ := 2 * |y| ^ (terms+1) / (1-|y|)

/-- The finite series encloses log(1+y)-log(1-y), with a proved geometric remainder. -/
theorem log_ratio_enclosure (y : ℝ) (terms : ℕ) (small : |y| < 1) :
    logSeries y terms - logError y terms ≤ Real.log (1+y) - Real.log (1-y) ∧
    Real.log (1+y) - Real.log (1-y) ≤ logSeries y terms + logError y terms := by
  have positive := abs_le.mp (Real.abs_log_sub_add_sum_range_le small terms)
  have negative := abs_le.mp (Real.abs_log_sub_add_sum_range_le
    (show |(-y)| < 1 by simpa using small) terms)
  simp only [abs_neg, sub_neg_eq_add] at negative
  unfold logSeries logError
  rw [mul_div_assoc]
  constructor <;> linarith

/-- Range-reducing a positive argument produces a logarithm enclosure.
For 1 ≤ value ≤ 2 the series parameter lies in [0,1/3], giving rapid convergence. -/
theorem log_enclosure (value : ℝ) (positive : 0 < value) (terms : ℕ) :
    let y := (value-1)/(value+1)
    logSeries y terms - logError y terms ≤ Real.log value ∧
    Real.log value ≤ logSeries y terms + logError y terms := by
  let y := (value-1)/(value+1)
  have denominator : 0 < value+1 := by linarith
  have lower : -1 < y := by dsimp [y]; rw [lt_div_iff₀ denominator]; linarith
  have upper : y < 1 := by dsimp [y]; rw [div_lt_iff₀ denominator]; linarith
  have ratio : (1+y)/(1-y) = value := by
    dsimp [y]
    field_simp
    ring
  have logarithm : Real.log (1+y) - Real.log (1-y) = Real.log value := by
    rw [← Real.log_div (by linarith) (by linarith), ratio]
  have bounds := log_ratio_enclosure y terms (abs_lt.mpr ⟨lower, upper⟩)
  rw [logarithm] at bounds
  exact bounds

/-- The rational range-reduction parameter is uniformly at most one third on [1,2]. -/
theorem normalized_parameter_bound (value : ℝ) (lower : 1 ≤ value) (upper : value ≤ 2) :
    0 ≤ (value-1)/(value+1) ∧ (value-1)/(value+1) ≤ 1/3 := by
  have denominator : 0 < value+1 := by linarith
  constructor
  · exact div_nonneg (sub_nonneg.mpr lower) denominator.le
  · rw [div_le_iff₀ denominator]
    linarith

end
end MatrixBounds.Numeric
