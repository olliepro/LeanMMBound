module

public import FKLBridge.IndexTable
public import ParameterIndexData.SplitAlpha4

@[expose] public section

namespace FKLBridge.Idx.SplitAlpha4

open FKLBridge MatrixBounds.Numeric
set_option maxRecDepth 100000

/-- Packed lanes 0…127 (width 13). -/
def chunk000 : ℕ := 0x15a5ad2568eb455a1ad0567eb3d59dace566eb35599acc565eb2d595aca564eb25591ac8563eb1d58dac6562eb15589ac4561eb0d585ac2560eb05581ac055feafd57dabe55eeaf5579abc55deaed575aba55ceae5571ab855beadd56dab655aead5569ab4559eacd565ab2558eac5561ab0557eabd55daae556eab5559aac555eaad555aaa554eaa5551aa8553ea9d54daa6552ea95549aa4551ea8d545aa2550ea85541aa054fea7d53d

/-- Chunk tree: bit `l` of the chunk number selects the branch at depth `l`. -/
def tree : FKL.Tree :=
  (FKL.Tree.leaf chunk000)

theorem check000 : lanesEq 13 8191 MatrixBounds.Numeric.ParameterIndexData.SplitAlpha4Part000.leaf000.entries (tree.get 0) = true := by decide +kernel

theorem reads_ParameterIndexData_SplitAlpha4Part000_leaf000 : Reads MatrixBounds.Numeric.ParameterIndexData.SplitAlpha4Part000.leaf000 (FKL.ptGet tree 7 13) 0 :=
  reads_chunk tree 7 13 8191 0 MatrixBounds.Numeric.ParameterIndexData.SplitAlpha4Part000.leaf000 0 (by rfl) (by decide) (by decide) check000

theorem reads_ParameterIndexData_SplitAlpha4Part000_table : Reads MatrixBounds.Numeric.ParameterIndexData.SplitAlpha4Part000.table (FKL.ptGet tree 7 13) 0 :=
  FKLBridge.Idx.SplitAlpha4.reads_ParameterIndexData_SplitAlpha4Part000_leaf000

theorem reads_ParameterIndexData_SplitAlpha4_table : Reads MatrixBounds.Numeric.ParameterIndexData.SplitAlpha4.table (FKL.ptGet tree 7 13) 0 :=
  FKLBridge.Idx.SplitAlpha4.reads_ParameterIndexData_SplitAlpha4Part000_table

/-- Every lookup of `ParameterIndexData.SplitAlpha4.table` is lane `i` of the packed chunk tree. -/
theorem get_eq : ∀ i : Fin 105, (MatrixBounds.Numeric.ParameterIndexData.SplitAlpha4.table.get i).val = FKL.ptGet tree 7 13 i.val :=
  reads_get FKLBridge.Idx.SplitAlpha4.reads_ParameterIndexData_SplitAlpha4_table

end FKLBridge.Idx.SplitAlpha4
