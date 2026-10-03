module

public import ParameterIndexData.DyadicTerminalrolesPart000

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

namespace MatrixBounds.Numeric.ParameterIndexData.DyadicTerminalroles

/-- Complete original parameter-array references; row dimensions are (2,). -/
def table : CheckedIndexTable 2 15279 :=
  DyadicTerminalrolesPart000.table

end MatrixBounds.Numeric.ParameterIndexData.DyadicTerminalroles
