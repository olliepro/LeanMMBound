import CWRootApproximateExtraction
import CWRootApproximateCosts
import CWRootAsymptotic

/-! The unrestricted CW source produces complete approximate root interfaces
at the nominal entropy rate, with every finite gluing and repair cost paid. -/
namespace MatrixBounds.Tensor.CW.RootRestrictionData

universe v
open Empirical Numeric RepairRates Selection
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {K : Type*} [CommRing K]

set_option maxHeartbeats 3000000 in
/-- The original unrestricted CW power extracts complete child windows suitable for later stages.
Its positive window and size threshold precede all populations, exact split counts, and nominal laws. -/
theorem eventual_approximate_extraction (length q bits edgeBits multiplier base : ℕ)
    (alphabet : q+2 ≤ 2^bits) (shapes : Fintype.card (ShapeAlphabet (2*length)) ≤ 2^edgeBits)
    (baseLarge : 2 ≤ base) (lengthBound : 2*length ≤ base)
    {degreeError copyError costError rateGrowth : ℝ} (degreePositive : 0 < degreeError)
    (copyPositive : 0 < copyError) (costPositive : 0 < costError) (rateNonnegative : 0 ≤ rateGrowth) :
    ∃ threshold : ℕ, ∃ delta > 0, ∀ k : ℕ, threshold ≤ k → ∀ (P : Type*) [Fintype P] [Nonempty P]
      (data : RootRestrictionData length) (_reference : data.PrescribedEdges (P := P)),
      scale k ≤ multiplier*Fintype.card P → Fintype.card P ≤ multiplier*scale k →
      ∀ (ux uy uz : Fin (2*length+1) → ℝ), (∀ b, 0 < ux b) → (∀ b, 0 < uy b) → (∀ b, 0 < uz b) →
      ∀ (lawX lawY lawZ : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℝ),
      (∀ child symbol, 0 ≤ lawY child symbol ∧ lawY child symbol ≤ 1) →
      (∀ child symbol, 0 ≤ lawZ child symbol ∧ lawZ child symbol ≤ 1) →
      let rate := (Fintype.card P : ℝ)*(data.nominalRetention (P := P) ux uy uz lawY lawZ-degreeError);
      -(rateGrowth*scale k) ≤ rate →
      ∃ copies overhead : ℕ, Real.exp (rate-copyError*scale k) ≤ copies ∧
        (overhead : ℝ) ≤ Real.exp (costError*scale k) ∧
        ContextReduction.{v} (rootPower (K := K) (P := P) q length)
          (directSum (fun _ : Fin copies => data.approximateTarget (K := K) q lawX lawY lawZ delta)) overhead := by
  obtain ⟨localThreshold, delta, positiveDelta, extraction⟩ :=
    exists_finite_approximate_extraction.{v} (K := K) length degreePositive
  have edgeNonnegative : 0 ≤ (edgeBits*multiplier : ℕ)*Real.log 2 :=
    mul_nonneg (Nat.cast_nonneg _) (Real.log_nonneg (by norm_num))
  obtain ⟨copyThreshold, copiesBound⟩ := common_retainedCopies_eventually base edgeNonnegative rateNonnegative copyPositive
  obtain ⟨costThreshold, costBound⟩ := approximate_cost_eventually length multiplier
    (repairGrowth length edgeBits multiplier bits) costPositive
  refine ⟨max 3 (max (multiplier*(localThreshold+1)) (max copyThreshold costThreshold)), delta, positiveDelta, ?_⟩
  intro k large P finite nonempty data reference lower upper ux uy uz positiveX positiveY positiveZ
    lawX lawY lawZ rangeY rangeZ rate rateLower
  have localLarge : localThreshold ≤ Fintype.card P := by
    have multiplied : multiplier*(localThreshold+1) ≤ multiplier*Fintype.card P :=
      (show multiplier*(localThreshold+1) ≤ k by omega).trans ((index_le_scale k).trans lower)
    have positiveMultiplier : 0 < multiplier := Nat.pos_of_mul_pos_right
      ((show 0 < k by omega).trans_le ((index_le_scale k).trans lower))
    have := Nat.le_of_mul_le_mul_left multiplied positiveMultiplier
    omega
  let copies := data.nominalCopies (P := P) base k rate
  let overhead := (Fintype.card data.ChildProfileTuple)^3*2^(3*coverLength (repairGrowth length edgeBits multiplier bits) k)
  letI : Nonempty (TypedWord (P := P) data.split) := ⟨data.prescribedWordEquiv reference⟩
  refine ⟨copies, overhead, ?_, ?_, ?_⟩
  · exact copiesBound (scale k) ((show copyThreshold ≤ k by omega).trans (index_le_scale k))
      (Fintype.card (TypedWord (P := P) data.split)) rate
      (by exact_mod_cast Fintype.card_pos (α := TypedWord (P := P) data.split))
      (data.prescribed_edges_exponential edgeBits multiplier (scale k) shapes upper) rateLower
  · exact costBound k (by omega) P data reference upper
  · exact extraction P localLarge data reference ux uy uz positiveX positiveY positiveZ lawX lawY lawZ rangeY rangeZ
      q k bits edgeBits multiplier base (by omega) alphabet shapes upper baseLarge lengthBound

end
end MatrixBounds.Tensor.CW.RootRestrictionData
