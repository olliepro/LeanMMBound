import CWOneLetterMatrices

/-! Full one-letter child windows produced by a mixed extraction already
contain their complete matrix factors, including zero-sized child pools. -/
namespace MatrixBounds.Tensor.CW

universe v
open Empirical Numeric
noncomputable section
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {K P : Type*} [CommRing K] [Fintype P]

/-- The identity coordinates recover the full one-letter power from its forced fine-law windows. -/
def oneLetterWindowRestriction (q : ℕ) (child : ShapeAlphabet 2) {tolerance : ℝ} (nonnegative : 0 ≤ tolerance) :
    CoordinateRestriction
      (Interface.windowedPower (K := K) (P := P) (constituent q 1 child.val)
        (fun entry => fineWord entry.val) (fun entry => fineWord entry.val) (fun entry => fineWord entry.val)
        (oneLetterLaw (shapeXIndex child)) (oneLetterLaw (shapeYIndex child)) (oneLetterLaw (shapeZIndex child)) tolerance)
      (Interface.heterogeneous (fun _ : P => constituent q 1 child.val)) where
  left := id
  middle := id
  right := id
  coefficient left middle right := if_pos ⟨one_letter_activeWithin (shapeXIndex child) left nonnegative,
    one_letter_activeWithin (shapeYIndex child) middle nonnegative, one_letter_activeWithin (shapeZIndex child) right nonnegative⟩

/-- Every one-letter window factor of a shared extraction maps to its explicit rectangular matrix at unit cost. -/
def oneLetterWindowMatrixRestriction (q : ℕ) (child : ShapeAlphabet 2) {tolerance : ℝ} (nonnegative : 0 ≤ tolerance) :
    CoordinateRestriction
      (Interface.windowedPower (K := K) (P := P) (constituent q 1 child.val)
        (fun entry => fineWord entry.val) (fun entry => fineWord entry.val) (fun entry => fineWord entry.val)
        (oneLetterLaw (shapeXIndex child)) (oneLetterLaw (shapeYIndex child)) (oneLetterLaw (shapeZIndex child)) tolerance)
      (MatrixMul.tensor (K := K) (I := Fin (oneLetterRows q (Fintype.card P) child.val))
        (J := Fin (oneLetterInner q (Fintype.card P) child.val)) (L := Fin (oneLetterColumns q (Fintype.card P) child.val))) :=
  (oneLetterWindowRestriction q child nonnegative).trans (oneLetterMatrixRestriction q child)

/-- Matrix conversion of a full terminal child window preserves all waiting factors and earlier copies. -/
theorem contextReduction_one_letter_window_matrix (q : ℕ) (child : ShapeAlphabet 2)
    {tolerance : ℝ} (nonnegative : 0 ≤ tolerance) :
    ContextReduction.{v}
      (Interface.windowedPower (K := K) (P := P) (constituent q 1 child.val)
        (fun entry => fineWord entry.val) (fun entry => fineWord entry.val) (fun entry => fineWord entry.val)
        (oneLetterLaw (shapeXIndex child)) (oneLetterLaw (shapeYIndex child)) (oneLetterLaw (shapeZIndex child)) tolerance)
      (MatrixMul.tensor (K := K) (I := Fin (oneLetterRows q (Fintype.card P) child.val))
        (J := Fin (oneLetterInner q (Fintype.card P) child.val)) (L := Fin (oneLetterColumns q (Fintype.card P) child.val))) 1 :=
  (oneLetterWindowMatrixRestriction q child nonnegative).context

end
end MatrixBounds.Tensor.CW
