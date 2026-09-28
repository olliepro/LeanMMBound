import CWWindowEntropy

/-! The fine-degree entropy tolerance is chosen once, before the population,
split profile, or child profiles. This quantifier order keeps repair constants
fixed throughout the asymptotic extraction sequence. -/
namespace MatrixBounds.Tensor.CW.SplitRestrictionData

open Empirical Numeric
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p

/-- One tolerance controls the actual normalized accepted-word degree for all populations and feasible profiles of a fixed child length. -/
theorem exists_uniform_window_degree_entropy (length : ℕ) {error : ℝ} (positive : 0 < error) :
    ∃ tolerance > 0, ∀ (P : Type*) [Fintype P] [Nonempty P]
      (data : SplitRestrictionData length) (_symmetric : data.Symmetric)
      (reference : data.PrescribedEdges (P := P)) (axis : Shape → ℕ)
      (_additive : ∀ left right, axis (addShape left right) = axis left + axis right)
      (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
      (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
      (_support : ∀ child block, fineTotal block ≠ axis child.val → profile child block = 0)
      (_representative : data.TargetParts profile),
      (data.windowDegree axis axisClass profile (Within (P := P) (data.parentCenter (P := P) profile) tolerance) : ℝ)/
          Fintype.card (TypedWord (P := P) data.split) ≤
        Real.exp (data.compatibilityCost reference axisClass profile -
          (Fintype.card P : ℝ)*(Entropy.entropy (data.parentCenter (P := P) profile)-error) + parentTypeError P length) := by
  obtain ⟨delta, deltaPositive, control⟩ := Entropy.entropy_uniform_tolerance
    (A := Fin (length+length) → Fin 3) positive
  refine ⟨delta/2, half_pos deltaPositive, ?_⟩
  intro P finite nonempty data symmetric reference axis additive axisClass profile support representative
  apply data.window_degree_entropy symmetric reference axis additive axisClass profile support representative
    (data.parentCenter (P := P) profile) (delta/2) error
  intro fine accepted
  have close := control (fun symbol => (count fine symbol : ℝ)/Fintype.card P)
    (data.parentCenter (P := P) profile) (empirical_probability_range fine)
    (data.parentCenter_range reference profile representative)
    (fun symbol => (accepted symbol).trans_lt (half_lt_self deltaPositive))
  have lower := (abs_lt.mp close).1
  linarith

end
end MatrixBounds.Tensor.CW.SplitRestrictionData
