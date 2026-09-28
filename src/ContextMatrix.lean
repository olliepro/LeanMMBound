import MatrixTensor
import TensorTranspose
import HeterogeneousInterface

/-! Rectangular matrix factors can be permuted and multiplied through actual
coordinate maps, preserving all waiting tensors and copy labels. -/
namespace MatrixBounds.Tensor.MatrixMul

universe v
open scoped BigOperators
noncomputable section
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {K I J L : Type*} [CommSemiring K]
variable [DecidableEq I] [DecidableEq J] [DecidableEq L]

/-- Cycling tensor axes cycles matrix dimensions after swapping the affected coordinate pairs. -/
theorem cyclic_matrix_identity :
    (fun (x : J × L) (y : L × I) (z : J × I) =>
      cyclic (tensor (K := K) (I := I) (J := J) (L := L)) x (y.2, y.1) (z.2, z.1)) =
      tensor (K := K) (I := J) (J := L) (L := I) := by
  funext x y z
  simp only [cyclic, tensor]
  congr 1
  apply propext
  constructor
  · rintro ⟨a, b, c⟩
    exact ⟨b.symm, c, a.symm⟩
  · rintro ⟨a, b, c⟩
    exact ⟨c.symm, a.symm, b⟩

/-- The cycled matrix tensor reduces to the corresponding rectangular matrix product in every context. -/
theorem contextReduction_cyclic_matrix :
    ContextReduction.{v} (cyclic (tensor (K := K) (I := I) (J := J) (L := L)))
      (tensor (K := K) (I := J) (J := L) (L := I)) 1 := by
  rw [← cyclic_matrix_identity (K := K) (I := I) (J := J) (L := L)]
  exact contextReduction_pullback _ _ _ _

/-- Swapping the first two tensor axes swaps the outer matrix dimensions by transposing coordinates. -/
theorem transpose_matrix_identity :
    (fun (x : L × J) (y : J × I) (z : L × I) =>
      transposeXY (tensor (K := K) (I := I) (J := J) (L := L)) (x.2, x.1) (y.2, y.1) (z.2, z.1)) =
      tensor (K := K) (I := L) (J := J) (L := I) := by
  funext x y z
  simp only [transposeXY, tensor]
  congr 1
  apply propext
  constructor <;> rintro ⟨a, b, c⟩ <;> exact ⟨c, b.symm, a⟩

/-- A transposed matrix factor carries exactly the transposed dimensions beside every context. -/
theorem contextReduction_transpose_matrix :
    ContextReduction.{v} (transposeXY (tensor (K := K) (I := I) (J := J) (L := L)))
      (tensor (K := K) (I := L) (J := J) (L := I)) 1 := by
  rw [← transpose_matrix_identity (K := K) (I := I) (J := J) (L := L)]
  exact contextReduction_pullback _ _ _ _

end
end MatrixBounds.Tensor.MatrixMul
