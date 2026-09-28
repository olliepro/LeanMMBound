import MatrixCoordinateRestrictions
import SixfoldComposition

/-! Every physical matrix orientation yields an actual matrix factor with
permuted index sets and exactly the same full volume. -/
namespace MatrixBounds.Tensor.MatrixMul

universe v u
noncomputable section
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {K : Type*} [CommSemiring K] {I J L : Type u}

/-- Matrix row indices after restoring the indicated physical tensor orientation. -/
def orientedRows (I J L : Type u) : AxisOrder → Type u
  | .xyz | .zyx => I
  | .xzy | .yzx => J
  | .yxz | .zxy => L

/-- Matrix contracted indices after restoring the indicated physical tensor orientation. -/
def orientedInner (I J L : Type u) : AxisOrder → Type u
  | .xyz | .yxz => J
  | .xzy | .zxy => I
  | .yzx | .zyx => L

/-- Matrix column indices after restoring the indicated physical tensor orientation. -/
def orientedColumns (I J L : Type u) : AxisOrder → Type u
  | .xyz | .xzy => L
  | .yxz | .yzx => I
  | .zxy | .zyx => J

/-- The restored matrix row set is finite whenever the original three index sets are finite. -/
instance orientedRowsFinite [Fintype I] [Fintype J] [Fintype L] (order : AxisOrder) :
    Fintype (orientedRows I J L order) := by cases order <;> dsimp only [orientedRows] <;> infer_instance

/-- The restored matrix contracted set is finite whenever the original three index sets are finite. -/
instance orientedInnerFinite [Fintype I] [Fintype J] [Fintype L] (order : AxisOrder) :
    Fintype (orientedInner I J L order) := by cases order <;> dsimp only [orientedInner] <;> infer_instance

/-- The restored matrix column set is finite whenever the original three index sets are finite. -/
instance orientedColumnsFinite [Fintype I] [Fintype J] [Fintype L] (order : AxisOrder) :
    Fintype (orientedColumns I J L order) := by cases order <;> dsimp only [orientedColumns] <;> infer_instance

/-- Each of the six physical tensor orderings gives a genuine matrix with its appropriate index permutation. -/
theorem contextReduction_oriented_matrix (order : AxisOrder) :
    ContextReduction.{v} (orient order (tensor (K := K) (I := I) (J := J) (L := L)))
      (tensor (K := K) (I := orientedRows I J L order) (J := orientedInner I J L order)
        (L := orientedColumns I J L order)) 1 := by
  cases order with
  | xyz => exact ContextReduction.refl _
  | xzy => exact (contextReduction_transpose_matrix (K := K) (I := I) (J := J) (L := L)).cyclic.trans contextReduction_cyclic_matrix
  | yxz => exact contextReduction_transpose_matrix
  | yzx => exact contextReduction_cyclic_matrix
  | zxy => exact (contextReduction_cyclic_matrix (K := K) (I := I) (J := J) (L := L)).cyclic.trans contextReduction_cyclic_matrix
  | zyx =>
    exact (contextReduction_transpose_matrix (K := K) (I := I) (J := J) (L := L)).cyclic.cyclic.trans
      ((contextReduction_cyclic_matrix (K := K) (I := L) (J := J) (L := I)).cyclic.trans contextReduction_cyclic_matrix)

/-- Physical orientation preserves the exact full matrix volume. -/
theorem oriented_volume [Fintype I] [Fintype J] [Fintype L] (order : AxisOrder) :
    Fintype.card (orientedRows I J L order)*Fintype.card (orientedInner I J L order)*Fintype.card (orientedColumns I J L order) =
      Fintype.card I*Fintype.card J*Fintype.card L := by
  cases order <;> dsimp only [orientedRows, orientedInner, orientedColumns] <;> ring

end
end MatrixBounds.Tensor.MatrixMul
