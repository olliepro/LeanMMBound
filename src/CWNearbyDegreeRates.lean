import CWDegreeControlShrink
import CWRetentionContinuity

/-! A single nominal fine-axis rate controls every nearby exact child profile.
This is the uniform estimate needed before choosing a common output count and
gluing all exact types in a tolerance window. -/
namespace MatrixBounds.Tensor.CW.SplitRestrictionData

universe u
open Empirical Numeric
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p

/-- One child tolerance gives the nominal-law degree bound uniformly over every feasible exact profile and parent population. -/
theorem exists_uniform_nearby_degree_rate (length : ℕ) {error : ℝ} (positive : 0 < error) :
    ∃ delta > 0, ∀ (P : Type u) [Fintype P] [Nonempty P] (control : DegreeControl.{u} length (error/2)),
      control.threshold ≤ Fintype.card P →
      ∀ (data : SplitRestrictionData length) (_symmetric : data.Symmetric)
        (_reference : data.PrescribedEdges (P := P)) (axis : Shape → ℕ)
        (_additive : ∀ left right, axis (addShape left right) = axis left + axis right)
        (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
        (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
        (_support : ∀ child block, fineTotal block ≠ axis child.val → profile child block = 0)
        (_representative : data.TargetParts profile)
        (law : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℝ),
      (∀ child symbol, 0 ≤ law child symbol ∧ law child symbol ≤ 1) →
      (∀ child symbol, |data.childLaw profile child symbol-law child symbol| ≤ delta) →
      (data.windowDegree axis axisClass profile (Within (P := P) (data.parentCenter (P := P) profile) control.tolerance) : ℝ)/
          Fintype.card (TypedWord (P := P) data.split) ≤
        Real.exp (-(Fintype.card P : ℝ)*(data.lawRetention (P := P) axisClass law-error)) := by
  obtain ⟨delta, positiveDelta, continuous⟩ := exists_uniform_retention_tolerance length (half_pos positive)
  refine ⟨delta, positiveDelta, ?_⟩
  intro P finite nonempty control large data symmetric reference axis additive axisClass profile support representative law range close
  have rateClose := continuous P data reference axisClass (data.childLaw profile) law
    (data.child_profile_range profile representative) range close
  rw [← data.fineRetention_childLaw axisClass profile representative] at rateClose
  have lower : data.lawRetention (P := P) axisClass law-error ≤ data.fineRetention (P := P) axisClass profile-error/2 := by
    have := (abs_lt.mp rateClose).1
    linarith
  apply (control.fine P large data symmetric reference axis additive axisClass profile support representative).trans
  apply Real.exp_le_exp.mpr
  have multiplied := mul_le_mul_of_nonneg_left lower (Nat.cast_nonneg (Fintype.card P) : (0 : ℝ) ≤ _)
  linarith

end
end MatrixBounds.Tensor.CW.SplitRestrictionData
