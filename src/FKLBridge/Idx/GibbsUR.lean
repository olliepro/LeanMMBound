module

public import FKLBridge.IndexTable
public import ParameterIndexData.GibbsUR

@[expose] public section

namespace FKLBridge.Idx.GibbsUR

open FKLBridge MatrixBounds.Numeric
set_option maxRecDepth 100000

/-- Packed lanes 0…3 (width 15). -/
def chunk000 : ℕ := 0x103d2079c0f2

/-- Chunk tree: bit `l` of the chunk number selects the branch at depth `l`. -/
def tree : FKL.Tree :=
  (FKL.Tree.leaf chunk000)

theorem check000 : lanesEq 15 32767 MatrixBounds.Numeric.ParameterIndexData.GibbsURPart000.leaf000.entries (tree.get 0) = true := by decide +kernel

theorem reads_ParameterIndexData_GibbsURPart000_leaf000 : Reads MatrixBounds.Numeric.ParameterIndexData.GibbsURPart000.leaf000 (FKL.ptGet tree 2 15) 0 :=
  reads_chunk tree 2 15 32767 0 MatrixBounds.Numeric.ParameterIndexData.GibbsURPart000.leaf000 0 (by rfl) (by decide) (by decide) check000

theorem reads_ParameterIndexData_GibbsURPart000_table : Reads MatrixBounds.Numeric.ParameterIndexData.GibbsURPart000.table (FKL.ptGet tree 2 15) 0 :=
  FKLBridge.Idx.GibbsUR.reads_ParameterIndexData_GibbsURPart000_leaf000

theorem reads_ParameterIndexData_GibbsUR_table : Reads MatrixBounds.Numeric.ParameterIndexData.GibbsUR.table (FKL.ptGet tree 2 15) 0 :=
  FKLBridge.Idx.GibbsUR.reads_ParameterIndexData_GibbsURPart000_table

/-- Every lookup of `ParameterIndexData.GibbsUR.table` is lane `i` of the packed chunk tree. -/
theorem get_eq : ∀ i : Fin 3, (MatrixBounds.Numeric.ParameterIndexData.GibbsUR.table.get i).val = FKL.ptGet tree 2 15 i.val :=
  reads_get FKLBridge.Idx.GibbsUR.reads_ParameterIndexData_GibbsUR_table

end FKLBridge.Idx.GibbsUR
