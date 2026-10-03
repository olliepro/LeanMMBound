module

public import ParameterIndexData.DyadicAlpha3Part000
public import ParameterIndexData.DyadicAlpha3Part001
public import ParameterIndexData.DyadicAlpha3Part002

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

namespace MatrixBounds.Numeric.ParameterIndexData.DyadicAlpha3

/-- Complete original parameter-array references; row dimensions are (945, 6). -/
def table : CheckedIndexTable 5670 15279 :=
  ((DyadicAlpha3Part000.table).append DyadicAlpha3Part001.table).append DyadicAlpha3Part002.table

end MatrixBounds.Numeric.ParameterIndexData.DyadicAlpha3
