module

public import SuppliedRootFineParent4IntegerValidity
public import RootFineCacheAssembly

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Independently checked complete parent4 laws compose into an exact source-indexed lookup. -/
namespace MatrixBounds.Numeric

/-- A consecutive block of actual parent4 laws with all original physical axes and orbits. -/
structure RootFineParent4CacheTable (start count : ℕ) where
  /-- Original parent bounds are retained. -/
  bounded : start+count ≤ 105
  /-- Complete integer orbit numerators in source order. -/
  lookup : Fin count → Fin 3 → Fin 231 → ℤ
  /-- Every entry equals the actual original integer parent law. -/
  checked : ∀ parent axis orbit, lookup parent axis orbit =
    SuppliedRootFineParent4Integers.numerator ⟨start+parent.val, by have := parent.isLt; omega⟩ axis orbit

namespace RootFineParent4CacheTable

/-- Concatenate adjacent original parent blocks without changing any source label. -/
def append {start left right : ℕ} (first : RootFineParent4CacheTable start left)
    (second : RootFineParent4CacheTable (start+left) right) : RootFineParent4CacheTable start (left+right) where
  bounded := by have := second.bounded; omega
  lookup parent axis orbit :=
    if before : parent.val < left then first.lookup ⟨parent.val, before⟩ axis orbit
    else second.lookup ⟨parent.val-left, by have := parent.isLt; omega⟩ axis orbit
  checked parent axis orbit := by
    split_ifs with before
    · exact first.checked ⟨parent.val, before⟩ axis orbit
    · have identity := second.checked ⟨parent.val-left, by have := parent.isLt; omega⟩ axis orbit
      convert identity using 1
      congr 1
      apply Fin.ext
      dsimp only
      omega

/-- One fully verified original parent law forms a one-parent cache block. -/
def single (source : Fin 105) (value : Fin 3 → Fin 231 → ℤ)
    (checked : ∀ axis orbit, value axis orbit = SuppliedRootFineParent4Integers.numerator source axis orbit) :
    RootFineParent4CacheTable source.val 1 where
  bounded := source.isLt
  lookup _ := value
  checked parent axis orbit := by
    have zero : parent.val = 0 := by have := parent.isLt; omega
    simpa only [zero, Nat.add_zero] using checked axis orbit

end RootFineParent4CacheTable
end MatrixBounds.Numeric
