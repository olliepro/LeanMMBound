import BatchPowers
import DegenerationExponent

/-! The asymptotic sum inequality for identical square matrix summands.
An explicit batching construction removes rounding after taking tensor powers;
polynomial coefficient extraction is absorbed into an arbitrary exponent margin. -/
namespace MatrixBounds.MatrixComplexity

open Tensor Tensor.Degeneration Filter
noncomputable section
variable {K : Type*} [CommSemiring K]

/-- Powers remove rounding in the amortized rank cost of a nonempty batch.
If s independent b by b matrix products have rank at most s*b^rate,
the matrix multiplication exponent is at most rate. -/
theorem exponent_le_of_batch {copies base rank : ℕ}
    (nonempty : 0 < copies) (base_large : 1 < base)
    (algorithm : RankLE (squareBatch K copies base) rank)
    (rate : ℝ) (rate_nonneg : 0 ≤ rate)
    (budget : (rank : ℝ) ≤ (copies : ℝ) * (base : ℝ) ^ rate) : exponent K ≤ rate := by
  apply le_of_forall_pos_le_add
  intro margin margin_positive
  have hb : (1 : ℝ) < base := by exact_mod_cast base_large
  have growth : 1 < (base : ℝ) ^ margin := Real.one_lt_rpow hb margin_positive
  have eventual := (tendsto_pow_atTop_atTop_of_one_lt growth).eventually
    (eventually_ge_atTop (2 : ℝ))
  obtain ⟨power, doubling, power_positive⟩ := (eventual.and (eventually_ge_atTop 1)).exists
  let groups : ℕ := ⌈((base : ℝ) ^ rate) ^ power⌉₊
  have capacity : rank ^ power ≤ groups * copies ^ power := by
    have powered := pow_le_pow_left₀ (Nat.cast_nonneg _) budget power
    rw [mul_pow] at powered
    have ceiling := Nat.le_ceil (((base : ℝ) ^ rate) ^ power)
    have result := powered.trans (mul_le_mul_of_nonneg_left ceiling
      (pow_nonneg (Nat.cast_nonneg copies) power))
    have result' : (rank : ℝ) ^ power ≤ (groups : ℝ) * (copies : ℝ) ^ power := by
      simpa only [groups, mul_comm] using result
    exact_mod_cast result'
  apply exponent_le_of_batch_integer (pow_pos nonempty _)
    (Nat.one_lt_pow (by omega) base_large) (squareBatch_power algorithm power)
    capacity (rate + margin) (by positivity)
  have unit : (1 : ℝ) ≤ ((base : ℝ) ^ rate) ^ power :=
    one_le_pow₀ (Real.one_le_rpow hb.le rate_nonneg)
  have ceiling : (groups : ℝ) ≤ ((base : ℝ) ^ rate) ^ power + 1 :=
    (Nat.ceil_lt_add_one (by positivity)).le
  calc
    _ ≤ ((base : ℝ) ^ rate) ^ power + 1 := ceiling
    _ ≤ ((base : ℝ) ^ rate) ^ power * 2 := by linarith
    _ ≤ ((base : ℝ) ^ rate) ^ power * ((base : ℝ) ^ margin) ^ power :=
      mul_le_mul_of_nonneg_left doubling (by positivity)
    _ = _ := by
      rw [Nat.cast_pow, ← mul_pow, ← Real.rpow_add (by positivity),
        ← Real.rpow_natCast_mul (by positivity), ← Real.rpow_mul_natCast (by positivity)]
      rw [mul_comm]

/-- A batch of identical square matrix degenerations satisfies the same asymptotic inequality.
The polynomial certificate is powered before coefficient extraction, so its cost vanishes. -/
theorem exponent_le_of_batch_degeneration {copies base rank degree : ℕ}
    (nonempty : 0 < copies) (base_large : 1 < base)
    (certificate : Certificate (squareBatch K copies base) rank degree)
    (rate : ℝ) (rate_nonneg : 0 ≤ rate)
    (budget : (rank : ℝ) ≤ (copies : ℝ) * (base : ℝ) ^ rate) : exponent K ≤ rate := by
  apply le_of_forall_pos_le_add
  intro margin margin_positive
  have hb : (1 : ℝ) < base := by exact_mod_cast base_large
  have growth : 1 < (base : ℝ) ^ margin := Real.one_lt_rpow hb margin_positive
  obtain ⟨power, overhead, power_positive⟩ :=
    ((extraction_overhead_small degree ((base : ℝ) ^ margin) growth).and
      (eventually_ge_atTop 1)).exists
  apply exponent_le_of_batch (pow_pos nonempty _)
    (Nat.one_lt_pow (by omega) base_large) (batchCertificatePower certificate power).exact_rank
    (rate + margin) (by positivity)
  push_cast
  have powered := pow_le_pow_left₀ (Nat.cast_nonneg _) budget power
  rw [mul_pow] at powered
  calc
    _ ≤ ((copies : ℝ) ^ power * ((base : ℝ) ^ rate) ^ power) *
        ((base : ℝ) ^ margin) ^ power := mul_le_mul powered
      (by exact_mod_cast overhead) (by positivity) (by positivity)
    _ = _ := by
      rw [mul_assoc, ← mul_pow, ← Real.rpow_add (by positivity),
        ← Real.rpow_natCast_mul (by positivity), ← Real.rpow_mul_natCast (by positivity)]
      rw [mul_comm (power : ℝ)]

end
end MatrixBounds.MatrixComplexity
