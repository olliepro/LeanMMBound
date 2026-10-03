module

public import SamplingBounds
public import Mathlib.Logic.Equiv.Prod

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Conditioning independent finite samples on distinctness quantifies the
difference between sampling with and without replacement. -/
namespace MatrixBounds.Sampling

open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p

/-- Conditioning on a nonempty part changes an event fraction by at most the excluded fraction. -/
theorem conditioning_fraction_bound {good bad goodHits badHits : ℝ}
    (good_positive : 0 < good) (bad_nonneg : 0 ≤ bad)
    (goodHits_nonneg : 0 ≤ goodHits) (goodHits_bound : goodHits ≤ good)
    (badHits_nonneg : 0 ≤ badHits) (badHits_bound : badHits ≤ bad) :
    |goodHits/good - (goodHits+badHits)/(good+bad)| ≤ bad/(good+bad) := by
  have total_positive : 0 < good+bad := by positivity
  have numerator_bound : |goodHits*bad-badHits*good| ≤ good*bad := by
    rw [abs_le]
    constructor <;> nlinarith [mul_nonneg goodHits_nonneg bad_nonneg,
      mul_nonneg badHits_nonneg good_positive.le,
      mul_le_mul_of_nonneg_right goodHits_bound bad_nonneg,
      mul_le_mul_of_nonneg_right badHits_bound good_positive.le]
  have identity : goodHits/good - (goodHits+badHits)/(good+bad) =
      (goodHits*bad-badHits*good)/(good*(good+bad)) := by
    field_simp [good_positive.ne', total_positive.ne']
    ring
  rw [identity, abs_div, abs_of_pos (mul_pos good_positive total_positive)]
  calc
    _ ≤ (good*bad)/(good*(good+bad)) := div_le_div_of_nonneg_right numerator_bound (by positivity)
    _ = _ := by field_simp [good_positive.ne', total_positive.ne']

/-- Exact event counts imply the conditioning bound on an arbitrary finite sample space. -/
theorem conditioning_event_bound {Outcome : Type*} [Fintype Outcome]
    (good event : Outcome → Prop) (nonempty : 0 < Nat.card {outcome // good outcome}) :
    |(Nat.card {outcome // good outcome ∧ event outcome} : ℝ) / Nat.card {outcome // good outcome} -
      (Nat.card {outcome // event outcome} : ℝ) / Fintype.card Outcome| ≤
      (Nat.card {outcome // ¬good outcome} : ℝ) / Fintype.card Outcome := by
  classical
  have partition : Nat.card {outcome // event outcome} =
      Nat.card {outcome // good outcome ∧ event outcome} +
      Nat.card {outcome // ¬good outcome ∧ event outcome} := by
    simpa only [and_comm, Nat.add_comm] using Selection.event_partition event good
  have total : Fintype.card Outcome = Nat.card {outcome // good outcome} +
      Nat.card {outcome // ¬good outcome} := by
    simp only [Nat.card_eq_fintype_card, Fintype.card_subtype_compl]
    have bound := Fintype.card_subtype_le good
    omega
  have hg := Fintype.card_subtype_mono (fun outcome => good outcome ∧ event outcome)
    good (fun _ h => h.1)
  have hb := Fintype.card_subtype_mono (fun outcome => ¬good outcome ∧ event outcome)
    (fun outcome => ¬good outcome) (fun _ h => h.1)
  rw [partition, total, Nat.cast_add, Nat.cast_add]
  apply conditioning_fraction_bound
  · exact_mod_cast nonempty
  · positivity
  · positivity
  · simp only [Nat.card_eq_fintype_card]
    exact_mod_cast hg
  · positivity
  · simp only [Nat.card_eq_fintype_card]
    exact_mod_cast hb

/-- Tuples with equal entries at two specified slots are determined by deleting one slot. -/
def equalSlotsEquiv {Index Position : Type*} [DecidableEq Index]
    (left right : Index) (different : left ≠ right) :
    {tuple : Index → Position // tuple left = tuple right} ≃
      ({slot : Index // slot ≠ right} → Position) where
  toFun tuple slot := tuple.val slot.val
  invFun remaining := ⟨fun slot => if same : slot = right then remaining ⟨left, different⟩
    else remaining ⟨slot, same⟩, by simp [different]⟩
  left_inv tuple := by
    apply Subtype.ext
    funext slot
    dsimp
    split_ifs with same
    · subst slot
      exact tuple.property
    · rfl
  right_inv remaining := by
    funext slot
    simp only [dif_neg slot.property]

/-- One collision among independent coordinates occurs in exactly N^(k-1) tuples. -/
theorem equal_slots_count {Index Position : Type*} [Fintype Index] [Fintype Position]
    [DecidableEq Index] (left right : Index) (different : left ≠ right) :
    Nat.card {tuple : Index → Position // tuple left = tuple right} =
      Fintype.card Position ^ (Fintype.card Index - 1) := by
  rw [Nat.card_congr (equalSlotsEquiv (Position := Position) left right different)]
  simp only [Nat.card_eq_fintype_card, Fintype.card_fun, Fintype.card_subtype_compl,
    Fintype.card_subtype_eq]

/-- A union bound controls all collisions among a fixed finite collection of sampled slots. -/
theorem noninjective_count {Index Position : Type*} [Fintype Index] [Fintype Position]
    [DecidableEq Index] :
    Nat.card {tuple : Index → Position // ¬Function.Injective tuple} ≤
      Fintype.card Index ^ 2 * Fintype.card Position ^ (Fintype.card Index - 1) := by
  classical
  let bad : (Index × Index) → (Index → Position) → Prop :=
    fun pair tuple => pair.1 ≠ pair.2 ∧ tuple pair.1 = tuple pair.2
  have event (tuple : Index → Position) : ¬Function.Injective tuple ↔ ∃ pair, bad pair tuple := by
    simp only [Function.Injective, not_forall, bad, Prod.exists]
    constructor
    · rintro ⟨i, j, equal, different⟩
      exact ⟨i, j, different, equal⟩
    · rintro ⟨i, j, different, equal⟩
      exact ⟨i, j, equal, different⟩
  let event_equiv : {tuple : Index → Position // ¬Function.Injective tuple} ≃
      {tuple : Index → Position // ∃ pair, bad pair tuple} :=
    Equiv.subtypeEquiv (Equiv.refl (Index → Position)) event
  have event_count := Nat.card_congr event_equiv
  have per_pair (pair : Index × Index) : Nat.card {tuple // bad pair tuple} ≤
      Fintype.card Position ^ (Fintype.card Index - 1) := by
    by_cases different : pair.1 ≠ pair.2
    · simpa [bad, different] using
        (equal_slots_count (Position := Position) pair.1 pair.2 different).le
    · simp [bad, different]
  calc
    _ = Nat.card {tuple : Index → Position // ∃ pair, bad pair tuple} := event_count
    _ ≤ ∑ pair, Nat.card {tuple // bad pair tuple} := Selection.union_count bad
    _ ≤ ∑ _pair : Index × Index, Fintype.card Position ^ (Fintype.card Index - 1) :=
      Finset.sum_le_sum (fun pair _ => per_pair pair)
    _ = _ := by simp only [Finset.sum_const, Finset.card_univ, Fintype.card_prod, smul_eq_mul, pow_two]

/-- The fraction of colliding independent tuples is at most k^2/N. -/
theorem noninjective_probability {Index Position : Type*} [Fintype Index] [Fintype Position]
    [Nonempty Index] [Nonempty Position] [DecidableEq Index] :
    (Nat.card {tuple : Index → Position // ¬Function.Injective tuple} : ℝ) /
        Fintype.card (Index → Position) ≤ (Fintype.card Index : ℝ)^2 / Fintype.card Position := by
  have index_positive : 0 < Fintype.card Index := Fintype.card_pos
  have position_positive : (0 : ℝ) < Fintype.card Position := by exact_mod_cast Fintype.card_pos
  have tuples_positive : (0 : ℝ) < Fintype.card (Index → Position) := by exact_mod_cast Fintype.card_pos
  have power_identity : Fintype.card Position ^ (Fintype.card Index - 1) * Fintype.card Position =
      Fintype.card Position ^ Fintype.card Index := by
    rw [← pow_succ, Nat.sub_add_cancel index_positive]
  have scaled := Nat.mul_le_mul_right (Fintype.card Position)
    (noninjective_count (Index := Index) (Position := Position))
  rw [Nat.mul_assoc, power_identity, ← Fintype.card_fun] at scaled
  apply (div_le_div_iff₀ tuples_positive position_positive).mpr
  exact_mod_cast scaled

/-- Conditioning independent slots on distinctness changes any event probability by at most k^2/N. -/
theorem without_replacement_event_bound {Index Position : Type*}
    [Fintype Index] [Fintype Position] [Nonempty Index] [Nonempty Position] [DecidableEq Index]
    (event : (Index → Position) → Prop)
    (feasible : 0 < Nat.card {tuple : Index → Position // Function.Injective tuple}) :
    |(Nat.card {tuple : Index → Position // Function.Injective tuple ∧ event tuple} : ℝ) /
        Nat.card {tuple : Index → Position // Function.Injective tuple} -
      (Nat.card {tuple : Index → Position // event tuple} : ℝ) / Fintype.card (Index → Position)| ≤
        (Fintype.card Index : ℝ)^2 / Fintype.card Position :=
  (conditioning_event_bound Function.Injective event feasible).trans noninjective_probability

end
end MatrixBounds.Sampling
