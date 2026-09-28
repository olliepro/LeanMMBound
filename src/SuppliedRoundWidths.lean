import SuppliedBatchWidths
import PipelineActiveRates

/-! Forward tolerance selection follows the actual finite batch schedule.
An active batch records only its current phase's output; every other batch
and every earlier waiting tolerance remains unchanged. -/
namespace MatrixBounds.Numeric.SuppliedRounds

open Tensor SuppliedBatch SuppliedRationalStages
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {batches : ℕ}

/-- Every fixed original batch has its own independent complete width record. -/
abbrev Parameters (batches : ℕ) := Fin batches → Widths

/-- The actual supplied phase selected by an active batch in this shared round. -/
def phase (round : ℕ) (batch : Pipeline.ActiveBatch batches round) : Phase :=
  phaseAt (Pipeline.activeStage round batch)

/-- Newly chosen output widths for every active batch, retaining its own original label. -/
abbrev Selected (batches round : ℕ) := (batch : Pipeline.ActiveBatch batches round) → Width (phase round batch)

/-- Record the new widths exactly at the active phases of this round. -/
def advance (round : ℕ) (parameters : Parameters batches) (selected : Selected batches round) : Parameters batches :=
  fun batch => if present : Pipeline.active round batch then
    (parameters batch).update (phase round ⟨batch, present⟩) (selected ⟨batch, present⟩)
  else parameters batch

/-- Each active batch has precisely the update associated with its actual scheduled phase. -/
theorem advance_active (round : ℕ) (parameters : Parameters batches) (selected : Selected batches round)
    (batch : Pipeline.ActiveBatch batches round) :
    advance round parameters selected batch.val =
      (parameters batch.val).update (phase round batch) (selected batch) := by
  simp only [advance, dif_pos batch.property]

/-- Every inactive original batch keeps its entire width record unchanged. -/
theorem advance_inactive (round : ℕ) (parameters : Parameters batches) (selected : Selected batches round)
    (batch : Fin batches) (absent : ¬Pipeline.active round batch) :
    advance round parameters selected batch = parameters batch := by
  simp only [advance, dif_neg absent]

/-- Summing the rates of the actual labelled active phases yields exactly the proved schedule's round vector. -/
theorem active_rates (round : Fin (batches+2)) (rates : Fin 3 → Rates) :
    (∑ batch : Pipeline.ActiveBatch batches round.val, rates (Pipeline.activeStage round.val batch)) =
      Pipeline.roundRates batches round.val rates := by
  exact (Pipeline.roundRates_eq_active round rates).symm

end
end MatrixBounds.Numeric.SuppliedRounds
