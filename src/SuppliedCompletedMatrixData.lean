import SuppliedWaitingMatrixPositivity
import SuppliedWaitingZero2Sixfold
import SuppliedTerminalSixfoldMatrix

/-! Complete final matrix dimensions of one supplied batch: every original
waiting matrix and every terminal child matrix appears exactly once. -/
namespace MatrixBounds.Numeric.SuppliedCompletedMatrix

open Tensor WaitingZeroMatrix
noncomputable section
set_option synthInstance.maxSize 1000
set_option maxRecDepth 3000
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A

/-- Original row indices of the complete batch matrix, preserving the four factor groups. -/
abbrev Rows (size : ℕ) :=
  ((SuppliedWaitingZero4.CombinedRows size × SuppliedWaitingZero3.CombinedRows size) ×
    SuppliedWaitingZero2.CombinedRows size) × SuppliedTerminalSixfoldMatrix.CombinedRows size

/-- Original contracted indices of the complete batch matrix. -/
abbrev Inner (size : ℕ) :=
  ((SuppliedWaitingZero4.CombinedInner size × SuppliedWaitingZero3.CombinedInner size) ×
    SuppliedWaitingZero2.CombinedInner size) × SuppliedTerminalSixfoldMatrix.CombinedInner size

/-- Original column indices of the complete batch matrix. -/
abbrev Columns (size : ℕ) :=
  ((SuppliedWaitingZero4.CombinedColumns size × SuppliedWaitingZero3.CombinedColumns size) ×
    SuppliedWaitingZero2.CombinedColumns size) × SuppliedTerminalSixfoldMatrix.CombinedColumns size

/-- Cache the complete row enumeration for later product matrices. -/
instance rowsFinite (size : ℕ) : Fintype (Rows size) := inferInstance

/-- Cache the complete contracted-index enumeration for later product matrices. -/
instance innerFinite (size : ℕ) : Fintype (Inner size) := inferInstance

/-- Cache the complete column enumeration for later product matrices. -/
instance columnsFinite (size : ℕ) : Fintype (Columns size) := inferInstance

/-- Exact weighted complete-volume growth of all six orientations of all original batch factors. -/
def volumeRate : ℝ := 6*(SuppliedWaitingZero4.volumeRate+SuppliedWaitingZero3.volumeRate+
  SuppliedWaitingZero2.volumeRate+SuppliedTerminalMatrix.volumeRate)

/-- The complete selected zero2 matrix volume is positive at every original population. -/
theorem zero2_positive (size : ℕ) :
    0 < Fintype.card (SuppliedWaitingZero2.CombinedRows size)*Fintype.card (SuppliedWaitingZero2.CombinedInner size)*
      Fintype.card (SuppliedWaitingZero2.CombinedColumns size) := by
  rw [sixfold_volume]
  apply pow_pos
  have positive := MatrixMul.family_volume_positive
    (fun label : SuppliedWaitingZero2.Active => SuppliedWaitingZero2.Rows label.val size)
    (fun label : SuppliedWaitingZero2.Active => SuppliedWaitingZero2.Inner label.val size)
    (fun label : SuppliedWaitingZero2.Active => SuppliedWaitingZero2.Columns label.val size)
    (fun label => by rw [SuppliedWaitingZero2.factor_volume]; exact SuppliedWaitingZero2.indices_positive label.val size)
  simpa only [← Nat.card_eq_fintype_card] using positive

/-- Every complete final batch matrix has positive finite volume, including at population zero. -/
theorem volume_positive (size : ℕ) : 0 < Fintype.card (Rows size)*Fintype.card (Inner size)*Fintype.card (Columns size) :=
  MatrixMul.product_volume_positive
    (MatrixMul.product_volume_positive
      (MatrixMul.product_volume_positive (SuppliedWaitingZero4.volume_positive size) (SuppliedWaitingZero3.volume_positive size))
      (zero2_positive size))
    (SuppliedTerminalSixfoldMatrix.sixfold_volume_positive size)

/-- Actual logarithmic volume is exactly the sum of the four complete component volumes. -/
theorem log_volume (size : ℕ) :
    Real.log ((Fintype.card (Rows size)*Fintype.card (Inner size)*Fintype.card (Columns size) : ℕ) : ℝ) =
      Real.log ((Fintype.card (SuppliedWaitingZero4.CombinedRows size)*Fintype.card (SuppliedWaitingZero4.CombinedInner size)*
        Fintype.card (SuppliedWaitingZero4.CombinedColumns size) : ℕ) : ℝ)+
      Real.log ((Fintype.card (SuppliedWaitingZero3.CombinedRows size)*Fintype.card (SuppliedWaitingZero3.CombinedInner size)*
        Fintype.card (SuppliedWaitingZero3.CombinedColumns size) : ℕ) : ℝ)+
      Real.log ((Fintype.card (SuppliedWaitingZero2.CombinedRows size)*Fintype.card (SuppliedWaitingZero2.CombinedInner size)*
        Fintype.card (SuppliedWaitingZero2.CombinedColumns size) : ℕ) : ℝ)+
      Real.log ((Fintype.card (SuppliedTerminalSixfoldMatrix.CombinedRows size)*Fintype.card (SuppliedTerminalSixfoldMatrix.CombinedInner size)*
        Fintype.card (SuppliedTerminalSixfoldMatrix.CombinedColumns size) : ℕ) : ℝ) := by
  have first := SuppliedWaitingZero4.volume_positive size
  have second := SuppliedWaitingZero3.volume_positive size
  have third := zero2_positive size
  have last := SuppliedTerminalSixfoldMatrix.sixfold_volume_positive size
  rw [MatrixMul.product_log_volume (MatrixMul.product_volume_positive (MatrixMul.product_volume_positive first second) third) last,
    MatrixMul.product_log_volume (MatrixMul.product_volume_positive first second) third,
    MatrixMul.product_log_volume first second]

end
end MatrixBounds.Numeric.SuppliedCompletedMatrix
