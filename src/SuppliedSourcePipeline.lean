import SuppliedPipelineRoot

/-! The actual original CW sources supply every completed batch of the finite
pipeline. Root extraction, all shared rounds, and all boundary errors are
composed as contextual reductions, before the final matrix extraction. -/
namespace MatrixBounds.Numeric.SuppliedSourcePipeline

universe v
open Tensor Tensor.CW Interface SuppliedBatch SuppliedPopulationWeights SuppliedRounds
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {K : Type} [CommRing K] {batches : ℕ}

/-- Exact retained-copy growth before asymptotically negligible losses, including every finite boundary round. -/
def retention (batches : ℕ) : ℝ :=
  6*((batches : ℝ)*rootWeight*SuppliedRootStage.retention+
    scheduledRetention batches (stageRates 0) (stageRates 1) (stageRates 2))

/-- One common error pays for every root batch and every shared round, exactly once in each of six orientations. -/
def loss (batches : ℕ) (error : ℝ) : ℝ := 6*(2*(batches : ℝ)+2)*error

/-- The original fixed sources yield all complete final batches with actual copy counts and overheads at their full finite-pipeline rates. -/
theorem eventual_extraction (large : 2 ≤ batches) {error : ℝ} (errorPositive : 0 < error) :
    ∃ final : Parameters batches, ∃ threshold : ℕ,
      ∀ k, threshold ≤ k → 17592186044416 ∣ RepairRates.scale k → ∃ copies cost : ℕ,
        Real.exp ((retention batches-loss batches error)*RepairRates.scale k) ≤ copies ∧
        (cost : ℝ) ≤ Real.exp (loss batches error*RepairRates.scale k) ∧
        ContextReduction.{v} (SuppliedPipelineRoot.source (K := K) batches (RepairRates.scale k))
          (directSum (fun _ : Fin copies => heterogeneous
            (fun batch => (completed (K := K) (final batch) (RepairRates.scale k)).coefficient))) cost := by
  obtain ⟨rootThreshold, root, rootPositive, rootExtraction⟩ :=
    SuppliedPipelineRoot.eventual_extraction (K := K) batches errorPositive
  obtain ⟨final, pipelineThreshold, pipelineExtraction⟩ := SuppliedRounds.eventual_pipeline (K := K)
    large (SuppliedPipelineRoot.initial batches root rootPositive) errorPositive
  refine ⟨final, max rootThreshold pipelineThreshold, ?_⟩
  intro k above divisible
  obtain ⟨rootCopies, rootCost, rootRetained, rootOverhead, rootReduction⟩ :=
    rootExtraction k (le_trans (le_max_left _ _) above) divisible
  obtain ⟨pipelineCopies, pipelineCost, pipelineRetained, pipelineOverhead, pipelineReduction⟩ :=
    pipelineExtraction k (le_trans (le_max_right _ _) above) divisible
  refine ⟨rootCopies*pipelineCopies, rootCost*pipelineCost, ?_, ?_, ?_⟩
  · have combined := mul_le_mul rootRetained pipelineRetained (Real.exp_pos _).le (Nat.cast_nonneg _)
    rw [← Real.exp_add, ← Nat.cast_mul] at combined
    convert combined using 1; congr 1; dsimp only [retention, loss]; ring
  · have combined := mul_le_mul rootOverhead pipelineOverhead (Nat.cast_nonneg _) (Real.exp_pos _).le
    rw [← Real.exp_add, ← Nat.cast_mul] at combined
    convert combined using 1; congr 1; dsimp only [loss]; ring
  · have combined := rootReduction.compose_fin_extractions pipelineReduction
    simpa only [one_mul] using combined.trans
      ((SuppliedRounds.finalRestriction (K := K) final (RepairRates.scale k)).context.batch (I := Fin (rootCopies*pipelineCopies)))

end
end MatrixBounds.Numeric.SuppliedSourcePipeline
