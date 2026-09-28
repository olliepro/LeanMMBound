import SuppliedPathStages
import SuppliedTerminalPhysicalSplit
import CWRationalStagePresentation

/-! Every supplied phase and every shared collection of phases has its exact
original source-window presentation, including all preceding role histories. -/
namespace MatrixBounds.Numeric.SuppliedStagePresentations

open Tensor Tensor.CW Empirical SuppliedRationalStages
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p

/-- Original supplied level-four windows and roles present the checked physical stage exactly. -/
def level4 : Mixed.RationalStage.PhysicalPresentation SuppliedFixedStages.level4 where
  original label := SuppliedTypedParameters.level4Split label.val.1
  role label := label.val.2
  law label axis child := SuppliedHigherLaws.child3 label.val.1 child axis
  splits_eq _ := rfl
  laws_eq _ _ := rfl

/-- Original node/strategy windows, preserving the previous role, present the checked physical level-three stage. -/
def level3 : Mixed.RationalStage.PhysicalPresentation SuppliedPathStages.level3 where
  original label := SuppliedTypedParameters.level3Split label.val.source.1 label.val.source.2
  role label := label.val.role
  law label axis child := SuppliedLeafLaws.law label.val.source.1 label.val.source.2 child axis
  splits_eq _ := rfl
  laws_eq _ _ := rfl

/-- Original terminal windows and their complete role histories present the actual shared terminal stage. -/
def terminal : Mixed.RationalStage.PhysicalPresentation SuppliedPathStages.terminal where
  original label := SuppliedTerminalRationalSplit.split label.val.source .xyz
  role label := SuppliedTerminalRoles.role label.val.source label.val.selected
  law _ := SuppliedTerminalRationalSplit.law
  splits_eq label := SuppliedTerminalRationalSplit.split_eq_permute label.val.source _
  laws_eq label axis := (SuppliedTerminalRationalSplit.roleLaw_eq
    (fun label : SuppliedPathStages.TerminalLabels => SuppliedTerminalRoles.role label.val.source label.val.selected) axis label).symm

/-- Each original fixed phase has its exact original source-window presentation. -/
def presentation (phase : Phase) : Mixed.RationalStage.PhysicalPresentation (SuppliedPathStages.fixed phase) := by
  cases phase with
  | level4 => exact level4
  | level3 => exact level3
  | terminal => exact terminal

/-- Shared phases retain their original source, role, child-law, and allocation-history labels in one presentation. -/
def shared {S : Type} [Fintype S] (phase : S → Phase) :
    Mixed.RationalStage.PhysicalPresentation (Mixed.RationalStage.combine (fun sector => SuppliedPathStages.fixed (phase sector))) where
  original index := (presentation (phase index.1)).original index.2
  role index := (presentation (phase index.1)).role index.2
  law index := (presentation (phase index.1)).law index.2
  splits_eq index := (presentation (phase index.1)).splits_eq index.2
  laws_eq index axis := (presentation (phase index.1)).laws_eq index.2 axis

end
end MatrixBounds.Numeric.SuppliedStagePresentations
