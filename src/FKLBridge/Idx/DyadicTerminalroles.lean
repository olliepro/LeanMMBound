module

public import FKLBridge.IndexTable
public import ParameterIndexData.DyadicTerminalroles

@[expose] public section

namespace FKLBridge.Idx.DyadicTerminalroles

open FKLBridge MatrixBounds.Numeric
set_option maxRecDepth 100000

/-- Packed lanes 0…1 (width 14). -/
def chunk000 : ℕ := 0xeebbbad

/-- Chunk tree: bit `l` of the chunk number selects the branch at depth `l`. -/
def tree : FKL.Tree :=
  (FKL.Tree.leaf chunk000)

theorem check000 : lanesEq 14 16383 MatrixBounds.Numeric.ParameterIndexData.DyadicTerminalrolesPart000.leaf000.entries (tree.get 0) = true := by decide +kernel

theorem reads_ParameterIndexData_DyadicTerminalrolesPart000_leaf000 : Reads MatrixBounds.Numeric.ParameterIndexData.DyadicTerminalrolesPart000.leaf000 (FKL.ptGet tree 1 14) 0 :=
  reads_chunk tree 1 14 16383 0 MatrixBounds.Numeric.ParameterIndexData.DyadicTerminalrolesPart000.leaf000 0 (by rfl) (by decide) (by decide) check000

theorem reads_ParameterIndexData_DyadicTerminalrolesPart000_table : Reads MatrixBounds.Numeric.ParameterIndexData.DyadicTerminalrolesPart000.table (FKL.ptGet tree 1 14) 0 :=
  FKLBridge.Idx.DyadicTerminalroles.reads_ParameterIndexData_DyadicTerminalrolesPart000_leaf000

theorem reads_ParameterIndexData_DyadicTerminalroles_table : Reads MatrixBounds.Numeric.ParameterIndexData.DyadicTerminalroles.table (FKL.ptGet tree 1 14) 0 :=
  FKLBridge.Idx.DyadicTerminalroles.reads_ParameterIndexData_DyadicTerminalrolesPart000_table

/-- Every lookup of `ParameterIndexData.DyadicTerminalroles.table` is lane `i` of the packed chunk tree. -/
theorem get_eq : ∀ i : Fin 2, (MatrixBounds.Numeric.ParameterIndexData.DyadicTerminalroles.table.get i).val = FKL.ptGet tree 1 14 i.val :=
  reads_get FKLBridge.Idx.DyadicTerminalroles.reads_ParameterIndexData_DyadicTerminalroles_table

end FKLBridge.Idx.DyadicTerminalroles
