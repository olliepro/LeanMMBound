import ContextRestrictions

/-! Copy selection and flattening are context-preserving coordinate maps.
Earlier and newly extracted copy labels remain independent on every axis. -/
namespace MatrixBounds.Tensor

universe v
noncomputable section
variable {K X Y Z I J : Type*} [CommSemiring K] [DecidableEq I] [DecidableEq J]

/-- Select an injected subfamily of copies without losing any surrounding tensor factor. -/
theorem contextReduction_selectCopies (tensor : Coeff K X Y Z) (embedding : J ↪ I) :
    ContextReduction.{v} (directSum (fun _ : I => tensor)) (directSum (fun _ : J => tensor)) 1 := by
  have pulled := contextReduction_pullback.{v} (directSum (fun _ : I => tensor))
    (fun x : J × X => (embedding x.1, x.2)) (fun y : J × Y => (embedding y.1, y.2))
    (fun z : J × Z => (embedding z.1, z.2))
  convert pulled using 1
  funext x y z
  simp only [directSum, EmbeddingLike.apply_eq_iff_eq]

/-- Renumbering independent copies is valid inside every tensor context. -/
theorem contextReduction_relabelCopies (tensor : Coeff K X Y Z) (equiv : J ≃ I) :
    ContextReduction.{v} (directSum (fun _ : I => tensor)) (directSum (fun _ : J => tensor)) 1 :=
  contextReduction_selectCopies tensor equiv.toEmbedding

/-- Nested batches contain the Cartesian product of their independently earned copy indices. -/
theorem contextReduction_flattenCopies (tensor : Coeff K X Y Z) :
    ContextReduction.{v} (directSum (fun _ : I => directSum (fun _ : J => tensor)))
      (directSum (fun _ : I × J => tensor)) 1 := by
  have pulled := contextReduction_pullback.{v} (directSum (fun _ : I => directSum (fun _ : J => tensor)))
    (fun x : (I × J) × X => (x.1.1, x.1.2, x.2))
    (fun y : (I × J) × Y => (y.1.1, y.1.2, y.2))
    (fun z : (I × J) × Z => (z.1.1, z.1.2, z.2))
  convert pulled using 1
  funext x y z
  simp only [directSum, ← ite_and, Prod.ext_iff]
  congr 1
  apply propext
  tauto

end
end MatrixBounds.Tensor
