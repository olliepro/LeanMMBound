import SuppliedPipelineMatrix
import SuppliedPipelineRank
import RectangularExtractionExponent
import TypeDenominators

/-! Concrete rectangular finite-rank algorithms from the original complete
supplied source construction, with arbitrarily small rank, copy, and volume losses. -/
namespace MatrixBounds.Numeric.SuppliedRectangularAlgorithms

open Tensor Tensor.CW Interface SuppliedBatch SuppliedRounds SuppliedPipelineMatrix
noncomputable section
set_option synthInstance.maxSize 1000
set_option maxRecDepth 3000
set_option maxHeartbeats 3000000
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {K : Type} [CommRing K] {batches : ℕ}

/-- An actual complete pipeline matrix relabels to the standard rectangular matrix tensor. -/
def standardRestriction (batches size : ℕ) :
    CoordinateRestriction
      (MatrixMul.tensor (K := K) (I := Rows batches size) (J := Inner batches size) (L := Columns batches size))
      (MatrixMul.tensor (K := K) (I := Fin (Fintype.card (Rows batches size)))
        (J := Fin (Fintype.card (Inner batches size))) (L := Fin (Fintype.card (Columns batches size)))) :=
  MatrixMul.relabelCoordinateRestriction (Fintype.equivFin (Rows batches size)).symm
    (Fintype.equivFin (Inner batches size)).symm (Fintype.equivFin (Columns batches size)).symm

/-- Every requested accuracy admits an actual rectangular algorithm from the fixed original parameters. -/
theorem asymptotic_extractions (large : 2 ≤ batches) (error : ℝ) (positive : 0 < error) :
    ∃ scale : ℝ, ∃ rank copies i j l : ℕ,
      0 < scale ∧ RankLE (MatrixComplexity.rectangularBatch K copies i j l) rank ∧
      (rank : ℝ) ≤ Real.exp (scale*(SuppliedSourceRank.rate batches+error)) ∧
      Real.exp (scale*(SuppliedSourcePipeline.retention batches-error)) ≤ (copies : ℝ) ∧
      Real.exp (scale*(SuppliedPipelineMatrix.volumeRate batches-error)) ≤ ((i*j*l : ℕ) : ℝ) := by
  obtain ⟨final, rankThreshold, algorithms⟩ := SuppliedPipelineRank.eventual_algorithms (K := K) large positive
  obtain ⟨matrixThreshold, matrices⟩ := SuppliedPipelineMatrix.eventual_extraction.{0} (K := K) (by omega) final positive
  obtain ⟨k, aboveRank, aboveMatrix, divisible⟩ :=
    Empirical.exists_divisible_repair_scale 17592186044416 rankThreshold (max 1 matrixThreshold) (by decide)
  obtain ⟨copies, rank, retained, rankBound, algorithm⟩ := algorithms k aboveRank divisible
  obtain ⟨volume, matrixReduction⟩ := matrices (RepairRates.scale k) (le_trans (le_max_right _ _) aboveMatrix)
  have standard := matrixReduction.trans (standardRestriction (K := K) batches (RepairRates.scale k)).context
  have output := (standard.batch (I := Fin copies)).apply_rank algorithm
  refine ⟨RepairRates.scale k, rank, copies, Fintype.card (Rows batches (RepairRates.scale k)),
    Fintype.card (Inner batches (RepairRates.scale k)), Fintype.card (Columns batches (RepairRates.scale k)),
    ?_, ?_, ?_, ?_, ?_⟩
  · exact_mod_cast (show 0 < RepairRates.scale k by omega)
  · simpa only [one_mul] using output
  · simpa only [mul_comm] using rankBound
  · simpa only [mul_comm] using retained
  · have volumePositive : (0 : ℝ) <
        ((Fintype.card (Rows batches (RepairRates.scale k))*Fintype.card (Inner batches (RepairRates.scale k))*
          Fintype.card (Columns batches (RepairRates.scale k)) : ℕ) : ℝ) := by
      exact_mod_cast SuppliedPipelineMatrix.volume_positive batches (RepairRates.scale k)
    exact (Real.exp_le_exp.mpr volume).trans_eq (Real.exp_log volumePositive)

/-- Any strict nominal budget for the actual supplied rates bounds the algebraic matrix multiplication exponent. -/
theorem exponent_le (large : 2 ≤ batches) {rate : ℝ}
    (volumePositive : 0 < SuppliedPipelineMatrix.volumeRate batches) (rateNonnegative : 0 ≤ rate)
    (strictBudget : SuppliedSourceRank.rate batches < SuppliedSourcePipeline.retention batches+
      (rate/3)*SuppliedPipelineMatrix.volumeRate batches) : MatrixComplexity.exponent K ≤ rate :=
  MatrixComplexity.exponent_le_of_asymptotic_rectangular_extraction volumePositive rateNonnegative strictBudget
    (asymptotic_extractions (K := K) large)

end
end MatrixBounds.Numeric.SuppliedRectangularAlgorithms
