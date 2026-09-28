import SplitSemantics
import Mathlib.Data.List.NodupEquivFin

/-! Finite coarse-shape alphabets and an actual complementary permutation.
Unsupported symbols are fixed by the permutation and carry zero checked mass. -/
namespace MatrixBounds.Numeric

open scoped BigOperators
noncomputable section

/-- The finite alphabet of all shapes with a given coordinate total. -/
abbrev ShapeAlphabet (total : ℕ) := {shape : Shape // shape ∈ shapes total}

/-- The supplied lexicographic columns enumerate the finite shape alphabet bijectively. -/
def shapeColumnEquiv (total : ℕ) : Fin (shapes total).length ≃ ShapeAlphabet total :=
  List.Nodup.getEquiv (shapes total) (shapes_nodup total)

/-- Coarse shape alphabets are finite by their explicit column enumeration. -/
instance shapeAlphabetFintype (total : ℕ) : Fintype (ShapeAlphabet total) :=
  Fintype.ofEquiv (Fin (shapes total).length) (shapeColumnEquiv total)

/-- Complement a supported child; leave an inadmissible, necessarily zero-mass symbol fixed. -/
def complementSymbol (parent : Shape) (total : ℕ) (balanced : parent.total = 2*total)
    (symbol : ShapeAlphabet total) : ShapeAlphabet total :=
  if fits : symbol.val.Fits parent then
    ⟨parent.complement symbol.val, mem_shapes_of_total
      (Shape.complement_total balanced (shapes_total symbol.property) fits)⟩
  else symbol

/-- The totalized complement is an involution on the complete finite alphabet. -/
theorem complementSymbol_involution (parent : Shape) (total : ℕ) (balanced : parent.total = 2*total) :
    Function.Involutive (complementSymbol parent total balanced) := by
  intro symbol
  by_cases fits : symbol.val.Fits parent
  · have complementary := Shape.complement_involution fits
    apply Subtype.ext
    simp only [complementSymbol, dif_pos fits, dif_pos complementary.1, complementary.2]
  · simp only [complementSymbol, dif_neg fits]

/-- Actual permutation used to pair the two children of a balanced parent shape. -/
def complementEquiv (parent : Shape) (total : ℕ) (balanced : parent.total = 2*total) :
    Equiv.Perm (ShapeAlphabet total) :=
  (complementSymbol_involution parent total balanced).toPerm

/-- On admissible symbols, the permutation has exactly the expected coordinate complement. -/
theorem complementEquiv_shape (parent : Shape) (total : ℕ) (balanced : parent.total = 2*total)
    (symbol : ShapeAlphabet total) (fits : symbol.val.Fits parent) :
    (complementEquiv parent total balanced symbol).val = parent.complement symbol.val := by
  change (complementSymbol parent total balanced symbol).val = _
  simp only [complementSymbol, dif_pos fits]

/-- A checked split row has the same integer mass after applying the complementary permutation. -/
theorem checked_complement_mass {data : SplitRow} {denominator : ℕ}
    (checked : data.check denominator = true) (symbol : ShapeAlphabet data.childTotal) :
    data.massAt (complementEquiv data.parent data.childTotal (SplitRow.check_sound checked).2.2.1 symbol).val =
      data.massAt symbol.val := by
  by_cases fits : symbol.val.Fits data.parent
  · rw [complementEquiv_shape _ _ _ _ fits]
    exact ((SplitRow.check_sound checked).2.2.2 symbol.val symbol.property).2.symm
  · change data.massAt (complementSymbol data.parent data.childTotal
      (SplitRow.check_sound checked).2.2.1 symbol).val = _
    rw [complementSymbol, dif_neg fits]

/-- Summing masses over shape symbols is exactly summing the original checked columns. -/
theorem checked_shape_mass_total {data : SplitRow} {denominator : ℕ}
    (checked : data.check denominator = true) :
    (∑ symbol : ShapeAlphabet data.childTotal, data.massAt symbol.val) = denominator := by
  have row := (SplitRow.check_sound checked).1
  have width := (SplitRow.check_sound checked).2.1
  have support : ∀ entry ∈ data.row.entries, entry.1 < (shapes data.childTotal).length := by
    intro entry present
    rw [← width]
    exact (DyadicRow.check_sound row).1 entry present
  have columns := data.row.sum_columns (DyadicRow.check_sound row).1
  rw [width, (DyadicRow.check_sound row).2] at columns
  rw [← Equiv.sum_comp (shapeColumnEquiv data.childTotal) (fun symbol => data.massAt symbol.val)]
  convert columns using 1
  apply Finset.sum_congr rfl
  intro column _
  exact SplitRow.massAt_column data column support

end
end MatrixBounds.Numeric
