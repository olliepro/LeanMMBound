module

public import EmpiricalTypes
public import FiniteSelection

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Sampling coordinates of exact empirical types. Coordinate permutation
symmetry supplies the finite counting identities behind sampling without replacement. -/
namespace MatrixBounds.Empirical

open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {P B : Type*} [Fintype P] [Fintype B] [DecidableEq P]

omit [Fintype P] [Fintype B] in
/-- Any ordered pair of distinct positions can be carried to any other by two swaps. -/
theorem two_positions_permutation (p q r s : P) (source_distinct : p ≠ q)
    (target_distinct : r ≠ s) : ∃ permutation : Equiv.Perm P,
      permutation p = r ∧ permutation q = s := by
  let first := Equiv.swap p r
  have moved_distinct : first q ≠ r := by
    intro same
    have : first q = first p := same.trans (Equiv.swap_apply_left p r).symm
    exact source_distinct (first.injective this).symm
  refine ⟨first.trans (Equiv.swap s (first q)), ?_, ?_⟩
  · change Equiv.swap s (first q) (first p) = r
    rw [show first p = r from Equiv.swap_apply_left p r]
    exact Equiv.swap_apply_of_ne_of_ne target_distinct moved_distinct.symm
  · exact Equiv.swap_apply_right s (first q)

omit [Fintype P] [Fintype B] in
/-- Fixed pair events in an exact type have the same count at all distinct position pairs. -/
theorem pair_event_count_constant (profile : B → ℕ) (a b : B) (p q r s : P)
    (source_distinct : p ≠ q) (target_distinct : r ≠ s) :
    Nat.card {word : TypedWord (P := P) profile // word.val p = a ∧ word.val q = b} =
      Nat.card {word : TypedWord (P := P) profile // word.val r = a ∧ word.val s = b} := by
  obtain ⟨permutation, hp, hq⟩ := two_positions_permutation p q r s source_distinct target_distinct
  let equiv : TypedWord (P := P) profile ≃ TypedWord (P := P) profile := MulAction.toPerm permutation
  apply Nat.card_congr (Equiv.subtypeEquiv equiv ?_)
  intro word
  change (word.val p = a ∧ word.val q = b) ↔
    (word.val (permutation.symm r) = a ∧ word.val (permutation.symm s) = b)
  rw [← hp, ← hq, Equiv.symm_apply_apply, Equiv.symm_apply_apply]

omit [Fintype B] [DecidableEq P] in
/-- The number of coordinates with a symbol is the sum of its indicator. -/
theorem count_eq_sum (word : P → B) (symbol : B) :
    count word symbol = ∑ p, if word p = symbol then (1 : ℕ) else 0 :=
  Selection.count_as_sum _

omit [Fintype B] [DecidableEq P] in
/-- Count ordered samples with replacement by multiplying the two symbol counts. -/
theorem pair_with_replacement (word : P → B) (a b : B) :
    (∑ p, ∑ q, if word p = a ∧ word q = b then (1 : ℕ) else 0) =
      count word a * count word b := by
  rw [count_eq_sum, count_eq_sum, Finset.sum_mul]
  apply Finset.sum_congr rfl
  intro p _
  rw [Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro q _
  by_cases ha : word p = a <;> by_cases hb : word q = b <;> simp [ha, hb]

omit [Fintype B] in
/-- The diagonal samples contribute one symbol count when the requested symbols coincide. -/
theorem pair_diagonal_count (word : P → B) (a b : B) :
    (∑ p, ∑ q, if p = q ∧ word p = a ∧ word q = b then (1 : ℕ) else 0) =
      if a = b then count word a else 0 := by
  simp only [ite_and, Finset.sum_ite_eq, Finset.mem_univ, if_true]
  by_cases same : a = b
  · subst b
    rw [if_pos rfl, count_eq_sum]
    apply Finset.sum_congr rfl
    intro p _
    by_cases present : word p = a <;> simp [present]
  · have vanishes (p : P) : (if word p = a then if word p = b then (1 : ℕ) else 0 else 0) = 0 := by
      by_cases ha : word p = a <;> by_cases hb : word p = b <;> simp_all
    simp only [vanishes, Finset.sum_const_zero, if_neg same]

omit [Fintype B] in
/-- The exact without-replacement pair count, written without truncated subtraction. -/
theorem pair_without_replacement (word : P → B) (a b : B) :
    (∑ p, ∑ q, if p ≠ q ∧ word p = a ∧ word q = b then (1 : ℕ) else 0) +
      (if a = b then count word a else 0) = count word a * count word b := by
  rw [← pair_diagonal_count word a b, ← pair_with_replacement word a b,
    ← Finset.sum_add_distrib]
  apply Finset.sum_congr rfl
  intro p _
  rw [← Finset.sum_add_distrib]
  apply Finset.sum_congr rfl
  intro q _
  by_cases same : p = q <;> simp [same]

/-- Exact pair-sampling identity for a uniform word of a prescribed type.
The diagonal correction is zero for different symbols and profile(a) for equal symbols. -/
theorem type_pair_sampling_identity (profile : B → ℕ) (a b : B) (p q : P) (distinct : p ≠ q) :
    Fintype.card P * (Fintype.card P - 1) *
        Nat.card {word : TypedWord (P := P) profile // word.val p = a ∧ word.val q = b} +
      Fintype.card (TypedWord (P := P) profile) * (if a = b then profile a else 0) =
      Fintype.card (TypedWord (P := P) profile) * (profile a * profile b) := by
  classical
  let pairs := Nat.card {word : TypedWord (P := P) profile // word.val p = a ∧ word.val q = b}
  have uniform (r s : P) :
      (∑ word : TypedWord (P := P) profile,
        if r ≠ s ∧ word.val r = a ∧ word.val s = b then (1 : ℕ) else 0) =
      if r ≠ s then pairs else 0 := by
    by_cases different : r ≠ s
    · simpa [different, Selection.count_as_sum, pairs, Fintype.card_subtype] using
        pair_event_count_constant profile a b r s p q different distinct
    · simp [different]
  have row (r : P) : (∑ s, if r ≠ s then pairs else 0) = (Fintype.card P - 1) * pairs := by
    have excluded : (Finset.univ.filter (fun s => r ≠ s)) = Finset.univ.erase r := by
      ext s
      simp [ne_comm]
    rw [Finset.sum_ite]
    simp only [excluded, Finset.sum_const, mul_zero, add_zero,
      Finset.card_erase_of_mem (Finset.mem_univ r), Finset.card_univ, smul_eq_mul]
  have counted : (∑ word : TypedWord (P := P) profile, ∑ r, ∑ s,
      if r ≠ s ∧ word.val r = a ∧ word.val s = b then (1 : ℕ) else 0) =
        Fintype.card P * (Fintype.card P - 1) * pairs := by
    rw [Finset.sum_comm]
    conv_lhs =>
      arg 2
      ext r
      rw [Finset.sum_comm]
    simp only [uniform, row, Finset.sum_const, Finset.card_univ, smul_eq_mul, Nat.mul_assoc]
  have local_identity (word : TypedWord (P := P) profile) :=
    pair_without_replacement word.val a b
  have summed := Finset.sum_congr (s₁ := Finset.univ) rfl (fun word _ => local_identity word)
  simp only [Finset.sum_add_distrib, counted] at summed
  simpa only [pairs, (fun word : TypedWord (P := P) profile => word.property a),
    (fun word : TypedWord (P := P) profile => word.property b),
    Finset.sum_const, Finset.card_univ, smul_eq_mul] using summed

/-- Uniform exact-type pair probabilities have the usual without-replacement correction. -/
theorem type_pair_probability (profile : B → ℕ) [Nonempty (TypedWord (P := P) profile)]
    (a b : B) (p q : P) (distinct : p ≠ q) :
    (Nat.card {word : TypedWord (P := P) profile // word.val p = a ∧ word.val q = b} : ℝ) /
        Fintype.card (TypedWord (P := P) profile) =
      ((profile a : ℝ) * profile b - if a = b then (profile a : ℝ) else 0) /
        ((Fintype.card P : ℝ) * (Fintype.card P - 1)) := by
  have large : 1 < Fintype.card P := Fintype.one_lt_card_iff.mpr ⟨p, q, distinct⟩
  have count_positive : (0 : ℝ) < Fintype.card (TypedWord (P := P) profile) := by
    exact_mod_cast Fintype.card_pos
  have positions_positive : (1 : ℝ) < Fintype.card P := by exact_mod_cast large
  have casted := congrArg (fun n : ℕ => (n : ℝ)) (type_pair_sampling_identity profile a b p q distinct)
  push_cast at casted
  rw [Nat.cast_sub (by omega : 1 ≤ Fintype.card P), Nat.cast_one] at casted
  apply (div_eq_div_iff count_positive.ne' (mul_pos (by positivity)
    (by linarith : (0 : ℝ) < Fintype.card P - 1)).ne').mpr
  by_cases same : a = b <;> simp only [same, if_true, if_false] at * <;> nlinarith

end
end MatrixBounds.Empirical
