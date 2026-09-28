import CWRootProfiles
import CWRootGraph
import ProfileCountRates
import CWApproximateCosts

/-! Every root pool has at most the source population, so gluing every exact
profile tuple costs a polynomial whose degree depends only on the root length. -/
namespace MatrixBounds.Tensor.CW.RootRestrictionData

open Empirical Numeric RepairRates Selection
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A

/-- Polynomial degree counting separately labelled root child fine profiles. -/
def profileDimension (length : ℕ) : ℕ :=
  Fintype.card (ShapeAlphabet (2*length))*Fintype.card (Fin length → Fin 3)

/-- Root child-profile tuples have a uniform polynomial bound under a linear population bound. -/
theorem child_profile_count_bound {P : Type*} [Fintype P] {length : ℕ}
    (data : RootRestrictionData length) (reference : data.PrescribedEdges (P := P))
    (multiplier size : ℕ) (population : Fintype.card P ≤ multiplier*size) :
    Fintype.card data.ChildProfileTuple ≤ (multiplier*size+1)^profileDimension length := by
  have pools (child : ShapeAlphabet (2*length)) : Fintype.card (data.ChildPositions child) ≤ multiplier*size := by
    have bound := count_le_positions (data.prescribedWordEquiv reference).val child
    rw [(data.prescribedWordEquiv reference).property child] at bound
    simpa only [ChildPositions, Fintype.card_fin] using bound.trans population
  have bound := profile_tuple_bound (Positions := data.ChildPositions)
    (Alphabet := fun _ : ShapeAlphabet (2*length) => Fin length → Fin 3) multiplier size pools
  simp only [Finset.sum_const, Finset.card_univ, nsmul_eq_mul] at bound
  unfold profileDimension
  simp only [← Nat.card_eq_fintype_card] at bound ⊢
  exact bound

/-- The whole three-axis root gluing cost is below any fixed positive exponential rate for large populations. -/
theorem child_profile_cost_eventually (length multiplier : ℕ) {error : ℝ} (positive : 0 < error) :
    ∃ threshold : ℕ, ∀ size : ℕ, threshold ≤ size → ∀ (P : Type*) [Fintype P]
      (data : RootRestrictionData length) (_reference : data.PrescribedEdges (P := P)),
      Fintype.card P ≤ multiplier*size →
      (Fintype.card data.ChildProfileTuple : ℝ)^3 ≤ Real.exp (error*size) := by
  obtain ⟨threshold, small⟩ := polynomial_cost_eventually (profileDimension length*3) multiplier positive
  refine ⟨threshold, ?_⟩
  intro size large P finite data reference population
  have bound := data.child_profile_count_bound reference multiplier size population
  have castBound : (Fintype.card data.ChildProfileTuple : ℝ) ≤
      ((multiplier*size+1 : ℕ) : ℝ)^profileDimension length := by exact_mod_cast bound
  calc
    _ ≤ (((multiplier*size+1 : ℕ) : ℝ)^profileDimension length)^3 := pow_le_pow_left₀ (Nat.cast_nonneg _) castBound _
    _ ≤ _ := by rw [← pow_mul]; exact small size large

/-- Combined root type gluing and sparse repair cost has arbitrarily small exponential overhead. -/
theorem approximate_cost_eventually (length multiplier growth : ℕ) {error : ℝ} (positive : 0 < error) :
    ∃ threshold : ℕ, ∀ k : ℕ, threshold ≤ k → ∀ (P : Type*) [Fintype P]
      (data : RootRestrictionData length) (_reference : data.PrescribedEdges (P := P)),
      Fintype.card P ≤ multiplier*scale k →
      (((Fintype.card data.ChildProfileTuple)^3*2^(3*coverLength growth k) : ℕ) : ℝ) ≤ Real.exp (error*scale k) := by
  obtain ⟨profileThreshold, profiles⟩ := child_profile_cost_eventually length multiplier (half_pos positive)
  obtain ⟨repairThreshold, repair⟩ := repair_cost_eventually growth (half_pos positive)
  refine ⟨max profileThreshold repairThreshold, ?_⟩
  intro k large P finite data reference population
  have profileBound := profiles (scale k) (((le_max_left _ _).trans large).trans (index_le_scale k)) P data reference population
  have repairBound := repair k ((le_max_right _ _).trans large)
  have bound := mul_le_mul profileBound repairBound (by positivity) (Real.exp_pos _).le
  push_cast
  apply bound.trans_eq
  rw [← Real.exp_add]
  congr 1
  ring

end
end MatrixBounds.Tensor.CW.RootRestrictionData
