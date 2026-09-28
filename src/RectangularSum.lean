import RectangularBatches
import AsymptoticSum

/-! Rectangular asymptotic sum inequality for identical summands. Three cyclic
orientations produce square products through explicit tensor coordinate maps. -/
namespace MatrixBounds.MatrixComplexity

open Tensor Tensor.Degeneration
noncomputable section
variable {K : Type*} [CommSemiring K]

/-- Three cyclic orientations turn s rectangular products into s^3 square products of side i*j*l. -/
theorem rectangularBatch_square {copies i j l rank : ℕ}
    (budget : RankLE (rectangularBatch K copies i j l) rank) :
    RankLE (squareBatch K (copies^3) (i*j*l)) (rank^3) := by
  have once := rectangularBatch_cyclic budget
  have twice := rectangularBatch_cyclic once
  have result := rectangularBatch_product (rectangularBatch_product budget once) twice
  have middle : j*l*i = i*j*l := by ac_rfl
  have right : l*i*j = i*j*l := by ac_rfl
  have copy_cube : copies*copies*copies = copies^3 := by ring
  have rank_cube : rank*rank*rank = rank^3 := by ring
  rw [middle, right, copy_cube, rank_cube] at result
  exact result

/-- Rectangular degeneration certificates symmetrize without losing rank or copy factors. -/
def rectangularCertificateSquare {copies i j l rank degree : ℕ}
    (certificate : Certificate (rectangularBatch K copies i j l) rank degree) :
    Certificate (squareBatch K (copies^3) (i*j*l)) (rank^3) (3*degree) := by
  let once := rectangularCertificateCyclic certificate
  let twice := rectangularCertificateCyclic once
  have result := rectangularCertificateProduct (rectangularCertificateProduct certificate once) twice
  have middle : j*l*i = i*j*l := by ac_rfl
  have right : l*i*j = i*j*l := by ac_rfl
  have copy_cube : copies*copies*copies = copies^3 := by ring
  have rank_cube : rank*rank*rank = rank^3 := by ring
  have degree_sum : degree+degree+degree = 3*degree := by ring
  rw [middle, right, copy_cube, rank_cube, degree_sum] at result
  exact result

/-- Cubing an amortized rectangular rank bound gives the matching square-batch bound. -/
theorem rectangular_cube_budget {copies volume rank : ℕ} {rate : ℝ}
    (budget : (rank : ℝ) ≤ (copies : ℝ)*(volume : ℝ)^(rate/3)) :
    ((rank^3 : ℕ) : ℝ) ≤ ((copies^3 : ℕ) : ℝ)*(volume : ℝ)^rate := by
  have powered := pow_le_pow_left₀ (Nat.cast_nonneg rank) budget 3
  rw [mul_pow, ← Real.rpow_mul_natCast (Nat.cast_nonneg volume)] at powered
  have exponent : (rate/3)*(3 : ℕ) = rate := by norm_num
  rw [exponent] at powered
  simpa only [Nat.cast_pow] using powered

/-- A nonempty batch of rectangular algorithms gives the usual volume-based exponent bound. -/
theorem exponent_le_of_rectangular_batch {copies i j l rank : ℕ}
    (nonempty : 0 < copies) (volume_large : 1 < i*j*l)
    (algorithm : RankLE (rectangularBatch K copies i j l) rank)
    (rate : ℝ) (rate_nonneg : 0 ≤ rate)
    (budget : (rank : ℝ) ≤ (copies : ℝ)*((i*j*l : ℕ) : ℝ)^(rate/3)) : exponent K ≤ rate := by
  exact exponent_le_of_batch (pow_pos nonempty 3) volume_large (rectangularBatch_square algorithm)
    rate rate_nonneg (rectangular_cube_budget budget)

/-- Polynomial degenerations of identical rectangular summands obey the same exponent inequality. -/
theorem exponent_le_of_rectangular_degeneration {copies i j l rank degree : ℕ}
    (nonempty : 0 < copies) (volume_large : 1 < i*j*l)
    (certificate : Certificate (rectangularBatch K copies i j l) rank degree)
    (rate : ℝ) (rate_nonneg : 0 ≤ rate)
    (budget : (rank : ℝ) ≤ (copies : ℝ)*((i*j*l : ℕ) : ℝ)^(rate/3)) : exponent K ≤ rate := by
  exact exponent_le_of_batch_degeneration (pow_pos nonempty 3) volume_large
    (rectangularCertificateSquare certificate) rate rate_nonneg (rectangular_cube_budget budget)

end
end MatrixBounds.MatrixComplexity
