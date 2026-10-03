module

public import CWRootCoarseRates
public import CWRootFineRates

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! The root's three actual collision degrees share one entropy retention
rate and one threshold chosen before all exact profiles and positive potentials. -/
namespace MatrixBounds.Tensor.CW.RootRestrictionData

open Empirical Numeric
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {P : Type*} [Fintype P] {length : ℕ}

/-- The root limiting axis is selected after computing all three normalized entropy rates. -/
def retention (data : RootRestrictionData length) (ux uy uz : Fin (2*length+1) → ℝ) : ℝ :=
  min (data.coarseRetention (P := P) ux uy uz)
    (min (fineRetention (P := P) yClass data.fineY) (fineRetention (P := P) zClass data.fineZ))

/-- One population threshold bounds all actual root collision degrees by the minimum entropy rate. -/
theorem exists_uniform_degree_rate (length : ℕ) {error : ℝ} (positive : 0 < error) :
    ∃ threshold : ℕ, ∀ (P : Type*) [Fintype P] [Nonempty P], threshold ≤ Fintype.card P →
      ∀ (data : RootRestrictionData length) (_reference : data.PrescribedEdges (P := P))
        (_representativeY : data.TargetParts data.fineY) (_representativeZ : data.TargetParts data.fineZ)
        (ux uy uz : Fin (2*length+1) → ℝ),
      (∀ b, 0 < ux b) → (∀ b, 0 < uy b) → (∀ b, 0 < uz b) →
      let bound := Real.exp (-((Fintype.card P : ℝ)*(data.retention (P := P) ux uy uz-error)))
      (data.coarseDegree (P := P) : ℝ)/Fintype.card (TypedWord (P := P) data.split) ≤ bound ∧
      (data.fineDegree (P := P) Shape.y yClass data.fineY : ℝ)/Fintype.card (TypedWord (P := P) data.split) ≤ bound ∧
      (data.fineDegree (P := P) Shape.z zClass data.fineZ : ℝ)/Fintype.card (TypedWord (P := P) data.split) ≤ bound := by
  obtain ⟨coarseThreshold, coarse⟩ := exists_uniform_coarse_rate length positive
  obtain ⟨fineThreshold, fine⟩ := exists_uniform_fine_rate length positive
  refine ⟨max coarseThreshold fineThreshold, ?_⟩
  intro P finite nonempty large data reference representativeY representativeZ ux uy uz positiveX positiveY positiveZ
  have hx := coarse P ((le_max_left _ _).trans large) data reference ux uy uz positiveX positiveY positiveZ
  have hy := fine P ((le_max_right _ _).trans large) data (data.prescribedWordEquiv reference) Shape.y yClass data.fineY representativeY
  have hz := fine P ((le_max_right _ _).trans large) data (data.prescribedWordEquiv reference) Shape.z zClass data.fineZ representativeZ
  have liftRate {degree : ℕ} {rate : ℝ}
      (bound : (degree : ℝ)/Fintype.card (TypedWord (P := P) data.split) ≤
        Real.exp (-(Fintype.card P : ℝ)*(rate-error))) (smaller : data.retention (P := P) ux uy uz ≤ rate) :
      (degree : ℝ)/Fintype.card (TypedWord (P := P) data.split) ≤
        Real.exp (-((Fintype.card P : ℝ)*(data.retention (P := P) ux uy uz-error))) := by
    apply bound.trans
    apply Real.exp_le_exp.mpr
    nlinarith [mul_le_mul_of_nonneg_left smaller (Nat.cast_nonneg (Fintype.card P) : (0 : ℝ) ≤ _)]
  exact ⟨liftRate hx (min_le_left _ _), liftRate hy ((min_le_right _ _).trans (min_le_left _ _)),
    liftRate hz ((min_le_right _ _).trans (min_le_right _ _))⟩

end
end MatrixBounds.Tensor.CW.RootRestrictionData
