import ParameterIndexData.SplitAlpha3Part000
import ParameterIndexData.SplitAlpha3Part001
import ParameterIndexData.SplitAlpha3Part002

namespace MatrixBounds.Numeric.ParameterIndexData.SplitAlpha3

/-- Complete original parameter-array references; row dimensions are (945, 6). -/
def table : CheckedIndexTable 5670 5542 :=
  ((SplitAlpha3Part000.table).append SplitAlpha3Part001.table).append SplitAlpha3Part002.table

end MatrixBounds.Numeric.ParameterIndexData.SplitAlpha3
