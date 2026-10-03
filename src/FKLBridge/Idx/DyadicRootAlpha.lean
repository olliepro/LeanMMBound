module

public import FKLBridge.IndexTable
public import ParameterIndexData.DyadicRootAlpha

@[expose] public section

namespace FKLBridge.Idx.DyadicRootAlpha

open FKLBridge MatrixBounds.Numeric
set_option maxRecDepth 100000

/-- Packed lanes 0…0 (width 1). -/
def chunk000 : ℕ := 0x1

/-- Chunk tree: bit `l` of the chunk number selects the branch at depth `l`. -/
def tree : FKL.Tree :=
  (FKL.Tree.leaf chunk000)

theorem check000 : lanesEq 1 1 MatrixBounds.Numeric.ParameterIndexData.DyadicRootAlphaPart000.leaf000.entries (tree.get 0) = true := by decide +kernel

theorem reads_ParameterIndexData_DyadicRootAlphaPart000_leaf000 : Reads MatrixBounds.Numeric.ParameterIndexData.DyadicRootAlphaPart000.leaf000 (FKL.ptGet tree 0 1) 0 :=
  reads_chunk tree 0 1 1 0 MatrixBounds.Numeric.ParameterIndexData.DyadicRootAlphaPart000.leaf000 0 (by rfl) (by decide) (by decide) check000

theorem reads_ParameterIndexData_DyadicRootAlphaPart000_table : Reads MatrixBounds.Numeric.ParameterIndexData.DyadicRootAlphaPart000.table (FKL.ptGet tree 0 1) 0 :=
  FKLBridge.Idx.DyadicRootAlpha.reads_ParameterIndexData_DyadicRootAlphaPart000_leaf000

theorem reads_ParameterIndexData_DyadicRootAlpha_table : Reads MatrixBounds.Numeric.ParameterIndexData.DyadicRootAlpha.table (FKL.ptGet tree 0 1) 0 :=
  FKLBridge.Idx.DyadicRootAlpha.reads_ParameterIndexData_DyadicRootAlphaPart000_table

/-- Every lookup of `ParameterIndexData.DyadicRootAlpha.table` is lane `i` of the packed chunk tree. -/
theorem get_eq : ∀ i : Fin 1, (MatrixBounds.Numeric.ParameterIndexData.DyadicRootAlpha.table.get i).val = FKL.ptGet tree 0 1 i.val :=
  reads_get FKLBridge.Idx.DyadicRootAlpha.reads_ParameterIndexData_DyadicRootAlpha_table

end FKLBridge.Idx.DyadicRootAlpha
