import CheckedIndexTable

/-! Original flattened row references, in the exact supplied array order. -/
namespace MatrixBounds.Numeric.ParameterIndexData.DyadicAlloc4Part000
set_option maxRecDepth 100000
set_option maxHeartbeats 8000000

/-- Exact source references beginning at flat position 0, with bounded lookup depth. -/
def leaf000 : CheckedIndexTable 105 15279 :=
  CheckedIndexTable.ofList [
    74,74,74,119,6524,11,11,11,11,11,6482,6483,11,119,6483,119,119,119,6483,11,11,11,11,11,6483,11,74,119,119,74,119,6483,
    6482,11,11,11,11,6483,74,74,6483,74,119,119,11,11,11,6483,6483,6483,74,6483,6483,74,6483,11,6483,6483,6483,74,74,6483,6483,6483,
    6483,74,6483,6483,74,74,74,6483,74,6483,74,6483,74,74,74,119,6524,11,6483,6483,74,119,6482,6524,11,74,11,6482,6524,6524,119,11,
    6482,6524,119,6524,6482,6524,6524,119,119
  ] (by decide) (by decide)


/-- Complete source slice, preserving its original order and proved short-leaf lookups. -/
def table : CheckedIndexTable 105 15279 :=
  leaf000

/-- Original row references starting at flat index 0. -/
def entries : List ℕ := table.entries

end MatrixBounds.Numeric.ParameterIndexData.DyadicAlloc4Part000
