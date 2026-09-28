import CWAsymptoticDegrees

/-! Package the proved uniform degree estimates with their fixed threshold
and tolerance. The package has a constructor for every positive rate loss. -/
namespace MatrixBounds.Tensor.CW.SplitRestrictionData

universe u
open Empirical Numeric
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p

/-- Population-independent choices and proved degree bounds for one child length and entropy loss. -/
structure DegreeControl (length : ℕ) (error : ℝ) where
  /-- Minimum number of parent positions required by both entropy estimates. -/
  threshold : ℕ
  /-- Fixed positive parent-window tolerance for the fine-degree estimate. -/
  tolerance : ℝ
  /-- The chosen window has positive width. -/
  positiveTolerance : 0 < tolerance
  /-- Every feasible coarse graph above the threshold has its certified Gibbs retention rate. -/
  coarse : ∀ (P : Type u) [Fintype P] [Nonempty P], threshold ≤ Fintype.card P →
    ∀ (data : SplitRestrictionData length) (_reference : data.PrescribedEdges (P := P))
      (ux uy uz : Fin (2*length+1) → ℝ),
    (∀ b, 0 < ux b) → (∀ b, 0 < uy b) → (∀ b, 0 < uz b) →
    (data.coarseDegree (P := P) : ℝ)/Fintype.card (TypedWord (P := P) data.split) ≤
      Real.exp (-(Fintype.card P : ℝ)*(data.coarseRetention (P := P) ux uy uz-error))
  /-- Every feasible supported fine profile has its certified pooled-entropy retention rate. -/
  fine : ∀ (P : Type u) [Fintype P] [Nonempty P], threshold ≤ Fintype.card P →
    ∀ (data : SplitRestrictionData length) (_symmetric : data.Symmetric)
      (_reference : data.PrescribedEdges (P := P)) (axis : Shape → ℕ)
      (_additive : ∀ left right, axis (addShape left right) = axis left + axis right)
      (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
      (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
      (_support : ∀ child block, fineTotal block ≠ axis child.val → profile child block = 0)
      (_representative : data.TargetParts profile),
    (data.windowDegree axis axisClass profile (Within (P := P) (data.parentCenter (P := P) profile) tolerance) : ℝ)/
        Fintype.card (TypedWord (P := P) data.split) ≤
      Real.exp (-(Fintype.card P : ℝ)*(data.fineRetention (P := P) axisClass profile-error))

/-- The finite counting and continuity proofs construct uniform degree control for every positive loss. -/
theorem degreeControl_exists (length : ℕ) {error : ℝ} (positive : 0 < error) : Nonempty (DegreeControl length error) := by
  obtain ⟨coarseThreshold, coarse⟩ := exists_uniform_coarse_rate length positive
  obtain ⟨fineThreshold, tolerance, positiveTolerance, fine⟩ := exists_eventual_fine_rate length positive
  refine ⟨{
    threshold := max coarseThreshold fineThreshold
    tolerance := tolerance
    positiveTolerance := positiveTolerance
    coarse := ?_
    fine := ?_ }⟩
  · intro P finite nonempty large
    exact coarse P ((le_max_left _ _).trans large)
  · intro P finite nonempty large
    exact fine P ((le_max_right _ _).trans large)

/-- Choose the proved threshold and tolerance; for example, `degreeControl 2 (by norm_num : (0 : ℝ) < 1/100)` controls length-two children. -/
def degreeControl (length : ℕ) {error : ℝ} (positive : 0 < error) : DegreeControl length error :=
  Classical.choice (degreeControl_exists length positive)

end
end MatrixBounds.Tensor.CW.SplitRestrictionData
