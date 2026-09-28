import CWRationalOrbitParents
import Mathlib.Data.Rat.Cast.Lemmas

/-! Computable rational arithmetic for compressed parent laws and strategy
mixtures agrees exactly with the actual real laws used by extraction. -/
namespace MatrixBounds.Numeric.OrbitArithmetic

open Tensor.CW Entropy Empirical
open scoped BigOperators

/-- A finite exact rational mixture, retaining every source label. -/
def mixture {I O : Type*} [Fintype I] (weight : I → ℚ) (mass : I → O → ℚ) (orbit : O) : ℚ :=
  ∑ index, weight index*mass index orbit

/-- Interpreting a computed rational mixture in the reals gives the exact real mixture. -/
theorem cast_mixture {I O : Type*} [Fintype I] (weight : I → ℚ) (mass : I → O → ℚ) (orbit : O) :
    (mixture weight mass orbit : ℝ) = ∑ index, (weight index : ℝ)*(mass index orbit : ℝ) := by
  simp only [mixture, Rat.cast_sum, Rat.cast_mul]

/-- Select one complete compatibility sector while keeping its exact source weights. -/
def pool {I O : Type*} [Fintype I] (weight : I → ℚ) (mass : I → O → ℚ)
    (selected : I → Bool) (orbit : O) : ℚ :=
  ∑ index, if selected index then weight index*mass index orbit else 0

/-- The computable rational pool has exactly the complete real sector-mass formula. -/
theorem cast_pool {I O : Type*} [Fintype I] (weight : I → ℚ) (mass : I → O → ℚ)
    (selected : I → Bool) (orbit : O) :
    (pool weight mass selected orbit : ℝ) =
      ∑ index, if selected index then (weight index : ℝ)*(mass index orbit : ℝ) else 0 := by
  simp only [pool, Rat.cast_sum, apply_ite, Rat.cast_mul, Rat.cast_zero]

/-- Exact compressed parent masses, computed from child masses and the verified orbit sizes and pair columns. -/
def parentMass {I C P : Type*} [Fintype I] (weight : I → ℚ) (complement : I → I)
    (childSize : C → ℕ) (parentSize : P → ℕ) (columns : P → C × C) (mass : I → C → ℚ) (orbit : P) : ℚ :=
  parentSize orbit*∑ index, weight index*
    ((mass index (columns orbit).1/childSize (columns orbit).1)*
      (mass (complement index) (columns orbit).2/childSize (columns orbit).2))

/-- The finite rational parent arithmetic equals the compressed mass of the actual full parent law. -/
theorem cast_parentMass {length denominator children parents : ℕ}
    (split : RationalSplit length denominator) (encoding : PairEncoding children parents)
    (partition : OrbitMap (Fin length → Fin 3) (Fin children))
    (childSize : Fin children → ℕ) (parentSize : Fin parents → ℕ)
    (childCorrect : ∀ orbit, childSize orbit = partition.size orbit)
    (parentCorrect : ∀ orbit, parentSize orbit = (encoding.wordOrbits partition).size orbit)
    (mass : ShapeAlphabet (2*length) → Fin children → ℚ) (orbit : Fin parents) :
    (parentMass (fun child => (split.numerator child : ℚ)/denominator)
      (complementEquiv split.parent (2*length) split.balanced) childSize parentSize encoding.columns mass orbit : ℝ) =
      split.orbitParentMass encoding partition (fun child label => (mass child label : ℝ)) orbit := by
  rw [split.orbitParentMass_formula]
  simp only [parentMass, RationalSplit.orbitParentValue, Rat.cast_mul, Rat.cast_sum,
    Rat.cast_div, Rat.cast_natCast, childCorrect, parentCorrect]

end MatrixBounds.Numeric.OrbitArithmetic
