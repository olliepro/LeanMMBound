module

public import FKLBridge.IndexTable
public import ParameterIndexData.DyadicAlloc4

@[expose] public section

namespace FKLBridge.Idx.DyadicAlloc4

open FKLBridge MatrixBounds.Numeric
set_option maxRecDepth 100000

/-- Packed lanes 0…127 (width 13). -/
def chunk000 : ℕ := 0x7703be5f32f9952cbe01df2f995200581df2f997cca9002c09400bcbe65480ee04aca9e54c01797c03b812809404aca9812b2a604aca9812809404aca9e54c095953ca9e54f2a604a025654f2a7953005e54c095953ca9812b2a7953ca9802c01600b03b81dc095953025012b2a600b005802c017952ca981dc09407703b8128017953005802c01600b005e54c0ee07703be54c0ee00bca9e54801600b005802c01797c03b812809404a

/-- Chunk tree: bit `l` of the chunk number selects the branch at depth `l`. -/
def tree : FKL.Tree :=
  (FKL.Tree.leaf chunk000)

theorem check000 : lanesEq 13 8191 MatrixBounds.Numeric.ParameterIndexData.DyadicAlloc4Part000.leaf000.entries (tree.get 0) = true := by decide +kernel

theorem reads_ParameterIndexData_DyadicAlloc4Part000_leaf000 : Reads MatrixBounds.Numeric.ParameterIndexData.DyadicAlloc4Part000.leaf000 (FKL.ptGet tree 7 13) 0 :=
  reads_chunk tree 7 13 8191 0 MatrixBounds.Numeric.ParameterIndexData.DyadicAlloc4Part000.leaf000 0 (by rfl) (by decide) (by decide) check000

theorem reads_ParameterIndexData_DyadicAlloc4Part000_table : Reads MatrixBounds.Numeric.ParameterIndexData.DyadicAlloc4Part000.table (FKL.ptGet tree 7 13) 0 :=
  FKLBridge.Idx.DyadicAlloc4.reads_ParameterIndexData_DyadicAlloc4Part000_leaf000

theorem reads_ParameterIndexData_DyadicAlloc4_table : Reads MatrixBounds.Numeric.ParameterIndexData.DyadicAlloc4.table (FKL.ptGet tree 7 13) 0 :=
  FKLBridge.Idx.DyadicAlloc4.reads_ParameterIndexData_DyadicAlloc4Part000_table

/-- Every lookup of `ParameterIndexData.DyadicAlloc4.table` is lane `i` of the packed chunk tree. -/
theorem get_eq : ∀ i : Fin 105, (MatrixBounds.Numeric.ParameterIndexData.DyadicAlloc4.table.get i).val = FKL.ptGet tree 7 13 i.val :=
  reads_get FKLBridge.Idx.DyadicAlloc4.reads_ParameterIndexData_DyadicAlloc4_table

end FKLBridge.Idx.DyadicAlloc4
