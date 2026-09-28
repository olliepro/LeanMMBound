import ShapeAlphabet
import DyadicData

/-! Translate a checked probability row to the actual complete shape alphabet
through the same lexicographic column enumeration used by the certificate. -/
namespace MatrixBounds.Numeric

open scoped BigOperators
noncomputable section

/-- Read an exact numerator at a shape's unique lexicographic column. -/
def DyadicRow.shapeNumerator (row : DyadicRow) (total : ℕ) (child : ShapeAlphabet total) : ℕ :=
  row.atColumn ((shapeColumnEquiv total).symm child).val

/-- A checked row of the correct width gives an exactly normalized shape distribution. -/
theorem DyadicRow.shapeNumerator_total {row : DyadicRow} {denominator total : ℕ}
    (checked : row.check denominator = true) (width : row.width = (shapes total).length) :
    (∑ child, row.shapeNumerator total child) = denominator := by
  have columns := (row.sum_columns (DyadicRow.check_sound checked).1).trans (DyadicRow.check_sound checked).2
  have normalized : (∑ column : Fin (shapes total).length, row.atColumn column.val) = denominator := by
    rcases row with ⟨rowWidth, entries⟩
    dsimp only at width
    subst rowWidth
    exact columns
  rw [← Equiv.sum_comp (shapeColumnEquiv total)]
  simpa only [shapeNumerator, Equiv.symm_apply_apply] using normalized

end
end MatrixBounds.Numeric
