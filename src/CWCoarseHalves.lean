module

public import CWRegroup
public import ShapeAlphabet

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Every nonzero parent coefficient has an actual admissible coarse split.
Splitting its coordinates recovers both complementary child constituents. -/
namespace MatrixBounds.Tensor.CW

open Numeric
noncomputable section
variable {K : Type*} [CommRing K]

omit [CommRing K] in
/-- A word's coarse total is at most twice its length. -/
theorem wordCoarse_le {q length : ℕ} (word : Fin length → Fin (q+2)) : wordCoarse word ≤ 2*length := by
  have bound := Finset.sum_le_sum (s := Finset.univ) (fun position _ => coarse_le_two (word position))
  simpa only [wordCoarse, Finset.sum_const, Finset.card_univ, Fintype.card_fin, smul_eq_mul, mul_comm] using bound

/-- The coarse total as a member of its finite, exact coordinate alphabet. -/
def wordCoarseIndex {q length : ℕ} (word : Fin length → Fin (q+2)) : Fin (2*length+1) :=
  ⟨wordCoarse word, Nat.lt_succ_of_le (wordCoarse_le word)⟩

/-- The left half of a complete coordinate or fine-label word. -/
def leftHalf {A : Type*} {leftLength rightLength : ℕ} (word : Fin (leftLength+rightLength) → A) :
    Fin leftLength → A := fun position => word (Fin.castAdd rightLength position)

/-- The right half of a complete coordinate or fine-label word. -/
def rightHalf {A : Type*} {leftLength rightLength : ℕ} (word : Fin (leftLength+rightLength) → A) :
    Fin rightLength → A := fun position => word (Fin.natAdd leftLength position)

omit [CommRing K] in
/-- Splitting then concatenating recovers the original complete word. -/
theorem concatenate_halves {A : Type*} {leftLength rightLength : ℕ}
    (word : Fin (leftLength+rightLength) → A) : concatenate (leftHalf word) (rightHalf word) = word := by
  funext position
  refine Fin.addCases (fun i => ?_) (fun i => ?_) position <;>
    simp only [concatenate, Fin.addCases_left, Fin.addCases_right, leftHalf, rightHalf]

omit [CommRing K] in
/-- The two child coarse totals sum exactly to the parent total. -/
theorem wordCoarse_halves {q leftLength rightLength : ℕ} (word : Fin (leftLength+rightLength) → Fin (q+2)) :
    wordCoarse (leftHalf word) + wordCoarse (rightHalf word) = wordCoarse word := by
  rw [← wordCoarse_concatenate, concatenate_halves]

/-- Every parent coefficient is the product of its two actual child coefficients. -/
theorem wordPower_halves {q leftLength rightLength : ℕ}
    (x y z : Fin (leftLength+rightLength) → Fin (q+2)) :
    wordPower (tensor (K := K) q) (leftLength+rightLength) x y z =
      wordPower (tensor q) leftLength (leftHalf x) (leftHalf y) (leftHalf z) *
        wordPower (tensor q) rightLength (rightHalf x) (rightHalf y) (rightHalf z) := by
  simpa only [concatenate_halves] using wordPower_concatenate (K := K)
    (leftHalf x) (leftHalf y) (leftHalf z) (rightHalf x) (rightHalf y) (rightHalf z)

omit [CommRing K] in
/-- A parent axis restricted to its prescribed left coarse index is an actual left child variable. -/
def leftChildAxis {q leftLength rightLength parentTotal childTotal : ℕ}
    (word : AxisVariable q (leftLength+rightLength) parentTotal)
    (coarse : wordCoarse (leftHalf word.val) = childTotal) : AxisVariable q leftLength childTotal :=
  ⟨leftHalf word.val, coarse⟩

omit [CommRing K] in
/-- The same parent axis determines a right child with the complementary coarse total. -/
def rightChildAxis {q leftLength rightLength parentTotal childTotal : ℕ}
    (word : AxisVariable q (leftLength+rightLength) parentTotal)
    (coarse : wordCoarse (leftHalf word.val) = childTotal) : AxisVariable q rightLength (parentTotal-childTotal) :=
  ⟨rightHalf word.val, by
    have sums := wordCoarse_halves word.val
    rw [word.property, coarse] at sums
    omega⟩

omit [CommRing K] in
/-- The three actual left coarse indices name the coarse split of a coefficient. -/
def leftShape {q leftLength rightLength : ℕ} (parent : Shape)
    (x : AxisVariable q (leftLength+rightLength) parent.x)
    (y : AxisVariable q (leftLength+rightLength) parent.y)
    (z : AxisVariable q (leftLength+rightLength) parent.z) : Shape :=
  ⟨wordCoarse (leftHalf x.val), wordCoarse (leftHalf y.val), wordCoarse (leftHalf z.val)⟩

omit [CommRing K] in
/-- Each actual left child coordinate fits in its parent coordinate. -/
theorem leftShape_fits {q leftLength rightLength : ℕ} (parent : Shape)
    (x : AxisVariable q (leftLength+rightLength) parent.x)
    (y : AxisVariable q (leftLength+rightLength) parent.y)
    (z : AxisVariable q (leftLength+rightLength) parent.z) : (leftShape parent x y z).Fits parent := by
  have hx := wordCoarse_halves x.val
  have hy := wordCoarse_halves y.val
  have hz := wordCoarse_halves z.val
  rw [x.property] at hx
  rw [y.property] at hy
  rw [z.property] at hz
  exact ⟨Nat.le.intro hx, Nat.le.intro hy, Nat.le.intro hz⟩

/-- A nonzero parent coefficient has a left shape in the full child support alphabet. -/
theorem leftShape_total {q leftLength rightLength : ℕ} (parent : Shape)
    (x : AxisVariable q (leftLength+rightLength) parent.x)
    (y : AxisVariable q (leftLength+rightLength) parent.y)
    (z : AxisVariable q (leftLength+rightLength) parent.z)
    (nonzero : constituent (K := K) q (leftLength+rightLength) parent x y z ≠ 0) :
    (leftShape parent x y z).total = 2*leftLength := by
  have productNonzero :
      wordPower (tensor (K := K) q) leftLength (leftHalf x.val) (leftHalf y.val) (leftHalf z.val) *
        wordPower (tensor q) rightLength (rightHalf x.val) (rightHalf y.val) (rightHalf z.val) ≠ 0 := by
    rw [← wordPower_halves]
    exact nonzero
  exact word_support_total _ _ _ (left_ne_zero_of_mul productNonzero)

/-- The actual support edge is a finite shape-alphabet symbol; no completeness assumption is needed. -/
def actualLeftSymbol {q leftLength rightLength : ℕ} (parent : Shape)
    (x : AxisVariable q (leftLength+rightLength) parent.x)
    (y : AxisVariable q (leftLength+rightLength) parent.y)
    (z : AxisVariable q (leftLength+rightLength) parent.z)
    (nonzero : constituent (K := K) q (leftLength+rightLength) parent x y z ≠ 0) :
    ShapeAlphabet (2*leftLength) :=
  ⟨leftShape parent x y z, mem_shapes_of_total (leftShape_total parent x y z nonzero)⟩

end
end MatrixBounds.Tensor.CW
