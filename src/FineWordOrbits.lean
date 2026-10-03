module

public import PairOrbitEncoding
public import CWCoarseHalves
public import Mathlib.Algebra.BigOperators.Fin

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Recursive finite orbits refer to the same complete fine-label words used
by the CW tensor windows, with an exact lexicographic column enumeration. -/
namespace MatrixBounds.Entropy

open Tensor.CW
noncomputable section

/-- Reverse the coordinate order of a finite fine-label word, with its explicit inverse. -/
def reverseFineWord (length : ℕ) : (Fin length → Fin 3) ≃ (Fin length → Fin 3) where
  toFun word position := word position.rev
  invFun word position := word position.rev
  left_inv word := by funext position; simp only [Fin.rev_rev]
  right_inv word := by funext position; simp only [Fin.rev_rev]

/-- Complete fine words in the supplied lexicographic base-three column order. -/
def fineWordColumns (length : ℕ) : Fin (3^length) ≃ (Fin length → Fin 3) :=
  finFunctionFinEquiv.symm.trans (reverseFineWord length)

/-- Splitting a complete fine word into its two halves is an actual bijection. -/
def fineWordHalves (length : ℕ) : (Fin (length+length) → Fin 3) ≃ (Fin length → Fin 3) × (Fin length → Fin 3) where
  toFun word := (leftHalf word, rightHalf word)
  invFun pair := concatenate pair.1 pair.2
  left_inv := concatenate_halves
  right_inv pair := by
    apply Prod.ext <;> funext position <;>
      simp only [leftHalf, rightHalf, concatenate, Fin.addCases_left, Fin.addCases_right]

/-- A one-letter word has one of the three singleton fine-symbol orbits. -/
def oneLetterOrbits : OrbitMap (Fin 1 → Fin 3) (Fin 3) where
  label word := word 0
  representative symbol := fun _ => symbol
  representative_label _ := rfl

/-- Each base orbit contains precisely its single one-letter word. -/
theorem oneLetterOrbits_size (symbol : Fin 3) : oneLetterOrbits.size symbol = 1 := by
  let labels : oneLetterOrbits.Fiber symbol ≃ PUnit.{1} := {
    toFun := fun _ => PUnit.unit
    invFun := fun _ => ⟨fun _ => symbol, rfl⟩
    left_inv := fun word => by
      apply Subtype.ext
      funext position
      have same : position = 0 := Subsingleton.elim _ _
      rw [same]
      exact word.property.symm
    right_inv := fun _ => rfl }
  simpa only [OrbitMap.size, ← Nat.card_eq_fintype_card, Nat.card_unique] using Nat.card_congr labels

/-- The next recursive word orbit is the checked unordered pair of its two child-word orbits. -/
def PairEncoding.wordOrbits {length children parents : ℕ} (encoding : PairEncoding children parents)
    (child : OrbitMap (Fin length → Fin 3) (Fin children)) :
    OrbitMap (Fin (length+length) → Fin 3) (Fin parents) :=
  (encoding.pairOrbit child).reindex (fineWordHalves length)

/-- Recursive orbit labels use exactly the left and right complete fine words seen by the extraction formulas. -/
theorem PairEncoding.wordOrbits_label {length children parents : ℕ} (encoding : PairEncoding children parents)
    (child : OrbitMap (Fin length → Fin 3) (Fin children)) (word : Fin (length+length) → Fin 3) :
    (encoding.wordOrbits child).label word = encoding.code (child.label (leftHalf word), child.label (rightHalf word)) := rfl

/-- The exact recursive word-orbit cardinality is unchanged by concatenating its two halves. -/
theorem PairEncoding.wordOrbits_size {length children parents : ℕ} (encoding : PairEncoding children parents)
    (child : OrbitMap (Fin length → Fin 3) (Fin children)) (orbit : Fin parents) :
    (encoding.wordOrbits child).size orbit = (encoding.pairOrbit child).size orbit :=
  OrbitMap.reindex_size _ _ _

end
end MatrixBounds.Entropy
