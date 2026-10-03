module

public import CoarseRetentionRates

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Real exponential estimates pass to maxima of finite natural counts without
rounding losses. This is used for the actual coarse and fine graph degrees. -/
namespace MatrixBounds.Selection

/-- A common real upper bound controls the maximum of finitely many natural counts. -/
theorem finite_maximum_real_bound {A : Type*} (set : Finset A) (count : A → ℕ)
    {bound : ℝ} (nonnegative : 0 ≤ bound)
    (pointwise : ∀ a ∈ set, (count a : ℝ) ≤ bound) :
    ((set.sup count : ℕ) : ℝ) ≤ bound := by
  have rounded : set.sup count ≤ ⌊bound⌋₊ :=
    Finset.sup_le (fun a member => Nat.le_floor (pointwise a member))
  exact (Nat.cast_le.mpr rounded).trans (Nat.floor_le nonnegative)

/-- A common normalized rate controls the maximum of finitely many natural counts. -/
theorem finite_maximum_normalized_bound {A : Type*} (set : Finset A) (count : A → ℕ)
    {denominator : ℕ} (positive : 0 < denominator) {rate : ℝ} (nonnegative : 0 ≤ rate)
    (pointwise : ∀ a ∈ set, (count a : ℝ)/denominator ≤ rate) :
    ((set.sup count : ℕ) : ℝ)/denominator ≤ rate := by
  have positiveReal : (0 : ℝ) < denominator := by exact_mod_cast positive
  apply (div_le_iff₀ positiveReal).mpr
  exact finite_maximum_real_bound set count (mul_nonneg nonnegative positiveReal.le)
    (fun a member => (div_le_iff₀ positiveReal).mp (pointwise a member))

end MatrixBounds.Selection
