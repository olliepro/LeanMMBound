import UniformRetainedBatch
import LogarithmicLoss

/-! Quantified removal of the common-prime and Behrend losses. Thresholds
are independent of the exact profile, retained rate, and number of graph edges. -/
namespace MatrixBounds.Selection

noncomputable section

/-- The explicit common copy count has the logarithmic lower bound with both finite losses retained. -/
theorem retainedCopies_exponential {cost retention cap loss : ℝ} (positive : 0 < cost)
    (small : Real.log cost+4*Real.sqrt (Real.log cap) ≤ loss) :
    Real.exp (retention-loss) ≤ retainedCopies cost retention cap := by
  calc
    _ ≤ Real.exp (retention-(Real.log cost+4*Real.sqrt (Real.log cap))) :=
      Real.exp_le_exp.mpr (by linarith)
    _ = Real.exp retention/cost*Real.exp (-4*Real.sqrt (Real.log cap)) := by
      rw [show retention-(Real.log cost+4*Real.sqrt (Real.log cap)) =
        (retention-Real.log cost)+(-4*Real.sqrt (Real.log cap)) by ring,
        Real.exp_add, Real.exp_sub, Real.exp_log positive]
    _ ≤ _ := retainedCopies_lower _ _ _

/-- The logarithm of the explicit linear modulus overhead is eventually below any positive rate. -/
theorem modulus_log_eventually (base : ℕ) {error : ℝ} (positive : 0 < error) :
    ∃ threshold : ℕ, ∀ size : ℕ, threshold ≤ size →
      Real.log (12*modulusFactor base size) ≤ error*size := by
  obtain ⟨threshold, small⟩ := logarithmic_error_eventually
    (constant := 1) (growth := 12*(base : ℝ)+216) (by norm_num) (by positivity) positive
  refine ⟨max 1 threshold, ?_⟩
  intro size large
  have sizeLarge : (1 : ℝ) ≤ size := by exact_mod_cast (le_max_left 1 threshold).trans large
  have factorPositive : 0 < 12*modulusFactor base size := by unfold modulusFactor; positivity
  have comparison : 12*modulusFactor base size ≤ (12*(base : ℝ)+216)*size+1 := by
    unfold modulusFactor
    nlinarith [mul_le_mul_of_nonneg_left sizeLarge (Nat.cast_nonneg base : (0 : ℝ) ≤ base)]
  have bound := small size ((le_max_right 1 threshold).trans large)
  have logarithm := Real.log_le_log factorPositive comparison
  linarith

/-- A linear logarithmic cap makes the complete Behrend loss arbitrarily small, uniformly in the retained rate. -/
theorem retainedCopies_eventually (base : ℕ) {growth error : ℝ}
    (growthNonnegative : 0 ≤ growth) (positive : 0 < error) :
    ∃ threshold : ℕ, ∀ size : ℕ, threshold ≤ size → ∀ retention cap : ℝ,
      Real.log cap ≤ growth*size →
      Real.exp (retention-error*size) ≤ retainedCopies (12*modulusFactor base size) retention cap := by
  obtain ⟨threshold, small⟩ := modulus_log_eventually base (half_pos positive)
  let rootThreshold := ⌈16*growth/(error/2)^2⌉₊
  refine ⟨max 1 (max threshold rootThreshold), ?_⟩
  intro size large retention cap capBound
  have sizeLarge : (1 : ℝ) ≤ size := by exact_mod_cast (le_max_left 1 _).trans large
  have costBound := small size ((le_max_left threshold rootThreshold).trans ((le_max_right 1 _).trans large))
  have rootLarge : 16*growth ≤ (error/2)^2*size := by
    have bound : 16*growth/(error/2)^2 ≤ (size : ℝ) := (Nat.le_ceil _).trans
      (by exact_mod_cast (le_max_right threshold rootThreshold).trans ((le_max_right 1 _).trans large))
    have := (div_le_iff₀ (sq_pos_of_pos (half_pos positive))).mp bound
    nlinarith
  have root := HashBuckets.square_root_loss growthNonnegative (by linarith : (0 : ℝ) < size) (half_pos positive) rootLarge
  apply retainedCopies_exponential (by unfold modulusFactor; positivity)
  have monotone := Real.sqrt_le_sqrt capBound
  linarith

/-- Exponentially many graph edges and a linear lower bound on retention give a uniform exponential prime cap. -/
theorem common_cap_log_bound (base size : ℕ) {edges retention edgeGrowth rateGrowth : ℝ}
    (edgesPositive : 0 < edges) (edgeBound : edges ≤ Real.exp (edgeGrowth*size))
    (retentionBound : -(rateGrowth*size) ≤ retention)
    (factorBound : Real.log (12*modulusFactor base size) ≤ size) :
    Real.log (2*modulusFactor base size*(edges*Real.exp (-retention))) ≤ (edgeGrowth+rateGrowth+1)*size := by
  have factorPositive : 0 < modulusFactor base size := by unfold modulusFactor; positivity
  have edgeLog : Real.log edges ≤ edgeGrowth*size := by
    simpa only [Real.log_exp] using Real.log_le_log edgesPositive edgeBound
  have factorLog : Real.log (2*modulusFactor base size) ≤ size :=
    (Real.log_le_log (by positivity) (by nlinarith : 2*modulusFactor base size ≤ 12*modulusFactor base size)).trans factorBound
  rw [Real.log_mul (by positivity) (by positivity), Real.log_mul (ne_of_gt edgesPositive) (Real.exp_ne_zero _), Real.log_exp]
  nlinarith

/-- The full common-copy bound has no asymptotic loss beyond any prescribed positive error, uniformly in all nearby exact types. -/
theorem common_retainedCopies_eventually (base : ℕ) {edgeGrowth rateGrowth error : ℝ}
    (edgeNonnegative : 0 ≤ edgeGrowth) (rateNonnegative : 0 ≤ rateGrowth) (positive : 0 < error) :
    ∃ threshold : ℕ, ∀ size : ℕ, threshold ≤ size → ∀ edges retention : ℝ,
      0 < edges → edges ≤ Real.exp (edgeGrowth*size) → -(rateGrowth*size) ≤ retention →
      Real.exp (retention-error*size) ≤ retainedCopies (12*modulusFactor base size) retention
        (2*modulusFactor base size*(edges*Real.exp (-retention))) := by
  obtain ⟨first, firstBound⟩ := modulus_log_eventually base (show (0 : ℝ) < 1 by norm_num)
  obtain ⟨second, secondBound⟩ := retainedCopies_eventually base
    (by positivity : 0 ≤ edgeGrowth+rateGrowth+1) positive
  refine ⟨max first second, ?_⟩
  intro size large edges retention edgesPositive edgeBound retentionBound
  apply secondBound size ((le_max_right first second).trans large)
  exact common_cap_log_bound base size edgesPositive edgeBound retentionBound
    (by simpa only [one_mul] using firstBound size ((le_max_left first second).trans large))

end
end MatrixBounds.Selection
