import SuppliedStagePresentations
import CWRationalCanonicalInterfaces
import SuppliedTerminalRationalDimensions

/-! The actual canonical terminal stage output restricts to its full matrix
tensor, whose exact volume is the supplied terminal source volume rate. -/
namespace MatrixBounds.Numeric.SuppliedTerminalMatrix

open Tensor Tensor.CW Terminal Empirical SuppliedTerminalScaling SuppliedPopulationPaths SuppliedTerminalRationalChildren
noncomputable section
set_option maxHeartbeats 3000000
set_option maxRecDepth 3000
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A

/-- Original terminal axes for each complete path label before the selected physical extraction role. -/
def sourceAxes (label : SuppliedPathStages.TerminalLabels) : Equiv.Perm (Fin 3) := axes label.val.source .xyz

/-- Actual repeated extreme count at a complete terminal path label. -/
def extremeCount (size : ℕ) (label : SuppliedPathStages.TerminalLabels) : ℕ :=
  repetitions (terminalWeight label.val) size*extreme label.val.source

/-- Actual repeated middle count at a complete terminal path label. -/
def middleCount (size : ℕ) (label : SuppliedPathStages.TerminalLabels) : ℕ :=
  repetitions (terminalWeight label.val) size*middle label.val.source

/-- Complete row index set of the genuine terminal output matrix. -/
abbrev Rows (size : ℕ) := PermutedMixedRows sourceAxes 5 (extremeCount size) (middleCount size)

/-- Complete contracted index set of the genuine terminal output matrix. -/
abbrev Inner (size : ℕ) := PermutedMixedInner sourceAxes 5 (extremeCount size) (middleCount size)

/-- Complete column index set of the genuine terminal output matrix. -/
abbrev Columns (size : ℕ) := PermutedMixedColumns sourceAxes 5 (extremeCount size) (middleCount size)

/-- Exact full-volume growth coefficient of the terminal factors, retaining every source path. -/
def volumeRate : ℝ := SuppliedTerminalRationalChildren.volumeRate
  (fun label : SuppliedPathStages.TerminalLabels => label.val.source) (fun label => terminalWeight label.val) 5

/-- The original complete terminal children restrict to their actual matrix, with no additional extraction loss. -/
def restriction {K : Type} [CommRing K] (size : ℕ) (tolerance : SuppliedPathStages.TerminalLabels → ℝ)
    (nonnegative : ∀ label, 0 ≤ tolerance label) :
    CoordinateRestriction
      (SuppliedStagePresentations.terminal.originalChildren (K := K) size 5 tolerance)
      (MatrixMul.tensor (K := K) (I := Rows size) (J := Inner size) (L := Columns size)) :=
  matrixRestriction (fun label : SuppliedPathStages.TerminalLabels => label.val.source) (fun _ => .xyz)
    (fun label => terminalWeight label.val) size 5 tolerance nonnegative

/-- Actual complete terminal dimensions have exactly the claimed full-volume logarithm at every positive scale. -/
theorem log_volume {size : ℕ} (positive : 0 < size) :
    Real.log (((Fintype.card (Rows size)*Fintype.card (Inner size)*Fintype.card (Columns size) : ℕ) : ℝ)) =
      volumeRate*size := by
  have volume := matrix_log_volume (T := SuppliedPathStages.TerminalLabels) (size := size) (q := 5)
    (source := fun label : SuppliedPathStages.TerminalLabels => label.val.source)
    (role := fun _ : SuppliedPathStages.TerminalLabels => AxisOrder.xyz)
    (weight := fun label : SuppliedPathStages.TerminalLabels => terminalWeight label.val)
    (weightPositive := fun label : SuppliedPathStages.TerminalLabels => label.property)
    (divisible := fun label : SuppliedPathStages.TerminalLabels => terminal_divisible label.val)
    (sizePositive := positive) (qPositive := by decide)
  simp only [← Nat.card_eq_fintype_card] at volume ⊢
  simpa only [Rows, Inner, Columns, sourceAxes, extremeCount, middleCount, volumeRate] using volume

end
end MatrixBounds.Numeric.SuppliedTerminalMatrix
