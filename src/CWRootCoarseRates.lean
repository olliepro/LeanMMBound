module

public import CWRootCoarseEntropy
public import LogarithmicLoss

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! The coarse rate is marginal entropy minus the Gibbs upper bound on the
entropy penalty. Its finite counting error is explicitly logarithmic. -/
namespace MatrixBounds.Tensor.CW.RootRestrictionData

open Empirical Numeric
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {P : Type*} [Fintype P] [Nonempty P] {length : ℕ}

/-- Gibbs upper bound on the entropy of the complete admissible marginal graph. -/
def gibbsCost (data : RootRestrictionData length) (ux uy uz : Fin (2*length+1) → ℝ) : ℝ :=
  Real.log (∑ a : SplitAlphabet (rootBox (2*length)) (2*length), ux (splitXIndex a)*uy (splitYIndex a)*uz (splitZIndex a)) -
    ((∑ b, ((data.coarse 0) b : ℝ)/Fintype.card P*Real.log (ux b)) +
      (∑ b, ((data.coarse 1) b : ℝ)/Fintype.card P*Real.log (uy b)) +
      ∑ b, ((data.coarse 2) b : ℝ)/Fintype.card P*Real.log (uz b))

/-- Coarse-X retention: marginal entropy plus prescribed split entropy minus the Gibbs entropy bound. -/
def coarseRetention (data : RootRestrictionData length) (ux uy uz : Fin (2*length+1) → ℝ) : ℝ :=
  Entropy.entropy (fun b => ((data.coarse 0) b : ℝ)/Fintype.card P) +
    Entropy.entropy (fun a => (data.split a : ℝ)/Fintype.card P) - data.gibbsCost (P := P) ux uy uz

/-- Fixed alphabet constant in the coarse degree's logarithmic error. -/
def coarseErrorConstant (length : ℕ) : ℕ :=
  Fintype.card (Fin (2*length+1)) + Fintype.card (ShapeAlphabet (2*length))

/-- Multiplying normalized log weights by the nonempty population recovers their exact count weights. -/
theorem scaled_log_weights {A : Type*} [Fintype A] (counts : A → ℕ) (weights : A → ℝ) :
    (Fintype.card P : ℝ)*(∑ a, (counts a : ℝ)/Fintype.card P*Real.log (weights a)) =
      ∑ a, (counts a : ℝ)*Real.log (weights a) := by
  rw [Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro a _
  have nonzero : (Fintype.card P : ℝ) ≠ 0 := by exact_mod_cast (Fintype.card_pos (α := P)).ne'
  field_simp

/-- Exact conversion of the finite coarse exponent into a normalized retention rate plus its counting error. -/
theorem coarseDegreeExponent_eq (data : RootRestrictionData length) (ux uy uz : Fin (2*length+1) → ℝ) :
    data.coarseDegreeExponent (P := P) ux uy uz =
      -(Fintype.card P : ℝ)*data.coarseRetention (P := P) ux uy uz +
        coarseErrorConstant length*(Real.log ((Fintype.card P : ℝ)+1)+1) := by
  have hx := scaled_log_weights (P := P) (data.coarse 0) ux
  have hy := scaled_log_weights (P := P) (data.coarse 1) uy
  have hz := scaled_log_weights (P := P) (data.coarse 2) uz
  unfold coarseDegreeExponent coarseRetention gibbsCost coarseErrorConstant
  push_cast
  rw [← hx, ← hy, ← hz]
  ring

/-- The actual normalized maximum coarse degree is bounded by its retention exponent and a finite logarithmic error. -/
theorem coarse_degree_rate (data : RootRestrictionData length) (reference : data.PrescribedEdges (P := P))
    (ux uy uz : Fin (2*length+1) → ℝ)
    (positiveX : ∀ b, 0 < ux b) (positiveY : ∀ b, 0 < uy b) (positiveZ : ∀ b, 0 < uz b) :
    (data.coarseDegree (P := P) : ℝ)/Fintype.card (TypedWord (P := P) data.split) ≤
      Real.exp (-(Fintype.card P : ℝ)*data.coarseRetention (P := P) ux uy uz +
        coarseErrorConstant length*(Real.log ((Fintype.card P : ℝ)+1)+1)) := by
  rw [← data.coarseDegreeExponent_eq]
  exact data.coarse_degree_entropy reference ux uy uz positiveX positiveY positiveZ

/-- Any positive loss absorbs the coarse counting error above one threshold independent of profiles and Gibbs potentials. -/
theorem exists_uniform_coarse_rate (length : ℕ) {error : ℝ} (positive : 0 < error) :
    ∃ threshold : ℕ, ∀ (P : Type*) [Fintype P] [Nonempty P], threshold ≤ Fintype.card P →
      ∀ (data : RootRestrictionData length) (_reference : data.PrescribedEdges (P := P))
        (ux uy uz : Fin (2*length+1) → ℝ),
      (∀ b, 0 < ux b) → (∀ b, 0 < uy b) → (∀ b, 0 < uz b) →
      (data.coarseDegree (P := P) : ℝ)/Fintype.card (TypedWord (P := P) data.split) ≤
        Real.exp (-(Fintype.card P : ℝ)*(data.coarseRetention (P := P) ux uy uz-error)) := by
  obtain ⟨threshold, errors⟩ := Selection.logarithmic_error_eventually
    (constant := (coarseErrorConstant length : ℝ)) (growth := 1) (Nat.cast_nonneg _) (by norm_num) positive
  refine ⟨threshold, ?_⟩
  intro P finite nonempty large data reference ux uy uz positiveX positiveY positiveZ
  apply (data.coarse_degree_rate reference ux uy uz positiveX positiveY positiveZ).trans
  apply Real.exp_le_exp.mpr
  have small := errors (Fintype.card P) large
  simp only [one_mul] at small
  nlinarith

end
end MatrixBounds.Tensor.CW.RootRestrictionData
