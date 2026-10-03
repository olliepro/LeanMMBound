module

public import CWTerminalDegreeControl
public import CWTerminalMixedTarget
public import ContextComposition
public import CWMixedContextualRates

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! A terminal extraction with its actual parent tensors and actual matrix
outputs. The entropy bounds, feasible profiles, and coordinate maps are proved
here, leaving only the explicit finite population and repair requirements. -/
namespace MatrixBounds.Tensor.CW.Terminal

universe v
open Empirical Numeric Entropy Selection RepairRates HashCounting Extraction
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {K T : Type*} [CommRing K] [Fintype T]

/-- Finite binary retention exponent, after the specified loss per parent position. -/
def binaryRate (error : ℝ) (extreme middle : ℕ) : ℝ :=
  (2*((extreme : ℝ)+middle))*(Real.log 2-error)

/-- Finite ternary retention exponent, after the same loss per parent position. -/
def ternaryRate (error : ℝ) (extreme middle : ℕ) : ℝ :=
  (2*((extreme : ℝ)+middle))*(entropy
    (![parameter extreme middle, 1-2*parameter extreme middle, parameter extreme middle] : Fin 3 → ℝ)-error)

/-- The six one-letter child shapes fit in the fixed three-bit edge alphabet. -/
theorem terminal_shape_bits : Fintype.card (ShapeAlphabet 2) ≤ 2^3 := by
  rw [← Fintype.card_congr (shapeColumnEquiv 2), Fintype.card_fin]
  norm_num [shapes, List.range_succ]

set_option maxHeartbeats 3000000 in
/-- Fix the window and threshold before the integer counts. Every sufficiently
large mixed terminal family then extracts actual matrix copies, preserving any
waiting tensor, with the shared-hash minimum taken after summing the rates. -/
theorem exists_terminal_extraction_window {error maximum : ℝ}
    (positiveError : 0 < error) (positiveMaximum : 0 < maximum) :
    ∃ threshold : ℕ, ∃ tolerance : ℝ, 0 < tolerance ∧ tolerance ≤ maximum ∧
      ∀ (extreme middle : T → ℕ), (∀ type, 0 < extreme type+middle type) →
      (∀ type, threshold ≤ 2*(extreme type+middle type)) →
      ∀ (q k bits : ℕ) (multiplier : T → ℕ), 0 < k →
      3*(Mixed.parentRepairConstant (fun _ : T => 1) multiplier (fun _ => tolerance)+1) ≤ k →
      q+2 ≤ 2^bits →
      (∀ type, scale k ≤ multiplier type*(2*(extreme type+middle type))) →
      (∀ type, 2*(extreme type+middle type) ≤ multiplier type*scale k) →
      let terminal := fun type => data (counts (extreme type) (middle type))
      let Positions := fun type => Fin (2*(extreme type+middle type))
      let rate := Mixed.mixedRetention (fun type => binaryRate error (extreme type) (middle type))
        (fun type => binaryRate error (extreme type) (middle type))
        (fun type => ternaryRate error (extreme type) (middle type))
      ∃ prime copies : ℕ, prime.Prime ∧
        (prime : ℝ) ≤ 2*modulusFactor 2 (scale k)*
          ((Nat.card (Mixed.PrescribedEdges Positions terminal) : ℝ)*Real.exp (-rate)) ∧
        Real.exp rate/(12*modulusFactor 2 (scale k))*
          Real.exp (-4*Real.sqrt (Real.log prime)) ≤ copies ∧
        ContextReduction.{v} (Mixed.parentInterface (K := K) terminal q
          (Mixed.parentWindows (Positions := Positions) terminal (fun type => (terminal type).fineX) (fun _ => tolerance))
          (Mixed.parentWindows (Positions := Positions) terminal (fun type => (terminal type).fineY) (fun _ => tolerance))
          (Mixed.parentWindows (Positions := Positions) terminal (fun type => (terminal type).fineZ) (fun _ => tolerance)))
          (directSum (fun _ : Fin copies => MatrixMul.tensor (K := K)
            (I := Fin (q^(2*∑ type, middle type))) (J := Fin (q^(2*∑ type, extreme type)))
            (L := Fin (q^(2*∑ type, middle type)))))
          (2^(3*coverLength (Mixed.repairGrowth (fun _ : T => 1) (fun _ => 3) multiplier bits) k)) := by
  obtain ⟨threshold, tolerance, positiveTolerance, withinMaximum, bounds⟩ :=
    exists_uniform_terminal_rates positiveError positiveMaximum
  refine ⟨threshold, tolerance, positiveTolerance, withinMaximum, ?_⟩
  intro extreme middle positive large q k bits multiplier positiveK repair alphabet lower upper
  dsimp only
  letI (type : T) : Nonempty (Fin (2*(extreme type+middle type))) := ⟨⟨0, by have := positive type; omega⟩⟩
  have rates type := bounds (extreme type) (middle type) (positive type) (large type)
  obtain ⟨prime, copies, primality, primeBound, copiesBound, extracted⟩ :=
    Mixed.finite_contextual_rate_extraction.{v} (K := K)
      (fun type => data (counts (extreme type) (middle type)))
      (fun type => counts_symmetric (extreme type) (middle type)) q
      (fun type => countsReference (extreme type) (middle type))
      (fun type child word outside => one_letter_profile_support (shapeYIndex child)
        (2*fullProfile (counts (extreme type) (middle type)) child) word outside)
      (fun type child word outside => one_letter_profile_support (shapeZIndex child)
        (2*fullProfile (counts (extreme type) (middle type)) child) word outside)
      (fun type => representativeX (counts (extreme type) (middle type)))
      (fun type => representativeY (counts (extreme type) (middle type)))
      (fun type => representativeZ (counts (extreme type) (middle type)))
      (fun _ => tolerance) (fun _ => positiveTolerance) k bits 2 (fun _ => 3) multiplier
      positiveK repair alphabet (fun _ => terminal_shape_bits)
      (by simpa only [Fintype.card_fin] using lower)
      (by simpa only [Fintype.card_fin] using upper) (by norm_num) (fun _ => by norm_num)
      (fun type => binaryRate error (extreme type) (middle type))
      (fun type => binaryRate error (extreme type) (middle type))
      (fun type => ternaryRate error (extreme type) (middle type))
      (fun type => by simpa only [binaryRate, neg_mul, ← Nat.card_eq_fintype_card] using (rates type).1)
      (fun type => by simpa only [binaryRate, neg_mul, ← Nat.card_eq_fintype_card] using (rates type).2.1)
      (fun type => by simpa only [ternaryRate, neg_mul, ← Nat.card_eq_fintype_card] using (rates type).2.2)
  refine ⟨prime, copies, primality, ?_, copiesBound, ?_⟩
  · simpa only [← Nat.card_eq_fintype_card] using primeBound
  · simpa only [one_mul] using extracted.trans
      ((contextReduction_mixed_terminal_matrix (K := K) q extreme middle).batch (I := Fin copies))

end
end MatrixBounds.Tensor.CW.Terminal
