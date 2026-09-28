import SuppliedTerminalMatrix
import WaitingZeroMatrixOrientation
import SuppliedBatchTensors

/-! Complete terminal child matrices in all six original physical orientations
combine into one actual matrix with exactly six times the original volume. -/
namespace MatrixBounds.Numeric.SuppliedTerminalSixfoldMatrix

universe v
open Tensor Tensor.CW Interface WaitingZeroMatrix SuppliedTerminalMatrix
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A

/-- Actual row coordinates of all six complete terminal matrices. -/
abbrev CombinedRows (size : ℕ) := SixfoldRows (Rows size) (Inner size) (Columns size)

/-- Actual contracted coordinates of all six complete terminal matrices. -/
abbrev CombinedInner (size : ℕ) := SixfoldInner (Rows size) (Inner size) (Columns size)

/-- Actual column coordinates of all six complete terminal matrices. -/
abbrev CombinedColumns (size : ℕ) := SixfoldColumns (Rows size) (Inner size) (Columns size)

/-- The complete original terminal matrix has positive finite volume at every population, including zero. -/
theorem volume_positive (size : ℕ) : 0 < Fintype.card (Rows size)*Fintype.card (Inner size)*Fintype.card (Columns size) := by
  have volume := Terminal.permuted_mixed_matrix_volume sourceAxes 5 (extremeCount size) (middleCount size)
  simp only [← Nat.card_eq_fintype_card] at volume ⊢
  rw [volume]
  exact Finset.prod_pos (fun _ _ => by positivity)

/-- Six complete terminal matrix orientations have positive finite product volume. -/
theorem sixfold_volume_positive (size : ℕ) :
    0 < Fintype.card (CombinedRows size)*Fintype.card (CombinedInner size)*Fintype.card (CombinedColumns size) := by
  rw [sixfold_volume]
  exact pow_pos (volume_positive size) 6

/-- Every actual sixfold terminal output restricts to the complete product-dimension matrix at unit cost. -/
theorem reduction {K : Type} [CommRing K] (size : ℕ) (width : SuppliedBatch.Width .terminal) :
    ContextReduction.{v} (SuppliedBatch.output (K := K) size .terminal width).coefficient
      (MatrixMul.tensor (K := K) (I := CombinedRows size) (J := CombinedInner size) (L := CombinedColumns size)) 1 := by
  have extracted := (SuppliedTerminalMatrix.restriction (K := K) size width.val (fun label => (width.property label).le)).context.sixfold
  have matrices := sixfold_matrix (K := K) (I := Rows size) (J := Inner size) (L := Columns size)
  dsimp only [SuppliedBatch.output, SuppliedStagePresentations.presentation, SuppliedPathStages.fixed,
    SuppliedPathStages.Labels, SuppliedPathStages.labelsFinite, FiniteTensor.ofCoeff, FiniteTensor.sixfold]
  simpa only [one_pow, one_mul] using extracted.trans matrices

/-- The actual sixfold terminal matrix volume has its exact original weighted logarithmic rate. -/
theorem log_volume {size : ℕ} (positive : 0 < size) :
    Real.log ((Fintype.card (CombinedRows size)*Fintype.card (CombinedInner size)*Fintype.card (CombinedColumns size) : ℕ) : ℝ) =
      6*SuppliedTerminalMatrix.volumeRate*size := by
  rw [sixfold_log_volume, SuppliedTerminalMatrix.log_volume positive]
  ring

end
end MatrixBounds.Numeric.SuppliedTerminalSixfoldMatrix
