module

public import PipelineSchedule
public import HeterogeneousPartition
public import ContextProductReductions
public import ContextSequence

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! The finite pipeline acts on actual labelled tensor products. Every round
extracts its active product while preserving all other batch factors. -/
namespace MatrixBounds.Pipeline

universe v
open Tensor Interface
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {K : Type*} [CommSemiring K] {batches : ℕ}
variable {X Y Z : Fin batches → ℕ → Type}

/-- A batch is active precisely during its three assigned extraction rounds. -/
def active (round : ℕ) (batch : Fin batches) : Prop := batch.val ≤ round ∧ round < batch.val+3

/-- The separately labelled batches whose next stage is executed in one shared round. -/
abbrev ActiveBatch (batches round : ℕ) := {batch : Fin batches // active round batch}

/-- The unique stage executed by an active batch during this round. -/
def activeStage (round : ℕ) (batch : ActiveBatch batches round) : Fin 3 :=
  ⟨round-batch.val.val, by have := batch.property; unfold active at this; omega⟩

/-- Active batches advance from the designated stage to its successor exactly once. -/
theorem active_stage_states (round : ℕ) (batch : ActiveBatch batches round) :
    completedBefore batch.val.val round = (activeStage round batch).val ∧
      completedBefore batch.val.val (round+1) = (activeStage round batch).val+1 := by
  have := batch.property
  unfold active at this
  simp only [completedBefore, activeStage]
  omega

/-- Active batch labels are in bijection with the batch-stage labels assigned to this round. -/
def activeStepEquiv (round : Fin (batches+2)) : ActiveBatch batches round.val ≃ StepsAt batches round where
  toFun batch := ⟨(batch.val, activeStage round.val batch), by
    apply Fin.ext
    have := batch.property
    unfold active at this
    simp only [scheduledRound, activeStage]
    omega⟩
  invFun step := ⟨step.val.1, by
    have equal : step.val.1.val+step.val.2.val = round.val := congrArg Fin.val step.property
    have := step.val.2.isLt
    unfold active
    omega⟩
  left_inv _ := rfl
  right_inv step := by
    apply Subtype.ext
    apply Prod.ext
    · rfl
    · apply Fin.ext
      have equal : step.val.1.val+step.val.2.val = round.val := congrArg Fin.val step.property
      simp only [activeStage]
      omega

/-- The complete state of every source batch immediately before a shared round. -/
def roundTensor (tensors : ∀ batch state, Coeff K (X batch state) (Y batch state) (Z batch state))
    (round : ℕ) := heterogeneous (fun batch => tensors batch (completedBefore batch.val round))

/-- The active part of the current tensor product, retaining each original batch label. -/
def activeTensor (tensors : ∀ batch state, Coeff K (X batch state) (Y batch state) (Z batch state))
    (round : ℕ) := heterogeneous (fun batch : ActiveBatch batches round =>
      tensors batch.val (completedBefore batch.val.val round))

/-- The active factors immediately after this round's shared extraction. -/
def advancedTensor (tensors : ∀ batch state, Coeff K (X batch state) (Y batch state) (Z batch state))
    (round : ℕ) := heterogeneous (fun batch : ActiveBatch batches round =>
      tensors batch.val (completedBefore batch.val.val (round+1)))

/-- Every inactive batch has exactly the same tensor before and after this round. -/
def waitingRestriction (tensors : ∀ batch state, Coeff K (X batch state) (Y batch state) (Z batch state))
    (round : ℕ) : CoordinateRestriction
      (heterogeneous (fun batch : {batch : Fin batches // ¬active round batch} =>
        tensors batch.val (completedBefore batch.val.val round)))
      (heterogeneous (fun batch : {batch : Fin batches // ¬active round batch} =>
        tensors batch.val (completedBefore batch.val.val (round+1)))) := by
  apply CoordinateRestriction.heterogeneous
  intro batch
  have same := completed_waiting batch.val.val round batch.property
  rw [same]
  exact CoordinateRestriction.refl _

/-- A shared active extraction extends to the entire scheduled round, keeping every waiting factor inside every new copy. -/
theorem round_extraction
    [∀ batch state, Fintype (X batch state)] [∀ batch state, Fintype (Y batch state)]
    [∀ batch state, Fintype (Z batch state)]
    (tensors : ∀ batch state, Coeff K (X batch state) (Y batch state) (Z batch state))
    (round copies cost : ℕ)
    (extraction : ContextReduction.{v} (activeTensor tensors round)
      (directSum (fun _ : Fin copies => advancedTensor tensors round)) cost) :
    ContextReduction.{v} (roundTensor tensors round)
      (directSum (fun _ : Fin copies => roundTensor tensors (round+1))) cost := by
  classical
  let waiting := heterogeneous (fun batch : {batch : Fin batches // ¬active round batch} =>
    tensors batch.val (completedBefore batch.val.val round))
  have split := (partitionRestriction (active round)
    (fun batch => tensors batch (completedBefore batch.val round))).context
  have swapped := split.trans (productSwapRestriction (activeTensor tensors round) waiting).context
  have extracted := swapped.trans (extraction.extract_with_waiting waiting)
  have restored := ((productSwapRestriction waiting (advancedTensor tensors round)).trans
    ((CoordinateRestriction.refl (advancedTensor tensors round)).product (waitingRestriction tensors round))).trans
      (restorePartitionRestriction (active round) (fun batch => tensors batch (completedBefore batch.val (round+1))))
  simpa only [one_mul, mul_one] using! extracted.trans (restored.context.batch (I := Fin copies))

/-- Every scheduled shared extraction composes into the complete pipeline with all integer copy counts and costs multiplied. -/
theorem pipeline_extraction
    [∀ batch state, Fintype (X batch state)] [∀ batch state, Fintype (Y batch state)]
    [∀ batch state, Fintype (Z batch state)]
    (tensors : ∀ batch state, Coeff K (X batch state) (Y batch state) (Z batch state))
    (copies cost : ℕ → ℕ)
    (extractions : ∀ round, round < batches+2 → ContextReduction.{v} (activeTensor tensors round)
      (directSum (fun _ : Fin (copies round) => advancedTensor tensors round)) (cost round)) :
    ContextReduction.{v} (roundTensor tensors 0)
      (directSum (fun _ : Fin (∏ round ∈ Finset.range (batches+2), copies round) =>
        roundTensor tensors (batches+2))) (∏ round ∈ Finset.range (batches+2), cost round) :=
  contextReduction_sequence (roundTensor tensors) copies cost (batches+2)
    (fun round inside => round_extraction tensors round _ _ (extractions round inside))

end
end MatrixBounds.Pipeline
