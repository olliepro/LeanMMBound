import SuppliedLevel4Transition
import SuppliedLevel3Transition

/-! Positive source widths for one actual pipeline batch. Later widths are
stored independently and selected only when their phase becomes active. -/
namespace MatrixBounds.Numeric.SuppliedBatch

open Tensor SuppliedRationalStages
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p

/-- A strictly positive window width at every actual label of one phase. -/
abbrev Width (phase : Phase) := {width : SuppliedPathStages.Labels phase → ℝ // ∀ label, 0 < width label}

/-- All selected output widths and the initial root width of one batch. -/
structure Widths where
  root : ℝ
  rootPositive : 0 < root
  output4 : Width .level4
  output3 : Width .level3
  outputTerminal : Width .terminal

/-- Initialize a batch before any phase has run; unselected future widths start at one. -/
def Widths.initial (root : ℝ) (positive : 0 < root) : Widths :=
  ⟨root, positive, ⟨fun _ => 1, fun _ => by norm_num⟩,
    ⟨fun _ => 1, fun _ => by norm_num⟩, ⟨fun _ => 1, fun _ => by norm_num⟩⟩

/-- The true parent width of each phase is inherited from its own preceding extracted child. -/
def Widths.input (widths : Widths) : (phase : Phase) → Width phase
  | .level4 => ⟨fun _ => widths.root, fun _ => widths.rootPositive⟩
  | .level3 => ⟨SuppliedLevel4Transition.nextTolerance
      (SuppliedLevel4Transition.extendTolerance widths.output4.val),
    SuppliedLevel4Transition.nextTolerance_positive _
      (SuppliedLevel4Transition.extendTolerance_positive _ widths.output4.property)⟩
  | .terminal => ⟨fun label => SuppliedLevel3Transition.extendTolerance widths.output3.val
      (SuppliedLevel3Transition.terminalPredecessor label.val),
    fun _ => SuppliedLevel3Transition.extendTolerance_pos _ widths.output3.property _⟩

/-- Record one newly selected output tolerance while retaining every earlier tolerance. -/
def Widths.update (widths : Widths) : (phase : Phase) → Width phase → Widths
  | .level4, next => {widths with output4 := next}
  | .level3, next => {widths with output3 := next}
  | .terminal, next => {widths with outputTerminal := next}

/-- Updating one active phase never changes its already available parent widths. -/
theorem Widths.update_input (widths : Widths) (phase : Phase) (next : Width phase) :
    (widths.update phase next).input phase = widths.input phase := by cases phase <;> rfl

/-- The three scheduled phase numbers refer to the actual supplied level-four, level-three, and terminal stages. -/
def phaseAt (index : Fin 3) : Phase :=
  if index.val = 0 then .level4 else if index.val = 1 then .level3 else .terminal

end
end MatrixBounds.Numeric.SuppliedBatch
