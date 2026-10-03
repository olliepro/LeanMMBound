module

public import CWApproximateCosts

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Combined uniform cost of actual three-axis gluing, hole repair, and
polynomial coefficient extraction. This is the complete finite overhead in
the approximate extraction theorem. -/
namespace MatrixBounds.Tensor.CW.Mixed

open RepairRates Selection
noncomputable section
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {T : Type*} [Fintype T] {length : T → ℕ}

/-- Total rank multiplier for exact-type gluing, sparse repair, and polynomial interpolation. -/
def extractionOverhead (data : ∀ type, SplitRestrictionData (length type)) (growth degree k : ℕ) : ℕ :=
  (Fintype.card (ChildProfileTuple data))^3*2^(3*coverLength growth k)*(degree+1)^2

/-- Above one common threshold, the entire extraction overhead is smaller than any prescribed exponential rate. -/
theorem extraction_overhead_eventually (length : T → ℕ) (multiplier : T → ℕ) (growth degreeGrowth : ℕ)
    {error : ℝ} (positive : 0 < error) :
    ∃ threshold : ℕ, ∀ k : ℕ, threshold ≤ k → ∀ degree : ℕ, degree ≤ degreeGrowth*scale k →
      ∀ (Positions : T → Type*) [∀ type, Fintype (Positions type)]
        (data : ∀ type, SplitRestrictionData (length type)) (_reference : PrescribedEdges Positions data),
        (∀ type, Fintype.card (Positions type) ≤ multiplier type*scale k) →
        (extractionOverhead data growth degree k : ℝ) ≤ Real.exp (error*scale k) := by
  have third : 0 < error/3 := by positivity
  obtain ⟨profileThreshold, profiles⟩ := child_profile_cost_eventually length multiplier third
  obtain ⟨repairThreshold, repair⟩ := repair_cost_eventually growth third
  obtain ⟨degreeThreshold, degrees⟩ := polynomial_cost_eventually 2 degreeGrowth third
  refine ⟨max profileThreshold (max repairThreshold degreeThreshold), ?_⟩
  intro k large degree degreeBound Positions finite data reference population
  have profileLarge : profileThreshold ≤ scale k :=
    ((le_max_left _ _).trans large).trans (index_le_scale k)
  have repairLarge : repairThreshold ≤ k := (le_max_left _ _).trans ((le_max_right _ _).trans large)
  have degreeLarge : degreeThreshold ≤ scale k :=
    ((le_max_right _ _).trans ((le_max_right _ _).trans large)).trans (index_le_scale k)
  have profileBound := profiles (scale k) profileLarge Positions data reference population
  have repairBound := repair k repairLarge
  have interpolation : ((degree+1 : ℕ) : ℝ)^2 ≤ Real.exp (error/3*scale k) := by
    have bound : ((degree+1 : ℕ) : ℝ) ≤ ((degreeGrowth*scale k+1 : ℕ) : ℝ) := by
      exact_mod_cast Nat.add_le_add_right degreeBound 1
    apply (pow_le_pow_left₀ (by positivity : (0 : ℝ) ≤ (degree+1 : ℕ)) bound 2).trans
    exact degrees (scale k) degreeLarge
  have first := mul_le_mul profileBound repairBound (by positivity) (Real.exp_pos _).le
  have second := mul_le_mul first interpolation (by positivity) (by positivity)
  push_cast at second
  unfold extractionOverhead
  push_cast
  apply second.trans_eq
  rw [← Real.exp_add, ← Real.exp_add]
  congr 1
  ring

end
end MatrixBounds.Tensor.CW.Mixed
