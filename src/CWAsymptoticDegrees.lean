module

public import CWCoarseRates
public import CWCompatibilityRates

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Uniform thresholds absorb all finite degree-counting errors. The threshold
and window tolerance are chosen before the population and exact profiles. -/
namespace MatrixBounds.Tensor.CW.SplitRestrictionData

open Empirical Numeric
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p

/-- Above a fixed threshold, one parent tolerance yields the full fine-degree rate with any requested positive loss. -/
theorem exists_eventual_fine_rate (length : ℕ) {error : ℝ} (positive : 0 < error) :
    ∃ threshold : ℕ, ∃ tolerance > 0, ∀ (P : Type*) [Fintype P] [Nonempty P],
      threshold ≤ Fintype.card P →
      ∀ (data : SplitRestrictionData length) (_symmetric : data.Symmetric)
        (_reference : data.PrescribedEdges (P := P)) (axis : Shape → ℕ)
        (_additive : ∀ left right, axis (addShape left right) = axis left + axis right)
        (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
        (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
        (_support : ∀ child block, fineTotal block ≠ axis child.val → profile child block = 0)
        (_representative : data.TargetParts profile),
      (data.windowDegree axis axisClass profile (Within (P := P) (data.parentCenter (P := P) profile) tolerance) : ℝ)/
          Fintype.card (TypedWord (P := P) data.split) ≤
        Real.exp (-(Fintype.card P : ℝ)*(data.fineRetention (P := P) axisClass profile-error)) := by
  obtain ⟨tolerance, positiveTolerance, bound⟩ := exists_uniform_fine_rate length (half_pos positive)
  obtain ⟨threshold, errors⟩ := Selection.logarithmic_error_eventually
    (constant := (fineErrorConstant length : ℝ)) (growth := 2) (Nat.cast_nonneg _) (by norm_num) (half_pos positive)
  refine ⟨threshold, tolerance, positiveTolerance, ?_⟩
  intro P finite nonempty large data symmetric reference axis additive axisClass profile support representative
  apply (bound P data symmetric reference axis additive axisClass profile support representative).trans
  apply Real.exp_le_exp.mpr
  have small := errors (Fintype.card P) large
  nlinarith

end
end MatrixBounds.Tensor.CW.SplitRestrictionData
