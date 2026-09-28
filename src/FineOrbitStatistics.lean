import FineWordOrbits

/-! Every additive fine-symbol statistic is constant on the actual recursive
word orbits. This includes total degree and middle-symbol multiplicity. -/
namespace MatrixBounds.Entropy

open Tensor.CW
open scoped BigOperators
noncomputable section

/-- Sum a specified nonnegative symbol statistic over every coordinate of a complete fine word. -/
def fineStatistic {length : ℕ} (symbolValue : Fin 3 → ℕ) (word : Fin length → Fin 3) : ℕ :=
  ∑ position, symbolValue (word position)

/-- Splitting a complete word divides its additive statistic between exactly its two halves. -/
theorem fineStatistic_halves {length : ℕ} (symbolValue : Fin 3 → ℕ) (word : Fin (length+length) → Fin 3) :
    fineStatistic symbolValue word = fineStatistic symbolValue (leftHalf word)+fineStatistic symbolValue (rightHalf word) := by
  simp only [fineStatistic, Fin.sum_univ_add, leftHalf, rightHalf]

/-- The statistic of a one-letter word is exactly the statistic of its singleton orbit label. -/
theorem oneLetterOrbits_statistic (symbolValue : Fin 3 → ℕ) (word : Fin 1 → Fin 3) :
    fineStatistic symbolValue word = symbolValue (oneLetterOrbits.label word) := by
  simp only [fineStatistic, Fin.sum_univ_one, oneLetterOrbits]

/-- The recursive statistic at a parent orbit is the sum at its two fixed child representatives. -/
def PairEncoding.statistic {children parents : ℕ} (encoding : PairEncoding children parents)
    (childStatistic : Fin children → ℕ) (orbit : Fin parents) : ℕ :=
  childStatistic (encoding.columns orbit).1+childStatistic (encoding.columns orbit).2

/-- Actual word statistics follow the same recursive pair formula as the supplied orbit coordinates. -/
theorem PairEncoding.wordOrbits_statistic {length children parents : ℕ} (encoding : PairEncoding children parents)
    (partition : OrbitMap (Fin length → Fin 3) (Fin children))
    (symbolValue : Fin 3 → ℕ) (childStatistic : Fin children → ℕ)
    (childIdentity : ∀ word, fineStatistic symbolValue word = childStatistic (partition.label word))
    (word : Fin (length+length) → Fin 3) :
    fineStatistic symbolValue word = encoding.statistic childStatistic ((encoding.wordOrbits partition).label word) := by
  rw [fineStatistic_halves, childIdentity, childIdentity]
  exact encoding.symmetric_invariant (fun left right => childStatistic left+childStatistic right)
    (fun left right => Nat.add_comm _ _) (partition.label (leftHalf word), partition.label (rightHalf word))

/-- Every word has the same verified statistic as the representative of its actual orbit. -/
theorem orbit_statistic_invariant {length orbits : ℕ} (partition : OrbitMap (Fin length → Fin 3) (Fin orbits))
    (symbolValue : Fin 3 → ℕ) (statistic : Fin orbits → ℕ)
    (identity : ∀ word, fineStatistic symbolValue word = statistic (partition.label word)) (word : Fin length → Fin 3) :
    fineStatistic symbolValue word = fineStatistic symbolValue (partition.representative (partition.label word)) := by
  rw [identity, identity, partition.representative_label]

end
end MatrixBounds.Entropy
