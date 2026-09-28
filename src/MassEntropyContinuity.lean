import MassEntropy
import InterfaceContinuity

/-! Uniform continuity of pooled mass entropy includes zero-mass sectors and
works on any fixed bounded mass cube. -/
namespace MatrixBounds.Entropy

open scoped BigOperators
noncomputable section
variable {A : Type*} [Fintype A]

/-- Pooled mass entropy is continuous even when a whole sector has mass zero. -/
theorem continuous_massEntropy : Continuous (massEntropy (A := A)) := by
  unfold massEntropy
  exact continuous_entropy.add (Real.continuous_mul_log.comp
    (continuous_finset_sum Finset.univ (fun a _ => continuous_apply a)))

/-- One coordinate tolerance controls pooled mass entropy uniformly on a fixed bounded cube. -/
theorem massEntropy_uniform_tolerance (bound : ℝ) {error : ℝ} (positive : 0 < error) :
    ∃ tolerance > 0, ∀ p q : A → ℝ,
      (∀ a, 0 ≤ p a ∧ p a ≤ bound) → (∀ a, 0 ≤ q a ∧ q a ≤ bound) →
      (∀ a, |p a-q a| < tolerance) → |massEntropy p-massEntropy q| < error := by
  have uniform := (isCompact_Icc (a := (fun _ : A => (0 : ℝ))) (b := fun _ => bound)).uniformContinuousOn_of_continuous
    continuous_massEntropy.continuousOn
  obtain ⟨tolerance, positiveTolerance, control⟩ := Metric.uniformContinuousOn_iff.mp uniform error positive
  refine ⟨tolerance, positiveTolerance, ?_⟩
  intro p q hp hq close
  have pMem : p ∈ Set.Icc (fun _ : A => (0 : ℝ)) (fun _ => bound) := ⟨fun a => (hp a).1, fun a => (hp a).2⟩
  have qMem : q ∈ Set.Icc (fun _ : A => (0 : ℝ)) (fun _ => bound) := ⟨fun a => (hq a).1, fun a => (hq a).2⟩
  have distance : dist p q < tolerance := (dist_pi_lt_iff positiveTolerance).mpr
    (fun a => by simpa only [Real.dist_eq] using close a)
  simpa only [Real.dist_eq] using control p pMem q qMem distance

end
end MatrixBounds.Entropy
