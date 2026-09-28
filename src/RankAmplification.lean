import MatrixExponent

/-! Padding and powering connect finite matrix algorithms to uniform asymptotic
rank bounds, retaining the constants needed for all matrix sizes. -/
namespace MatrixBounds.MatrixComplexity

open Tensor Tensor.MatrixMul
noncomputable section
variable (K : Type*) [CommSemiring K]

/-- Minimum matrix rank is monotone in the matrix dimension, by zero padding. -/
theorem matrixRank_mono : Monotone (matrixRank K) := by
  intro m n size
  exact matrixRank_le K (fin_submatrix_rank size (matrixRank_spec K n))

/-- Repeated tensor products turn one algorithm into algorithms for every power of its size. -/
theorem matrixRank_pow_le (size power : ℕ) :
    matrixRank K (size ^ power) ≤ matrixRank K size ^ power := by
  induction power with
  | zero => simpa using matrixRank_le_cube K 1
  | succ power ih =>
    rw [pow_succ, pow_succ]
    exact le_trans (matrixRank_mul_le K _ _) (Nat.mul_le_mul_right _ ih)

/-- Uniform bounds on geometric sizes extend to all sizes with one explicit padding factor.
For example, a bound at sizes 2^k loses only a factor 2^rate when padding inputs. -/
theorem admissible_of_power_bounds (base : ℕ) (base_large : 1 < base)
    (rate constant : ℝ) (rate_nonneg : 0 ≤ rate) (constant_positive : 0 < constant)
    (bounds : ∀ power : ℕ, (matrixRank K (base ^ power) : ℝ) ≤
      constant * ((base ^ power : ℕ) : ℝ) ^ rate) : Admissible K rate := by
  have base_positive : (0 : ℝ) < base := by exact_mod_cast (by omega : 0 < base)
  refine ⟨rate_nonneg, constant * (base : ℝ) ^ rate,
    mul_pos constant_positive (Real.rpow_pos_of_pos base_positive _), ?_⟩
  intro n n_positive
  obtain ⟨power, lower, upper⟩ := exists_nat_pow_near n_positive base_large
  have padding : base ^ (power + 1) ≤ base * n := by
    rw [pow_succ, Nat.mul_comm]
    exact Nat.mul_le_mul_left base lower
  have monotone_rank : (matrixRank K n : ℝ) ≤ matrixRank K (base ^ (power + 1)) := by
    exact_mod_cast matrixRank_mono K (Nat.le_of_lt upper)
  have padding_real : ((base ^ (power + 1) : ℕ) : ℝ) ≤ (base : ℝ) * n := by
    exact_mod_cast padding
  calc
    _ ≤ (matrixRank K (base ^ (power + 1)) : ℝ) := monotone_rank
    _ ≤ constant * ((base ^ (power + 1) : ℕ) : ℝ) ^ rate := bounds _
    _ ≤ constant * ((base : ℝ) * n) ^ rate := mul_le_mul_of_nonneg_left
      (Real.rpow_le_rpow (by positivity) padding_real rate_nonneg) constant_positive.le
    _ = _ := by rw [Real.mul_rpow base_positive.le (by positivity)]; ring

/-- A single finite-size rank inequality yields an actual bound on the defined exponent.
The premise is an algorithm rank budget, not an assumed bound on the exponent. -/
theorem exponent_le_of_finite_rank (base rank : ℕ) (base_large : 1 < base)
    (rate : ℝ) (rate_nonneg : 0 ≤ rate)
    (budget : RankLE (tensor (K := K) (I := Fin base) (J := Fin base) (L := Fin base)) rank)
    (rank_bound : (rank : ℝ) ≤ (base : ℝ) ^ rate) : exponent K ≤ rate := by
  apply exponent_le_of_admissible K
  apply admissible_of_power_bounds K base base_large rate 1 rate_nonneg (by norm_num)
  intro power
  have finite_bound := le_trans (matrixRank_pow_le K base power)
    (Nat.pow_le_pow_left (matrixRank_le K budget) power)
  have casted : (matrixRank K (base ^ power) : ℝ) ≤ (rank : ℝ) ^ power := by
    exact_mod_cast finite_bound
  calc
    _ ≤ (rank : ℝ) ^ power := casted
    _ ≤ ((base : ℝ) ^ rate) ^ power := pow_le_pow_left₀ (by positivity) rank_bound power
    _ = 1 * ((base ^ power : ℕ) : ℝ) ^ rate := by
      rw [one_mul, Nat.cast_pow, ← Real.rpow_natCast_mul (by positivity),
        ← Real.rpow_mul_natCast (by positivity)]
      rw [mul_comm]

end
end MatrixBounds.MatrixComplexity
