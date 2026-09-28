import SuppliedRoundExtraction
import EventualContextSequence
import ExponentialPowerBounds
import PipelineScheduleRates

/-! The full finite supplied pipeline chooses all shrinking windows before
the growing scale and composes every actual shared round, including startup
and drain. Its final state contains every original batch and waiting factor. -/
namespace MatrixBounds.Numeric.SuppliedRounds

universe v
open Tensor Interface SuppliedBatch
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {K : Type} [CommRing K] {batches : ℕ}

/-- The exact original supplied phase rate vectors before any numerical replacement. -/
def stageRates (index : Fin 3) : Rates := (SuppliedFixedStages.fixed (phaseAt index)).rates

/-- The actual finite pipeline earns its complete startup, steady-state, and drain retention on all original batches. -/
theorem eventual_pipeline (large : 2 ≤ batches) (initial : Parameters batches)
    {error : ℝ} (errorPositive : 0 < error) :
    ∃ final : Parameters batches, ∃ threshold : ℕ,
      ∀ k, threshold ≤ k → 17592186044416 ∣ RepairRates.scale k → ∃ copies cost : ℕ,
        Real.exp ((6*(scheduledRetention batches (stageRates 0) (stageRates 1) (stageRates 2)
          -(batches+2)*error))*RepairRates.scale k) ≤ copies ∧
        (cost : ℝ) ≤ Real.exp (((batches+2)*(6*error))*RepairRates.scale k) ∧
        ContextReduction.{v} (tensor (K := K) 0 initial (RepairRates.scale k)).coefficient
          (directSum (fun _ : Fin copies => (tensor (K := K) (batches+2) final (RepairRates.scale k)).coefficient)) cost := by
  let growth := fun round => 6*(bottleneck (Pipeline.roundRates batches round stageRates)-error)
  let loss := fun _ : ℕ => 6*error
  have step (round : ℕ) (inside : round < batches+2) (parameters : Parameters batches) :
      ∃ next : Parameters batches, ∃ threshold : ℕ,
        ∀ k, threshold ≤ k → 17592186044416 ∣ RepairRates.scale k → ∃ copies cost : ℕ,
          Real.exp (growth round*RepairRates.scale k) ≤ copies ∧
          (cost : ℝ) ≤ Real.exp (loss round*RepairRates.scale k) ∧
          ContextReduction.{v} (tensor (K := K) round parameters (RepairRates.scale k)).coefficient
            (directSum (fun _ : Fin copies => (tensor (K := K) (round+1) next (RepairRates.scale k)).coefficient)) cost := by
    obtain ⟨selected, threshold, extraction⟩ := eventual_extraction (K := K) ⟨round, inside⟩ parameters errorPositive
    refine ⟨advance round parameters selected, threshold, ?_⟩
    intro k above divisible
    obtain ⟨copies, cost, retained, overhead, reduction⟩ := extraction k above divisible
    refine ⟨copies^6, cost^6, ?_, ?_, reduction⟩
    · simpa only [growth, stageRates, Nat.cast_ofNat, mul_assoc] using exponential_power_lower retained 6
    · simpa only [loss, Nat.cast_ofNat, mul_assoc] using exponential_power_upper overhead 6
  obtain ⟨final, threshold, extraction⟩ := eventual_parameterized_sequence
    (fun _ => Parameters batches)
    (fun round parameters size => (tensor (K := K) round parameters size).Left)
    (fun round parameters size => (tensor (K := K) round parameters size).Middle)
    (fun round parameters size => (tensor (K := K) round parameters size).Right)
    (fun round parameters size => (tensor (K := K) round parameters size).coefficient)
    (fun k => 17592186044416 ∣ RepairRates.scale k) growth loss initial (batches+2) step
  have growth_sum : (∑ round ∈ Finset.range (batches+2), growth round) =
      6*(scheduledRetention batches (stageRates 0) (stageRates 1) (stageRates 2)-(batches+2)*error) := by
    simp only [growth, ← Finset.mul_sum, Finset.sum_sub_distrib, Pipeline.total_retention large,
      Finset.sum_const, Finset.card_range, nsmul_eq_mul, Nat.cast_add, Nat.cast_ofNat]
  have loss_sum : (∑ round ∈ Finset.range (batches+2), loss round) = (batches+2)*(6*error) := by
    simp only [loss, Finset.sum_const, Finset.card_range, nsmul_eq_mul, Nat.cast_add, Nat.cast_ofNat]
  refine ⟨final, threshold, ?_⟩
  intro k above divisible
  simpa only [growth_sum, loss_sum] using extraction k above divisible

/-- After the final drain round every original batch is the complete terminal output with all waiting factors retained. -/
def finalRestriction (parameters : Parameters batches) (size : ℕ) :
    CoordinateRestriction (tensor (K := K) (batches+2) parameters size).coefficient
      (heterogeneous (fun batch => (completed (K := K) (parameters batch) size).coefficient)) := by
  apply CoordinateRestriction.heterogeneous
  intro batch
  apply FiniteTensor.equalRestriction
  change state (K := K) (Pipeline.completedBefore batch.val (batches+2)) (parameters batch) size =
    completed (parameters batch) size
  rw [Pipeline.completed_final batch]
  rfl

end
end MatrixBounds.Numeric.SuppliedRounds
