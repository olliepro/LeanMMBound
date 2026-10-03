module

public import FiniteCover
public import MatrixBounds
public import Mathlib.Tactic.Linarith

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Finite union, Markov, and averaging bounds for selecting many sparse-hole
tensor copies. All quantities are integer counts; no independence is assumed. -/
namespace MatrixBounds.Selection

open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {Outcome Edge : Type*} [Fintype Outcome] [Fintype Edge]

omit [Fintype Edge] in
/-- Event cardinality is the sum of its zero-one indicator over the finite sample space. -/
theorem count_as_sum (event : Outcome → Prop) :
    Nat.card {outcome // event outcome} = ∑ outcome, if event outcome then (1 : ℕ) else 0 := by
  classical
  simp [Nat.card_eq_fintype_card, Fintype.card_subtype]

/-- The number of outcomes hitting at least one event is at most the sum of event counts. -/
theorem union_count (bad : Edge → Outcome → Prop) :
    Nat.card {outcome // ∃ edge, bad edge outcome} ≤
      ∑ edge, Nat.card {outcome // bad edge outcome} := by
  classical
  have pointwise (outcome : Outcome) :
      (if ∃ edge, bad edge outcome then (1 : ℕ) else 0) ≤
        ∑ edge, if bad edge outcome then 1 else 0 := by
    split_ifs with existsBad
    · obtain ⟨edge, present⟩ := existsBad
      have bound := Finset.single_le_sum (f := fun e => if bad e outcome then (1 : ℕ) else 0)
        (fun _ _ => Nat.zero_le _) (Finset.mem_univ edge)
      simpa only [if_pos present] using bound
    · exact Nat.zero_le _
  have bound := Finset.sum_le_sum (s := Finset.univ) (fun outcome _ => pointwise outcome)
  rw [Finset.sum_comm] at bound
  simpa only [Finset.sum_boole, Nat.cast_id, Nat.card_eq_fintype_card,
    Fintype.card_subtype] using bound

omit [Fintype Edge] in
/-- Integer Markov inequality: each outcome above a threshold contributes at least that much. -/
theorem markov_count (loss : Outcome → ℕ) (threshold : ℕ) :
    Nat.card {outcome // threshold ≤ loss outcome} * threshold ≤ ∑ outcome, loss outcome := by
  classical
  have pointwise (outcome : Outcome) :
      (if threshold ≤ loss outcome then 1 else 0) * threshold ≤ loss outcome := by
    split_ifs with large
    · simpa using large
    · simp
  have bound := Finset.sum_le_sum (s := Finset.univ) (fun outcome _ => pointwise outcome)
  simpa only [← Finset.sum_mul, Finset.sum_boole, Nat.cast_id, Nat.card_eq_fintype_card,
    Fintype.card_subtype] using bound

omit [Fintype Edge] in
/-- A surviving event partitions into acceptable and rejected outcomes. -/
theorem event_partition (survives bad : Outcome → Prop) :
    Nat.card {outcome // survives outcome} =
      Nat.card {outcome // survives outcome ∧ ¬ bad outcome} +
      Nat.card {outcome // survives outcome ∧ bad outcome} := by
  classical
  have pointwise (outcome : Outcome) : (if survives outcome then (1 : ℕ) else 0) =
      (if survives outcome ∧ ¬ bad outcome then 1 else 0) +
        (if survives outcome ∧ bad outcome then 1 else 0) := by
    by_cases hs : survives outcome <;> by_cases hb : bad outcome <;> simp [hs, hb]
  have bound := Finset.sum_congr (s₁ := Finset.univ) rfl (fun outcome _ => pointwise outcome)
  simpa only [Finset.sum_add_distrib, Finset.sum_boole, Nat.cast_id,
    Nat.card_eq_fintype_card, Fintype.card_subtype] using bound

/-- Uniform per-edge survival and loss bounds yield one seed with many acceptable edges.
The result uses only marginal event counts, so deletions at earlier stages may be correlated. -/
theorem exists_many_good [Nonempty Outcome]
    (survives bad : Outcome → Edge → Prop) (survival loss target : ℕ)
    (survival_count : ∀ edge, survival ≤ Nat.card {outcome // survives outcome edge})
    (loss_count : ∀ edge, Nat.card {outcome // survives outcome edge ∧ bad outcome edge} ≤ loss)
    (budget : Fintype.card Outcome * target + Fintype.card Edge * loss ≤
      Fintype.card Edge * survival) :
    ∃ outcome, target ≤ Nat.card {edge // survives outcome edge ∧ ¬ bad outcome edge} := by
  classical
  have local_bound (edge : Edge) : survival ≤
      Nat.card {outcome // survives outcome edge ∧ ¬ bad outcome edge} + loss := by
    have partition := event_partition (fun outcome => survives outcome edge) (fun outcome => bad outcome edge)
    have lower := survival_count edge
    have upper := loss_count edge
    omega
  have total := Finset.sum_le_sum (s := Finset.univ) (fun edge _ => local_bound edge)
  simp only [Finset.sum_add_distrib, Finset.sum_const, Finset.card_univ, smul_eq_mul,
    count_as_sum] at total
  rw [Finset.sum_comm] at total
  by_contra noGood
  push_neg at noGood
  have strictly_small := Finset.sum_lt_sum_of_nonempty (s := Finset.univ)
    Finset.univ_nonempty (fun outcome _ => noGood outcome)
  simp only [count_as_sum,
    Finset.sum_const, Finset.card_univ, smul_eq_mul] at strictly_small
  omega

end
end MatrixBounds.Selection
