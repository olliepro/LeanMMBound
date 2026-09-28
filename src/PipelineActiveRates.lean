import PipelineTensorSchedule
import PipelineScheduleRates

/-! Match the physical rates of actual labelled active batches to the rate
vectors used by the finite schedule accounting. -/
namespace MatrixBounds.Pipeline

open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p

/-- The sum over scheduled step labels equals the phase-by-phase round rate. -/
theorem roundRates_eq_steps {batches : ℕ} (round : Fin (batches+2)) (rates : Fin 3 → Rates) :
    roundRates batches round.val rates = ∑ step : StepsAt batches round, rates step.val.2 := by
  classical
  have transported := Equiv.sum_comp (phaseEquiv batches round)
    (fun phase : {phase : Fin 3 // phase.val ≤ round.val ∧ round.val-phase.val < batches} => rates phase.val)
  change (∑ phase : Fin 3, if phase.val ≤ round.val ∧ round.val-phase.val < batches then rates phase else 0) = _
  rw [← Finset.sum_filter]
  have subset := Finset.sum_subtype_eq_sum_filter (s := Finset.univ) rates
    (p := fun phase : Fin 3 => phase.val ≤ round.val ∧ round.val-phase.val < batches)
  rw [← subset]
  simpa only [Finset.subtype_univ, phaseEquiv, Equiv.coe_fn_mk] using transported.symm

/-- Each actual active batch contributes exactly its current phase's physical rate vector. -/
theorem roundRates_eq_active {batches : ℕ} (round : Fin (batches+2)) (rates : Fin 3 → Rates) :
    roundRates batches round.val rates =
      ∑ batch : ActiveBatch batches round.val, rates (activeStage round.val batch) := by
  rw [roundRates_eq_steps]
  exact (Equiv.sum_comp (activeStepEquiv round) (fun step : StepsAt batches round => rates step.val.2)).symm

end
end MatrixBounds.Pipeline
