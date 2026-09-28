import SuppliedRoundTensors

/-! A shared round of the full supplied pipeline advances all original active
batches and carries every inactive and accumulated waiting factor unchanged. -/
namespace MatrixBounds.Numeric.SuppliedRounds

universe v
open Tensor Tensor.CW Interface SuppliedBatch
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {K : Type} [CommRing K] {batches : ℕ}
set_option maxRecDepth 3000
set_option maxHeartbeats 3000000

/-- Every full shared round has a uniform positive choice of next widths and an actual extraction at its exact scheduled rate. -/
theorem eventual_extraction (round : Fin (batches+2)) (parameters : Parameters batches)
    {error : ℝ} (errorPositive : 0 < error) :
    ∃ selected : Selected batches round.val, ∃ threshold : ℕ,
      ∀ k, threshold ≤ k → 17592186044416 ∣ RepairRates.scale k → ∃ copies cost : ℕ,
        Real.exp ((bottleneck (Pipeline.roundRates batches round.val
          (fun index => (SuppliedFixedStages.fixed (phaseAt index)).rates))-error)*RepairRates.scale k) ≤ copies ∧
        (cost : ℝ) ≤ Real.exp (error*RepairRates.scale k) ∧
        ContextReduction.{v} (tensor (K := K) round.val parameters (RepairRates.scale k)).coefficient
          (directSum (fun _ : Fin (copies^6) =>
            (tensor (K := K) (round.val+1) (advance round.val parameters selected) (RepairRates.scale k)).coefficient)) (cost^6) := by
  obtain ⟨delta, positive, threshold, extraction⟩ := SuppliedCanonicalStages.eventual_extraction (K := K)
    (phase round.val) (fun batch => ((parameters batch.val).input (phase round.val batch)).val)
    (fun batch => ((parameters batch.val).input (phase round.val batch)).property) errorPositive
  let selected : Selected batches round.val := fun batch => ⟨delta batch, positive batch⟩
  refine ⟨selected, max 1 threshold, ?_⟩
  intro k large divisible
  have sizePositive : 0 < RepairRates.scale k :=
    (show 0 < k by omega).trans_le (RepairRates.index_le_scale k)
  obtain ⟨copies, cost, retained, overhead, extracted⟩ := extraction k (by omega) divisible
  refine ⟨copies, cost, ?_, overhead, ?_⟩
  · simpa only [← active_rates round, phase] using retained
  · have prepared : ContextReduction.{v}
        (activeParents (K := K) round.val parameters (RepairRates.scale k)).coefficient
        (directSum (fun _ : Fin (copies^6) => (activeOutputs (K := K) round.val (RepairRates.scale k) selected).coefficient))
        (cost^6) := extracted
    have carried := prepared.extract_with_waiting (activeWaiting (K := K) round.val parameters (RepairRates.scale k)).coefficient
    have advanced := (outputs_reduction (K := K) round.val parameters selected sizePositive).batch (I := Fin (copies^6))
    have active : ContextReduction.{v}
        (activeTensor (K := K) round.val parameters (RepairRates.scale k)).coefficient
        (directSum (fun _ : Fin (copies^6) => (advancedTensor (K := K) round.val parameters selected (RepairRates.scale k)).coefficient))
        (cost^6) := by
      simpa only [one_mul, mul_one] using ((activeRestriction (K := K) round.val parameters (RepairRates.scale k)).context.trans carried).trans advanced
    exact ContextReduction.extract_partition (Pipeline.active round.val)
      (fun batch => (state (K := K) (Pipeline.completedBefore batch.val round.val) (parameters batch) (RepairRates.scale k)).coefficient)
      (fun batch => (state (K := K) (Pipeline.completedBefore batch.val (round.val+1))
        (advance round.val parameters selected batch) (RepairRates.scale k)).coefficient)
      active (inactiveRestriction (K := K) round.val parameters selected (RepairRates.scale k))

end
end MatrixBounds.Numeric.SuppliedRounds
