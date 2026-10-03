module

public import MatrixDegeneration
public import Mathlib.Analysis.SpecificLimits.Normed

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Polynomial degeneration overhead vanishes in the algebraic exponent.
Every step uses explicit finite decompositions and the previously defined rank exponent. -/
namespace MatrixBounds.MatrixComplexity

open Tensor Tensor.MatrixMul Tensor.Degeneration Filter
noncomputable section
variable (K : Type*) [CommSemiring K]

/-- The quadratic coefficient-extraction overhead is eventually below any exponential base > 1. -/
theorem extraction_overhead_small (degree : ℕ) (ratio : ℝ) (ratio_large : 1 < ratio) :
    ∀ᶠ power : ℕ in atTop, ((degree * power + 1 : ℕ) : ℝ) ^ 2 ≤ ratio ^ power := by
  have decay := (isLittleO_pow_const_const_pow_of_one_lt (R := ℝ) 2 ratio_large).const_mul_left
    (((degree : ℝ) + 1) ^ 2)
  have eventual := decay.bound (show (0 : ℝ) < 1 by norm_num)
  filter_upwards [eventual, eventually_ge_atTop 1] with power bound positive
  have real_positive : (1 : ℝ) ≤ power := by exact_mod_cast positive
  have degree_nonneg : (0 : ℝ) ≤ degree := Nat.cast_nonneg _
  have simplified : ((degree : ℝ) + 1) ^ 2 * (power : ℝ) ^ 2 ≤ ratio ^ power := by
    simpa only [Real.norm_eq_abs, abs_of_nonneg (by positivity : 0 ≤ ((degree : ℝ) + 1)^2 *
      (power : ℝ)^2), abs_of_nonneg (pow_nonneg (by linarith : 0 ≤ ratio) _), one_mul] using bound
  push_cast
  have linear : (degree : ℝ) * power + 1 ≤ ((degree : ℝ) + 1) * power := by nlinarith
  have squared := pow_le_pow_left₀ (by positivity : 0 ≤ (degree : ℝ) * power + 1) linear 2
  rw [mul_pow] at squared
  exact squared.trans simplified

/-- A finite matrix degeneration bounds the algebraic exponent just as an exact algorithm does.
The proof powers the certificate, extracts exact coefficients, and absorbs the
polynomial extraction cost into an arbitrary positive exponent margin. -/
theorem exponent_le_of_degeneration {base rank degree : ℕ} (base_large : 1 < base)
    (certificate : Certificate (tensor (K := K) (I := Fin base) (J := Fin base)
      (L := Fin base)) rank degree)
    (rate : ℝ) (rate_nonneg : 0 ≤ rate)
    (rank_bound : (rank : ℝ) ≤ (base : ℝ) ^ rate) : exponent K ≤ rate := by
  apply le_of_forall_pos_le_add
  intro margin margin_positive
  have hb : (1 : ℝ) < base := by exact_mod_cast base_large
  have ratio_large : 1 < (base : ℝ) ^ margin := Real.one_lt_rpow hb margin_positive
  obtain ⟨power, overhead, power_positive⟩ :=
    ((extraction_overhead_small degree ((base : ℝ) ^ margin) ratio_large).and
      (eventually_ge_atTop 1)).exists
  have size_large : 1 < base ^ power := by
    exact Nat.one_lt_pow (by omega) base_large
  apply exponent_le_of_finite_rank K (base ^ power)
    (rank ^ power * (degree * power + 1) ^ 2) size_large (rate + margin)
    (by positivity) (matrix_power_rank certificate power)
  push_cast
  calc
    _ ≤ ((base : ℝ) ^ rate) ^ power * (((base : ℝ) ^ margin) ^ power) :=
      mul_le_mul (pow_le_pow_left₀ (Nat.cast_nonneg _) rank_bound _)
        (by exact_mod_cast overhead) (by positivity) (by positivity)
    _ = ((base : ℝ) ^ (rate + margin)) ^ power := by
      rw [← mul_pow, ← Real.rpow_add (by positivity)]
    _ = ((base : ℝ) ^ power) ^ (rate + margin) := by
      rw [← Real.rpow_mul_natCast (by positivity), ← Real.rpow_natCast_mul (by positivity)]
      rw [mul_comm]

end
end MatrixBounds.MatrixComplexity
