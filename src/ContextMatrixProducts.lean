module

public import ContextMatrix

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Finite heterogeneous products of actual matrix tensors yield the matrix
product whose three index sets are the products of the corresponding indices. -/
namespace MatrixBounds.Tensor.MatrixMul

universe v
open scoped BigOperators
noncomputable section
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {K T : Type*} [CommSemiring K] [Fintype T]
variable {I J L : T → Type*}
variable [∀ t, DecidableEq (I t)] [∀ t, DecidableEq (J t)] [∀ t, DecidableEq (L t)]

/-- Regroup a matrix coordinate pair into a family of factor coordinate pairs. -/
def familyPairs {A B : T → Type*} (pair : (∀ t, A t) × (∀ t, B t)) : ∀ t, A t × B t :=
  fun t => (pair.1 t, pair.2 t)

/-- Multiplying all matrix coefficients is exactly the coefficient of the product-dimension matrix tensor. -/
theorem heterogeneous_matrix_identity :
    (fun x y z => Interface.heterogeneous (fun t => tensor (K := K) (I := I t) (J := J t) (L := L t))
      (familyPairs x) (familyPairs y) (familyPairs z)) =
      tensor (K := K) (I := ∀ t, I t) (J := ∀ t, J t) (L := ∀ t, L t) := by
  funext x y z
  unfold Interface.heterogeneous tensor familyPairs
  simp only [Fintype.prod_boole]
  congr 1
  apply propext
  simp only [forall_and, funext_iff]

/-- All heterogeneous matrix factors combine at unit cost and preserve an arbitrary tensor context. -/
theorem contextReduction_heterogeneous_matrix :
    ContextReduction.{v}
      (Interface.heterogeneous (fun t => tensor (K := K) (I := I t) (J := J t) (L := L t)))
      (tensor (K := K) (I := ∀ t, I t) (J := ∀ t, J t) (L := ∀ t, L t)) 1 := by
  rw [← heterogeneous_matrix_identity (K := K) (I := I) (J := J) (L := L)]
  exact contextReduction_pullback _ _ _ _

variable [∀ t, Fintype (I t)] [∀ t, Fintype (J t)] [∀ t, Fintype (L t)]

omit [∀ t, DecidableEq (I t)] [∀ t, DecidableEq (J t)] [∀ t, DecidableEq (L t)] in
/-- The three resulting matrix dimensions are the products of the actual factor cardinalities. -/
theorem heterogeneous_matrix_dimensions :
    Fintype.card (∀ t, I t) = ∏ t, Fintype.card (I t) ∧
    Fintype.card (∀ t, J t) = ∏ t, Fintype.card (J t) ∧
    Fintype.card (∀ t, L t) = ∏ t, Fintype.card (L t) :=
  ⟨Fintype.card_pi, Fintype.card_pi, Fintype.card_pi⟩

end
end MatrixBounds.Tensor.MatrixMul
