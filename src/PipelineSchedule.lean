module

public import MatrixBounds
public import Mathlib.Algebra.BigOperators.Fin

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! A finite three-stage pipeline labels every batch and stage explicitly.
The schedule visits every labelled stage once and records each batch's exact
state before and after every shared round, including startup and draining. -/
namespace MatrixBounds.Pipeline

open scoped BigOperators
noncomputable section

/-- One of three extraction stages belonging to one fixed source batch. -/
abbrev Step (batches : ℕ) := Fin batches × Fin 3

/-- Batch b performs stage s during shared round b+s, with rounds numbered from zero. -/
def scheduledRound {batches : ℕ} (step : Step batches) : Fin (batches+2) :=
  ⟨step.1.val+step.2.val, by have := step.1.isLt; have := step.2.isLt; omega⟩

/-- The separately labelled extraction steps active during one shared round. -/
abbrev StepsAt (batches : ℕ) (round : Fin (batches+2)) :=
  {step : Step batches // scheduledRound step = round}

/-- Grouping stages by scheduled round preserves each batch-stage label exactly once. -/
def schedulePlacement (batches : ℕ) : ((round : Fin (batches+2)) × StepsAt batches round) ≃ Step batches where
  toFun index := index.2.val
  invFun step := ⟨scheduledRound step, ⟨step, rfl⟩⟩
  left_inv index := by
    rcases index with ⟨round, step, same⟩
    cases same
    rfl
  right_inv _ := rfl

/-- The finite schedule contains exactly three steps for every source batch. -/
theorem total_steps (batches : ℕ) :
    (∑ round, Fintype.card (StepsAt batches round)) = 3*batches := by
  have count := Fintype.card_congr (schedulePlacement batches)
  simpa only [Fintype.card_sigma, Fintype.card_prod, Fintype.card_fin, Nat.mul_comm batches 3] using count

/-- Number of stages completed by a batch immediately before a shared round. -/
def completedBefore (batch round : ℕ) : ℕ := min 3 (round-batch)

/-- No extraction stage has run before the initial round. -/
theorem completed_initial (batch : ℕ) : completedBefore batch 0 = 0 := by simp [completedBefore]

/-- All three stages of every batch have completed after the final drain round. -/
theorem completed_final {batches : ℕ} (batch : Fin batches) : completedBefore batch.val (batches+2) = 3 := by
  have := batch.isLt
  unfold completedBefore
  omega

/-- At its unique scheduled round, a labelled stage is precisely the next stage of its batch. -/
theorem completed_at_step {batches : ℕ} (step : Step batches) :
    completedBefore step.1.val (scheduledRound step).val = step.2.val ∧
      completedBefore step.1.val ((scheduledRound step).val+1) = step.2.val+1 := by
  have := step.2.isLt
  simp only [scheduledRound, completedBefore]
  omega

/-- A batch outside its three active rounds keeps the same stage state. -/
theorem completed_waiting (batch round : ℕ) (inactive : ¬(batch ≤ round ∧ round < batch+3)) :
    completedBefore batch (round+1) = completedBefore batch round := by
  unfold completedBefore
  omega

/-- Exactly the phases whose matching batch is in range occur in a given round. -/
def phaseEquiv (batches : ℕ) (round : Fin (batches+2)) :
    StepsAt batches round ≃ {phase : Fin 3 // phase.val ≤ round.val ∧ round.val-phase.val < batches} where
  toFun step := ⟨step.val.2, by
    have same : step.val.1.val+step.val.2.val = round.val := congrArg Fin.val step.property
    have := step.val.1.isLt
    omega⟩
  invFun phase := ⟨(⟨round.val-phase.val.val, phase.property.2⟩, phase.val), by
    apply Fin.ext
    simp only [scheduledRound]
    have := phase.property.1
    omega⟩
  left_inv step := by
    apply Subtype.ext
    apply Prod.ext
    · apply Fin.ext
      have same : step.val.1.val+step.val.2.val = round.val := congrArg Fin.val step.property
      simp only
      omega
    · rfl
  right_inv _ := rfl

/-- The physical three-axis rate vector for a shared round, before taking its single bottleneck. -/
def roundRates (batches round : ℕ) (rates : Fin 3 → Rates) : Rates :=
  ∑ phase : Fin 3, if phase.val ≤ round ∧ round-phase.val < batches then rates phase else 0

/-- The first warm-up round contains precisely level four. -/
theorem roundRates_first {batches : ℕ} (positive : 0 < batches) (rates : Fin 3 → Rates) :
    roundRates batches 0 rates = rates 0 := by
  simp [roundRates, positive]

/-- The second warm-up round contains levels four and three. -/
theorem roundRates_second {batches : ℕ} (large : 2 ≤ batches) (rates : Fin 3 → Rates) :
    roundRates batches 1 rates = rates 0+rates 1 := by
  have first : 1 < batches := by omega
  have second : 0 < batches := by omega
  simp [roundRates, Fin.sum_univ_succ, first, second]

/-- Every interior round contains each of the three levels exactly once. -/
theorem roundRates_steady {batches round : ℕ} (lower : 2 ≤ round) (upper : round < batches)
    (rates : Fin 3 → Rates) : roundRates batches round rates = rates 0+rates 1+rates 2 := by
  have one : 1 ≤ round := by omega
  have tailOne : round-1 < batches := by omega
  have tailTwo : round-2 < batches := by omega
  simp [roundRates, Fin.sum_univ_succ, lower, upper, one, tailOne, tailTwo, add_assoc]

/-- The first drain round contains levels three and two. -/
theorem roundRates_drain {batches : ℕ} (large : 2 ≤ batches) (rates : Fin 3 → Rates) :
    roundRates batches batches rates = rates 1+rates 2 := by
  have one : 1 ≤ batches := by omega
  have positive : 0 < batches := by omega
  simp [roundRates, Fin.sum_univ_succ, large, one, positive]

/-- The final drain round contains precisely level two. -/
theorem roundRates_last {batches : ℕ} (positive : 0 < batches) (rates : Fin 3 → Rates) :
    roundRates batches (batches+1) rates = rates 2 := by
  have one : 1 ≤ batches := by omega
  simp [roundRates, Fin.sum_univ_succ, one, positive]

end
end MatrixBounds.Pipeline
