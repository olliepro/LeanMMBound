module

public import ParameterIndexData.DyadicAlpha4Part000

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

namespace MatrixBounds.Numeric.ParameterIndexData.DyadicAlpha4

/-- Complete original parameter-array references; row dimensions are (105,). -/
def table : CheckedIndexTable 105 15279 :=
  DyadicAlpha4Part000.table

end MatrixBounds.Numeric.ParameterIndexData.DyadicAlpha4
