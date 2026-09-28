import ParameterIndexData.DyadicAlloc3Part000
import ParameterIndexData.DyadicAlloc3Part001
import ParameterIndexData.DyadicAlloc3Part002

namespace MatrixBounds.Numeric.ParameterIndexData.DyadicAlloc3

/-- Complete original parameter-array references; row dimensions are (945, 6). -/
def table : CheckedIndexTable 5670 15279 :=
  ((DyadicAlloc3Part000.table).append DyadicAlloc3Part001.table).append DyadicAlloc3Part002.table

end MatrixBounds.Numeric.ParameterIndexData.DyadicAlloc3
