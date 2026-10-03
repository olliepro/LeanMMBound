module

public import SuppliedBatchWidths
public import SuppliedCanonicalStages
public import SuppliedInitialPhase
public import FiniteTensorFamily

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

-- v4.35 port: instance terms for the nested sixfold variable types exceed the default size 128.
set_option synthInstance.maxSize 4096

/-! Actual finite tensors for every intermediate state of one supplied batch.
Each waiting factor retains the tolerance at which it was first extracted. -/
namespace MatrixBounds.Numeric.SuppliedBatch

open Tensor Tensor.CW Interface SuppliedRationalStages
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {K : Type} [CommRing K]

/-- All six original root zero-coordinate waiting families with the initial batch width. -/
def rootWaiting (widths : Widths) (size : ℕ) : FiniteTensor K :=
  (FiniteTensor.ofCoeff (SuppliedInitialAllocation.waiting (K := K) size widths.root)).sixfold

/-- All six zero3 waiting families, with their exact preceding level-four output widths. -/
def zero3Waiting (widths : Widths) (size : ℕ) : FiniteTensor K :=
  (FiniteTensor.ofCoeff (SuppliedLevel4Transition.waiting3 (K := K) size
    (SuppliedLevel4Transition.extendTolerance widths.output4.val))).sixfold

/-- All six zero2 waiting families, retaining every earlier role and the level-three output width. -/
def zero2Waiting (widths : Widths) (size : ℕ) : FiniteTensor K :=
  (FiniteTensor.ofCoeff (SuppliedLevel3Transition.waiting (K := K) size
    (SuppliedLevel3Transition.extendTolerance widths.output3.val))).sixfold

/-- The complete waiting tensor accompanying the specified active phase. -/
def waiting (widths : Widths) (size : ℕ) : Phase → FiniteTensor K
  | .level4 => rootWaiting widths size
  | .level3 => (rootWaiting widths size).product (zero3Waiting widths size)
  | .terminal => ((rootWaiting widths size).product (zero3Waiting widths size)).product (zero2Waiting widths size)

/-- The true sixfold canonical active parent, with its inherited positive widths. -/
def active (widths : Widths) (size : ℕ) (phase : Phase) : FiniteTensor K :=
  .ofCoeff (SuppliedCanonicalStages.parent (K := K) phase size (widths.input phase).val)

/-- A complete active batch is exactly its accumulated waiting tensor times its actual phase input. -/
def atPhase (widths : Widths) (size : ℕ) (phase : Phase) : FiniteTensor K :=
  (waiting widths size phase).product (active widths size phase)

/-- Package a complete canonical child tensor with its chosen positive output widths. -/
def output (size : ℕ) (phase : Phase) (width : Width phase) : FiniteTensor K :=
  (FiniteTensor.ofCoeff ((SuppliedStagePresentations.presentation phase).originalChildren
    (K := K) size 5 width.val)).sixfold

/-- The completed batch retains every waiting source and every actual terminal child. -/
def completed (widths : Widths) (size : ℕ) : FiniteTensor K :=
  (waiting widths size .terminal).product (output size .terminal widths.outputTerminal)

/-- State zero, one, two, and three are the original three active phases and the complete final batch. -/
def state (stage : ℕ) (widths : Widths) (size : ℕ) : FiniteTensor K :=
  match stage with
  | 0 => atPhase widths size .level4
  | 1 => atPhase widths size .level3
  | 2 => atPhase widths size .terminal
  | _ => completed widths size

/-- A scheduled phase number selects the corresponding complete active state. -/
theorem state_phase (index : Fin 3) (widths : Widths) (size : ℕ) :
    state (K := K) index.val widths size = atPhase widths size (phaseAt index) := by
  fin_cases index <;> rfl

/-- Selecting the active output does not alter any waiting factor previously set aside. -/
theorem waiting_update (widths : Widths) (size : ℕ) (phase : Phase) (next : Width phase) :
    waiting (K := K) (widths.update phase next) size phase = waiting widths size phase := by
  cases phase <;> rfl

end
end MatrixBounds.Numeric.SuppliedBatch
