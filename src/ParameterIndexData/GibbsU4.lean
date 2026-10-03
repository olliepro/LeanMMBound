module

public import ParameterIndexData.GibbsU4Part000

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

namespace MatrixBounds.Numeric.ParameterIndexData.GibbsU4

/-- Complete original parameter-array references; row dimensions are (105, 3). -/
def table : CheckedIndexTable 315 16629 :=
  GibbsU4Part000.table

end MatrixBounds.Numeric.ParameterIndexData.GibbsU4
