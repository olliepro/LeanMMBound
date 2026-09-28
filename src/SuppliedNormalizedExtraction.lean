import SuppliedNormalizedRates
import SuppliedRectangularAlgorithms

/-! Actual rectangular algorithms with the source certificate's normalized
rates, ready for direct identification with its checked numerical expressions. -/
namespace MatrixBounds.Numeric.SuppliedNormalizedExtraction

open Tensor SuppliedNormalizedRates
noncomputable section
variable {K : Type} [CommRing K] {batches : ℕ}

/-- Every positive accuracy gives actual rectangular algorithms at the original normalized source rates. -/
theorem asymptotic_extractions (large : 2 ≤ batches) (error : ℝ) (positive : 0 < error) :
    ∃ scale : ℝ, ∃ rank copies i j l : ℕ,
      0 < scale ∧ RankLE (MatrixComplexity.rectangularBatch K copies i j l) rank ∧
      (rank : ℝ) ≤ Real.exp (scale*(8*Real.log 7+error)) ∧
      Real.exp (scale*(retention batches-error)) ≤ (copies : ℝ) ∧
      Real.exp (scale*(volume-error)) ≤ ((i*j*l : ℕ) : ℝ) := by
  have countPositive : 0 < batches := by omega
  have unitPositive := units_positive countPositive
  obtain ⟨scale, rank, copies, i, j, l, scalePositive, algorithm, rankBound, retained, dimensions⟩ :=
    SuppliedRectangularAlgorithms.asymptotic_extractions (K := K) large (units batches*error) (mul_pos unitPositive positive)
  refine ⟨scale*units batches, rank, copies, i, j, l, mul_pos scalePositive unitPositive, algorithm, ?_, ?_, ?_⟩
  · rw [source_rate] at rankBound
    convert rankBound using 1
    congr 1
    ring
  · rw [retention_rate countPositive] at retained
    convert retained using 1
    congr 1
    ring
  · rw [volume_rate] at dimensions
    convert dimensions using 1
    congr 1
    ring

/-- A strict bound on the actual normalized rate expressions bounds the algebraic matrix multiplication exponent. -/
theorem exponent_le (large : 2 ≤ batches) {rate : ℝ}
    (volumePositive : 0 < volume) (rateNonnegative : 0 ≤ rate)
    (strictBudget : 8*Real.log 7 < retention batches+(rate/3)*volume) : MatrixComplexity.exponent K ≤ rate :=
  MatrixComplexity.exponent_le_of_asymptotic_rectangular_extraction volumePositive rateNonnegative strictBudget
    (asymptotic_extractions (K := K) large)

end
end MatrixBounds.Numeric.SuppliedNormalizedExtraction
