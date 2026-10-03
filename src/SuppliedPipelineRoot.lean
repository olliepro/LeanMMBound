module

public import SuppliedFinitePipeline
public import SuppliedSourceCertificate

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! All fixed source batches feed the actual initial tensor of the finite
pipeline, with their original CW polynomial certificate and exact root losses. -/
namespace MatrixBounds.Numeric.SuppliedPipelineRoot

universe v
open Tensor Tensor.CW Interface SuppliedBatch SuppliedPopulationWeights
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {K : Type} [CommRing K]

/-- The genuine original sixfold CW source for every fixed batch. -/
def source (batches size : ℕ) :=
  heterogeneous (fun _ : Fin batches => SuppliedSixfoldRoot.source (K := K) size)

/-- All batches begin with the actual common positive root width and unselected later widths. -/
def initial (batches : ℕ) (root : ℝ) (positive : 0 < root) : SuppliedRounds.Parameters batches :=
  fun _ => Widths.initial root positive

/-- Original state-zero batch labels give precisely the first scheduled full tensor. -/
def initialRestriction {batches : ℕ} (parameters : SuppliedRounds.Parameters batches) (size : ℕ) :
    CoordinateRestriction (heterogeneous (fun batch => (state (K := K) 0 (parameters batch) size).coefficient))
      (SuppliedRounds.tensor (K := K) 0 parameters size).coefficient := by
  apply CoordinateRestriction.heterogeneous
  intro batch
  apply FiniteTensor.equalRestriction
  change state (K := K) 0 (parameters batch) size =
    state (Pipeline.completedBefore batch.val 0) (parameters batch) size
  rw [Pipeline.completed_initial]

/-- Actual root extraction supplies all fixed scheduled batches, preserving their original source labels and retained copies. -/
theorem eventual_extraction (batches : ℕ) {error : ℝ} (errorPositive : 0 < error) :
    ∃ threshold : ℕ, ∃ root : ℝ, ∃ positive : 0 < root, ∀ k, threshold ≤ k → 17592186044416 ∣ RepairRates.scale k →
      ∃ copies cost : ℕ,
        Real.exp ((6*batches*((rootWeight : ℝ)*SuppliedRootStage.retention-error))*RepairRates.scale k) ≤ copies ∧
        (cost : ℝ) ≤ Real.exp ((6*batches*error)*RepairRates.scale k) ∧
        ContextReduction.{v} (source (K := K) batches (RepairRates.scale k))
          (directSum (fun _ : Fin copies =>
            (SuppliedRounds.tensor (K := K) 0 (initial batches root positive) (RepairRates.scale k)).coefficient)) cost := by
  obtain ⟨threshold, root, positive, extraction⟩ := SuppliedInitialSixfold.eventual_extraction (K := K) errorPositive
  refine ⟨threshold, root, positive, ?_⟩
  intro k large divisible
  obtain ⟨copies, cost, retained, overhead, reduction⟩ := extraction k large divisible
  have next := (SuppliedInitialPhase.batch_reduction (K := K) (RepairRates.scale k) root).trans
    (SuppliedBatch.initialRestriction (K := K) root positive (RepairRates.scale k)).context
  have single : ContextReduction.{v} (SuppliedSixfoldRoot.source (K := K) (RepairRates.scale k))
      (directSum (fun _ : Fin (copies^6) =>
        (state (K := K) 0 (Widths.initial root positive) (RepairRates.scale k)).coefficient)) (cost^6) := by
    simpa only [one_mul, mul_one] using reduction.trans (next.batch (I := Fin (copies^6)))
  have combined := ContextReduction.heterogeneous_extractions (fun _ : Fin batches => copies^6)
    (fun _ : Fin batches => cost^6) (fun _ => single)
  have copiesIdentity : (∏ _ : Fin batches, copies^6) = (copies^6)^batches := by simp
  have costIdentity : (∏ _ : Fin batches, cost^6) = (cost^6)^batches := by simp
  rw [copiesIdentity, costIdentity] at combined
  refine ⟨(copies^6)^batches, (cost^6)^batches, ?_, ?_, ?_⟩
  · have bound := exponential_power_lower (exponential_power_lower retained 6) batches
    convert bound using 1; congr 1; ring
  · have bound := exponential_power_upper (exponential_power_upper overhead 6) batches
    convert bound using 1; congr 1; ring
  · simpa only [one_mul] using! combined.trans
      ((initialRestriction (K := K) (initial batches root positive) (RepairRates.scale k)).context.batch (I := Fin ((copies^6)^batches)))

end
end MatrixBounds.Numeric.SuppliedPipelineRoot
