import OrientedMatrixFactors
import Mathlib.Analysis.SpecialFunctions.Log.Basic

/-! Canonical zero-coordinate extractions restore the original physical source,
and their six orientations produce a genuine matrix with sixfold log volume. -/
namespace MatrixBounds.Tensor.WaitingZeroMatrix

universe v u
open Interface
open scoped BigOperators
noncomputable section
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {K : Type} [CommSemiring K]

/-- The actual inverse of each of the six physical axis orderings. -/
def inverseOrder : AxisOrder → AxisOrder
  | .xyz => .xyz
  | .xzy => .xzy
  | .yxz => .yxz
  | .yzx => .zxy
  | .zxy => .yzx
  | .zyx => .zyx

/-- Restore a canonical extraction to its original complete source coordinates. -/
theorem restore_source {X Y Z U V W : Type} (order : AxisOrder)
    {source : Coeff K X Y Z} {target : Coeff K U V W} {cost : ℕ}
    (extraction : ContextReduction.{v} (orient order source) target cost) :
    ContextReduction.{v} source (orient (inverseOrder order) target) cost := by
  cases order with
  | xyz => exact extraction
  | xzy => exact extraction.orient .xzy
  | yxz => exact extraction.orient .yxz
  | yzx => exact extraction.orient .zxy
  | zxy => exact extraction.orient .yzx
  | zyx => exact extraction.orient .zyx

/-- Restore a canonical matrix extraction to an actual matrix in the source's original physical axes. -/
theorem restore_matrix {X Y Z I J L : Type} (order : AxisOrder)
    {source : Coeff K X Y Z} {cost : ℕ}
    (extraction : ContextReduction.{v} (orient order source)
      (MatrixMul.tensor (K := K) (I := I) (J := J) (L := L)) cost) :
    ContextReduction.{v} source
      (MatrixMul.tensor (K := K)
        (I := MatrixMul.orientedRows I J L (inverseOrder order))
        (J := MatrixMul.orientedInner I J L (inverseOrder order))
        (L := MatrixMul.orientedColumns I J L (inverseOrder order))) cost := by
  simpa only [one_mul] using (restore_source order extraction).trans
    (MatrixMul.contextReduction_oriented_matrix (K := K) (I := I) (J := J) (L := L) (inverseOrder order))

/-- Row indices of the combined six physical orientations of one matrix. -/
abbrev SixfoldRows (I J L : Type) := ∀ order : AxisOrder, MatrixMul.orientedRows I J L order

/-- Contracted indices of the combined six physical orientations of one matrix. -/
abbrev SixfoldInner (I J L : Type) := ∀ order : AxisOrder, MatrixMul.orientedInner I J L order

/-- Column indices of the combined six physical orientations of one matrix. -/
abbrev SixfoldColumns (I J L : Type) := ∀ order : AxisOrder, MatrixMul.orientedColumns I J L order

/-- Combine all six physical matrix orientations into one actual product-dimension matrix. -/
theorem sixfold_matrix {I J L : Type} [Fintype I] [Fintype J] [Fintype L]
    [DecidableEq I] [DecidableEq J] [DecidableEq L] :
    ContextReduction.{v}
      (heterogeneous (fun order : AxisOrder => orient order (MatrixMul.tensor (K := K) (I := I) (J := J) (L := L))))
      (MatrixMul.tensor (K := K) (I := SixfoldRows I J L) (J := SixfoldInner I J L) (L := SixfoldColumns I J L)) 1 := by
  have factors := ContextReduction.heterogeneous (fun _ : AxisOrder => 1)
    (fun order => MatrixMul.contextReduction_oriented_matrix (K := K) (I := I) (J := J) (L := L) order)
  have extraction := factors.trans MatrixMul.contextReduction_heterogeneous_matrix
  have same : @MatrixMul.tensor K I J L _ (Classical.decEq I) (Classical.decEq J) (Classical.decEq L) =
      MatrixMul.tensor (K := K) (I := I) (J := J) (L := L) := by
    congr 1 <;> exact Subsingleton.elim _ _
  rw [same] at extraction
  simpa only [Finset.prod_const_one, mul_one] using extraction

/-- Six physical orientations multiply the original full matrix volume exactly six times. -/
theorem sixfold_volume {I J L : Type} [Fintype I] [Fintype J] [Fintype L] :
    Fintype.card (SixfoldRows I J L)*Fintype.card (SixfoldInner I J L)*Fintype.card (SixfoldColumns I J L) =
      (Fintype.card I*Fintype.card J*Fintype.card L)^6 := by
  simp only [SixfoldRows, SixfoldInner, SixfoldColumns, Fintype.card_pi]
  rw [← Finset.prod_mul_distrib, ← Finset.prod_mul_distrib]
  simp only [MatrixMul.oriented_volume, Finset.prod_const, Finset.card_univ, axisOrder_card]

/-- The complete logarithmic volume of the combined matrix is six times the original log volume. -/
theorem sixfold_log_volume {I J L : Type} [Fintype I] [Fintype J] [Fintype L] :
    Real.log ((Fintype.card (SixfoldRows I J L)*Fintype.card (SixfoldInner I J L)*
      Fintype.card (SixfoldColumns I J L) : ℕ) : ℝ) =
      6*Real.log ((Fintype.card I*Fintype.card J*Fintype.card L : ℕ) : ℝ) := by
  rw [sixfold_volume, Nat.cast_pow, Real.log_pow]
  norm_num

end
end MatrixBounds.Tensor.WaitingZeroMatrix
