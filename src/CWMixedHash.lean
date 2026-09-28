import CWPartition
import HeterogeneousInterface
import HashConditional

/-! The shared mixed-level hash instantiated with actual selected factors of
heterogeneous CW tensor powers. Factor lengths may vary from position to position. -/
namespace MatrixBounds.Tensor.CW

open scoped BigOperators
noncomputable section
variable {K : Type*} [CommRing K] [NoZeroDivisors K] [Nontrivial K]

/-- Selecting any set of factors of a nonzero tensor-power coefficient preserves nonzeroness. -/
theorem selected_word_nonzero {q length selectedLength : ℕ}
    (positions : Fin selectedLength → Fin length) (x y z : Fin length → Fin (q+2))
    (nonzero : wordPower (tensor (K := K) q) length x y z ≠ 0) :
    wordPower (tensor (K := K) q) selectedLength
      (fun i => x (positions i)) (fun i => y (positions i)) (fun i => z (positions i)) ≠ 0 := by
  apply Finset.prod_ne_zero_iff.mpr
  intro i _ zero
  exact nonzero (Finset.prod_eq_zero (Finset.mem_univ (positions i)) zero)

/-- A heterogeneous CW product is supported on the coarse sums needed for one shared hash. -/
theorem heterogeneous_selected_totals {Parent : Type*} [Fintype Parent] {q : ℕ}
    (length selectedLength : Parent → ℕ) (positions : ∀ p, Fin (selectedLength p) → Fin (length p))
    (x y z : ∀ p, Fin (length p) → Fin (q+2))
    (nonzero : Interface.heterogeneous (fun p => wordPower (tensor (K := K) q) (length p)) x y z ≠ 0)
    (parent : Parent) :
    wordCoarse (fun i => x parent (positions parent i)) + wordCoarse (fun i => y parent (positions parent i)) +
      wordCoarse (fun i => z parent (positions parent i)) = 2*selectedLength parent := by
  have parent_nonzero : wordPower (tensor (K := K) q) (length parent) (x parent) (y parent) (z parent) ≠ 0 := by
    intro zero
    exact nonzero (Finset.prod_eq_zero (Finset.mem_univ parent) zero)
  exact word_support_total _ _ _ (selected_word_nonzero (positions parent) _ _ _ parent_nonzero)

/-- The mixed-level hash equation holds for every nonzero coefficient of the actual CW source.
For example, selecting the left halves of level-four and level-three factors
uses different selectedLength values in the same equation. -/
theorem heterogeneous_shared_hash {F Parent : Type*} [Field F] [NeZero (2 : F)] [Fintype Parent] {q : ℕ}
    (length selectedLength : Parent → ℕ) (positions : ∀ p, Fin (selectedLength p) → Fin (length p))
    (x y z : ∀ p, Fin (length p) → Fin (q+2))
    (nonzero : Interface.heterogeneous (fun p => wordPower (tensor (K := K) q) (length p)) x y z ≠ 0)
    (offset shift : F) (weight : Parent → F) :
    hashX offset weight (fun p => (wordCoarse (fun i => x p (positions p i)) : F)) +
      hashY offset shift weight (fun p => (wordCoarse (fun i => y p (positions p i)) : F)) =
      2*hashZ offset shift weight (fun p => (2*selectedLength p : ℕ))
        (fun p => (wordCoarse (fun i => z p (positions p i)) : F)) := by
  apply shared_hash_identity
  intro parent
  exact_mod_cast congrArg (fun n : ℕ => (n : F))
    (heterogeneous_selected_totals length selectedLength positions x y z nonzero parent)

end
end MatrixBounds.Tensor.CW
