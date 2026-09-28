import CoordinateRestriction
import ContextMatrixProducts

/-! Concrete coordinate selections for relabeling, rotating, and multiplying
rectangular matrix tensors. -/
namespace MatrixBounds.Tensor.MatrixMul

noncomputable section
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {K I J L : Type*} [CommSemiring K]
variable [DecidableEq I] [DecidableEq J] [DecidableEq L]

/-- Relabel the row, inner, and column index sets by explicit bijections. -/
def relabelCoordinateRestriction {I' J' L' : Type*}
    [DecidableEq I'] [DecidableEq J'] [DecidableEq L'] (ei : I' ≃ I) (ej : J' ≃ J) (el : L' ≃ L) :
    CoordinateRestriction (tensor (K := K) (I := I) (J := J) (L := L))
      (tensor (K := K) (I := I') (J := J') (L := L')) where
  left pair := (ei pair.1, ej pair.2)
  middle pair := (ej pair.1, el pair.2)
  right pair := (ei pair.1, el pair.2)
  coefficient _ _ _ := by simp only [tensor, Equiv.apply_eq_iff_eq]

/-- Restore standard matrix coordinates after cycling the three physical tensor axes. -/
def cyclicCoordinateRestriction :
    CoordinateRestriction (cyclic (tensor (K := K) (I := I) (J := J) (L := L)))
      (tensor (K := K) (I := J) (J := L) (L := I)) where
  left := id
  middle := Prod.swap
  right := Prod.swap
  coefficient x y z := congrFun (congrFun (congrFun (cyclic_matrix_identity (K := K)) x) y) z

/-- Regroup independent matrix-factor coordinates into one product-dimension matrix. -/
def heterogeneousCoordinateRestriction {T : Type*} [Fintype T] {I J L : T → Type*}
    [∀ t, DecidableEq (I t)] [∀ t, DecidableEq (J t)] [∀ t, DecidableEq (L t)] :
    CoordinateRestriction
      (Interface.heterogeneous (fun t => tensor (K := K) (I := I t) (J := J t) (L := L t)))
      (tensor (K := K) (I := ∀ t, I t) (J := ∀ t, J t) (L := ∀ t, L t)) where
  left := familyPairs
  middle := familyPairs
  right := familyPairs
  coefficient x y z := congrFun (congrFun (congrFun (heterogeneous_matrix_identity (K := K)) x) y) z

end
end MatrixBounds.Tensor.MatrixMul
