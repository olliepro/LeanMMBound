import CWMixedNearbyExtraction
import RetentionLossRates

/-! The actual mixed CW prescribed-edge count supplies the exponential cap
needed to remove the common-prime and Behrend losses uniformly. -/
namespace MatrixBounds.Tensor.CW.Mixed

open Empirical Numeric RepairRates Selection
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {T : Type*} [Fintype T] {length : T → ℕ}

/-- The prescribed-edge count has an explicit exponential rate in the common population scale. -/
theorem prescribed_edges_exponential {Positions : T → Type*} [∀ type, Fintype (Positions type)]
    (data : ∀ type, SplitRestrictionData (length type)) (edgeBits multiplier : T → ℕ) (size : ℕ)
    (shapes : ∀ type, Fintype.card (ShapeAlphabet (2*length type)) ≤ 2^(edgeBits type))
    (population : ∀ type, Fintype.card (Positions type) ≤ multiplier type*size) :
    (Fintype.card (PrescribedEdges Positions data) : ℝ) ≤
      Real.exp (((∑ type, edgeBits type*multiplier type : ℕ) : ℝ)*Real.log 2*size) := by
  have bound := selected_binary_bound data (Function.Embedding.refl (PrescribedEdges Positions data)) edgeBits multiplier size shapes population
  have castBound : (Fintype.card (PrescribedEdges Positions data) : ℝ) ≤ (2 : ℝ)^((∑ type, edgeBits type*multiplier type)*size) := by exact_mod_cast bound
  apply castBound.trans_eq
  rw [show (((∑ type, edgeBits type*multiplier type : ℕ) : ℝ)*Real.log 2*size) =
    (((∑ type, edgeBits type*multiplier type)*size : ℕ) : ℝ)*Real.log 2 by push_cast; ring,
    Real.exp_nat_mul, Real.exp_log (by norm_num : (0 : ℝ) < 2)]

/-- A common size threshold gives the nominal output-copy rate for all feasible mixed populations and all profile choices. -/
theorem nominal_copies_eventually (length : T → ℕ) (edgeBits multiplier : T → ℕ) (base : ℕ)
    {rateGrowth error : ℝ} (rateNonnegative : 0 ≤ rateGrowth) (positive : 0 < error) :
    ∃ threshold : ℕ, ∀ k : ℕ, threshold ≤ scale k →
      ∀ (Positions : T → Type*) [∀ type, Fintype (Positions type)]
        (data : ∀ type, SplitRestrictionData (length type)) (_reference : PrescribedEdges Positions data) (retention : ℝ),
        (∀ type, Fintype.card (ShapeAlphabet (2*length type)) ≤ 2^(edgeBits type)) →
        (∀ type, Fintype.card (Positions type) ≤ multiplier type*scale k) →
        -(rateGrowth*scale k) ≤ retention →
        Real.exp (retention-error*scale k) ≤ nominalCopies (Positions := Positions) data base k retention := by
  let edgeGrowth := (((∑ type, edgeBits type*multiplier type : ℕ) : ℝ)*Real.log 2)
  have nonnegative : 0 ≤ edgeGrowth := mul_nonneg (Nat.cast_nonneg _) (Real.log_nonneg (by norm_num))
  obtain ⟨threshold, bound⟩ := common_retainedCopies_eventually base nonnegative rateNonnegative positive
  refine ⟨threshold, ?_⟩
  intro k large Positions finite data reference retention shapes population rateBound
  apply bound (scale k) large
  · exact_mod_cast prescribed_positive data reference
  · exact prescribed_edges_exponential data edgeBits multiplier (scale k) shapes population
  · exact rateBound

end
end MatrixBounds.Tensor.CW.Mixed
