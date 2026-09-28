import ContextProductReductions
import HeterogeneousFiniteRegrouping

/-! A finite labelled family of contextual transformations acts simultaneously
with the product cost. All intermediate and final factor labels are retained. -/
namespace MatrixBounds.Tensor

universe v
open scoped BigOperators
noncomputable section
variable {K : Type*} [CommSemiring K]

/-- Combine contextual transformations across a finite dependent sequence, multiplying their costs exactly once. -/
theorem ContextReduction.fin_heterogeneous (n : ℕ) :
    ∀ {X Y Z U V W : Fin n → Type}
      [∀ index, Fintype (X index)] [∀ index, Fintype (Y index)] [∀ index, Fintype (Z index)]
      [∀ index, Fintype (U index)] [∀ index, Fintype (V index)] [∀ index, Fintype (W index)]
      {source : ∀ index, Coeff K (X index) (Y index) (Z index)}
      {target : ∀ index, Coeff K (U index) (V index) (W index)} (cost : Fin n → ℕ),
      (∀ index, ContextReduction.{v} (source index) (target index) (cost index)) →
      ContextReduction.{v} (Interface.heterogeneous source) (Interface.heterogeneous target) (∏ index, cost index) := by
  induction n with
  | zero =>
    intro X Y Z U V W finiteX finiteY finiteZ finiteU finiteV finiteW source target cost reductions
    let restriction : CoordinateRestriction (Interface.heterogeneous source) (Interface.heterogeneous target) := {
      left := fun _ index => Fin.elim0 index
      middle := fun _ index => Fin.elim0 index
      right := fun _ index => Fin.elim0 index
      coefficient := by intros; simp only [Interface.heterogeneous, Fin.prod_univ_zero] }
    simpa only [Fin.prod_univ_zero] using restriction.context
  | succ n induction =>
    intro X Y Z U V W finiteX finiteY finiteZ finiteU finiteV finiteW source target cost reductions
    have tail := induction (X := fun index => X index.succ) (Y := fun index => Y index.succ)
      (Z := fun index => Z index.succ) (U := fun index => U index.succ) (V := fun index => V index.succ)
      (W := fun index => W index.succ) (fun index => cost index.succ) (fun index => reductions index.succ)
    have combined := (reductions 0).product tail
    have reduction := ((Interface.finSuccProductRestriction source).context.trans combined).trans
      (Interface.productFinSuccRestriction target).context
    simpa only [one_mul, mul_one, Fin.prod_univ_succ] using reduction

/-- Any finite family of independently labelled transformations preserves arbitrary context with its product cost. -/
theorem ContextReduction.heterogeneous {T : Type} [Fintype T]
    {X Y Z U V W : T → Type}
    [∀ index, Fintype (X index)] [∀ index, Fintype (Y index)] [∀ index, Fintype (Z index)]
    [∀ index, Fintype (U index)] [∀ index, Fintype (V index)] [∀ index, Fintype (W index)]
    {source : ∀ index, Coeff K (X index) (Y index) (Z index)}
    {target : ∀ index, Coeff K (U index) (V index) (W index)} (cost : T → ℕ)
    (reductions : ∀ index, ContextReduction.{v} (source index) (target index) (cost index)) :
    ContextReduction.{v} (Interface.heterogeneous source) (Interface.heterogeneous target) (∏ index, cost index) := by
  let labels := (Fintype.equivFin T).symm
  have sequence := ContextReduction.fin_heterogeneous (Fintype.card T)
    (fun index => cost (labels index)) (fun index => reductions (labels index))
  have restore : CoordinateRestriction (Interface.heterogeneous (fun index => target (labels index)))
      (Interface.heterogeneous target) := {
    left := fun entries index => entries (labels index)
    middle := fun entries index => entries (labels index)
    right := fun entries index => entries (labels index)
    coefficient := fun x y z => Equiv.prod_comp labels (fun index => target index (x index) (y index) (z index)) }
  have reduction := ((Interface.reindexRestriction labels source).context.trans sequence).trans restore.context
  simpa only [one_mul, mul_one, Equiv.prod_comp labels cost] using reduction

end
end MatrixBounds.Tensor
