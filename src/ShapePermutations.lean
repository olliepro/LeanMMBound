module

public import ShapeAlphabet
public import Mathlib.Tactic.FinCases
public import Mathlib.Data.Fin.VecNotation
public import Mathlib.Algebra.BigOperators.Fin

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Coarse shapes and admissible complements transport through actual
coordinate permutations. This keeps physical role choices tied to the tensors. -/
namespace MatrixBounds.Numeric

open scoped BigOperators
noncomputable section

/-- Identify a shape with its three ordered natural coordinates. -/
def Shape.coordinates : Shape ≃ (Fin 3 → ℕ) where
  toFun shape := ![shape.x, shape.y, shape.z]
  invFun values := ⟨values 0, values 1, values 2⟩
  left_inv shape := by cases shape; rfl
  right_inv values := by funext axis; fin_cases axis <;> rfl

/-- Permute actual shape coordinates; for example, swapping 0 and 1 exchanges X and Y. -/
def Shape.permute (axes : Equiv.Perm (Fin 3)) (shape : Shape) : Shape :=
  coordinates.symm (coordinates shape ∘ axes)

/-- A permuted coordinate is the selected original physical coordinate. -/
theorem Shape.permute_coordinate (axes : Equiv.Perm (Fin 3)) (shape : Shape) (axis : Fin 3) :
    coordinates (permute axes shape) axis = coordinates shape (axes axis) := by
  simp only [permute, Equiv.apply_symm_apply, Function.comp_apply]

/-- Applying an inverse permutation restores the complete shape. -/
theorem Shape.permute_inverse (axes : Equiv.Perm (Fin 3)) (shape : Shape) :
    permute axes.symm (permute axes shape) = shape := by
  apply coordinates.injective
  funext axis
  simp only [permute_coordinate, Equiv.apply_symm_apply]

/-- Permutation gives an actual bijection of all coarse shapes. -/
def Shape.permuteEquiv (axes : Equiv.Perm (Fin 3)) : Shape ≃ Shape where
  toFun := permute axes
  invFun := permute axes.symm
  left_inv := permute_inverse axes
  right_inv := permute_inverse axes.symm

/-- The coarse total is the sum over its three physical coordinates. -/
theorem Shape.total_coordinates (shape : Shape) : shape.total = ∑ axis, coordinates shape axis := by
  simp [total, coordinates, Fin.sum_univ_succ, Nat.add_assoc]

/-- Coordinate order does not change the recursion level of a shape. -/
theorem Shape.permute_total (axes : Equiv.Perm (Fin 3)) (shape : Shape) :
    (permute axes shape).total = shape.total := by
  rw [total_coordinates, total_coordinates]
  simp only [permute_coordinate]
  exact Equiv.sum_comp axes (coordinates shape)

/-- Admissibility is equivalently the componentwise order on all physical coordinates. -/
theorem Shape.fits_coordinates (child parent : Shape) :
    child.Fits parent ↔ ∀ axis, coordinates child axis ≤ coordinates parent axis := by
  simp [Fits, coordinates, Fin.forall_fin_succ]

/-- Coordinate permutations preserve exactly the admissible split shapes. -/
theorem Shape.permute_fits (axes : Equiv.Perm (Fin 3)) (child parent : Shape) :
    (permute axes child).Fits (permute axes parent) ↔ child.Fits parent := by
  simp only [fits_coordinates, permute_coordinate]
  constructor
  · intro bound axis
    simpa only [Equiv.apply_symm_apply] using bound (axes.symm axis)
  · intro bound axis
    exact bound (axes axis)

/-- Complementation is coordinatewise natural subtraction. -/
theorem Shape.complement_coordinate (parent child : Shape) (axis : Fin 3) :
    coordinates (parent.complement child) axis = coordinates parent axis-coordinates child axis := by
  fin_cases axis <;> rfl

/-- Permuting a split transports the other child to the corresponding permuted complement. -/
theorem Shape.permute_complement (axes : Equiv.Perm (Fin 3)) (parent child : Shape) :
    permute axes (parent.complement child) = (permute axes parent).complement (permute axes child) := by
  apply coordinates.injective
  funext axis
  simp only [permute_coordinate, complement_coordinate]

/-- Reindex the complete finite alphabet by a physical coordinate permutation. -/
def shapeAlphabetPermutation (axes : Equiv.Perm (Fin 3)) (total : ℕ) :
    Equiv.Perm (ShapeAlphabet total) where
  toFun child := ⟨child.val.permute axes, mem_shapes_of_total
    ((Shape.permute_total axes child.val).trans (shapes_total child.property))⟩
  invFun child := ⟨child.val.permute axes.symm, mem_shapes_of_total
    ((Shape.permute_total axes.symm child.val).trans (shapes_total child.property))⟩
  left_inv child := Subtype.ext (Shape.permute_inverse axes child.val)
  right_inv child := Subtype.ext (Shape.permute_inverse axes.symm child.val)

/-- Alphabet reindexing commutes with the actual totalized child-complement map. -/
theorem shapeAlphabetPermutation_complement (axes : Equiv.Perm (Fin 3))
    (parent : Shape) (total : ℕ) (balanced : parent.total = 2*total) (child : ShapeAlphabet total) :
    shapeAlphabetPermutation axes total (complementSymbol parent total balanced child) =
      complementSymbol (parent.permute axes) total ((Shape.permute_total axes parent).trans balanced)
        (shapeAlphabetPermutation axes total child) := by
  by_cases fits : child.val.Fits parent
  · have permutedFits : (child.val.permute axes).Fits (parent.permute axes) :=
      (Shape.permute_fits axes child.val parent).mpr fits
    apply Subtype.ext
    simp only [complementSymbol, dif_pos fits, shapeAlphabetPermutation, Equiv.coe_fn_mk,
      permutedFits, ↓reduceDIte]
    exact Shape.permute_complement axes parent child.val
  · have permutedOutside : ¬(child.val.permute axes).Fits (parent.permute axes) :=
      fun inside => fits ((Shape.permute_fits axes child.val parent).mp inside)
    simp only [complementSymbol, dif_neg fits, shapeAlphabetPermutation, Equiv.coe_fn_mk,
      permutedOutside, ↓reduceDIte]

end
end MatrixBounds.Numeric
