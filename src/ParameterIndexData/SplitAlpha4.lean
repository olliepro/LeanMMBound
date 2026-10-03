module

public import ParameterIndexData.SplitAlpha4Part000

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

namespace MatrixBounds.Numeric.ParameterIndexData.SplitAlpha4

/-- Complete original parameter-array references; row dimensions are (105,). -/
def table : CheckedIndexTable 105 5542 :=
  SplitAlpha4Part000.table

end MatrixBounds.Numeric.ParameterIndexData.SplitAlpha4
