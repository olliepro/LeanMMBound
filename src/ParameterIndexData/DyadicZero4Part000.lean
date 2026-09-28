import CheckedIndexTable

/-! Original flattened row references, in the exact supplied array order. -/
namespace MatrixBounds.Numeric.ParameterIndexData.DyadicZero4Part000
set_option maxRecDepth 100000
set_option maxHeartbeats 8000000

/-- Exact source references beginning at flat position 0, with bounded lookup depth. -/
def leaf000 : CheckedIndexTable 48 15279 :=
  CheckedIndexTable.ofList [
    15235,15236,15237,15238,15239,15240,15241,15242,15243,15244,15245,15246,15247,15248,15249,15250,15235,15236,15236,15251,15252,15253,15254,15255,15256,15257,15258,15259,15260,15261,15262,15263,
    15264,15265,15266,15267,15268,15269,15270,15271,15272,15273,15274,15275,15276,15250,15250,15235
  ] (by decide) (by decide)


/-- Complete source slice, preserving its original order and proved short-leaf lookups. -/
def table : CheckedIndexTable 48 15279 :=
  leaf000

/-- Original row references starting at flat index 0. -/
def entries : List ℕ := table.entries

end MatrixBounds.Numeric.ParameterIndexData.DyadicZero4Part000
