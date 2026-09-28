import CWTerminalParentLaws
import CWOneLetterProfileLaws

/-! Identify the centers of the actual terminal parent windows. These equalities
include empty child pools, whose contribution is removed by its zero weight. -/
namespace MatrixBounds.Tensor.CW.Terminal

open Empirical Numeric
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A

/-- The actual X-window center is the balanced full binary parent law. -/
theorem terminal_center_x (extreme middle : ℕ) (positive : 0 < extreme+middle) :
    (data (counts extreme middle)).parentCenter (P := Fin (2*(extreme+middle)))
      (data (counts extreme middle)).fineX = binaryParentLaw := by
  rw [SplitRestrictionData.parentCenter_childLaw]
  change (data (counts extreme middle)).parentLaw (P := Fin (2*(extreme+middle)))
    ((data (counts extreme middle)).childLaw (fun child => oneLetterProfile (shapeXIndex child)
      (2*(data (counts extreme middle)).split child))) = _
  rw [one_letter_childLaw, SplitRestrictionData.parentLaw_active _ (counts_symmetric extreme middle)]
  exact terminal_parent_law_x extreme middle positive

/-- The actual Y-window center is the same balanced full binary parent law. -/
theorem terminal_center_y (extreme middle : ℕ) (positive : 0 < extreme+middle) :
    (data (counts extreme middle)).parentCenter (P := Fin (2*(extreme+middle)))
      (data (counts extreme middle)).fineY = binaryParentLaw := by
  rw [SplitRestrictionData.parentCenter_childLaw]
  change (data (counts extreme middle)).parentLaw (P := Fin (2*(extreme+middle)))
    ((data (counts extreme middle)).childLaw (fun child => oneLetterProfile (shapeYIndex child)
      (2*(data (counts extreme middle)).split child))) = _
  rw [one_letter_childLaw, SplitRestrictionData.parentLaw_active _ (counts_symmetric extreme middle)]
  exact terminal_parent_law_y extreme middle positive

/-- The actual Z-window center has the three prescribed terminal masses. -/
theorem terminal_center_z (extreme middle : ℕ) (positive : 0 < extreme+middle) :
    (data (counts extreme middle)).parentCenter (P := Fin (2*(extreme+middle)))
      (data (counts extreme middle)).fineZ = ternaryParentLaw (parameter extreme middle) := by
  rw [SplitRestrictionData.parentCenter_childLaw]
  change (data (counts extreme middle)).parentLaw (P := Fin (2*(extreme+middle)))
    ((data (counts extreme middle)).childLaw (fun child => oneLetterProfile (shapeZIndex child)
      (2*(data (counts extreme middle)).split child))) = _
  rw [one_letter_childLaw, SplitRestrictionData.parentLaw_active _ (counts_symmetric extreme middle)]
  exact terminal_parent_law_z extreme middle positive

end
end MatrixBounds.Tensor.CW.Terminal
