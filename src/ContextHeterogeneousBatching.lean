module

public import ContextHeterogeneousReductions
public import ContextCopies

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Independent labelled extractions earn the Cartesian product of their copy
labels. Regrouping these copies multiplies counts without merging variables. -/
namespace MatrixBounds.Tensor

universe v
open scoped BigOperators
noncomputable section
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {K : Type*} [CommSemiring K]

/-- A product of independent uniform batches is one uniform batch with the full vector of copy labels. -/
def heterogeneousBatchRestriction {T : Type*} [Fintype T] {X Y Z Copies : T → Type*}
    [∀ type, DecidableEq (Copies type)]
    (target : ∀ type, Coeff K (X type) (Y type) (Z type)) :
    CoordinateRestriction (Interface.heterogeneous (fun type => directSum (fun _ : Copies type => target type)))
      (directSum (fun _ : (∀ type, Copies type) => Interface.heterogeneous target)) where
  left entries type := (entries.1 type, entries.2 type)
  middle entries type := (entries.1 type, entries.2 type)
  right entries type := (entries.1 type, entries.2 type)
  coefficient x y z := by
    simp only [Interface.heterogeneous, directSum]
    by_cases same : x.1 = y.1 ∧ y.1 = z.1
    · rw [if_pos same]
      apply Finset.prod_congr rfl
      intro type _
      exact if_pos ⟨congrFun same.1 type, congrFun same.2 type⟩
    · rw [if_neg same]
      have witness : ∃ type, ¬(x.1 type = y.1 type ∧ y.1 type = z.1 type) := by
        by_contra absent
        push_neg at absent
        exact same ⟨funext (fun type => (absent type).1), funext (fun type => (absent type).2)⟩
      obtain ⟨type, different⟩ := witness
      exact Finset.prod_eq_zero (Finset.mem_univ type) (if_neg different)

/-- Finitely many labelled extractions earn the product number of complete output tensors, at the product cost. -/
theorem ContextReduction.heterogeneous_extractions {T : Type} [Fintype T]
    {X Y Z U V W : T → Type}
    [∀ type, Fintype (X type)] [∀ type, Fintype (Y type)] [∀ type, Fintype (Z type)]
    [∀ type, Fintype (U type)] [∀ type, Fintype (V type)] [∀ type, Fintype (W type)]
    {source : ∀ type, Coeff K (X type) (Y type) (Z type)}
    {target : ∀ type, Coeff K (U type) (V type) (W type)} (copies cost : T → ℕ)
    (reductions : ∀ type, ContextReduction.{v} (source type) (directSum (fun _ : Fin (copies type) => target type)) (cost type)) :
    ContextReduction.{v} (Interface.heterogeneous source)
      (directSum (fun _ : Fin (∏ type, copies type) => Interface.heterogeneous target)) (∏ type, cost type) := by
  have combined := (ContextReduction.heterogeneous cost reductions).trans
    (heterogeneousBatchRestriction (Copies := fun type => Fin (copies type)) target).context
  let labels : Fin (∏ type, copies type) ≃ (∀ type, Fin (copies type)) :=
    Fintype.equivOfCardEq (by simp only [Fintype.card_fin, Fintype.card_pi])
  simpa only [one_mul] using combined.trans (contextReduction_relabelCopies (Interface.heterogeneous target) labels)

end
end MatrixBounds.Tensor
