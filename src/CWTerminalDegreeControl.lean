module

public import CWTerminalRetention
public import CWDegreeControlShrink
public import CWFiniteExtraction

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! A single population threshold and positive window simultaneously realize
all three terminal rates, including endpoint laws, from the actual finite counts. -/
namespace MatrixBounds.Tensor.CW.Terminal

open Empirical Numeric Entropy
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A

set_option maxHeartbeats 1000000 in
/-- Uniform terminal degree bounds with arbitrary positive entropy loss.
The window and threshold are fixed before either integer split count is chosen. -/
theorem exists_uniform_terminal_rates {error maximum : ℝ}
    (positiveError : 0 < error) (positiveMaximum : 0 < maximum) :
    ∃ threshold : ℕ, ∃ tolerance : ℝ, 0 < tolerance ∧ tolerance ≤ maximum ∧
      ∀ extreme middle : ℕ, 0 < extreme+middle → threshold ≤ 2*(extreme+middle) →
      let terminal := data (counts extreme middle)
      let Positions := Fin (2*(extreme+middle))
      let population : ℝ := 2*((extreme : ℝ)+middle)
      let jointCount := Fintype.card (TypedWord (P := Positions) terminal.split)
      (terminal.coarseDegree (P := Positions) : ℝ)/jointCount ≤ Real.exp (-population*(Real.log 2-error)) ∧
      (terminal.windowDegree Shape.y yClass terminal.fineY
        (terminal.parentWindow (P := Positions) terminal.fineY tolerance) : ℝ)/jointCount ≤
          Real.exp (-population*(Real.log 2-error)) ∧
      (terminal.windowDegree Shape.z zClass terminal.fineZ
        (terminal.parentWindow (P := Positions) terminal.fineZ tolerance) : ℝ)/jointCount ≤
          Real.exp (-population*(entropy (![parameter extreme middle, 1-2*parameter extreme middle,
            parameter extreme middle] : Fin 3 → ℝ)-error)) := by
  obtain ⟨control, withinMaximum⟩ :=
    SplitRestrictionData.degreeControl_arbitrarily_small.{0} 1 positiveError positiveMaximum
  obtain ⟨coarseThreshold, smallError⟩ := Selection.logarithmic_error_eventually
    (constant := 3) (growth := 1) (by norm_num) (by norm_num) positiveError
  refine ⟨max coarseThreshold control.threshold, control.tolerance, control.positiveTolerance, withinMaximum, ?_⟩
  intro extreme middle positive large
  dsimp only
  letI : Nonempty (Fin (2*(extreme+middle))) := ⟨⟨0, by omega⟩⟩
  have coarseLarge : coarseThreshold ≤ 2*(extreme+middle) := (le_max_left _ _).trans large
  have fineLarge : control.threshold ≤ Fintype.card (Fin (2*(extreme+middle))) := by
    simpa only [Fintype.card_fin] using (le_max_right coarseThreshold control.threshold).trans large
  refine ⟨?_, ?_, ?_⟩
  · apply (terminal_coarse_degree_binary extreme middle positive).trans
    apply Real.exp_le_exp.mpr
    have loss := smallError (2*(extreme+middle)) coarseLarge
    norm_num only [one_mul, Nat.cast_mul, Nat.cast_add, Nat.cast_ofNat] at loss
    nlinarith
  · have bound := control.fine (Fin (2*(extreme+middle))) fineLarge (data (counts extreme middle))
      (counts_symmetric extreme middle) (countsReference extreme middle) Shape.y (fun _ _ => rfl)
      yClass (data (counts extreme middle)).fineY
      (fun child word outside => one_letter_profile_support (shapeYIndex child)
        (2*fullProfile (counts extreme middle) child) word outside)
      (representativeY (counts extreme middle))
    rw [terminal_y_fine_retention extreme middle positive] at bound
    simpa only [← Nat.card_eq_fintype_card, Nat.card_fin, Nat.cast_mul, Nat.cast_add,
      Nat.cast_ofNat, SplitRestrictionData.parentWindow] using bound
  · have bound := control.fine (Fin (2*(extreme+middle))) fineLarge (data (counts extreme middle))
      (counts_symmetric extreme middle) (countsReference extreme middle) Shape.z (fun _ _ => rfl)
      zClass (data (counts extreme middle)).fineZ
      (fun child word outside => one_letter_profile_support (shapeZIndex child)
        (2*fullProfile (counts extreme middle) child) word outside)
      (representativeZ (counts extreme middle))
    rw [terminal_z_fine_retention extreme middle positive] at bound
    simpa only [← Nat.card_eq_fintype_card, Nat.card_fin, Nat.cast_mul, Nat.cast_add,
      Nat.cast_ofNat, SplitRestrictionData.parentWindow] using bound

end
end MatrixBounds.Tensor.CW.Terminal
