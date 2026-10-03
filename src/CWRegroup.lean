module

public import CWConstituents

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Exact child-to-parent regrouping of CW coefficient tensors, with actual
coarse variable maps. Concatenation preserves each separately prescribed child shape. -/
namespace MatrixBounds.Tensor.CW

open scoped BigOperators
noncomputable section
variable {K : Type*} [CommRing K]

/-- Concatenate two coordinate words using the canonical disjoint sum of their positions. -/
def concatenate {X : Type*} {leftLength rightLength : ℕ}
    (left : Fin leftLength → X) (right : Fin rightLength → X) : Fin (leftLength+rightLength) → X :=
  Fin.addCases left right

/-- Coarse totals add under concatenation. -/
theorem wordCoarse_concatenate {q leftLength rightLength : ℕ}
    (left : Fin leftLength → Fin (q+2)) (right : Fin rightLength → Fin (q+2)) :
    wordCoarse (concatenate left right) = wordCoarse left + wordCoarse right := by
  simp only [wordCoarse, Fin.sum_univ_add, concatenate, Fin.addCases_left, Fin.addCases_right]

/-- Concatenation realizes the tensor product of child CW powers inside the parent power. -/
theorem wordPower_concatenate {q leftLength rightLength : ℕ}
    (x y z : Fin leftLength → Fin (q+2)) (x' y' z' : Fin rightLength → Fin (q+2)) :
    wordPower (tensor (K := K) q) (leftLength+rightLength)
      (concatenate x x') (concatenate y y') (concatenate z z') =
      wordPower (tensor q) leftLength x y z * wordPower (tensor q) rightLength x' y' z' := by
  simp only [wordPower, Fin.prod_univ_add, concatenate, Fin.addCases_left, Fin.addCases_right]

/-- Pair two child variables to form the parent variable of their summed coarse total. -/
def concatenateAxis {q leftLength rightLength leftTotal rightTotal : ℕ}
    (left : AxisVariable q leftLength leftTotal) (right : AxisVariable q rightLength rightTotal) :
    AxisVariable q (leftLength+rightLength) (leftTotal+rightTotal) :=
  ⟨concatenate left.val right.val, by rw [wordCoarse_concatenate, left.property, right.property]⟩

/-- Coordinatewise sum of two child shapes. -/
def addShape (left right : Numeric.Shape) : Numeric.Shape :=
  ⟨left.x+right.x, left.y+right.y, left.z+right.z⟩

/-- Parent constituents pulled back along the child concatenation maps are exactly child products. -/
theorem constituent_product_identity {q leftLength rightLength : ℕ} (left right : Numeric.Shape) :
    (fun x y z => constituent (K := K) q (leftLength+rightLength) (addShape left right)
      (concatenateAxis x.1 x.2) (concatenateAxis y.1 y.2) (concatenateAxis z.1 z.2)) =
      product (constituent q leftLength left) (constituent q rightLength right) := by
  funext x y z
  exact wordPower_concatenate x.1.val y.1.val z.1.val x.2.val y.2.val z.2.val

/-- The child-product maps transport any parent polynomial certificate without extra rank. -/
def splitConstituentCertificate {q leftLength rightLength rank degree : ℕ} (left right : Numeric.Shape)
    (certificate : Degeneration.Certificate
      (constituent (K := K) q (leftLength+rightLength) (addShape left right)) rank degree) :
    Degeneration.Certificate (product (constituent (K := K) q leftLength left) (constituent q rightLength right)) rank degree := by
  rw [← constituent_product_identity left right]
  exact certificate.pullback _ _ _

/-- Admissible complementary children reconstruct exactly their original parent shape. -/
theorem addShape_complement {parent child : Numeric.Shape} (fits : child.Fits parent) :
    addShape child (parent.complement child) = parent := by
  obtain ⟨hx, hy, hz⟩ := fits
  cases parent
  cases child
  simp only [addShape, Numeric.Shape.complement, Numeric.Shape.mk.injEq]
  dsimp at hx hy hz
  omega

end
end MatrixBounds.Tensor.CW
