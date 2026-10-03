module

public import CWDegreeControl

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Degree control remains valid in every smaller positive parent window.
This lets the exact extraction fit inside a previously available interface. -/
namespace MatrixBounds.Tensor.CW.SplitRestrictionData

universe u
open Empirical Numeric
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {P : Type*} [Fintype P] {length : ℕ}

/-- Shrinking the accepted set can only decrease the actual maximum fine compatibility degree. -/
theorem windowDegree_mono (data : SplitRestrictionData length) (axis : Shape → ℕ)
    (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
    (narrow wide : (P → Fin (length+length) → Fin 3) → Prop)
    (inclusion : ∀ fine, narrow fine → wide fine) :
    data.windowDegree axis axisClass profile narrow ≤ data.windowDegree axis axisClass profile wide := by
  unfold windowDegree
  apply Finset.sup_le
  intro fine _
  split_ifs with accepted
  · exact data.degree_le_windowDegree axis axisClass profile wide fine (inclusion fine accepted)
  · exact Nat.zero_le _

/-- A smaller positive tolerance preserves the same uniform threshold and entropy rates. -/
def DegreeControl.shrink {error tolerance : ℝ} (control : DegreeControl.{u} length error)
    (positive : 0 < tolerance) (smaller : tolerance ≤ control.tolerance) : DegreeControl.{u} length error where
  threshold := control.threshold
  tolerance := tolerance
  positiveTolerance := positive
  coarse := control.coarse
  fine := by
    intro P finite nonempty large data symmetric reference axis additive axisClass profile support representative
    have bound := control.fine P large data symmetric reference axis additive axisClass profile support representative
    have degree := data.windowDegree_mono axis axisClass profile
      (Within (P := P) (data.parentCenter (P := P) profile) tolerance)
      (Within (P := P) (data.parentCenter (P := P) profile) control.tolerance)
      (fun fine inside => within_mono _ fine smaller inside)
    exact (div_le_div_of_nonneg_right (Nat.cast_le.mpr degree)
      (Nat.cast_nonneg (Fintype.card (TypedWord (P := P) data.split)))).trans bound

/-- Every positive upper tolerance permits proved uniform degree control within that upper tolerance. -/
theorem degreeControl_arbitrarily_small (length : ℕ) {error maximum : ℝ}
    (positiveError : 0 < error) (positiveMaximum : 0 < maximum) :
    ∃ control : DegreeControl.{u} length error, control.tolerance ≤ maximum := by
  let control : DegreeControl.{u} length error := degreeControl length positiveError
  refine ⟨control.shrink (lt_min control.positiveTolerance positiveMaximum) (min_le_left _ _), ?_⟩
  exact min_le_right _ _

end
end MatrixBounds.Tensor.CW.SplitRestrictionData
