module

public import ParameterIndexData.DyadicRootAlphaPart000

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

namespace MatrixBounds.Numeric.ParameterIndexData.DyadicRootAlpha

/-- Complete original parameter-array references; row dimensions are (1,). -/
def table : CheckedIndexTable 1 15279 :=
  DyadicRootAlphaPart000.table

end MatrixBounds.Numeric.ParameterIndexData.DyadicRootAlpha
