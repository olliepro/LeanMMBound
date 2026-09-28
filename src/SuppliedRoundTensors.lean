import SuppliedBatchTransitions
import SuppliedRoundWidths
import FiniteTensorEquality
import PartitionedContextExtraction

/-! Actual labelled tensors before and after a shared round. Coordinate maps
separate active windows, retain waiting windows, and restore every batch. -/
namespace MatrixBounds.Numeric.SuppliedRounds

universe v
open Tensor Tensor.CW Interface SuppliedBatch
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {K : Type} [CommRing K] {batches : ℕ}

/-- Every original batch at its actual completed-stage count before the shared round. -/
def tensor (round : ℕ) (parameters : Parameters batches) (size : ℕ) : FiniteTensor K :=
  .heterogeneous (fun batch => state (Pipeline.completedBefore batch.val round) (parameters batch) size)

/-- Original complete states of precisely the active batches. -/
def activeTensor (round : ℕ) (parameters : Parameters batches) (size : ℕ) : FiniteTensor K :=
  .heterogeneous (fun batch : Pipeline.ActiveBatch batches round =>
    state (Pipeline.completedBefore batch.val.val round) (parameters batch.val) size)

/-- The waiting factors already accumulated inside each active original batch. -/
def activeWaiting (round : ℕ) (parameters : Parameters batches) (size : ℕ) : FiniteTensor K :=
  .heterogeneous (fun batch : Pipeline.ActiveBatch batches round =>
    waiting (parameters batch.val) size (phase round batch))

/-- Canonical parents of all active supplied phases, retaining batch labels. -/
def activeParents (round : ℕ) (parameters : Parameters batches) (size : ℕ) : FiniteTensor K :=
  .heterogeneous (fun batch : Pipeline.ActiveBatch batches round =>
    active (parameters batch.val) size (phase round batch))

/-- Actual canonical children of all active phases at their newly selected widths. -/
def activeOutputs (round size : ℕ) (selected : Selected batches round) : FiniteTensor K :=
  .heterogeneous (fun batch => output size (phase round batch) (selected batch))

/-- Updated complete states of every active original batch. -/
def advancedTensor (round : ℕ) (parameters : Parameters batches) (selected : Selected batches round) (size : ℕ) : FiniteTensor K :=
  .heterogeneous (fun batch : Pipeline.ActiveBatch batches round =>
    state (Pipeline.completedBefore batch.val.val (round+1)) (advance round parameters selected batch.val) size)

/-- Separate accumulated waiting factors from all actual active parent windows. -/
def activeRestriction (round : ℕ) (parameters : Parameters batches) (size : ℕ) :
    CoordinateRestriction (activeTensor (K := K) round parameters size).coefficient
      (product (activeWaiting (K := K) round parameters size).coefficient
        (activeParents (K := K) round parameters size).coefficient) := by
  have states (batch : Pipeline.ActiveBatch batches round) :
      state (K := K) (Pipeline.completedBefore batch.val.val round) (parameters batch.val) size =
        atPhase (parameters batch.val) size (phase round batch) := by
    rw [(Pipeline.active_stage_states round batch).1, state_phase]
    rfl
  exact (CoordinateRestriction.heterogeneous (fun batch => FiniteTensor.equalRestriction (states batch))).trans
    (level3CollectProductsRestriction
      (fun batch : Pipeline.ActiveBatch batches round => (waiting (K := K) (parameters batch.val) size (phase round batch)).coefficient)
      (fun batch => (active (K := K) (parameters batch.val) size (phase round batch)).coefficient))

/-- The complete newly extracted children advance every active batch, preserving its entire waiting tensor. -/
theorem outputs_reduction (round : ℕ) (parameters : Parameters batches) (selected : Selected batches round)
    {size : ℕ} (sizePositive : 0 < size) :
    ContextReduction.{v}
      (product (activeWaiting (K := K) round parameters size).coefficient
        (activeOutputs (K := K) round size selected).coefficient)
      (advancedTensor (K := K) round parameters selected size).coefficient 1 := by
  have restored := (distributeProductsRestriction
    (fun batch : Pipeline.ActiveBatch batches round => (waiting (K := K) (parameters batch.val) size (phase round batch)).coefficient)
    (fun batch => (output (K := K) size (phase round batch) (selected batch)).coefficient)).context
  have steps (batch : Pipeline.ActiveBatch batches round) : ContextReduction.{v}
      (product (waiting (K := K) (parameters batch.val) size (phase round batch)).coefficient
        (output (K := K) size (phase round batch) (selected batch)).coefficient)
      (state (K := K) (Pipeline.completedBefore batch.val.val (round+1))
        (advance round parameters selected batch.val) size).coefficient 1 := by
    have changed := next_reduction (K := K) (Pipeline.activeStage round batch) (parameters batch.val) (selected batch) sizePositive
    have same : state (K := K) ((Pipeline.activeStage round batch).val+1)
        ((parameters batch.val).update (phase round batch) (selected batch)) size =
        state (Pipeline.completedBefore batch.val.val (round+1)) (advance round parameters selected batch.val) size := by
      rw [advance_active, (Pipeline.active_stage_states round batch).2]
    simpa only [one_mul] using changed.trans (FiniteTensor.equalRestriction same).context
  have combined := ContextReduction.heterogeneous (fun _ : Pipeline.ActiveBatch batches round => 1) steps
  simpa only [Finset.prod_const_one, one_mul] using restored.trans combined

/-- Inactive batches retain their complete original tensors throughout this round. -/
def inactiveRestriction (round : ℕ) (parameters : Parameters batches) (selected : Selected batches round) (size : ℕ) :
    CoordinateRestriction
      (heterogeneous (fun batch : {batch : Fin batches // ¬Pipeline.active round batch} =>
        (state (K := K) (Pipeline.completedBefore batch.val.val round) (parameters batch.val) size).coefficient))
      (heterogeneous (fun batch : {batch : Fin batches // ¬Pipeline.active round batch} =>
        (state (K := K) (Pipeline.completedBefore batch.val.val (round+1)) (advance round parameters selected batch.val) size).coefficient)) := by
  apply CoordinateRestriction.heterogeneous
  intro batch
  apply FiniteTensor.equalRestriction
  rw [advance_inactive round parameters selected batch.val batch.property,
    Pipeline.completed_waiting batch.val.val round batch.property]

end
end MatrixBounds.Numeric.SuppliedRounds
