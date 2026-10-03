module

public import SuppliedRootFineParent3Columns

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Independently checked parent-law blocks compose into a complete source-indexed cache. -/
namespace MatrixBounds.Numeric

/-- A complete consecutive block of original parent laws, with all strategies, axes, and orbits. -/
structure RootFineParent3CacheTable (start count : ℕ) where
  /-- The block is within the original945-node hierarchy. -/
  bounded : start+count ≤ 945
  /-- Exact integer values at every retained original coordinate. -/
  lookup : Fin count → Fin 6 → Fin 3 → Fin 21 → ℤ
  /-- Every cached value equals the complete original finite-column convolution. -/
  checked : ∀ node strategy axis orbit, lookup node strategy axis orbit =
    SuppliedRootFineParent3Columns.numerator
      ⟨start+node.val, by have := node.isLt; omega⟩ strategy axis orbit

namespace RootFineParent3CacheTable

/-- Concatenate adjacent verified blocks without changing any original source coordinate. -/
def append {start left right : ℕ} (first : RootFineParent3CacheTable start left)
    (second : RootFineParent3CacheTable (start+left) right) : RootFineParent3CacheTable start (left+right) where
  bounded := by have := second.bounded; omega
  lookup node strategy axis orbit :=
    if before : node.val < left then first.lookup ⟨node.val, before⟩ strategy axis orbit
    else second.lookup ⟨node.val-left, by have := node.isLt; omega⟩ strategy axis orbit
  checked node strategy axis orbit := by
    split_ifs with before
    · exact first.checked ⟨node.val, before⟩ strategy axis orbit
    · have identity := second.checked ⟨node.val-left, by have := node.isLt; omega⟩ strategy axis orbit
      convert identity using 1
      congr 1
      apply Fin.ext
      dsimp only
      omega

end RootFineParent3CacheTable
end MatrixBounds.Numeric
