import TensorBatching
import AcceptedRestrictions

/-! Exact interfaces use subtype axes, whereas type partitions share ambient
axes. Explicit zero extensions connect their rank algorithms without changing
the budget or introducing additional coefficients. -/
namespace MatrixBounds.Tensor

open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {K X Y Z : Type*} [CommSemiring K]

/-- Restrict coefficient arguments to three axis subtypes. -/
def subtypeTensor (tensor : Coeff K X Y Z) (keepX : X → Prop) (keepY : Y → Prop) (keepZ : Z → Prop) :
    Coeff K {x // keepX x} {y // keepY y} {z // keepZ z} := fun x y z => tensor x.val y.val z.val

/-- Extend the factors of a subtype decomposition by zero on excluded ambient variables. -/
def Decomposition.extendSubtypes {R : Type*} [Fintype R] (tensor : Coeff K X Y Z)
    (keepX : X → Prop) (keepY : Y → Prop) (keepZ : Z → Prop)
    (algorithm : Decomposition (subtypeTensor tensor keepX keepY keepZ) R) :
    Decomposition (Empirical.acceptedTensor tensor id id id keepX keepY keepZ) R where
  left term x := if included : keepX x then algorithm.left term ⟨x, included⟩ else 0
  middle term y := if included : keepY y then algorithm.middle term ⟨y, included⟩ else 0
  right term z := if included : keepZ z then algorithm.right term ⟨z, included⟩ else 0
  reconstruct x y z := by
    by_cases hx : keepX x <;> by_cases hy : keepY y <;> by_cases hz : keepZ z
    · simpa only [Empirical.acceptedTensor, id_eq, hx, hy, hz, and_self, if_true, dite_true, subtypeTensor]
        using algorithm.reconstruct ⟨x, hx⟩ ⟨y, hy⟩ ⟨z, hz⟩
    all_goals simp [Empirical.acceptedTensor, hx, hy, hz]

/-- Zero extension preserves a subtype tensor's rank budget. -/
theorem rankLE_extend_subtypes (tensor : Coeff K X Y Z)
    (keepX : X → Prop) (keepY : Y → Prop) (keepZ : Z → Prop) {rank : ℕ}
    (algorithm : RankLE (subtypeTensor tensor keepX keepY keepZ) rank) :
    RankLE (Empirical.acceptedTensor tensor id id id keepX keepY keepZ) rank := by
  obtain ⟨decomposition⟩ := algorithm
  exact ⟨decomposition.extendSubtypes tensor keepX keepY keepZ⟩

/-- The same zero extension works simultaneously on every independent output-copy index. -/
theorem rankLE_extend_subtype_batch [Fintype X] [Fintype Y] [Fintype Z]
    (tensor : Coeff K X Y Z) (keepX : X → Prop) (keepY : Y → Prop) (keepZ : Z → Prop)
    {copies rank : ℕ} (algorithm : RankLE (directSum (fun _ : Fin copies => subtypeTensor tensor keepX keepY keepZ)) rank) :
    RankLE (directSum (fun _ : Fin copies => Empirical.acceptedTensor tensor id id id keepX keepY keepZ)) rank := by
  have pulled := rankLE_pullback algorithm
    (fun x : {x : Fin copies × X // keepX x.2} => (x.val.1, ⟨x.val.2, x.property⟩))
    (fun y : {y : Fin copies × Y // keepY y.2} => (y.val.1, ⟨y.val.2, y.property⟩))
    (fun z : {z : Fin copies × Z // keepZ z.2} => (z.val.1, ⟨z.val.2, z.property⟩))
  have extended := rankLE_extend_subtypes (directSum (fun _ : Fin copies => tensor))
    (fun x => keepX x.2) (fun y => keepY y.2) (fun z => keepZ z.2) pulled
  convert extended using 1
  funext x y z
  simp only [directSum, Empirical.acceptedTensor, id_eq]
  split_ifs <;> rfl

end
end MatrixBounds.Tensor
