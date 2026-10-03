module

public import SuppliedSourceRank

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Unconditional finite-rank algorithms for the actual complete output tensors
of every sufficiently large admissible supplied pipeline. -/
namespace MatrixBounds.Numeric.SuppliedPipelineRank

open Tensor Tensor.CW Interface SuppliedBatch SuppliedRounds
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {K : Type} [CommRing K] {batches : ℕ}

/-- Divide a requested rank error among all finite root and shared-stage losses. -/
def internalError (batches : ℕ) (error : ℝ) : ℝ := error/(2*(6*(2*(batches : ℝ)+2)))

/-- The finite pipeline error allocation is strictly positive. -/
theorem internalError_positive {error : ℝ} (positive : 0 < error) :
    0 < internalError batches error := by unfold internalError; positivity

/-- The complete contextual construction spends exactly half the requested allowance. -/
theorem internalError_loss (batches : ℕ) (error : ℝ) :
    SuppliedSourcePipeline.loss batches (internalError batches error) = error/2 := by
  unfold SuppliedSourcePipeline.loss internalError
  have nonzero : (2*(6*(2*(batches : ℝ)+2))) ≠ 0 := by positivity
  field_simp

/-- Actual complete output batches admit finite-rank algorithms with arbitrarily small common losses.
The statement includes the one original coefficient extraction, every pipeline boundary round,
and all separately labelled waiting and terminal tensors. -/
theorem eventual_algorithms (large : 2 ≤ batches) {error : ℝ} (positive : 0 < error) :
    ∃ final : Parameters batches, ∃ threshold : ℕ,
      ∀ k, threshold ≤ k → 17592186044416 ∣ RepairRates.scale k → ∃ copies rank : ℕ,
        Real.exp ((SuppliedSourcePipeline.retention batches-error)*RepairRates.scale k) ≤ copies ∧
        (rank : ℝ) ≤ Real.exp ((SuppliedSourceRank.rate batches+error)*RepairRates.scale k) ∧
        RankLE (directSum (fun _ : Fin copies => heterogeneous
          (fun batch => (completed (K := K) (final batch) (RepairRates.scale k)).coefficient))) rank := by
  obtain ⟨final, extractionThreshold, extraction⟩ := SuppliedSourcePipeline.eventual_extraction.{0}
    (K := K) large (internalError_positive positive)
  obtain ⟨rankThreshold, rankBound⟩ := SuppliedSourceRank.eventual_budget batches positive
  refine ⟨final, max extractionThreshold rankThreshold, ?_⟩
  intro k above divisible
  have sizeAbove : rankThreshold ≤ RepairRates.scale k :=
    (le_trans (le_max_right _ _) above).trans (RepairRates.index_le_scale k)
  obtain ⟨copies, cost, retained, overhead, reduction⟩ :=
    extraction k (le_trans (le_max_left _ _) above) divisible
  rw [internalError_loss] at retained overhead
  refine ⟨copies, cost*(SuppliedSourceRank.budget batches (RepairRates.scale k)*
    (SuppliedSourceRank.degree batches (RepairRates.scale k)+1)^2), ?_,
    rankBound (RepairRates.scale k) sizeAbove cost overhead, ?_⟩
  · apply le_trans (Real.exp_le_exp.mpr ?_) retained
    exact mul_le_mul_of_nonneg_right (by linarith) (Nat.cast_nonneg _)
  · exact reduction.apply_certificate (SuppliedSourceCertificate.batches batches (RepairRates.scale k))

end
end MatrixBounds.Numeric.SuppliedPipelineRank
