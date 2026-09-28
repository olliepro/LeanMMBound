import CWOneLetterMatrices
import ShapePermutations

/-! Permuting the physical axes of one-letter CW constituents preserves
their actual matrix volume, including the three scalar constituents. -/
namespace MatrixBounds.Tensor.CW

open Numeric
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p

/-- A one-letter constituent has a nontrivial matrix side exactly when none of its coordinates is two. -/
def mixedOneLetterShape (child : Shape) : Prop := ∀ axis : Fin 3, Shape.coordinates child axis ≠ 2

/-- The product of the three explicit matrix-side dimensions has a permutation-invariant description. -/
theorem one_letter_matrix_volume (q size : ℕ) (child : ShapeAlphabet 2) :
    oneLetterRows q size child.val*oneLetterInner q size child.val*oneLetterColumns q size child.val =
      if mixedOneLetterShape child.val then q^size else 1 := by
  obtain ⟨column, rfl⟩ := (shapeColumnEquiv 2).surjective child
  change Fin 6 at column
  fin_cases column <;> norm_num [oneLetterRows, oneLetterInner, oneLetterColumns,
    mixedOneLetterShape, Shape.coordinates, Fin.forall_fin_succ, shapeColumnEquiv,
    List.Nodup.getEquiv, shapes, List.range_succ]

/-- Whether a one-letter constituent contributes a matrix side is invariant under coordinate permutation. -/
theorem mixedOneLetterShape_permute (axes : Equiv.Perm (Fin 3)) (child : Shape) :
    mixedOneLetterShape (child.permute axes) ↔ mixedOneLetterShape child := by
  unfold mixedOneLetterShape
  simp only [Shape.permute_coordinate]
  constructor
  · intro mixed axis
    simpa only [Equiv.apply_symm_apply] using mixed (axes.symm axis)
  · intro mixed axis
    exact mixed (axes axis)

/-- The actual finite matrix volume is unchanged by any physical permutation of a child shape. -/
theorem one_letter_matrix_volume_permute (axes : Equiv.Perm (Fin 3)) (q size : ℕ)
    (child : ShapeAlphabet 2) :
    oneLetterRows q size (shapeAlphabetPermutation axes 2 child).val*
      oneLetterInner q size (shapeAlphabetPermutation axes 2 child).val*
      oneLetterColumns q size (shapeAlphabetPermutation axes 2 child).val =
    oneLetterRows q size child.val*oneLetterInner q size child.val*oneLetterColumns q size child.val := by
  rw [one_letter_matrix_volume, one_letter_matrix_volume]
  change (if mixedOneLetterShape (child.val.permute axes) then q^size else 1) = _
  rw [mixedOneLetterShape_permute]

end
end MatrixBounds.Tensor.CW
