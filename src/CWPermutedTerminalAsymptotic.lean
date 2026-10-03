module

public import CWPermutedTerminalRateBounds
public import CWTerminalInterfaces
public import ContextUniformCopies
public import CWExtractionSchedule

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! The shared extraction across physical terminal orientations has arbitrarily small finite losses.
Its positive input window and all thresholds are chosen before populations. -/
namespace MatrixBounds.Tensor.CW.Terminal

universe v
open Empirical Numeric Entropy Selection RepairRates
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {K T : Type*} [CommRing K] [Fintype T]

/-- The available mixed terminal parent tensor at a specified positive window. -/
def permutedParentTensor (axes : T → Equiv.Perm (Fin 3)) (q : ℕ) (extreme middle : T → ℕ) (tolerance : ℝ) :=
  let terminal := fun type => permutedData (axes type) (extreme type) (middle type)
  let Positions := fun type => Fin (2*(extreme type+middle type))
  Mixed.parentInterface (K := K) terminal q
    (Mixed.parentWindows (Positions := Positions) terminal (fun type => (terminal type).fineX) (fun _ => tolerance))
    (Mixed.parentWindows (Positions := Positions) terminal (fun type => (terminal type).fineY) (fun _ => tolerance))
    (Mixed.parentWindows (Positions := Positions) terminal (fun type => (terminal type).fineZ) (fun _ => tolerance))

/-- The exact rectangular matrix tensor produced by a mixed terminal family. -/
def permutedMatrixTensor (axes : T → Equiv.Perm (Fin 3)) (q : ℕ) (extreme middle : T → ℕ) :=
  MatrixMul.tensor (K := K) (I := PermutedMixedRows axes q extreme middle)
    (J := PermutedMixedInner axes q extreme middle) (L := PermutedMixedColumns axes q extreme middle)

set_option maxHeartbeats 2500000 in
/-- Every fixed positive parent window supplies complete terminal matrix copies
with the summed entropy rate, an arbitrary copy loss, and arbitrary exponential
overhead loss. No extraction or rank-bound hypothesis is assumed. -/
theorem eventual_permuted_terminal_extraction (q bits : ℕ) (alphabet : q+2 ≤ 2^bits) (multiplier : T → ℕ)
    {degreeError copyError costError wide : ℝ} (degreePositive : 0 < degreeError)
    (copyPositive : 0 < copyError) (costPositive : 0 < costError) (widePositive : 0 < wide) :
    ∃ threshold : ℕ, ∀ k : ℕ, threshold ≤ k → ∀ (axes : T → Equiv.Perm (Fin 3)) (extreme middle : T → ℕ),
      (∀ type, 0 < extreme type+middle type) →
      (∀ type, scale k ≤ multiplier type*(2*(extreme type+middle type))) →
      (∀ type, 2*(extreme type+middle type) ≤ multiplier type*scale k) →
      ∃ copies overhead : ℕ,
        Real.exp (permutedRetention axes degreeError extreme middle-copyError*scale k) ≤ copies ∧
        (overhead : ℝ) ≤ Real.exp (costError*scale k) ∧
        ContextReduction.{v} (permutedParentTensor (K := K) axes q extreme middle wide)
          (directSum (fun _ : Fin copies => permutedMatrixTensor (K := K) axes q extreme middle)) overhead := by
  obtain ⟨localThreshold, tolerance, positiveTolerance, smaller, extraction⟩ :=
    exists_permuted_terminal_extraction_window (K := K) (T := T) degreePositive widePositive
  let edgeGrowth : ℝ := (∑ type, (3*multiplier type : ℕ))*Real.log 2
  let rateGrowth : ℝ := degreeError*(∑ type, (multiplier type : ℝ))
  have edgeNonnegative : 0 ≤ edgeGrowth := mul_nonneg (Nat.cast_nonneg _) (Real.log_nonneg (by norm_num))
  have rateNonnegative : 0 ≤ rateGrowth := mul_nonneg degreePositive.le (Finset.sum_nonneg (fun _ _ => Nat.cast_nonneg _))
  obtain ⟨copyThreshold, copyBound⟩ := common_retainedCopies_eventually 2 edgeNonnegative rateNonnegative copyPositive
  let growth := Mixed.repairGrowth (fun _ : T => 1) (fun _ => 3) multiplier bits
  obtain ⟨costThreshold, costBound⟩ := repair_cost_eventually growth costPositive
  let populationThreshold := ∑ type, multiplier type*(localThreshold+1)
  let repairThreshold := 3*(Mixed.parentRepairConstant (fun _ : T => 1) multiplier (fun _ => tolerance)+1)
  refine ⟨max 1 (max populationThreshold (max repairThreshold (max copyThreshold costThreshold))), ?_⟩
  intro k large axes extreme middle positive lower upper
  have positiveK : 0 < k := by omega
  let Positions := fun type => Fin (2*(extreme type+middle type))
  let terminal := fun type => permutedData (axes type) (extreme type) (middle type)
  let reference : Mixed.PrescribedEdges Positions terminal := fun type => permutedReference (axes type) (extreme type) (middle type)
  have localLarge : ∀ type, localThreshold ≤ 2*(extreme type+middle type) := by
    intro type
    simpa only [Positions, Fintype.card_fin] using Mixed.population_thresholds (fun _ => localThreshold) multiplier positiveK
      (by change populationThreshold ≤ k; omega)
      Positions (by simpa only [Positions, Fintype.card_fin] using lower) type
  let edges := Nat.card (Mixed.PrescribedEdges Positions terminal)
  let rate := permutedRetention axes degreeError extreme middle
  let cap := 2*modulusFactor 2 (scale k)*((edges : ℝ)*Real.exp (-rate))
  let copies := retainedCopies (12*modulusFactor 2 (scale k)) rate cap
  let overhead := 2^(3*coverLength growth k)
  have edgesPositive : (0 : ℝ) < edges := by
    letI : Nonempty (Mixed.PrescribedEdges Positions terminal) := ⟨reference⟩
    exact_mod_cast Nat.card_pos
  have edgesBound : (edges : ℝ) ≤ Real.exp (edgeGrowth*scale k) := by
    simpa only [← Nat.card_eq_fintype_card] using Mixed.prescribed_edges_exponential terminal
      (fun _ => 3) multiplier (scale k) (fun _ => terminal_shape_bits)
      (by simpa only [Positions, Fintype.card_fin] using upper)
  refine ⟨copies, overhead, ?_, ?_, ?_⟩
  · exact copyBound (scale k) ((show copyThreshold ≤ k by omega).trans (index_le_scale k))
      edges rate edgesPositive edgesBound (permutedRetention_lower axes extreme middle positive degreePositive.le multiplier k upper)
  · simpa only [overhead, Nat.cast_pow, Nat.cast_ofNat] using costBound k (by omega)
  · apply contextReduction_uniform_retained_batch _ _ (by unfold modulusFactor; positivity)
    obtain ⟨prime, count, primality, primeBound, countBound, extracted⟩ :=
      extraction axes extreme middle positive localLarge q k bits multiplier positiveK (by omega) alphabet lower upper
    refine ⟨prime, count, primality.pos, primeBound, countBound, ?_⟩
    have narrower : ContextReduction.{v} (permutedParentTensor (K := K) axes q extreme middle wide)
        (permutedParentTensor (K := K) axes q extreme middle tolerance) 1 := by
      apply Mixed.contextReduction_narrowerParent
      all_goals intro type fine inside; exact within_mono _ fine smaller inside
    simpa only [mul_one] using! narrower.trans extracted

end
end MatrixBounds.Tensor.CW.Terminal
