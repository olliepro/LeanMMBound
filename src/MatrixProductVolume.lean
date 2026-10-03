module

public import MatrixCoordinateRestrictions
public import Mathlib.Analysis.SpecialFunctions.Log.Basic

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Two actual matrix factors combine by explicit coordinate maps, and their
full finite volumes multiply before logarithms are taken. -/
namespace MatrixBounds.Tensor.MatrixMul

open scoped BigOperators
noncomputable section
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {K : Type} [CommSemiring K] {I J L I' J' L' : Type}

/-- Combine two complete matrix tensors into the matrix on product row, inner, and column indices. -/
def productCoordinateRestriction [DecidableEq I] [DecidableEq J] [DecidableEq L]
    [DecidableEq I'] [DecidableEq J'] [DecidableEq L'] :
    CoordinateRestriction
      (product (tensor (K := K) (I := I) (J := J) (L := L)) (tensor (K := K) (I := I') (J := J') (L := L')))
      (tensor (K := K) (I := I × I') (J := J × J') (L := L × L')) where
  left := regroup
  middle := regroup
  right := regroup
  coefficient x y z := by
    simp only [product, tensor, regroup, Equiv.coe_fn_mk, Prod.ext_iff]
    split_ifs <;> simp_all <;> grind

variable [Fintype I] [Fintype J] [Fintype L] [Fintype I'] [Fintype J'] [Fintype L']

/-- The full dimension product of two combined matrix tensors is exactly the product of their original volumes. -/
theorem product_volume :
    Fintype.card (I × I')*Fintype.card (J × J')*Fintype.card (L × L') =
      (Fintype.card I*Fintype.card J*Fintype.card L)*(Fintype.card I'*Fintype.card J'*Fintype.card L') := by
  simp only [Fintype.card_prod]
  ring

/-- Positive original matrix volumes remain positive under the actual coordinate product. -/
theorem product_volume_positive
    (first : 0 < Fintype.card I*Fintype.card J*Fintype.card L)
    (second : 0 < Fintype.card I'*Fintype.card J'*Fintype.card L') :
    0 < Fintype.card (I × I')*Fintype.card (J × J')*Fintype.card (L × L') := by
  rw [product_volume]
  exact Nat.mul_pos first second

/-- The actual logarithmic matrix volume adds under a product of nonempty factors. -/
theorem product_log_volume
    (first : 0 < Fintype.card I*Fintype.card J*Fintype.card L)
    (second : 0 < Fintype.card I'*Fintype.card J'*Fintype.card L') :
    Real.log ((Fintype.card (I × I')*Fintype.card (J × J')*Fintype.card (L × L') : ℕ) : ℝ) =
      Real.log ((Fintype.card I*Fintype.card J*Fintype.card L : ℕ) : ℝ)+
      Real.log ((Fintype.card I'*Fintype.card J'*Fintype.card L' : ℕ) : ℝ) := by
  rw [product_volume, Nat.cast_mul, Real.log_mul]
  · exact_mod_cast first.ne'
  · exact_mod_cast second.ne'


/-- Complete product-index matrix dimensions multiply every separately labelled factor volume. -/
theorem family_volume {T : Type} [Fintype T] (rows inner columns : T → Type)
    [∀ label, Fintype (rows label)] [∀ label, Fintype (inner label)] [∀ label, Fintype (columns label)] :
    Fintype.card (∀ label, rows label)*Fintype.card (∀ label, inner label)*Fintype.card (∀ label, columns label) =
      ∏ label, Fintype.card (rows label)*Fintype.card (inner label)*Fintype.card (columns label) := by
  simp only [Fintype.card_pi, Finset.prod_mul_distrib]

/-- A complete labelled product of nonempty matrix factors has positive finite volume. -/
theorem family_volume_positive {T : Type} [Fintype T] (rows inner columns : T → Type)
    [∀ label, Fintype (rows label)] [∀ label, Fintype (inner label)] [∀ label, Fintype (columns label)]
    (positive : ∀ label, 0 < Fintype.card (rows label)*Fintype.card (inner label)*Fintype.card (columns label)) :
    0 < Fintype.card (∀ label, rows label)*Fintype.card (∀ label, inner label)*Fintype.card (∀ label, columns label) := by
  rw [family_volume]
  exact Finset.prod_pos (fun label _ => positive label)

end
end MatrixBounds.Tensor.MatrixMul
