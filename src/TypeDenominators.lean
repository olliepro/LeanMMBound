module

public import TypeCounting
public import RepairRates

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Rational type integrality along the same unbounded scale used by sparse repair. -/
namespace MatrixBounds.Empirical

open scoped BigOperators
noncomputable section

/-- Arbitrarily large repair scales can be chosen divisible by any fixed positive denominator. -/
theorem exists_divisible_repair_scale (denominator threshold size : ℕ) (positive : 0 < denominator) :
    ∃ k, threshold ≤ k ∧ size ≤ RepairRates.scale k ∧ denominator ∣ RepairRates.scale k := by
  let k := denominator * (max threshold size + 1)
  have base_bound : max threshold size + 1 ≤ k := by
    exact Nat.le_mul_of_pos_left _ positive
  have scale_bound : k ≤ RepairRates.scale k := by
    exact Nat.le_mul_of_pos_right _ (pow_pos (by decide) k)
  refine ⟨k, le_trans (by omega : threshold ≤ max threshold size + 1) base_bound,
    le_trans (by omega : size ≤ k) scale_bound, ?_⟩
  change denominator ∣ k * 2^k
  exact dvd_mul_of_dvd_left ⟨max threshold size + 1, rfl⟩ _

/-- Integer counts representing a fixed rational distribution at a divisible size. -/
def rationalProfile {A : Type*} (numerator : A → ℕ) (denominator size : ℕ) : A → ℕ :=
  fun a => (size / denominator) * numerator a

/-- A normalized rational distribution yields exactly the requested number of positions. -/
theorem rationalProfile_total {A : Type*} [Fintype A] (numerator : A → ℕ)
    {denominator size : ℕ} (normalized : ∑ a, numerator a = denominator) (divisible : denominator ∣ size) :
    (∑ a, rationalProfile numerator denominator size a) = size := by
  simp only [rationalProfile, ← Finset.mul_sum, normalized]
  exact Nat.div_mul_cancel divisible

/-- Every divisible size admits a word with precisely the fixed rational profile. -/
theorem rationalProfile_feasible {A : Type*} [Fintype A] (numerator : A → ℕ)
    {denominator size : ℕ} (normalized : ∑ a, numerator a = denominator) (divisible : denominator ∣ size) :
    Nonempty (TypedWord (P := Fin size) (rationalProfile numerator denominator size)) := by
  have feasible := profile_feasible (rationalProfile numerator denominator size)
  rwa [rationalProfile_total numerator normalized divisible] at feasible

/-- The feasible integer profile has exactly the intended real probability vector. -/
theorem rationalProfile_probability {A : Type*} (numerator : A → ℕ) {denominator size : ℕ}
    (denominator_positive : 0 < denominator) (size_positive : 0 < size) (divisible : denominator ∣ size) (a : A) :
    (rationalProfile numerator denominator size a : ℝ) / size = (numerator a : ℝ) / denominator := by
  have factor : (size / denominator : ℕ) * denominator = size := Nat.div_mul_cancel divisible
  have casted : ((size / denominator : ℕ) : ℝ) * denominator = size := by exact_mod_cast factor
  have denominator_nonzero : (denominator : ℝ) ≠ 0 := by exact_mod_cast denominator_positive.ne'
  have size_nonzero : (size : ℝ) ≠ 0 := by exact_mod_cast size_positive.ne'
  apply (div_eq_div_iff size_nonzero denominator_nonzero).mpr
  simp only [rationalProfile, Nat.cast_mul]
  nlinarith

end
end MatrixBounds.Empirical
