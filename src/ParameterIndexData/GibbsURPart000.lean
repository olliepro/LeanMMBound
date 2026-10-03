module

public import CheckedIndexTable

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Original flattened row references, in the exact supplied array order. -/
namespace MatrixBounds.Numeric.ParameterIndexData.GibbsURPart000
set_option maxRecDepth 100000
set_option maxHeartbeats 8000000

/-- Exact source references beginning at flat position 0, with bounded lookup depth. -/
def leaf000 : CheckedIndexTable 3 16629 :=
  CheckedIndexTable.ofList [
    16626,16627,16628
  ] (by decide) (by decide)


/-- Complete source slice, preserving its original order and proved short-leaf lookups. -/
def table : CheckedIndexTable 3 16629 :=
  leaf000

/-- Original row references starting at flat index 0. -/
def entries : List ℕ := table.entries

end MatrixBounds.Numeric.ParameterIndexData.GibbsURPart000
