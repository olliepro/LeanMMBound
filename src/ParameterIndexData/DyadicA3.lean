module

public import ParameterIndexData.DyadicA3Part000

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

namespace MatrixBounds.Numeric.ParameterIndexData.DyadicA3

/-- Complete original parameter-array references; row dimensions are (945,). -/
def table : CheckedIndexTable 945 15279 :=
  DyadicA3Part000.table

end MatrixBounds.Numeric.ParameterIndexData.DyadicA3
