import CWPermutedTerminalRates
import CWDegreeControlShrink
import CWFiniteExtraction

/-! A single small window and population threshold control all terminal
physical orientations simultaneously, before their integer counts are chosen. -/
namespace MatrixBounds.Tensor.CW.Terminal

open Empirical Numeric Entropy
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A

/-- Finite retention rate on one physical axis of a permuted terminal constituent. -/
def permutedRate (axes : Equiv.Perm (Fin 3)) (error : ℝ) (extreme middle : ℕ) (axis : Fin 3) : ℝ :=
  (2*((extreme : ℝ)+middle))*(axisEntropy extreme middle (axes axis)-error)

set_option maxHeartbeats 1200000 in
/-- Every terminal orientation obeys the three actual normalized degree bounds
with one population-independent window smaller than any prescribed positive width. -/
theorem exists_uniform_permuted_rates {error maximum : ℝ}
    (positiveError : 0 < error) (positiveMaximum : 0 < maximum) :
    ∃ threshold : ℕ, ∃ tolerance : ℝ, 0 < tolerance ∧ tolerance ≤ maximum ∧
      ∀ (axes : Equiv.Perm (Fin 3)) (extreme middle : ℕ),
      0 < extreme+middle → threshold ≤ 2*(extreme+middle) →
      let terminal := permutedData axes extreme middle
      let Positions := Fin (2*(extreme+middle))
      let jointCount := Nat.card (TypedWord (P := Positions) terminal.split)
      (terminal.coarseDegree (P := Positions) : ℝ)/jointCount ≤ Real.exp (-permutedRate axes error extreme middle 0) ∧
      (terminal.windowDegree Shape.y yClass terminal.fineY
        (terminal.parentWindow (P := Positions) terminal.fineY tolerance) : ℝ)/jointCount ≤
          Real.exp (-permutedRate axes error extreme middle 1) ∧
      (terminal.windowDegree Shape.z zClass terminal.fineZ
        (terminal.parentWindow (P := Positions) terminal.fineZ tolerance) : ℝ)/jointCount ≤
          Real.exp (-permutedRate axes error extreme middle 2) := by
  obtain ⟨control, withinMaximum⟩ :=
    SplitRestrictionData.degreeControl_arbitrarily_small.{0} 1 positiveError positiveMaximum
  obtain ⟨coarseThreshold, smallError⟩ := Selection.logarithmic_error_eventually
    (constant := 3) (growth := 1) (by norm_num) (by norm_num) positiveError
  refine ⟨max coarseThreshold control.threshold, control.tolerance, control.positiveTolerance, withinMaximum, ?_⟩
  intro axes extreme middle positive large
  dsimp only
  letI : Nonempty (Fin (2*(extreme+middle))) := ⟨⟨0, by omega⟩⟩
  have coarseLarge : coarseThreshold ≤ 2*(extreme+middle) := (le_max_left _ _).trans large
  have fineLarge : control.threshold ≤ Fintype.card (Fin (2*(extreme+middle))) := by
    simpa only [Fintype.card_fin] using (le_max_right coarseThreshold control.threshold).trans large
  refine ⟨?_, ?_, ?_⟩
  · apply (permuted_coarse_degree_rate axes extreme middle positive).trans
    apply Real.exp_le_exp.mpr
    have loss := smallError (2*(extreme+middle)) coarseLarge
    norm_num only [one_mul, Nat.cast_mul, Nat.cast_add, Nat.cast_ofNat] at loss
    unfold permutedRate
    nlinarith
  · have bound := control.fine (Fin (2*(extreme+middle))) fineLarge (permutedData axes extreme middle)
      (permuted_counts_symmetric axes extreme middle) (permutedReference axes extreme middle) Shape.y (fun _ _ => rfl)
      yClass (permutedData axes extreme middle).fineY
      (fun child word outside => one_letter_profile_support (shapeYIndex child)
        (2*permutedCounts axes extreme middle child) word outside)
      (permutedRepresentativeY axes extreme middle)
    rw [permuted_y_fine_retention axes extreme middle positive] at bound
    simpa only [← Nat.card_eq_fintype_card, Nat.card_fin, Nat.cast_mul, Nat.cast_add,
      Nat.cast_ofNat, SplitRestrictionData.parentWindow, permutedRate, neg_mul] using bound
  · have bound := control.fine (Fin (2*(extreme+middle))) fineLarge (permutedData axes extreme middle)
      (permuted_counts_symmetric axes extreme middle) (permutedReference axes extreme middle) Shape.z (fun _ _ => rfl)
      zClass (permutedData axes extreme middle).fineZ
      (fun child word outside => one_letter_profile_support (shapeZIndex child)
        (2*permutedCounts axes extreme middle child) word outside)
      (permutedRepresentativeZ axes extreme middle)
    rw [permuted_z_fine_retention axes extreme middle positive] at bound
    simpa only [← Nat.card_eq_fintype_card, Nat.card_fin, Nat.cast_mul, Nat.cast_add,
      Nat.cast_ofNat, SplitRestrictionData.parentWindow, permutedRate, neg_mul] using bound

end
end MatrixBounds.Tensor.CW.Terminal
