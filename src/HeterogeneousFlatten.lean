import HeterogeneousInterface
import TensorBatching

/-! Nested and flattened labelled factor lists describe the same tensor.
The explicit coordinate regrouping preserves every independent batch index. -/
namespace MatrixBounds.Interface

open Tensor
open scoped BigOperators
noncomputable section
variable {T K : Type*} [Fintype T] [CommSemiring K] {S : T → Type*} [∀ type, Fintype (S type)]
variable {X Y Z : (type : T) → S type → Type*}

/-- Flattening a dependent family of products is an exact coefficient identity. -/
theorem heterogeneous_flatten (family : ∀ type pool, Coeff K (X type pool) (Y type pool) (Z type pool))
    (x : ∀ index : (type : T) × S type, X index.1 index.2)
    (y : ∀ index : (type : T) × S type, Y index.1 index.2)
    (z : ∀ index : (type : T) × S type, Z index.1 index.2) :
    heterogeneous (fun type => heterogeneous (family type))
      (fun type pool => x ⟨type, pool⟩) (fun type pool => y ⟨type, pool⟩) (fun type pool => z ⟨type, pool⟩) =
    heterogeneous (fun index : (type : T) × S type => family index.1 index.2) x y z := by
  simp only [heterogeneous, Fintype.prod_sigma]

/-- A batch algorithm for nested labelled factors gives the same batch algorithm after flattening the factor list. -/
theorem rankLE_flatten_batch (family : ∀ type pool, Coeff K (X type pool) (Y type pool) (Z type pool))
    {copies rank : ℕ} (algorithm : RankLE
      (directSum (fun _ : Fin copies => heterogeneous (fun type => heterogeneous (family type)))) rank) :
    RankLE (directSum (fun _ : Fin copies => heterogeneous (fun index : (type : T) × S type => family index.1 index.2))) rank := by
  have pulled := rankLE_pullback algorithm
    (fun x : Fin copies × (∀ index : (type : T) × S type, X index.1 index.2) => (x.1, fun type pool => x.2 ⟨type, pool⟩))
    (fun y : Fin copies × (∀ index : (type : T) × S type, Y index.1 index.2) => (y.1, fun type pool => y.2 ⟨type, pool⟩))
    (fun z : Fin copies × (∀ index : (type : T) × S type, Z index.1 index.2) => (z.1, fun type pool => z.2 ⟨type, pool⟩))
  simpa only [directSum, heterogeneous_flatten] using pulled

/-- Regrouping a flat labelled factor list restores the nested product without changing the batch budget. -/
theorem rankLE_unflatten_batch (family : ∀ type pool, Coeff K (X type pool) (Y type pool) (Z type pool))
    {copies rank : ℕ} (algorithm : RankLE
      (directSum (fun _ : Fin copies => heterogeneous (fun index : (type : T) × S type => family index.1 index.2))) rank) :
    RankLE (directSum (fun _ : Fin copies => heterogeneous (fun type => heterogeneous (family type)))) rank := by
  have pulled := rankLE_pullback algorithm
    (fun x : Fin copies × (∀ type pool, X type pool) => (x.1, fun index => x.2 index.1 index.2))
    (fun y : Fin copies × (∀ type pool, Y type pool) => (y.1, fun index => y.2 index.1 index.2))
    (fun z : Fin copies × (∀ type pool, Z type pool) => (z.1, fun index => z.2 index.1 index.2))
  simpa only [directSum, heterogeneous, Fintype.prod_sigma] using pulled

end
end MatrixBounds.Interface
