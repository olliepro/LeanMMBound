import CWRationalLawValidity

/-! Exact normalization of actual recursive parent laws and strategy mixtures.
These identities discharge the probability hypotheses in the entropy bindings. -/
namespace MatrixBounds

open Numeric Entropy Tensor.CW
open scoped BigOperators
noncomputable section

namespace Tensor.CW.RationalSplit

/-- Independent concatenation preserves complete probability mass at every supported rational split. -/
theorem parentLaw_total {length denominator : ℕ} (split : RationalSplit length denominator)
    (positive : 0 < denominator)
    (law : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℝ)
    (normalized : ∀ child, ∑ word, law child word = 1) :
    (∑ word, split.parentLaw law word) = 1 := by
  unfold parentLaw SplitRestrictionData.rationalParentLaw
  rw [Finset.sum_comm]
  have wordTotal (child : ShapeAlphabet (2*length)) :
      (∑ word : Fin (length+length) → Fin 3, law child (leftHalf word)*
        law (complementEquiv split.parent (2*length) split.balanced child) (rightHalf word)) = 1 := by
    have reindex := Equiv.sum_comp (fineWordHalves length)
      (fun pair => law child pair.1*law (complementEquiv split.parent (2*length) split.balanced child) pair.2)
    rw [show (∑ word : Fin (length+length) → Fin 3, law child (leftHalf word)*
      law (complementEquiv split.parent (2*length) split.balanced child) (rightHalf word)) = _ from reindex]
    simp only [Fintype.sum_prod_type, ← Finset.mul_sum, normalized, mul_one]
  simp_rw [← Finset.mul_sum, wordTotal, mul_one]
  rw [← Finset.sum_div, ← Nat.cast_sum, split.normalized]
  exact div_self (by exact_mod_cast positive.ne')

/-- The compressed actual parent law is normalized whenever every complete compressed child law is normalized. -/
theorem orbitParentMass_total {length denominator children parents : ℕ}
    (split : RationalSplit length denominator) (positive : 0 < denominator)
    (encoding : PairEncoding children parents)
    (partition : OrbitMap (Fin length → Fin 3) (Fin children))
    (mass : ShapeAlphabet (2*length) → Fin children → ℝ)
    (normalized : ∀ child, ∑ orbit, mass child orbit = 1) :
    (∑ orbit, split.orbitParentMass encoding partition mass orbit) = 1 := by
  rw [← (encoding.wordOrbits partition).decode_total, ← split.parentLaw_decode]
  exact split.parentLaw_total positive _ (fun child => (partition.decode_total (mass child)).trans (normalized child))

/-- Nonnegative compressed child laws produce nonnegative actual compressed parent masses. -/
theorem orbitParentMass_nonnegative {length denominator children parents : ℕ}
    (split : RationalSplit length denominator) (encoding : PairEncoding children parents)
    (partition : OrbitMap (Fin length → Fin 3) (Fin children))
    (mass : ShapeAlphabet (2*length) → Fin children → ℝ)
    (nonnegative : ∀ child orbit, 0 ≤ mass child orbit) (orbit : Fin parents) :
    0 ≤ split.orbitParentMass encoding partition mass orbit := by
  rw [split.orbitParentMass_formula]
  apply mul_nonneg (Nat.cast_nonneg _)
  apply Finset.sum_nonneg
  intro child _
  exact mul_nonneg (div_nonneg (Nat.cast_nonneg _) (Nat.cast_nonneg _))
    (mul_nonneg (div_nonneg (nonnegative _ _) (Nat.cast_nonneg _))
      (div_nonneg (nonnegative _ _) (Nat.cast_nonneg _)))

end Tensor.CW.RationalSplit

/-- A supplied normalized strategy mixture of complete probability laws has exactly unit total mass. -/
theorem supplied_mixture_total {width denominator : ℕ} {Word : Type*} [Fintype Word]
    (source : TypedProbabilityRow width denominator) (positive : 0 < denominator)
    (law : Fin width → Word → ℝ) (normalized : ∀ strategy, ∑ word, law strategy word = 1) :
    (∑ word, ∑ strategy, (source.rational strategy : ℝ)*law strategy word) = 1 := by
  rw [Finset.sum_comm]
  simp_rw [← Finset.mul_sum, normalized, mul_one]
  exact source.real_total positive

end
end MatrixBounds
