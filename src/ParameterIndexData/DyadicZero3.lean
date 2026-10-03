module

public import ParameterIndexData.DyadicZero3Part000

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

namespace MatrixBounds.Numeric.ParameterIndexData.DyadicZero3

/-- Complete original parameter-array references; row dimensions are (840,). -/
def table : CheckedIndexTable 840 15279 :=
  DyadicZero3Part000.table

end MatrixBounds.Numeric.ParameterIndexData.DyadicZero3
