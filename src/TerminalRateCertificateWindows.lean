module

public import TerminalSourceNodeLookup
public import SuppliedTerminalRateCertificates
public import Mathlib.Algebra.BigOperators.Intervals

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Contiguous exact certificate windows support bounded source-to-certificate comparisons. -/
namespace MatrixBounds.Numeric.SuppliedTerminalRates

open TerminalSourceNodeLookup
open scoped BigOperators
noncomputable section

/-- A lookup table enumerates exactly its original complete source entries. -/
theorem sourceTable_ofFn {A : Type*} {count : ℕ} (table : SourceTable A count) :
    List.ofFn table.lookup = table.entries := by
  apply List.ext_getElem
  · simpa only [List.length_ofFn] using table.length_eq.symm
  · intro index beforeLeft beforeRight
    simp only [List.getElem_ofFn, table.lookup_eq]

/-- Applying and summing a function through a source lookup preserves every original entry. -/
theorem sourceTable_sum {A : Type*} {count : ℕ} (table : SourceTable A count) (value : A → ℝ) :
    (∑ index, value (table.lookup index)) = (table.entries.map value).sum := by
  rw [← sourceTable_ofFn table, List.map_ofFn, Fin.sum_ofFn]
  rfl

/-- Extend an exact certificate table by zero monomials outside its declared source range. -/
def certificateTermAt {count : ℕ} (table : SourceTable IntegerLogTerm count) (index : ℕ) : LogMonomial :=
  if before : index < count then (table.lookup ⟨index, before⟩).monomial else ⟨1, 0⟩

/-- Select one contiguous complete exact monomial window from the original certificate. -/
def certificateWindow {count : ℕ} (table : SourceTable IntegerLogTerm count) (first last : ℕ) :
    RationalLogExpression :=
  finiteLogSum (fun offset : Fin (last-first) => [certificateTermAt table (first+offset.val)])

/-- A contiguous certificate window represents precisely its finite interval sum. -/
theorem certificateWindow_value {count : ℕ} (table : SourceTable IntegerLogTerm count) (first last : ℕ) :
    rationalLogValue (certificateWindow table first last) =
      ∑ index ∈ Finset.Ico first last, (certificateTermAt table index).value := by
  rw [certificateWindow, finiteLogSum_value, Finset.sum_Ico_eq_sum_range]
  simp only [rationalLogValue, List.map_cons, List.map_nil, List.sum_cons, List.sum_nil, add_zero]
  exact Fin.sum_univ_eq_sum_range (fun offset => (certificateTermAt table (first+offset)).value) (last-first)

/-- Summing the complete extended table range gives exactly its original integer logarithmic sum. -/
theorem certificateTermAt_sum {count : ℕ} (table : SourceTable IntegerLogTerm count) :
    (∑ index ∈ Finset.range count, (certificateTermAt table index).value) = integerLogValue table.entries := by
  rw [← Fin.sum_univ_eq_sum_range]
  simp only [certificateTermAt, dif_pos (Fin.isLt _)]
  rw [sourceTable_sum table (fun term => term.monomial.value)]
  have identity : ∀ terms : List IntegerLogTerm, (terms.map (fun term => term.monomial.value)).sum = integerLogValue terms := by
    intro terms
    rw [integerLogValue_expression]
    simp only [rationalLogValue, List.map_map]
    rfl
  exact identity table.entries

/-- Adjacent windows partition the complete original certificate, with no missing or duplicate term. -/
theorem certificate_windows_value {count blocks : ℕ} (table : SourceTable IntegerLogTerm count)
    (cuts : ℕ → ℕ) (first : cuts 0 = 0) (last : cuts blocks = count)
    (ordered : ∀ index < blocks, cuts index ≤ cuts (index+1)) :
    (∑ block : Fin blocks, rationalLogValue (certificateWindow table (cuts block.val) (cuts (block.val+1)))) =
      integerLogValue table.entries := by
  simp only [certificateWindow_value]
  rw [Fin.sum_univ_eq_sum_range (fun block =>
    ∑ index ∈ Finset.Ico (cuts block) (cuts (block+1)), (certificateTermAt table index).value) blocks]
  have interval (index : ℕ) (present : index ∈ Finset.range blocks) :
      (∑ position ∈ Finset.Ico (cuts index) (cuts (index+1)), (certificateTermAt table position).value) =
        (∑ position ∈ Finset.range (cuts (index+1)), (certificateTermAt table position).value) -
        (∑ position ∈ Finset.range (cuts index), (certificateTermAt table position).value) :=
    Finset.sum_Ico_eq_sub _ (ordered index (Finset.mem_range.mp present))
  rw [Finset.sum_congr rfl interval,
    Finset.sum_range_sub (fun index => ∑ position ∈ Finset.range (cuts index),
      (certificateTermAt table position).value), first, last]
  simp only [Finset.range_zero, Finset.sum_empty, sub_zero]
  exact certificateTermAt_sum table

end
end MatrixBounds.Numeric.SuppliedTerminalRates
