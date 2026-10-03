module

public import TensorCore

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Products of finite coefficient tensors and constructive multiplicativity
of rank budgets. No asymptotic rank theorem is assumed. -/
namespace MatrixBounds.Tensor

open scoped BigOperators
noncomputable section
variable {K X Y Z U V W R S : Type*} [CommSemiring K]

/-- Tensor product in product bases: each coefficient is the product of its factors. -/
def product (left : Coeff K X Y Z) (right : Coeff K U V W) :
    Coeff K (X × U) (Y × V) (Z × W) :=
  fun x y z => left x.1 y.1 z.1 * right x.2 y.2 z.2

/-- Multiply two rank decompositions, using one term for every pair of source terms.
For example, decompositions with 7 and 7 terms give 49 terms for the product. -/
def Decomposition.product [Fintype R] [Fintype S]
    {left : Coeff K X Y Z} {right : Coeff K U V W}
    (dl : Decomposition left R) (dr : Decomposition right S) :
    Decomposition (Tensor.product left right) (R × S) where
  left term x := dl.left term.1 x.1 * dr.left term.2 x.2
  middle term y := dl.middle term.1 y.1 * dr.middle term.2 y.2
  right term z := dl.right term.1 z.1 * dr.right term.2 z.2
  reconstruct x y z := by
    simp only [Tensor.product, dl.reconstruct, dr.reconstruct,
      Fintype.sum_prod_type, Finset.sum_mul, Finset.mul_sum]
    rw [Finset.sum_comm]
    apply Finset.sum_congr rfl
    intro r _
    apply Finset.sum_congr rfl
    intro s _
    ring

/-- Tensor-product rank is at most the product of the two supplied rank budgets. -/
theorem rankLE_product {left : Coeff K X Y Z} {right : Coeff K U V W}
    {m n : ℕ} (hl : RankLE left m) (hr : RankLE right n) :
    RankLE (product left right) (m * n) := by
  obtain ⟨dl⟩ := hl
  obtain ⟨dr⟩ := hr
  have result : RankLE (product left right) (Fintype.card (Fin m × Fin n)) :=
    ⟨(dl.product dr).reindex (Fintype.equivFin (Fin m × Fin n)).symm⟩
  simpa only [Fintype.card_prod, Fintype.card_fin] using result

end
end MatrixBounds.Tensor
