import WaitingZeroMatrixOrientation

/-! Every combined sixfold matrix is exactly square: each actual index set
has cardinality equal to the square of the original matrix volume. -/
namespace MatrixBounds.Tensor.WaitingZeroMatrix
noncomputable section
open scoped BigOperators

/-- The complete source orientation set, in its actual six constructor order. -/
theorem all_axis_orders : (Finset.univ : Finset AxisOrder) =
    {.xyz, .xzy, .yxz, .yzx, .zxy, .zyx} := by decide +kernel

/-- Actual rows of a sixfold matrix have squared original volume. -/
theorem sixfold_rows_card {I J L : Type} [Fintype I] [Fintype J] [Fintype L] :
    Fintype.card (SixfoldRows I J L) = (Fintype.card I*Fintype.card J*Fintype.card L)^2 := by
  simp only [SixfoldRows, Fintype.card_pi, all_axis_orders]
  simp [MatrixMul.orientedRows]
  ring

/-- Actual contracted indices of a sixfold matrix have squared original volume. -/
theorem sixfold_inner_card {I J L : Type} [Fintype I] [Fintype J] [Fintype L] :
    Fintype.card (SixfoldInner I J L) = (Fintype.card I*Fintype.card J*Fintype.card L)^2 := by
  simp only [SixfoldInner, Fintype.card_pi, all_axis_orders]
  simp [MatrixMul.orientedInner]
  ring

/-- Actual columns of a sixfold matrix have squared original volume. -/
theorem sixfold_columns_card {I J L : Type} [Fintype I] [Fintype J] [Fintype L] :
    Fintype.card (SixfoldColumns I J L) = (Fintype.card I*Fintype.card J*Fintype.card L)^2 := by
  simp only [SixfoldColumns, Fintype.card_pi, all_axis_orders]
  simp [MatrixMul.orientedColumns]
  ring

/-- The three actual sixfold matrix index sets have exactly the same cardinality. -/
theorem sixfold_square {I J L : Type} [Fintype I] [Fintype J] [Fintype L] :
    Fintype.card (SixfoldRows I J L) = Fintype.card (SixfoldInner I J L) ∧
    Fintype.card (SixfoldRows I J L) = Fintype.card (SixfoldColumns I J L) := by
  rw [sixfold_rows_card, sixfold_inner_card, sixfold_columns_card]
  exact ⟨rfl, rfl⟩

end
end MatrixBounds.Tensor.WaitingZeroMatrix
