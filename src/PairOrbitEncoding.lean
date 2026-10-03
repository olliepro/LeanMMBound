module

public import FiniteOrbitProducts
public import Mathlib.Data.Fin.Basic

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! A checked encoding of unordered child-orbit pairs gives the recursive
word orbits used by the supplied numerical distributions. -/
namespace MatrixBounds.Entropy

open scoped BigOperators
noncomputable section

/-- Exact finite numbering of unordered child-orbit pairs, in a fixed column order. -/
structure PairEncoding (children parents : ℕ) where
  columns : Fin parents → Fin children × Fin children
  code : Fin children × Fin children → Fin parents
  code_columns : ∀ orbit, code (columns orbit) = orbit
  columns_code : ∀ pair, columns (code pair) = (min pair.1 pair.2, max pair.1 pair.2)

namespace PairEncoding
variable {children parents : ℕ}

/-- The checked pair numbering is an actual finite partition with its supplied representatives. -/
def partition (encoding : PairEncoding children parents) : OrbitMap (Fin children × Fin children) (Fin parents) where
  label := encoding.code
  representative := encoding.columns
  representative_label := encoding.code_columns

/-- A symmetric function of the child labels is constant on each checked unordered-pair fiber. -/
theorem symmetric_invariant {A : Type*} (encoding : PairEncoding children parents)
    (value : Fin children → Fin children → A) (symmetric : ∀ left right, value left right = value right left)
    (pair : Fin children × Fin children) :
    value pair.1 pair.2 = value (encoding.columns (encoding.code pair)).1 (encoding.columns (encoding.code pair)).2 := by
  rw [encoding.columns_code]
  by_cases ordered : pair.1 ≤ pair.2
  · rw [min_eq_left ordered, max_eq_right ordered]
  · have reversed := le_of_not_ge ordered
    rw [min_eq_right reversed, max_eq_left reversed]
    exact symmetric pair.1 pair.2

/-- Pair two actual child word orbits, then identify precisely the left/right exchange symmetry. -/
def pairOrbit {Word : Type*} (encoding : PairEncoding children parents) (child : OrbitMap Word (Fin children)) :
    OrbitMap (Word × Word) (Fin parents) := (child.product child).compose encoding.partition

/-- Every recursive parent orbit size is an exact sum of products of its child sizes. -/
theorem pairOrbit_size {Word : Type*} [Fintype Word]
    (encoding : PairEncoding children parents) (child : OrbitMap Word (Fin children)) (orbit : Fin parents) :
    (encoding.pairOrbit child).size orbit =
      ∑ pair : encoding.partition.Fiber orbit, child.size pair.val.1*child.size pair.val.2 := by
  rw [pairOrbit, OrbitMap.compose_size]
  apply Finset.sum_congr (by ext; simp)
  intro pair _
  exact child.product_size child pair.val

/-- Evaluate recursive orbit sizes by summing over the small finite child-label alphabet. -/
def parentSize (encoding : PairEncoding children parents) (childSize : Fin children → ℕ) (orbit : Fin parents) : ℕ :=
  ∑ pair : Fin children × Fin children,
    if encoding.code pair = orbit then childSize pair.1*childSize pair.2 else 0

/-- The small finite size evaluator computes actual word-fiber cardinalities exactly. -/
theorem pairOrbit_size_evaluator {Word : Type*} [Fintype Word]
    (encoding : PairEncoding children parents) (child : OrbitMap Word (Fin children)) (orbit : Fin parents) :
    (encoding.pairOrbit child).size orbit = encoding.parentSize child.size orbit := by
  rw [encoding.pairOrbit_size, parentSize, ← Finset.sum_filter]
  exact (Finset.sum_subtype (Finset.univ.filter (fun pair => encoding.code pair = orbit)) (by simp [partition])
    (fun pair => child.size pair.1*child.size pair.2)).symm

/-- A symmetric formula on the two child labels expands uniformly on the actual recursive word orbits. -/
theorem pairOrbit_invariant {Word : Type*} (encoding : PairEncoding children parents)
    (child : OrbitMap Word (Fin children)) (value : Fin children → Fin children → ℝ)
    (symmetric : ∀ left right, value left right = value right left) (word : Word × Word) :
    value (child.label word.1) (child.label word.2) =
      value (child.label ((encoding.pairOrbit child).representative ((encoding.pairOrbit child).label word)).1)
        (child.label ((encoding.pairOrbit child).representative ((encoding.pairOrbit child).label word)).2) := by
  simp only [pairOrbit, OrbitMap.compose, OrbitMap.product, partition, child.representative_label]
  exact encoding.symmetric_invariant value symmetric (child.label word.1, child.label word.2)

end PairEncoding
end
end MatrixBounds.Entropy
