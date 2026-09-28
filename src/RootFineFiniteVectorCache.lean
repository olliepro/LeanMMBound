import RootFineSparseVectorCheck

/-! Exact finite vector caches retain every source index while allowing balanced lookup. -/
namespace MatrixBounds.Numeric

open scoped BigOperators

/-- A consecutive range of complete integer vectors, individually identified with their actual source. -/
structure RootFineFiniteVectorCache {nodes width : ℕ}
    (source : Fin nodes → Fin width → ℤ) (start count : ℕ) where
  /-- The entire selected range belongs to the original finite source alphabet. -/
  bounded : start+count ≤ nodes
  /-- Fast complete coordinate lookup on the selected original source range. -/
  lookup : Fin count → Fin width → ℤ
  /-- Every candidate coordinate has been proved equal to its original source coordinate. -/
  checked : ∀ row coordinate, lookup row coordinate =
    source ⟨start+row.val, by have := row.isLt; omega⟩ coordinate

namespace RootFineFiniteVectorCache

/-- Concatenate adjacent verified vector ranges without changing their original source order. -/
def append {nodes width start left right : ℕ} {source : Fin nodes → Fin width → ℤ}
    (first : RootFineFiniteVectorCache source start left)
    (second : RootFineFiniteVectorCache source (start+left) right) :
    RootFineFiniteVectorCache source start (left+right) where
  bounded := by have := second.bounded; omega
  lookup row coordinate :=
    if before : row.val < left then first.lookup ⟨row.val, before⟩ coordinate
    else second.lookup ⟨row.val-left, by have := row.isLt; omega⟩ coordinate
  checked row coordinate := by
    split_ifs with before
    · exact first.checked ⟨row.val, before⟩ coordinate
    · have identity := second.checked ⟨row.val-left, by have := row.isLt; omega⟩ coordinate
      convert identity using 1
      congr 1
      apply Fin.ext
      dsimp only
      omega

/-- One exact complete vector forms a one-row cache at its original source index. -/
def single {nodes width : ℕ} {source : Fin nodes → Fin width → ℤ}
    (row : Fin nodes) (value : Fin width → ℤ)
    (checked : ∀ coordinate, value coordinate = source row coordinate) :
    RootFineFiniteVectorCache source row.val 1 where
  bounded := row.isLt
  lookup _ := value
  checked index coordinate := by
    have zero : index.val = 0 := by have := index.isLt; omega
    simpa only [zero, Nat.add_zero] using checked coordinate

/-- Sparse exact checks determine every coordinate when the actual complete vector is nonnegative and normalized. -/
def ofSparseCheck {nodes width : ℕ} {source : Fin nodes → Fin width → ℤ}
    (row : Fin nodes) (total : ℤ) (value : Fin width → ℤ)
    (nonnegative : ∀ coordinate, 0 ≤ source row coordinate)
    (normalized : ∑ coordinate, source row coordinate = total)
    (checked : sparseIntegerVectorCheck total value (source row) = true) :
    RootFineFiniteVectorCache source row.val 1 :=
  single row value (sparseIntegerVectorCheck_sound total value (source row) nonnegative normalized checked)

end RootFineFiniteVectorCache
end MatrixBounds.Numeric
