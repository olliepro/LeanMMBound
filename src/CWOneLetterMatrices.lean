module

public import CWZeroCoordinateRestrictions
public import CWOneLetterData

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Every one-letter CW shape has an explicit rectangular matrix restriction.
The dimensions are powers of q on exactly the two-middle-coordinate shapes. -/
namespace MatrixBounds.Tensor.CW

open Empirical Numeric
noncomputable section
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {K P : Type*} [CommRing K] [Fintype P]

/-- Relabel the one-point matrix index set by the standard finite singleton. -/
def finOneUnit : Fin 1 ≃ PUnit.{1} := Fintype.equivOfCardEq (by simp)

/-- Relabel all one-letter coordinate families by their exact numerical dimension. -/
def oneLetterFamilyNumbering (q : ℕ) (label : Fin 3) :
    Fin (if label = 1 then q^(Fintype.card P) else 1) ≃ (P → AxisVariable q 1 label.val) :=
  Fintype.equivOfCardEq (by rw [Fintype.card_fin, one_letter_matrix_dimension])

/-- A one-letter zero-Z pool has explicit matrix dimensions 1 by its coordinate count by 1. -/
def oneLetterZeroZRestriction (q : ℕ) (label : Fin 3) :
    CoordinateRestriction
      (Interface.heterogeneous (fun _ : P => constituent (K := K) q 1 ⟨label.val, 2-label.val, 0⟩))
      (MatrixMul.tensor (K := K) (I := Fin 1)
        (J := Fin (if label = 1 then q^(Fintype.card P) else 1)) (L := Fin 1)) :=
  (zeroZCoordinateRestriction q 1 label.val).trans
    (MatrixMul.relabelCoordinateRestriction finOneUnit (oneLetterFamilyNumbering q label) finOneUnit)

/-- A one-letter zero-Y pool puts its coordinate count on the matrix row dimension. -/
def oneLetterZeroYRestriction (q : ℕ) (label : Fin 3) :
    CoordinateRestriction
      (Interface.heterogeneous (fun _ : P => constituent (K := K) q 1 ⟨2-label.val, 0, label.val⟩))
      (MatrixMul.tensor (K := K) (I := Fin (if label = 1 then q^(Fintype.card P) else 1))
        (J := Fin 1) (L := Fin 1)) :=
  (zeroYCoordinateRestriction q 1 label.val).trans
    (MatrixMul.relabelCoordinateRestriction (oneLetterFamilyNumbering q label) finOneUnit finOneUnit)

/-- A one-letter zero-X pool puts its coordinate count on the matrix column dimension. -/
def oneLetterZeroXRestriction (q : ℕ) (label : Fin 3) :
    CoordinateRestriction
      (Interface.heterogeneous (fun _ : P => constituent (K := K) q 1 ⟨0, label.val, 2-label.val⟩))
      (MatrixMul.tensor (K := K) (I := Fin 1) (J := Fin 1)
        (L := Fin (if label = 1 then q^(Fintype.card P) else 1))) :=
  (zeroXCoordinateRestriction q 1 label.val).trans
    (MatrixMul.relabelCoordinateRestriction finOneUnit finOneUnit (oneLetterFamilyNumbering q label))

/-- Matrix row dimension contributed by one labelled child pool. -/
def oneLetterRows (q size : ℕ) (shape : Shape) : ℕ :=
  if shape.x = 1 ∧ shape.z = 1 then q^size else 1

/-- Matrix inner dimension contributed by one labelled child pool. -/
def oneLetterInner (q size : ℕ) (shape : Shape) : ℕ :=
  if shape.x = 1 ∧ shape.y = 1 then q^size else 1

/-- Matrix column dimension contributed by one labelled child pool. -/
def oneLetterColumns (q size : ℕ) (shape : Shape) : ℕ :=
  if shape.y = 1 ∧ shape.z = 1 then q^size else 1

/-- Every actual one-letter CW child has these matrix dimensions, through explicit coordinate selections. -/
def oneLetterMatrixRestriction (q : ℕ) (child : ShapeAlphabet 2) :
    CoordinateRestriction (Interface.heterogeneous (fun _ : P => constituent (K := K) q 1 child.val))
      (MatrixMul.tensor (K := K) (I := Fin (oneLetterRows q (Fintype.card P) child.val))
        (J := Fin (oneLetterInner q (Fintype.card P) child.val))
        (L := Fin (oneLetterColumns q (Fintype.card P) child.val))) := by
  apply Classical.choice
  obtain ⟨column, rfl⟩ := (shapeColumnEquiv 2).surjective child
  fin_cases column
  · exact ⟨oneLetterZeroXRestriction q 0⟩
  · exact ⟨oneLetterZeroXRestriction q 1⟩
  · exact ⟨oneLetterZeroXRestriction q 2⟩
  · exact ⟨oneLetterZeroYRestriction q 1⟩
  · exact ⟨oneLetterZeroZRestriction q 1⟩
  · exact ⟨oneLetterZeroZRestriction q 2⟩

/-- Forced exact one-letter fine profiles map back to the complete coordinate power. -/
def oneLetterExactRestriction (q : ℕ) (child : ShapeAlphabet 2) :
    CoordinateRestriction
      (Interface.exact (K := K) (P := P) (constituent q 1 child.val)
        (fun entry => fineWord entry.val) (fun entry => fineWord entry.val) (fun entry => fineWord entry.val)
        (oneLetterProfile (shapeXIndex child) (Fintype.card P))
        (oneLetterProfile (shapeYIndex child) (Fintype.card P))
        (oneLetterProfile (shapeZIndex child) (Fintype.card P)))
      (Interface.heterogeneous (fun _ : P => constituent q 1 child.val)) where
  left := oneLetterVariableEquiv (shapeXIndex child)
  middle := oneLetterVariableEquiv (shapeYIndex child)
  right := oneLetterVariableEquiv (shapeZIndex child)
  coefficient _ _ _ := rfl

/-- Specialize the exact one-letter interface to a numerically sized pool without dependent casts. -/
def oneLetterExactFinRestriction (q size : ℕ) (child : ShapeAlphabet 2) :
    CoordinateRestriction
      (Interface.exact (K := K) (P := Fin size) (constituent q 1 child.val)
        (fun entry => fineWord entry.val) (fun entry => fineWord entry.val) (fun entry => fineWord entry.val)
        (oneLetterProfile (shapeXIndex child) size) (oneLetterProfile (shapeYIndex child) size)
        (oneLetterProfile (shapeZIndex child) size))
      (Interface.heterogeneous (fun _ : Fin size => constituent q 1 child.val)) where
  left entries := ⟨entries, by simpa only [Fintype.card_fin] using one_letter_hasType (shapeXIndex child) entries⟩
  middle entries := ⟨entries, by simpa only [Fintype.card_fin] using one_letter_hasType (shapeYIndex child) entries⟩
  right entries := ⟨entries, by simpa only [Fintype.card_fin] using one_letter_hasType (shapeZIndex child) entries⟩
  coefficient _ _ _ := rfl

/-- Numerically sized one-letter powers carry the same proved finite matrix dimensions. -/
def oneLetterMatrixFinRestriction (q size : ℕ) (child : ShapeAlphabet 2) :
    CoordinateRestriction (Interface.heterogeneous (fun _ : Fin size => constituent (K := K) q 1 child.val))
      (MatrixMul.tensor (K := K) (I := Fin (oneLetterRows q size child.val))
        (J := Fin (oneLetterInner q size child.val)) (L := Fin (oneLetterColumns q size child.val))) :=
  (oneLetterMatrixRestriction (K := K) (P := Fin size) q child).trans
    (MatrixMul.relabelCoordinateRestriction
      (Fintype.equivOfCardEq (by simp)) (Fintype.equivOfCardEq (by simp)) (Fintype.equivOfCardEq (by simp)))

end
end MatrixBounds.Tensor.CW
