import CWExtractionOverhead
import CWNominalCopyRates

/-! One common schedule simultaneously satisfies the population, repair,
copy-retention, and total rank-overhead requirements. -/
namespace MatrixBounds.Tensor.CW.Mixed

universe u
open Empirical Numeric RepairRates Selection
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {T : Type*} [Fintype T]

/-- The common lower population bound eventually exceeds every fixed local counting threshold. -/
theorem population_thresholds (threshold multiplier : T → ℕ) {k : ℕ} (positive : 0 < k)
    (large : (∑ type, multiplier type*(threshold type+1)) ≤ k)
    (Positions : T → Type*) [∀ type, Fintype (Positions type)]
    (lower : ∀ type, scale k ≤ multiplier type*Fintype.card (Positions type)) (type : T) :
    threshold type ≤ Fintype.card (Positions type) := by
  have term : multiplier type*(threshold type+1) ≤ ∑ other, multiplier other*(threshold other+1) :=
    Finset.single_le_sum (f := fun other : T => multiplier other*(threshold other+1)) (fun _ _ => Nat.zero_le _) (Finset.mem_univ type)
  have multiplied := term.trans (large.trans ((index_le_scale k).trans (lower type)))
  have multiplierPositive : 0 < multiplier type := by
    have bound := positive.trans_le ((index_le_scale k).trans (lower type))
    exact Nat.pos_of_mul_pos_right bound
  have result := Nat.le_of_mul_le_mul_left multiplied multiplierPositive
  omega

/-- A single fixed threshold supplies all prerequisites for the finite complete approximate extraction and both exponential estimates. -/
theorem exists_approximate_schedule (length : T → ℕ) {degreeError copyError costError rateGrowth : ℝ}
    (degreePositive : 0 < degreeError) (copyPositive : 0 < copyError) (costPositive : 0 < costError)
    (rateNonnegative : 0 ≤ rateGrowth) (wide : T → ℝ)
    (parameters : ∀ type, SplitRestrictionData.NearbyParameters.{u} (length type) degreePositive (wide type))
    (edgeBits multiplier : T → ℕ) (bits base degreeGrowth : ℕ) :
    ∃ threshold : ℕ, ∀ k : ℕ, threshold ≤ k →
      0 < k ∧ 3*(parentRepairConstant length multiplier (fun type => (parameters type).control.tolerance)+1) ≤ k ∧
      (∀ (Positions : T → Type u) [∀ type, Fintype (Positions type)],
        (∀ type, scale k ≤ multiplier type*Fintype.card (Positions type)) →
        ∀ type, (parameters type).control.threshold ≤ Fintype.card (Positions type)) ∧
      (∀ (Positions : T → Type u) [∀ type, Fintype (Positions type)]
        (data : ∀ type, SplitRestrictionData (length type)) (_reference : PrescribedEdges Positions data) (retention : ℝ),
        (∀ type, Fintype.card (ShapeAlphabet (2*length type)) ≤ 2^(edgeBits type)) →
        (∀ type, Fintype.card (Positions type) ≤ multiplier type*scale k) →
        -(rateGrowth*scale k) ≤ retention →
        Real.exp (retention-copyError*scale k) ≤ nominalCopies (Positions := Positions) data base k retention) ∧
      (∀ degree : ℕ, degree ≤ degreeGrowth*scale k →
        ∀ (Positions : T → Type u) [∀ type, Fintype (Positions type)]
          (data : ∀ type, SplitRestrictionData (length type)) (_reference : PrescribedEdges Positions data),
          (∀ type, Fintype.card (Positions type) ≤ multiplier type*scale k) →
          (extractionOverhead data (repairGrowth length edgeBits multiplier bits) degree k : ℝ) ≤ Real.exp (costError*scale k)) := by
  obtain ⟨copyThreshold, copies⟩ := nominal_copies_eventually length edgeBits multiplier base rateNonnegative copyPositive
  obtain ⟨costThreshold, costs⟩ := extraction_overhead_eventually length multiplier
    (repairGrowth length edgeBits multiplier bits) degreeGrowth costPositive
  let populationThreshold := ∑ type, multiplier type*((parameters type).control.threshold+1)
  let repairThreshold := 3*(parentRepairConstant length multiplier (fun type => (parameters type).control.tolerance)+1)
  refine ⟨max 1 (max repairThreshold (max populationThreshold (max copyThreshold costThreshold))), ?_⟩
  intro k large
  have positive : 0 < k := by omega
  have populationLarge : populationThreshold ≤ k := by omega
  have copyLarge : copyThreshold ≤ scale k := (show copyThreshold ≤ k by omega).trans (index_le_scale k)
  have costLarge : costThreshold ≤ k := by omega
  refine ⟨positive, by omega, ?_, ?_, ?_⟩
  · intro Positions finite lower type
    exact population_thresholds (fun type => (parameters type).control.threshold) multiplier positive populationLarge Positions lower type
  · exact copies k copyLarge
  · exact costs k costLarge

end
end MatrixBounds.Tensor.CW.Mixed
