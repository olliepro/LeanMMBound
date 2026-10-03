module

public import CWRootRateExtraction
public import CWRootDegreeControl
public import ContextUniformCopies
public import CWExtractionOverhead
public import RetentionLossRates

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Root extraction from the original CW power has arbitrarily small losses
in both retained copies and repair cost, uniformly over feasible exact data. -/
namespace MatrixBounds.Tensor.CW.RootRestrictionData

universe v
open Empirical Numeric RepairRates Selection
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {K : Type*} [CommRing K]

/-- All prescribed root words have a uniform exponential count at the common repair scale. -/
theorem prescribed_edges_exponential {P : Type*} [Fintype P] {length : ℕ}
    (data : RootRestrictionData length) (edgeBits multiplier size : ℕ)
    (shapes : Fintype.card (ShapeAlphabet (2*length)) ≤ 2^edgeBits)
    (population : Fintype.card P ≤ multiplier*size) :
    (Fintype.card (TypedWord (P := P) data.split) : ℝ) ≤
      Real.exp ((edgeBits*multiplier : ℕ)*Real.log 2*size) := by
  have count := Fintype.card_subtype_le (HasType (P := P) data.split)
  simp only [Fintype.card_fun] at count
  have bound : Fintype.card (TypedWord (P := P) data.split) ≤ 2^((edgeBits*multiplier)*size) := by
    apply count.trans
    calc
      _ ≤ (2^edgeBits)^Fintype.card P := Nat.pow_le_pow_left shapes _
      _ = 2^(edgeBits*Fintype.card P) := (pow_mul _ _ _).symm
      _ ≤ _ := Nat.pow_le_pow_right (by decide) (by
        simpa only [Nat.mul_assoc] using Nat.mul_le_mul_left edgeBits population)
  have castBound : (Fintype.card (TypedWord (P := P) data.split) : ℝ) ≤ (2 : ℝ)^((edgeBits*multiplier)*size) := by
    exact_mod_cast bound
  apply castBound.trans_eq
  rw [show ((edgeBits*multiplier : ℕ) : ℝ)*Real.log 2*size =
    (((edgeBits*multiplier)*size : ℕ) : ℝ)*Real.log 2 by push_cast; ring,
    Real.exp_nat_mul, Real.exp_log (by norm_num : (0 : ℝ) < 2)]

set_option maxHeartbeats 2000000 in
/-- The unrestricted root supplies complete exact child targets at its proved entropy rate,
with arbitrarily small copy and overhead losses. A linear lower rate bound controls only the finite prime loss. -/
theorem eventual_exact_extraction (length q bits edgeBits multiplier base : ℕ)
    (alphabet : q+2 ≤ 2^bits) (shapes : Fintype.card (ShapeAlphabet (2*length)) ≤ 2^edgeBits)
    (baseLarge : 2 ≤ base) (lengthBound : 2*length ≤ base)
    {degreeError copyError costError rateGrowth : ℝ} (degreePositive : 0 < degreeError)
    (copyPositive : 0 < copyError) (costPositive : 0 < costError) (rateNonnegative : 0 ≤ rateGrowth) :
    ∃ threshold : ℕ, ∀ k : ℕ, threshold ≤ k → ∀ (P : Type*) [Fintype P] [Nonempty P]
      (data : RootRestrictionData length) (_reference : data.PrescribedEdges (P := P)),
      (∀ child block, fineTotal block ≠ child.val.y → data.fineY child block = 0) →
      (∀ child block, fineTotal block ≠ child.val.z → data.fineZ child block = 0) →
      data.TargetParts data.fineX → data.TargetParts data.fineY → data.TargetParts data.fineZ →
      scale k ≤ multiplier*Fintype.card P → Fintype.card P ≤ multiplier*scale k →
      ∀ (ux uy uz : Fin (2*length+1) → ℝ), (∀ b, 0 < ux b) → (∀ b, 0 < uy b) → (∀ b, 0 < uz b) →
      let rate := (Fintype.card P : ℝ)*(data.retention (P := P) ux uy uz-degreeError);
      -(rateGrowth*scale k) ≤ rate →
      ∃ copies overhead : ℕ, Real.exp (rate-copyError*scale k) ≤ copies ∧
        (overhead : ℝ) ≤ Real.exp (costError*scale k) ∧
        ContextReduction.{v} (rootPower (K := K) (P := P) q length)
          (directSum (fun _ : Fin copies => data.target (K := K) q)) overhead := by
  obtain ⟨localThreshold, degrees⟩ := exists_uniform_degree_rate length degreePositive
  have edgeNonnegative : 0 ≤ (edgeBits*multiplier : ℕ)*Real.log 2 :=
    mul_nonneg (Nat.cast_nonneg _) (Real.log_nonneg (by norm_num))
  obtain ⟨copyThreshold, copiesBound⟩ := common_retainedCopies_eventually base edgeNonnegative rateNonnegative copyPositive
  obtain ⟨costThreshold, costBound⟩ := repair_cost_eventually (repairGrowth length edgeBits multiplier bits) costPositive
  refine ⟨max 3 (max (multiplier*(localThreshold+1)) (max copyThreshold costThreshold)), ?_⟩
  intro k large P finite nonempty data reference supportY supportZ representativeX representativeY representativeZ
    lower upper ux uy uz positiveX positiveY positiveZ rate rateLower
  have localLarge : localThreshold ≤ Fintype.card P := by
    have multiplied : multiplier*(localThreshold+1) ≤ multiplier*Fintype.card P :=
      (show multiplier*(localThreshold+1) ≤ k by omega).trans ((index_le_scale k).trans lower)
    have positiveMultiplier : 0 < multiplier := Nat.pos_of_mul_pos_right
      ((show 0 < k by omega).trans_le ((index_le_scale k).trans lower))
    have := Nat.le_of_mul_le_mul_left multiplied positiveMultiplier
    omega
  have degreeBounds := degrees P localLarge data reference representativeY representativeZ ux uy uz positiveX positiveY positiveZ
  let edges := Fintype.card (TypedWord (P := P) data.split)
  let cap := 2*modulusFactor base (scale k)*((edges : ℝ)*Real.exp (-rate))
  let copies := retainedCopies (12*modulusFactor base (scale k)) rate cap
  let overhead := 2^(3*coverLength (repairGrowth length edgeBits multiplier bits) k)
  letI : Nonempty (TypedWord (P := P) data.split) := ⟨data.prescribedWordEquiv reference⟩
  refine ⟨copies, overhead, ?_, ?_, ?_⟩
  · exact copiesBound (scale k) ((show copyThreshold ≤ k by omega).trans (index_le_scale k)) edges rate
      (by exact_mod_cast Fintype.card_pos (α := TypedWord (P := P) data.split))
      (data.prescribed_edges_exponential edgeBits multiplier (scale k) shapes upper) rateLower
  · simpa only [overhead, Nat.cast_pow, Nat.cast_ofNat] using costBound k (by omega)
  · apply contextReduction_uniform_retained_batch _ _ (by unfold modulusFactor; positivity)
    obtain ⟨prime, count, primality, primeBound, countBound, extracted⟩ :=
      finite_rate_extraction.{v} (K := K) data q reference supportY supportZ representativeX representativeY representativeZ
        k bits edgeBits multiplier base (by omega) alphabet shapes upper baseLarge lengthBound rate
        degreeBounds.1 degreeBounds.2.1 degreeBounds.2.2
    exact ⟨prime, count, primality.pos, primeBound, countBound, extracted⟩

end
end MatrixBounds.Tensor.CW.RootRestrictionData
