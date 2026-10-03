module

public import ParameterIndexData.GibbsURPart000

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

namespace MatrixBounds.Numeric.ParameterIndexData.GibbsUR

/-- Complete original parameter-array references; row dimensions are (1, 3). -/
def table : CheckedIndexTable 3 16629 :=
  GibbsURPart000.table

end MatrixBounds.Numeric.ParameterIndexData.GibbsUR
