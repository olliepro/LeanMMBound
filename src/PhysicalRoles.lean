import TensorOrientations
import Mathlib.Data.Fintype.Perm

/-! The sixfold role bookkeeping is an exact permutation bijection. Every
original strategy appears once in each fixed physical region. -/
namespace MatrixBounds.Tensor.AxisOrder

open scoped BigOperators
noncomputable section

/-- Read each physical output-axis position as its original input-axis position. -/
def permutation : AxisOrder → Equiv.Perm (Fin 3)
  | xyz => Equiv.refl _
  | xzy => Equiv.swap 1 2
  | yxz => Equiv.swap 0 1
  | yzx => Equiv.swap 0 1 * Equiv.swap 1 2
  | zxy => Equiv.swap 1 2 * Equiv.swap 0 1
  | zyx => Equiv.swap 0 2

/-- The physical-order list enumerates every permutation exactly once. -/
theorem permutation_bijective : Function.Bijective permutation := by decide

/-- Explicit physical order labels and permutations identify the same six-element set. -/
def permutationEquiv : AxisOrder ≃ Equiv.Perm (Fin 3) := Equiv.ofBijective permutation permutation_bijective

/-- The source ordering placing an original strategy in a fixed physical region. -/
def sourceOrder (physical strategy : AxisOrder) : AxisOrder :=
  permutationEquiv.symm (permutation physical*(permutation strategy)⁻¹)

/-- The selected source and strategy really compose to the specified physical region. -/
theorem sourceOrder_composes (physical strategy : AxisOrder) :
    permutation (sourceOrder physical strategy)*permutation strategy = permutation physical := by
  change permutationEquiv (permutationEquiv.symm _)*_ = _
  rw [Equiv.apply_symm_apply, inv_mul_cancel_right]

/-- No second source ordering assigns the same strategy to the same physical region. -/
theorem sourceOrder_unique (physical strategy source : AxisOrder)
    (assigned : permutation source*permutation strategy = permutation physical) : source = sourceOrder physical strategy := by
  apply permutation_bijective.injective
  have selected := sourceOrder_composes physical strategy
  exact mul_right_cancel (assigned.trans selected.symm)

/-- As strategies vary, their required source copies also range over all six copies exactly once. -/
def sourceOrderEquiv (physical : AxisOrder) : AxisOrder ≃ AxisOrder :=
  permutationEquiv.trans ((Equiv.inv (Equiv.Perm (Fin 3))).trans
    ((Equiv.mulLeft (permutation physical)).trans permutationEquiv.symm))

/-- The strategy-to-source equivalence is the same assignment used by the physical composition formula. -/
theorem sourceOrderEquiv_apply (physical strategy : AxisOrder) :
    sourceOrderEquiv physical strategy = sourceOrder physical strategy := rfl

/-- Summing any weights through the physical-region assignment counts every source weight exactly once. -/
theorem sourceOrder_sum {A : Type*} [AddCommMonoid A] (physical : AxisOrder) (weight : AxisOrder → A) :
    (∑ strategy, weight (sourceOrder physical strategy)) = ∑ source, weight source :=
  (sourceOrderEquiv physical).sum_comp weight

end
end MatrixBounds.Tensor.AxisOrder
