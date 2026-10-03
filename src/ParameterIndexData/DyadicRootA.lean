module

public import ParameterIndexData.DyadicRootAPart000

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

namespace MatrixBounds.Numeric.ParameterIndexData.DyadicRootA

/-- Complete original parameter-array references; row dimensions are (1,). -/
def table : CheckedIndexTable 1 15279 :=
  DyadicRootAPart000.table

end MatrixBounds.Numeric.ParameterIndexData.DyadicRootA
