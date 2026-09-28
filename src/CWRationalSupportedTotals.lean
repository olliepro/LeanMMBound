import CWRationalProbabilityTotals

/-! Unsupported child symbols have zero split weight. Actual source fine laws
therefore need normalization only at admissible hierarchy children. -/
namespace MatrixBounds.Tensor.CW.RationalSplit

open Numeric Entropy
open scoped BigOperators
noncomputable section

/-- Both children of every nonzero rational split are admissible parent components. -/
theorem supported_pair {length denominator : ℕ} (split : RationalSplit length denominator)
    (child : ShapeAlphabet (2*length)) (nonzero : split.numerator child ≠ 0) :
    child.val.Fits split.parent ∧
      (complementEquiv split.parent (2*length) split.balanced child).val.Fits split.parent := by
  have fits := split.supported child nonzero
  refine ⟨fits, ?_⟩
  rw [complementEquiv_shape _ _ _ _ fits]
  exact (Shape.complement_involution fits).1

/-- Complete parent normalization needs unit child mass only on the actual supported coarse shapes. -/
theorem parentLaw_total_supported {length denominator : ℕ} (split : RationalSplit length denominator)
    (positive : 0 < denominator)
    (law : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℝ)
    (normalized : ∀ child, child.val.Fits split.parent → ∑ word, law child word = 1) :
    (∑ word, split.parentLaw law word) = 1 := by
  unfold parentLaw SplitRestrictionData.rationalParentLaw
  rw [Finset.sum_comm]
  simp_rw [← Finset.mul_sum]
  have weighted (child : ShapeAlphabet (2*length)) :
      ((split.numerator child : ℝ)/denominator)*
        (∑ word : Fin (length+length) → Fin 3, law child (leftHalf word)*
          law (complementEquiv split.parent (2*length) split.balanced child) (rightHalf word)) =
      (split.numerator child : ℝ)/denominator := by
    by_cases zero : split.numerator child = 0
    · simp only [zero, Nat.cast_zero, zero_div, zero_mul]
    · obtain ⟨fits, complementFits⟩ := split.supported_pair child zero
      have reindex := Equiv.sum_comp (fineWordHalves length)
        (fun pair => law child pair.1*law (complementEquiv split.parent (2*length) split.balanced child) pair.2)
      rw [show (∑ word : Fin (length+length) → Fin 3, law child (leftHalf word)*
        law (complementEquiv split.parent (2*length) split.balanced child) (rightHalf word)) = _ from reindex]
      simp only [Fintype.sum_prod_type, ← Finset.mul_sum, normalized _ complementFits,
        mul_one, normalized _ fits]
  simp_rw [weighted]
  rw [← Finset.sum_div, ← Nat.cast_sum, split.normalized]
  exact div_self (by exact_mod_cast positive.ne')

/-- Changing nonexistent child laws does not change any coordinate of the actual parent law. -/
theorem parentLaw_congr_supported {length denominator : ℕ} (split : RationalSplit length denominator)
    (first second : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℝ)
    (equal : ∀ child, child.val.Fits split.parent → first child = second child) :
    split.parentLaw first = split.parentLaw second := by
  funext word
  unfold parentLaw SplitRestrictionData.rationalParentLaw
  apply Finset.sum_congr rfl
  intro child _
  by_cases zero : split.numerator child = 0
  · simp only [zero, Nat.cast_zero, zero_div, zero_mul]
  · obtain ⟨fits, complementFits⟩ := split.supported_pair child zero
    rw [equal child fits, equal _ complementFits]

end
end MatrixBounds.Tensor.CW.RationalSplit
