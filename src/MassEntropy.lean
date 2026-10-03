module

public import FactorialEntropy

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Entropy of an unnormalized pooled mass vector. This is the PH quantity in
the supplied verifier, including zero-mass sectors and exact scaling identities. -/
namespace MatrixBounds.Entropy

open scoped BigOperators
noncomputable section
variable {A : Type*} [Fintype A]

/-- Entropy contribution of a pooled mass vector: its mass times the entropy after normalization. -/
def massEntropy (mass : A → ℝ) : ℝ :=
  entropy mass + (∑ symbol, mass symbol)*Real.log (∑ symbol, mass symbol)

/-- The mass-entropy expression reduces to ordinary entropy on a probability distribution. -/
theorem massEntropy_of_normalized (mass : A → ℝ) (normalized : ∑ symbol, mass symbol = 1) :
    massEntropy mass = entropy mass := by
  simp only [massEntropy, normalized, Real.log_one, mul_zero, add_zero]

omit [Fintype A] in
/-- Weighted logarithms distribute under scaling, with zero masses handled exactly. -/
theorem mul_log_scaled (scale mass : ℝ) :
    (scale*mass)*Real.log (scale*mass) = scale*(mass*Real.log mass) + (scale*mass)*Real.log scale := by
  by_cases zeroScale : scale = 0
  · simp [zeroScale]
  by_cases zeroMass : mass = 0
  · simp [zeroMass]
  rw [Real.log_mul zeroScale zeroMass]
  ring

/-- Pooling entropy is homogeneous: multiplying all masses multiplies the entropy contribution. -/
theorem massEntropy_scaled (scale : ℝ) (mass : A → ℝ) :
    massEntropy (fun symbol => scale*mass symbol) = scale*massEntropy mass := by
  unfold massEntropy entropy
  rw [← Finset.mul_sum]
  simp_rw [mul_log_scaled]
  rw [Finset.sum_add_distrib, ← Finset.mul_sum, ← Finset.sum_mul, ← Finset.mul_sum]
  ring

/-- For nonzero total mass, the algebraic expression is total mass times normalized entropy. -/
theorem massEntropy_normalize (mass : A → ℝ) (nonzero : (∑ symbol, mass symbol) ≠ 0) :
    massEntropy mass = (∑ symbol, mass symbol)*entropy (fun symbol => mass symbol/(∑ other, mass other)) := by
  have normalized : (∑ symbol, mass symbol/(∑ other, mass other)) = 1 := by
    rw [← Finset.sum_div, div_self nonzero]
  have scaled := massEntropy_scaled (1/(∑ symbol, mass symbol)) mass
  have same : (fun symbol => 1/(∑ other, mass other)*mass symbol) =
      (fun symbol => mass symbol/(∑ other, mass other)) := by funext symbol; ring
  rw [same, massEntropy_of_normalized _ normalized] at scaled
  rw [scaled]
  field_simp

/-- Integer count entropy is exactly mass entropy of the integer count vector. -/
theorem countEntropy_massEntropy (counts : A → ℕ) :
    countEntropy counts = massEntropy (fun symbol => (counts symbol : ℝ)) := by
  unfold countEntropy massEntropy entropy
  push_cast
  ring

/-- The usual count-entropy identity is valid even for an empty empirical population. -/
theorem countEntropy_eq_any (counts : A → ℕ) :
    countEntropy counts = ((∑ symbol, counts symbol : ℕ) : ℝ)*
      entropy (fun symbol => (counts symbol : ℝ)/(∑ other, counts other : ℕ)) := by
  by_cases empty : ∑ symbol, counts symbol = 0
  · have zero (symbol : A) : counts symbol = 0 :=
      Finset.sum_eq_zero_iff.mp empty symbol (Finset.mem_univ symbol)
    simp only [countEntropy, Nat.cast_zero, zero_mul, zero, Finset.sum_const_zero, sub_zero]
  · exact countEntropy_eq counts (Nat.pos_of_ne_zero empty)

/-- Relative to any positive parent size, a sector contributes size times its pooled mass entropy. -/
theorem countEntropy_parent_scale (counts : A → ℕ) (size : ℝ) (nonzero : size ≠ 0) :
    countEntropy counts = size*massEntropy (fun symbol => (counts symbol : ℝ)/size) := by
  have scaled := massEntropy_scaled (1/size) (fun symbol => (counts symbol : ℝ))
  have same : (fun symbol => 1/size*(counts symbol : ℝ)) =
      (fun symbol => (counts symbol : ℝ)/size) := by funext symbol; ring
  rw [same] at scaled
  rw [scaled, countEntropy_massEntropy]
  field_simp

end
end MatrixBounds.Entropy
