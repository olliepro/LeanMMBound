import CheckedIndexTable

/-! Original flattened row references, in the exact supplied array order. -/
namespace MatrixBounds.Numeric.ParameterIndexData.DyadicTerminalrolesPart000
set_option maxRecDepth 100000
set_option maxHeartbeats 8000000

/-- Exact source references beginning at flat position 0, with bounded lookup depth. -/
def leaf000 : CheckedIndexTable 2 15279 :=
  CheckedIndexTable.ofList [
    15277,15278
  ] (by decide) (by decide)


/-- Complete source slice, preserving its original order and proved short-leaf lookups. -/
def table : CheckedIndexTable 2 15279 :=
  leaf000

/-- Original row references starting at flat index 0. -/
def entries : List ℕ := table.entries

end MatrixBounds.Numeric.ParameterIndexData.DyadicTerminalrolesPart000
