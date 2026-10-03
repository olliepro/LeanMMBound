module

public import CWApproximateMixedExtraction
public import ProfileCountRates

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Actual CW profile counts and repair costs are subexponential on the
chosen common population schedule. All constants are fixed before populations. -/
namespace MatrixBounds.Tensor.CW.Mixed

open Empirical Numeric RepairRates Selection
open scoped BigOperators
noncomputable section
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {T : Type*} [Fintype T] {Positions : T → Type*} [∀ type, Fintype (Positions type)] {length : T → ℕ}

/-- The fixed degree of the polynomial counting all labelled child-profile tuples. -/
def profileDimension (length : T → ℕ) : ℕ :=
  ∑ type, Fintype.card (ShapeAlphabet (2*length type))*Fintype.card (Fin (length type) → Fin 3)

omit [Fintype T] in
/-- Every child pool has at most twice its parent population, including empty pools. -/
theorem child_population_bound (data : ∀ type, SplitRestrictionData (length type))
    (reference : PrescribedEdges Positions data) (type : T) (child : ShapeAlphabet (2*length type)) :
    Fintype.card ((data type).ChildPositions child) ≤ 2*Fintype.card (Positions type) := by
  have bound := count_le_positions ((data type).prescribedWord (reference type)).val child
  rw [((data type).prescribedWord (reference type)).property child] at bound
  simpa only [SplitRestrictionData.ChildPositions, Fintype.card_fin] using Nat.mul_le_mul_left 2 bound

/-- Linear parent populations give an explicit polynomial bound on every exact child-profile tuple. -/
theorem child_profile_count_bound (data : ∀ type, SplitRestrictionData (length type))
    (reference : PrescribedEdges Positions data) (multiplier : T → ℕ) (size : ℕ)
    (population : ∀ type, Fintype.card (Positions type) ≤ multiplier type*size) :
    Fintype.card (ChildProfileTuple data) ≤
      ((2*∑ type, multiplier type)*size+1)^profileDimension length := by
  have pools (index : ChildIndex length) : Fintype.card (ChildSlots data index) ≤ (2*∑ type, multiplier type)*size := by
    apply (child_population_bound data reference index.1 index.2).trans
    apply (Nat.mul_le_mul_left 2 (population index.1)).trans
    have bound : multiplier index.1 ≤ ∑ type, multiplier type := Finset.single_le_sum (fun _ _ => Nat.zero_le _) (Finset.mem_univ _)
    nlinarith
  have bound := profile_tuple_bound (Positions := ChildSlots data)
    (Alphabet := fun index : ChildIndex length => Fin (length index.1) → Fin 3) (2*∑ type, multiplier type) size pools
  simpa +instances only [ChildProfileTuple, Fintype.card_pi, ChildIndex, ChildSlots, Fintype.prod_sigma,
    Fintype.sum_sigma, Finset.sum_const, Finset.card_univ, nsmul_eq_mul, profileDimension] using! bound

/-- The full three-axis type-gluing cost is eventually smaller than any prescribed exponential rate. -/
theorem child_profile_cost_eventually (length : T → ℕ) (multiplier : T → ℕ) {error : ℝ} (positive : 0 < error) :
    ∃ threshold : ℕ, ∀ size : ℕ, threshold ≤ size →
      ∀ (Positions : T → Type*) [∀ type, Fintype (Positions type)]
        (data : ∀ type, SplitRestrictionData (length type)) (_reference : PrescribedEdges Positions data),
        (∀ type, Fintype.card (Positions type) ≤ multiplier type*size) →
        (Fintype.card (ChildProfileTuple data) : ℝ)^3 ≤ Real.exp (error*size) := by
  obtain ⟨threshold, small⟩ := polynomial_cost_eventually (profileDimension length*3) (2*∑ type, multiplier type) positive
  refine ⟨threshold, ?_⟩
  intro size large Positions finite data reference population
  have bound := child_profile_count_bound data reference multiplier size population
  have castBound : (Fintype.card (ChildProfileTuple data) : ℝ) ≤
      (((2*∑ type, multiplier type)*size+1 : ℕ) : ℝ)^profileDimension length := by exact_mod_cast bound
  calc
    _ ≤ ((((2*∑ type, multiplier type)*size+1 : ℕ) : ℝ)^profileDimension length)^3 :=
      pow_le_pow_left₀ (Nat.cast_nonneg _) castBound _
    _ ≤ _ := by rw [← pow_mul]; exact small size large

end
end MatrixBounds.Tensor.CW.Mixed

namespace MatrixBounds.RepairRates

noncomputable section

/-- The actual repair multiplier, rather than only its exponent, is eventually bounded by any positive exponential rate. -/
theorem repair_cost_eventually (growth : ℕ) {error : ℝ} (positive : 0 < error) :
    ∃ threshold : ℕ, ∀ k : ℕ, threshold ≤ k →
      (2 : ℝ)^(3*coverLength growth k) ≤ Real.exp (error*scale k) := by
  refine ⟨⌈3*((growth : ℝ)+1)*Real.log 2/error⌉₊, ?_⟩
  intro k large
  have threshold : 3*((growth : ℝ)+1)*Real.log 2 ≤ error*k := by
    have bound : 3*((growth : ℝ)+1)*Real.log 2/error ≤ (k : ℝ) := (Nat.le_ceil _).trans (by exact_mod_cast large)
    have := (div_le_iff₀ positive).mp bound
    nlinarith
  have powerOne : (1 : ℝ) ≤ 2^k := one_le_pow₀ (by norm_num)
  have logPositive : 0 ≤ Real.log 2 := Real.log_nonneg (by norm_num)
  have exponent : (3*coverLength growth k : ℕ)*Real.log 2 ≤ error*scale k := by
    have multiplied := mul_le_mul_of_nonneg_right threshold (by positivity : (0 : ℝ) ≤ 2^k)
    unfold coverLength scale
    push_cast
    nlinarith [mul_nonneg logPositive (sub_nonneg.mpr powerOne)]
  calc
    _ = Real.exp ((3*coverLength growth k : ℕ)*Real.log 2) := by
      rw [Real.exp_nat_mul, Real.exp_log (by norm_num : (0 : ℝ) < 2)]
    _ ≤ _ := Real.exp_le_exp.mpr exponent

end
end MatrixBounds.RepairRates
