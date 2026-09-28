import OrientedZeroLawIdentities

/-! Canonical zero-axis orientation matches the actual coarse matrix-factor
shape, with its complementary coordinate derived from the source total. -/
namespace MatrixBounds.Numeric

open Tensor
noncomputable section

/-- Moving a genuine zero coordinate to Z yields exactly the canonical zero-leaf extraction shape. -/
theorem canonical_zero_shape (shape : Shape) (length : ℕ) (zero positive : Fin 3)
    (different : zero ≠ positive) (balanced : shape.total = 2*length)
    (vanishes : Shape.coordinates shape zero = 0) :
    shape.permute (zeroCanonicalOrder zero positive).permutation =
      ⟨Shape.coordinates shape positive, 2*length-Shape.coordinates shape positive, 0⟩ := by
  let order := (zeroCanonicalOrder zero positive).permutation
  have axes := zeroCanonicalOrder_axes zero positive different
  have first : Shape.coordinates (shape.permute order) 0 = Shape.coordinates shape positive := by
    rw [Shape.permute_coordinate, axes.1]
  have last : Shape.coordinates (shape.permute order) 2 = 0 := by
    rw [Shape.permute_coordinate, axes.2.1, vanishes]
  have total : (shape.permute order).total = 2*length := (Shape.permute_total order shape).trans balanced
  apply Shape.coordinates.injective
  funext axis
  fin_cases axis
  · exact first
  · change (shape.permute order).y = 2*length-Shape.coordinates shape positive
    change (shape.permute order).x = Shape.coordinates shape positive at first
    change (shape.permute order).z = 0 at last
    unfold Shape.total at total
    omega
  · exact last

end
end MatrixBounds.Numeric
