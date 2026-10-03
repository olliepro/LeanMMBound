module

public import FKLBridge.IndexTable
public import ParameterIndexData.DyadicZero4

@[expose] public section

namespace FKLBridge.Idx.DyadicZero4

open FKLBridge MatrixBounds.Numeric
set_option maxRecDepth 100000

/-- Packed lanes 0…63 (width 14). -/
def chunk000 : ℕ := 0xee0fb92ee4bbaceeafbaaeea7ba8ee9fba6ee97ba4ee8fba2ee87ba0ee7fb9eee77b9cee6fb9aee67b98ee5fb96ee57b94ee4fb84ee13b83ee4bb91ee43b8fee3bb8dee33b8bee2bb89ee23b87ee1bb85ee13b83

/-- Chunk tree: bit `l` of the chunk number selects the branch at depth `l`. -/
def tree : FKL.Tree :=
  (FKL.Tree.leaf chunk000)

theorem check000 : lanesEq 14 16383 MatrixBounds.Numeric.ParameterIndexData.DyadicZero4Part000.leaf000.entries (tree.get 0) = true := by decide +kernel

theorem reads_ParameterIndexData_DyadicZero4Part000_leaf000 : Reads MatrixBounds.Numeric.ParameterIndexData.DyadicZero4Part000.leaf000 (FKL.ptGet tree 6 14) 0 :=
  reads_chunk tree 6 14 16383 0 MatrixBounds.Numeric.ParameterIndexData.DyadicZero4Part000.leaf000 0 (by rfl) (by decide) (by decide) check000

theorem reads_ParameterIndexData_DyadicZero4Part000_table : Reads MatrixBounds.Numeric.ParameterIndexData.DyadicZero4Part000.table (FKL.ptGet tree 6 14) 0 :=
  FKLBridge.Idx.DyadicZero4.reads_ParameterIndexData_DyadicZero4Part000_leaf000

theorem reads_ParameterIndexData_DyadicZero4_table : Reads MatrixBounds.Numeric.ParameterIndexData.DyadicZero4.table (FKL.ptGet tree 6 14) 0 :=
  FKLBridge.Idx.DyadicZero4.reads_ParameterIndexData_DyadicZero4Part000_table

/-- Every lookup of `ParameterIndexData.DyadicZero4.table` is lane `i` of the packed chunk tree. -/
theorem get_eq : ∀ i : Fin 48, (MatrixBounds.Numeric.ParameterIndexData.DyadicZero4.table.get i).val = FKL.ptGet tree 6 14 i.val :=
  reads_get FKLBridge.Idx.DyadicZero4.reads_ParameterIndexData_DyadicZero4_table

end FKLBridge.Idx.DyadicZero4
