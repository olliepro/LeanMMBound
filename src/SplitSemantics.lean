import SplitData
import Mathlib.Data.List.Nodup

/-! The executable split checks refer to the actual integer distribution columns
and to the complete coarse-shape alphabet, without ambiguous repeated labels. -/
namespace MatrixBounds.Numeric

/-- The coarse-shape enumeration contains each shape exactly once. -/
theorem shapes_nodup (total : ℕ) : (shapes total).Nodup := by
  apply List.nodup_flatMap.mpr
  constructor
  · intro x _
    apply List.Nodup.map _ List.nodup_range
    intro y y' same
    exact congrArg Shape.y same
  · apply (List.nodup_range (n := total+1)).imp
    intro x x' different shape left right
    obtain ⟨y, _, rfl⟩ := List.mem_map.mp left
    obtain ⟨y', _, same⟩ := List.mem_map.mp right
    exact different (congrArg Shape.x same).symm

/-- Every nonnegative shape of the intended total occurs in the enumerated alphabet. -/
theorem mem_shapes_of_total {total : ℕ} {shape : Shape} (correct : shape.total = total) :
    shape ∈ shapes total := by
  have hx : shape.x < total+1 := by unfold Shape.total at correct; omega
  have hy : shape.y < total-shape.x+1 := by unfold Shape.total at correct; omega
  apply List.mem_flatMap.mpr
  refine ⟨shape.x, List.mem_range.mpr hx, List.mem_map.mpr ⟨shape.y, List.mem_range.mpr hy, ?_⟩⟩
  cases shape
  simp only [Shape.total] at correct
  simp only [Shape.mk.injEq]
  dsimp at *
  simp only [true_and]
  omega

/-- Admissible child complements have the same child total when the parent total is doubled. -/
theorem Shape.complement_total {parent child : Shape} {total : ℕ}
    (parent_total : parent.total = 2*total) (child_total : child.total = total) (fits : child.Fits parent) :
    (parent.complement child).total = total := by
  obtain ⟨hx, hy, hz⟩ := fits
  simp only [Shape.total, Shape.complement] at *
  omega

/-- Looking up a shape mass is exactly looking up its unique original probability column. -/
theorem SplitRow.massAt_column (data : SplitRow) (column : Fin (shapes data.childTotal).length)
    (support : ∀ entry ∈ data.row.entries, entry.1 < (shapes data.childTotal).length) :
    data.massAt ((shapes data.childTotal)[column.val]) = data.row.atColumn column.val := by
  unfold massAt DyadicRow.atColumn
  apply congrArg List.sum
  apply List.map_congr_left
  intro entry present
  have small := support entry present
  simp only [List.getElem?_eq_getElem small, Option.some.injEq,
    (shapes_nodup data.childTotal).getElem_inj_iff]

/-- Every nonzero checked probability column corresponds to a valid child of its parent. -/
theorem SplitRow.column_support {data : SplitRow} {denominator : ℕ}
    (checked : data.check denominator = true) (column : Fin (shapes data.childTotal).length)
    (nonzero : data.row.atColumn column.val ≠ 0) :
    ((shapes data.childTotal)[column.val]).Fits data.parent := by
  obtain ⟨row, width, _, constraints⟩ := check_sound checked
  have support : ∀ entry ∈ data.row.entries, entry.1 < (shapes data.childTotal).length := by
    intro entry present
    rw [← width]
    exact (DyadicRow.check_sound row).1 entry present
  apply (constraints _ (List.getElem_mem _)).1
  rwa [massAt_column data column support]

end MatrixBounds.Numeric
