import SuppliedShapeIndices

/-! Balanced access to the original hierarchy records preserves their exact source order. -/
namespace MatrixBounds.Numeric.TerminalSourceNodeLookup
set_option maxRecDepth 3000

/-- A source record list equipped with a proved access function at its original position. -/
structure SourceTable (A : Type*) (count : ℕ) where
  entries : List A
  length_eq : entries.length = count
  lookup : Fin count → A
  lookup_eq : ∀ index, lookup index = entries[index.val]'(by rw [length_eq]; exact index.isLt)

namespace SourceTable

/-- Use direct indexing for one short original source slice. -/
def ofList {A : Type*} {count : ℕ} (entries : List A) (length_eq : entries.length = count) : SourceTable A count where
  entries := entries
  length_eq := length_eq
  lookup index := entries[index.val]'(by rw [length_eq]; exact index.isLt)
  lookup_eq _ := rfl

/-- Concatenate adjacent exact slices while retaining efficient index dispatch. -/
def append {A : Type*} {left right : ℕ} (first : SourceTable A left) (second : SourceTable A right) :
    SourceTable A (left + right) where
  entries := first.entries ++ second.entries
  length_eq := by simp only [List.length_append, first.length_eq, second.length_eq]
  lookup index := if before : index.val < left then first.lookup ⟨index.val, before⟩
    else second.lookup ⟨index.val-left, by have := index.isLt; omega⟩
  lookup_eq index := by
    split_ifs with before
    · rw [first.lookup_eq]
      exact (List.getElem_append_left (by rw [first.length_eq]; exact before)).symm
    · rw [second.lookup_eq, List.getElem_append_right (by rw [first.length_eq]; omega)]
      simp only [first.length_eq]

end SourceTable

open SuppliedShapeIndices

/-- A balanced four-leaf lookup over every original positive hierarchy record. -/
def table : SourceTable HierarchyNode 945 :=
  ((SourceTable.ofList positiveNodesPart000 (show positiveNodesPart000.length = 256 by decide)).append
    (SourceTable.ofList positiveNodesPart001 (show positiveNodesPart001.length = 256 by decide))).append
  ((SourceTable.ofList positiveNodesPart002 (show positiveNodesPart002.length = 256 by decide)).append
    (SourceTable.ofList positiveNodesPart003 (show positiveNodesPart003.length = 177 by decide)))

/-- The balanced metadata dispatch retains all original records in their original order. -/
theorem entries_eq : table.entries = positiveNodes := by
  simp only [table, SourceTable.append, SourceTable.ofList, positiveNodes, List.append_assoc]

/-- Every balanced node lookup is exactly the original source hierarchy record. -/
theorem lookup_eq (node : Fin 945) : table.lookup node = positiveNode node := by
  rw [table.lookup_eq]
  simp only [entries_eq, positiveNode]

end MatrixBounds.Numeric.TerminalSourceNodeLookup
