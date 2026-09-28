import ExtractionExponent
import RectangularSum

/-! Convert the complete rectangular output of a pipeline directly into the
algebraic exponent bound, including arbitrarily small extraction losses. -/
namespace MatrixBounds.MatrixComplexity

open Tensor
noncomputable section
variable {K : Type*} [CommSemiring K]

/-- Actual rectangular batches with exponential rank, copy, and volume estimates bound the exponent. -/
theorem exponent_le_of_rectangular_extraction {rank copies i j l : ℕ}
    (algorithm : RankLE (rectangularBatch K copies i j l) rank)
    {scale cost retention volume rate : ℝ}
    (scalePositive : 0 < scale) (volumePositive : 0 < volume) (rateNonnegative : 0 ≤ rate)
    (source : (rank : ℝ) ≤ Real.exp (scale*cost))
    (outputs : Real.exp (scale*retention) ≤ (copies : ℝ))
    (dimensions : Real.exp (scale*volume) ≤ ((i*j*l : ℕ) : ℝ))
    (accounting : cost ≤ retention+(rate/3)*volume) : exponent K ≤ rate := by
  have copiesPositive : 0 < copies := by exact_mod_cast (Real.exp_pos _).trans_le outputs
  have volumeLarge : 1 < i*j*l := by
    exact_mod_cast (Real.one_lt_exp_iff.mpr (mul_pos scalePositive volumePositive)).trans_le dimensions
  exact exponent_le_of_rectangular_batch copiesPositive volumeLarge algorithm rate rateNonnegative
    (exponential_batch_budget scalePositive.le (div_nonneg rateNonnegative (by norm_num))
      source outputs dimensions accounting)

/-- A strict nominal budget leaves a positive common loss allowance for rank, copies, and volume. -/
theorem rectangular_loss_allowance {cost retention volume rate : ℝ}
    (volumePositive : 0 < volume) (rateNonnegative : 0 ≤ rate)
    (strictBudget : cost < retention+(rate/3)*volume) :
    ∃ error : ℝ, 0 < error ∧ 0 < volume-error ∧
      cost+error ≤ retention-error+(rate/3)*(volume-error) := by
  let gap := retention+(rate/3)*volume-cost
  have gapPositive : 0 < gap := by dsimp only [gap]; linarith
  have factorPositive : 0 < 2+(rate/3) := by positivity
  let error := min (volume/2) (gap/(2*(2+rate/3)))
  have errorPositive : 0 < error := lt_min (by positivity) (div_pos gapPositive (by positivity))
  have volumeBound : error ≤ volume/2 := min_le_left _ _
  have gapBound : error ≤ gap/(2*(2+rate/3)) := min_le_right _ _
  have multiplied : error*(2*(2+rate/3)) ≤ gap := (le_div_iff₀ (by positivity)).mp gapBound
  refine ⟨error, errorPositive, by linarith, ?_⟩
  dsimp only [gap] at multiplied gapPositive
  nlinarith

/-- Arbitrarily small proved losses in genuine rectangular extractions imply the strict nominal rate bound. -/
theorem exponent_le_of_asymptotic_rectangular_extraction {cost retention volume rate : ℝ}
    (volumePositive : 0 < volume) (rateNonnegative : 0 ≤ rate)
    (strictBudget : cost < retention+(rate/3)*volume)
    (extractions : ∀ error : ℝ, 0 < error → ∃ scale : ℝ, ∃ rank copies i j l : ℕ,
      0 < scale ∧ RankLE (rectangularBatch K copies i j l) rank ∧
      (rank : ℝ) ≤ Real.exp (scale*(cost+error)) ∧
      Real.exp (scale*(retention-error)) ≤ (copies : ℝ) ∧
      Real.exp (scale*(volume-error)) ≤ ((i*j*l : ℕ) : ℝ)) : exponent K ≤ rate := by
  obtain ⟨error, positive, volumeBound, accounting⟩ :=
    rectangular_loss_allowance volumePositive rateNonnegative strictBudget
  obtain ⟨scale, rank, copies, i, j, l, scalePositive, algorithm, source, outputs, dimensions⟩ :=
    extractions error positive
  exact exponent_le_of_rectangular_extraction algorithm scalePositive volumeBound rateNonnegative
    source outputs dimensions accounting

end
end MatrixBounds.MatrixComplexity
