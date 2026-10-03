module

public import CWPermutedTerminalDegreeControl
public import CWPermutedTerminalMixedTarget
public import CWTerminalExtraction

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! One shared extraction for differently oriented terminal parents. The
physical rates are summed across all types before selecting the limiting axis. -/
namespace MatrixBounds.Tensor.CW.Terminal

universe v
open Empirical Numeric Selection RepairRates
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {K T : Type*} [CommRing K] [Fintype T]

/-- The shared terminal retention exponent in the assigned physical orientations. -/
def permutedRetention (axes : T → Equiv.Perm (Fin 3)) (error : ℝ) (extreme middle : T → ℕ) : ℝ :=
  Mixed.mixedRetention (fun type => permutedRate (axes type) error (extreme type) (middle type) 0)
    (fun type => permutedRate (axes type) error (extreme type) (middle type) 1)
    (fun type => permutedRate (axes type) error (extreme type) (middle type) 2)

set_option maxHeartbeats 1500000 in
/-- Fixed windows and thresholds supply actual mixed matrix copies for all
physical terminal assignments, with the exact shared-prime finite bounds. -/
theorem exists_permuted_terminal_extraction_window {error maximum : ℝ}
    (positiveError : 0 < error) (positiveMaximum : 0 < maximum) :
    ∃ threshold : ℕ, ∃ tolerance : ℝ, 0 < tolerance ∧ tolerance ≤ maximum ∧
      ∀ (axes : T → Equiv.Perm (Fin 3)) (extreme middle : T → ℕ),
      (∀ type, 0 < extreme type+middle type) → (∀ type, threshold ≤ 2*(extreme type+middle type)) →
      ∀ (q k bits : ℕ) (multiplier : T → ℕ), 0 < k →
      3*(Mixed.parentRepairConstant (fun _ : T => 1) multiplier (fun _ => tolerance)+1) ≤ k →
      q+2 ≤ 2^bits →
      (∀ type, scale k ≤ multiplier type*(2*(extreme type+middle type))) →
      (∀ type, 2*(extreme type+middle type) ≤ multiplier type*scale k) →
      let terminal := fun type => permutedData (axes type) (extreme type) (middle type)
      let Positions := fun type => Fin (2*(extreme type+middle type))
      let rate := permutedRetention axes error extreme middle
      ∃ prime copies : ℕ, prime.Prime ∧
        (prime : ℝ) ≤ 2*modulusFactor 2 (scale k)*
          ((Nat.card (Mixed.PrescribedEdges Positions terminal) : ℝ)*Real.exp (-rate)) ∧
        Real.exp rate/(12*modulusFactor 2 (scale k))*Real.exp (-4*Real.sqrt (Real.log prime)) ≤ copies ∧
        ContextReduction.{v} (Mixed.parentInterface (K := K) terminal q
          (Mixed.parentWindows (Positions := Positions) terminal (fun type => (terminal type).fineX) (fun _ => tolerance))
          (Mixed.parentWindows (Positions := Positions) terminal (fun type => (terminal type).fineY) (fun _ => tolerance))
          (Mixed.parentWindows (Positions := Positions) terminal (fun type => (terminal type).fineZ) (fun _ => tolerance)))
          (directSum (fun _ : Fin copies => MatrixMul.tensor (K := K)
            (I := PermutedMixedRows axes q extreme middle) (J := PermutedMixedInner axes q extreme middle)
            (L := PermutedMixedColumns axes q extreme middle)))
          (2^(3*coverLength (Mixed.repairGrowth (fun _ : T => 1) (fun _ => 3) multiplier bits) k)) := by
  obtain ⟨threshold, tolerance, positiveTolerance, withinMaximum, bounds⟩ :=
    exists_uniform_permuted_rates positiveError positiveMaximum
  refine ⟨threshold, tolerance, positiveTolerance, withinMaximum, ?_⟩
  intro axes extreme middle positive large q k bits multiplier positiveK repair alphabet lower upper
  dsimp only
  letI (type : T) : Nonempty (Fin (2*(extreme type+middle type))) := ⟨⟨0, by have := positive type; omega⟩⟩
  have rates type := bounds (axes type) (extreme type) (middle type) (positive type) (large type)
  obtain ⟨prime, copies, primality, primeBound, copiesBound, extracted⟩ :=
    Mixed.finite_contextual_rate_extraction.{v} (K := K)
      (fun type => permutedData (axes type) (extreme type) (middle type))
      (fun type => permuted_counts_symmetric (axes type) (extreme type) (middle type)) q
      (fun type => permutedReference (axes type) (extreme type) (middle type))
      (fun type child word outside => one_letter_profile_support (shapeYIndex child)
        (2*permutedCounts (axes type) (extreme type) (middle type) child) word outside)
      (fun type child word outside => one_letter_profile_support (shapeZIndex child)
        (2*permutedCounts (axes type) (extreme type) (middle type) child) word outside)
      (fun type => permutedRepresentativeX (axes type) (extreme type) (middle type))
      (fun type => permutedRepresentativeY (axes type) (extreme type) (middle type))
      (fun type => permutedRepresentativeZ (axes type) (extreme type) (middle type))
      (fun _ => tolerance) (fun _ => positiveTolerance) k bits 2 (fun _ => 3) multiplier
      positiveK repair alphabet (fun _ => terminal_shape_bits)
      (by simpa only [Fintype.card_fin] using lower)
      (by simpa only [Fintype.card_fin] using upper) (by norm_num) (fun _ => by norm_num)
      (fun type => permutedRate (axes type) error (extreme type) (middle type) 0)
      (fun type => permutedRate (axes type) error (extreme type) (middle type) 1)
      (fun type => permutedRate (axes type) error (extreme type) (middle type) 2)
      (fun type => by simpa only [← Nat.card_eq_fintype_card] using (rates type).1)
      (fun type => by simpa only [← Nat.card_eq_fintype_card] using (rates type).2.1)
      (fun type => by simpa only [← Nat.card_eq_fintype_card] using (rates type).2.2)
  refine ⟨prime, copies, primality, ?_, copiesBound, ?_⟩
  · simpa only [← Nat.card_eq_fintype_card] using! primeBound
  · simpa only [one_mul] using extracted.trans
      ((contextReduction_permuted_mixed_matrix (K := K) axes q extreme middle).batch (I := Fin copies))

end
end MatrixBounds.Tensor.CW.Terminal
