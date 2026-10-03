module

public import BlockConcentration

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Independent finite sample spaces and perturbation of product probabilities. -/
namespace MatrixBounds.Sampling

open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p

/-- Event probabilities on a nonempty finite space lie in the unit interval. -/
theorem indicator_average_bounds {Outcome : Type*} [Fintype Outcome] [Nonempty Outcome]
    (event : Outcome → Prop) : 0 ≤ average (indicator event) ∧ average (indicator event) ≤ 1 := by
  constructor
  · rw [← average_const (Outcome := Outcome) 0]
    apply average_mono
    intro outcome
    simp only [indicator]
    split_ifs <;> norm_num
  · rw [← average_const (Outcome := Outcome) 1]
    apply average_mono
    intro outcome
    simp only [indicator]
    split_ifs <;> norm_num

/-- A conjunction of events on independent finite coordinates has product probability. -/
theorem independent_pi_event {Index : Type*} [Fintype Index]
    {Outcome : Index → Type*} [∀ i, Fintype (Outcome i)] (event : ∀ i, Outcome i → Prop) :
    average (indicator (fun outcome : ∀ i, Outcome i => ∀ i, event i (outcome i))) =
      ∏ i, average (indicator (event i)) := by
  let equiv : {outcome : ∀ i, Outcome i // ∀ i, event i (outcome i)} ≃
      (∀ i, {outcome : Outcome i // event i outcome}) := {
    toFun outcome i := ⟨outcome.val i, outcome.property i⟩
    invFun outcome := ⟨fun i => (outcome i).val, fun i => (outcome i).property⟩
    left_inv _ := rfl
    right_inv _ := rfl }
  simp only [average_indicator, Nat.card_congr equiv, Nat.card_eq_fintype_card,
    Fintype.card_pi, Nat.cast_prod, Finset.prod_div_distrib]

/-- Perturbing factors in the unit interval changes their product by at most the sum of errors. -/
theorem probability_product_bound {Index : Type*} [Fintype Index] (left right : Index → ℝ)
    (left_bounds : ∀ i, 0 ≤ left i ∧ left i ≤ 1) (right_bounds : ∀ i, 0 ≤ right i ∧ right i ≤ 1) :
    |(∏ i, left i) - ∏ i, right i| ≤ ∑ i, |left i-right i| := by
  classical
  have bound (indices : Finset Index) :
      |(∏ i ∈ indices, left i) - ∏ i ∈ indices, right i| ≤ ∑ i ∈ indices, |left i-right i| := by
    induction indices using Finset.induction_on with
    | empty => simp
    | @insert index rest absent induction =>
      simp only [Finset.prod_insert absent, Finset.sum_insert absent]
      have identity : left index * (∏ i ∈ rest, left i) - right index * (∏ i ∈ rest, right i) =
          left index * ((∏ i ∈ rest, left i) - ∏ i ∈ rest, right i) +
            (left index-right index) * (∏ i ∈ rest, right i) := by ring
      rw [identity]
      have right_nonneg : 0 ≤ ∏ i ∈ rest, right i := Finset.prod_nonneg (fun i _ => (right_bounds i).1)
      have right_bound : (∏ i ∈ rest, right i) ≤ 1 :=
        Finset.prod_le_one₀ (fun i _ => (right_bounds i).1) (fun i _ => (right_bounds i).2)
      calc
        _ ≤ |left index * ((∏ i ∈ rest, left i) - ∏ i ∈ rest, right i)| +
            |(left index-right index) * (∏ i ∈ rest, right i)| := abs_add_le _ _
        _ = left index * |(∏ i ∈ rest, left i) - ∏ i ∈ rest, right i| +
            |left index-right index| * (∏ i ∈ rest, right i) := by
          rw [abs_mul, abs_mul, abs_of_nonneg (left_bounds index).1, abs_of_nonneg right_nonneg]
        _ ≤ 1 * (∑ i ∈ rest, |left i-right i|) + |left index-right index| * 1 := by
          exact add_le_add (mul_le_mul (left_bounds index).2 induction (abs_nonneg _) (by norm_num))
            (mul_le_mul_of_nonneg_left right_bound (abs_nonneg _))
        _ = _ := by ring
  exact bound Finset.univ

/-- Summable coordinate errors control a conjunction over independent sample spaces. -/
theorem independent_pi_event_error {Index : Type*} [Fintype Index]
    {Outcome : Index → Type*} [∀ i, Fintype (Outcome i)] [∀ i, Nonempty (Outcome i)]
    (event : ∀ i, Outcome i → Prop) (center error : Index → ℝ)
    (center_bounds : ∀ i, 0 ≤ center i ∧ center i ≤ 1)
    (individual : ∀ i, |average (indicator (event i))-center i| ≤ error i) :
    |average (indicator (fun outcome : ∀ i, Outcome i => ∀ i, event i (outcome i))) -
      ∏ i, center i| ≤ ∑ i, error i := by
  rw [independent_pi_event]
  exact (probability_product_bound _ _ (fun i => indicator_average_bounds (event i)) center_bounds).trans
    (Finset.sum_le_sum (fun i _ => individual i))

end
end MatrixBounds.Sampling
