import ParameterIndexData.DyadicAlpha3Part000
import ParameterIndexData.DyadicAlpha3Part001
import ParameterIndexData.DyadicAlpha3Part002

namespace MatrixBounds.Numeric.ParameterIndexData.DyadicAlpha3

/-- Complete original parameter-array references; row dimensions are (945, 6). -/
def table : CheckedIndexTable 5670 15279 :=
  ((DyadicAlpha3Part000.table).append DyadicAlpha3Part001.table).append DyadicAlpha3Part002.table

end MatrixBounds.Numeric.ParameterIndexData.DyadicAlpha3
