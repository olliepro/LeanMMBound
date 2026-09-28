import DyadicData

/-! Bounded lookup tables retain the exact source order of certificate arrays.
A proved lookup tree avoids repeatedly traversing a large concatenated list. -/
namespace MatrixBounds.Numeric

/-- A fixed-length vector of references, with a proved efficient lookup on its original entries. -/
structure CheckedIndexTable (count bound : ℕ) where
  /-- Original flattened row identifiers in source array order. -/
  entries : List ℕ
  /-- The vector has exactly its declared number of entries. -/
  length_eq : entries.length = count
  /-- Every original reference is in range. -/
  bounded : entries.all (fun entry => decide (entry < bound)) = true
  /-- Bounded lookup, implemented by short leaves and adjacent block dispatch. -/
  lookup : Fin count → Fin bound
  /-- The fast lookup selects exactly the original source-list entry. -/
  lookup_eq : ∀ index, (lookup index).val = entries[index.val]'(by rw [length_eq]; exact index.isLt)

namespace CheckedIndexTable

/-- Read one original in-range reference through the proved lookup tree. -/
def get {count bound : ℕ} (table : CheckedIndexTable count bound) (index : Fin count) : Fin bound :=
  table.lookup index

/-- Fast lookup agrees exactly with the original row-major reference list. -/
theorem get_val {count bound : ℕ} (table : CheckedIndexTable count bound) (index : Fin count) :
    (table.get index).val = table.entries[index.val]'(by rw [table.length_eq]; exact index.isLt) :=
  table.lookup_eq index

/-- Construct a checked short lookup leaf from its exact entries and two finite certificates. -/
def ofList {count bound : ℕ} (entries : List ℕ) (length_eq : entries.length = count)
    (bounded : entries.all (fun entry => decide (entry < bound)) = true) : CheckedIndexTable count bound where
  entries := entries
  length_eq := length_eq
  bounded := bounded
  lookup index :=
    let present : index.val < entries.length := by rw [length_eq]; exact index.isLt
    ⟨entries[index.val], of_decide_eq_true (List.all_eq_true.mp bounded _ (List.getElem_mem present))⟩
  lookup_eq _ := rfl

/-- Dispatch one concatenated index into its original left or right component. -/
def appendLookup {left right bound : ℕ} (first : CheckedIndexTable left bound)
    (second : CheckedIndexTable right bound) (index : Fin (left+right)) : Fin bound :=
  if before : index.val < left then first.get ⟨index.val, before⟩
  else second.get ⟨index.val-left, by have := index.isLt; omega⟩

/-- Concatenate exact source slices; for example adjacent 128-entry leaves form a 256-entry table. -/
def append {left right bound : ℕ} (first : CheckedIndexTable left bound)
    (second : CheckedIndexTable right bound) : CheckedIndexTable (left+right) bound where
  entries := first.entries ++ second.entries
  length_eq := by simp only [List.length_append, first.length_eq, second.length_eq]
  bounded := by simp only [List.all_append, first.bounded, second.bounded, Bool.and_true]
  lookup := appendLookup first second
  lookup_eq index := by
    unfold appendLookup
    split_ifs with before
    · rw [get_val]
      exact (List.getElem_append_left (by rw [first.length_eq]; exact before)).symm
    · rw [get_val, List.getElem_append_right (by rw [first.length_eq]; omega)]
      simp only [first.length_eq]

/-- Concatenation lookup on the first component preserves its original reference. -/
theorem get_append_left {left right bound : ℕ} (first : CheckedIndexTable left bound)
    (second : CheckedIndexTable right bound) (index : Fin left) :
    (first.append second).get (index.castAdd right) = first.get index := by
  apply Fin.ext
  simp only [get_val, append, Fin.coe_castAdd]
  exact List.getElem_append_left (by rw [first.length_eq]; exact index.isLt)

/-- Concatenation lookup on the second component subtracts exactly the first length. -/
theorem get_append_right {left right bound : ℕ} (first : CheckedIndexTable left bound)
    (second : CheckedIndexTable right bound) (index : Fin right) :
    (first.append second).get (index.natAdd left) = second.get index := by
  apply Fin.ext
  simp only [get_val, append, Fin.coe_natAdd]
  rw [List.getElem_append_right (by rw [first.length_eq]; omega)]
  simp only [first.length_eq, Nat.add_sub_cancel_left]

end CheckedIndexTable

/-- An accepted list entry inherits its previously proved executable certificate. -/
def checkedListEntry {A : Type*} (check : A → Bool) (rows : List A)
    (accepted : rows.all check = true) (index : Fin rows.length) : {row : A // check row = true} :=
  ⟨rows[index.val], List.all_eq_true.mp accepted _ (List.getElem_mem index.isLt)⟩

end MatrixBounds.Numeric
