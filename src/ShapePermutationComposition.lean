module

public import CWRationalPermutations

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Physical-axis composition acts contravariantly on the labelled child
shape alphabet, exactly as required by successive window orientations. -/
namespace MatrixBounds.Numeric

noncomputable section

/-- Consecutive physical shape orientations equal the product of their original-axis permutations. -/
theorem Shape.permute_mul (first second : Equiv.Perm (Fin 3)) (shape : Shape) :
    (shape.permute first).permute second = shape.permute (first*second) := by
  apply Shape.coordinates.injective
  funext axis
  simp only [Shape.permute_coordinate]
  rfl

/-- Relabelling complete child alphabets reverses the multiplication order of physical-axis permutations. -/
theorem shapeAlphabetPermutation_mul (first second : Equiv.Perm (Fin 3)) (total : ℕ) :
    shapeAlphabetPermutation (first*second) total =
      shapeAlphabetPermutation second total*shapeAlphabetPermutation first total := by
  apply Equiv.ext
  intro child
  apply Subtype.ext
  exact (Shape.permute_mul first second child.val).symm

/-- Undoing a composed physical role restores the original child in the exact source-label order. -/
theorem shapeAlphabetPermutation_mul_symm (first second : Equiv.Perm (Fin 3)) (total : ℕ) (child : ShapeAlphabet total) :
    (shapeAlphabetPermutation (first*second) total).symm child =
      (shapeAlphabetPermutation first total).symm ((shapeAlphabetPermutation second total).symm child) := by
  rw [shapeAlphabetPermutation_mul]
  rfl

end
end MatrixBounds.Numeric

namespace MatrixBounds.Tensor.CW.RationalSplit

/-- Rational split records agree when their actual parent shape and complete numerator vector agree. -/
theorem ext_data {length denominator : ℕ} (first second : RationalSplit length denominator)
    (parent : first.parent = second.parent) (numerator : first.numerator = second.numerator) : first = second := by
  cases first
  cases second
  cases parent
  cases numerator
  rfl

end MatrixBounds.Tensor.CW.RationalSplit
