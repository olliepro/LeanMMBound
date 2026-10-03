module

public import ParameterIndexData.DyadicZero4Part000

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

namespace MatrixBounds.Numeric.ParameterIndexData.DyadicZero4

/-- Complete original parameter-array references; row dimensions are (1, 48). -/
def table : CheckedIndexTable 48 15279 :=
  DyadicZero4Part000.table

end MatrixBounds.Numeric.ParameterIndexData.DyadicZero4
