import Mathlib.Data.Fin.Basic

/-! Exact finite checks can be split into bounded blocks without changing the
assertion checked by Lean's kernel. This avoids deep reduction stacks. -/
namespace MatrixBounds.Numeric

/-- Embed one consecutive bounded block into the complete finite index set. -/
def blockIndex {total : ℕ} (offset width : ℕ) (inside : offset+width ≤ total) (index : Fin width) : Fin total :=
  ⟨offset+index.val, by have := index.isLt; omega⟩

/-- A checked block proves the full predicate at every original index in that block. -/
theorem of_block_check {total offset width : ℕ} {predicate : Fin total → Prop}
    (inside : offset+width ≤ total)
    (checked : ∀ index : Fin width, predicate (blockIndex offset width inside index))
    (index : Fin total) (lower : offset ≤ index.val) (upper : index.val < offset+width) : predicate index := by
  let localIndex : Fin width := ⟨index.val-offset, by omega⟩
  have equal : blockIndex offset width inside localIndex = index := by
    apply Fin.ext
    dsimp only [blockIndex, localIndex]
    omega
  simpa only [equal] using checked localIndex

end MatrixBounds.Numeric
