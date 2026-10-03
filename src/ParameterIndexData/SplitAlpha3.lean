module

public import ParameterIndexData.SplitAlpha3Part000
public import ParameterIndexData.SplitAlpha3Part001
public import ParameterIndexData.SplitAlpha3Part002

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

namespace MatrixBounds.Numeric.ParameterIndexData.SplitAlpha3

/-- Complete original parameter-array references; row dimensions are (945, 6). -/
def table : CheckedIndexTable 5670 5542 :=
  ((SplitAlpha3Part000.table).append SplitAlpha3Part001.table).append SplitAlpha3Part002.table

end MatrixBounds.Numeric.ParameterIndexData.SplitAlpha3
