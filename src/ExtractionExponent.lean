module

public import AsymptoticSum

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Convert quantitative output counts of a tensor extraction into a bound on
the defined matrix multiplication exponent. Logarithms are natural here. -/
namespace MatrixBounds.MatrixComplexity

open Tensor Tensor.Degeneration
noncomputable section
variable {K : Type*} [CommSemiring K]

/-- Exponential rank, copy-count, and matrix-size estimates imply the finite batch budget. -/
theorem exponential_batch_budget {rank copies size : ℕ} {scale cost retention dimension rate : ℝ}
    (scale_nonneg : 0 ≤ scale) (rate_nonneg : 0 ≤ rate)
    (source : (rank : ℝ) ≤ Real.exp (scale * cost))
    (outputs : Real.exp (scale * retention) ≤ (copies : ℝ))
    (sides : Real.exp (scale * dimension) ≤ (size : ℝ))
    (accounting : cost ≤ retention + rate * dimension) :
    (rank : ℝ) ≤ (copies : ℝ) * (size : ℝ) ^ rate := by
  calc
    _ ≤ Real.exp (scale * cost) := source
    _ ≤ Real.exp (scale * (retention + rate * dimension)) :=
      Real.exp_le_exp.mpr (mul_le_mul_of_nonneg_left accounting scale_nonneg)
    _ = Real.exp (scale * retention) * (Real.exp (scale * dimension)) ^ rate := by
      rw [mul_add, Real.exp_add, ← Real.exp_mul, mul_assoc, mul_comm dimension rate]
    _ ≤ _ := mul_le_mul outputs
      (Real.rpow_le_rpow (Real.exp_pos _).le sides rate_nonneg)
      (by positivity) (Nat.cast_nonneg _)

/-- A finite extraction certificate and its exponential accounting bound the actual exponent.
For example, cost C, retention E, and side exponent M give rate (C-E)/M
whenever that rate is nonnegative and M is positive. -/
theorem exponent_le_of_extraction {rank copies size degree : ℕ}
    (certificate : Certificate (squareBatch K copies size) rank degree)
    {scale cost retention dimension rate : ℝ}
    (scale_positive : 0 < scale) (dimension_positive : 0 < dimension)
    (rate_nonneg : 0 ≤ rate)
    (source : (rank : ℝ) ≤ Real.exp (scale * cost))
    (outputs : Real.exp (scale * retention) ≤ (copies : ℝ))
    (sides : Real.exp (scale * dimension) ≤ (size : ℝ))
    (accounting : cost ≤ retention + rate * dimension) : exponent K ≤ rate := by
  have copies_positive : 0 < copies := by
    exact_mod_cast (Real.exp_pos _).trans_le outputs
  have size_large : 1 < size := by
    have bound := (Real.one_lt_exp_iff.mpr (mul_pos scale_positive dimension_positive)).trans_le sides
    exact_mod_cast bound
  exact exponent_le_of_batch_degeneration copies_positive size_large certificate rate rate_nonneg
    (exponential_batch_budget scale_positive.le rate_nonneg source outputs sides accounting)

end
end MatrixBounds.MatrixComplexity
