import ParameterIndexData.GibbsU3Part000
import ParameterIndexData.GibbsU3Part001
import ParameterIndexData.GibbsU3Part002
import ParameterIndexData.GibbsU3Part003
import ParameterIndexData.GibbsU3Part004
import ParameterIndexData.GibbsU3Part005
import ParameterIndexData.GibbsU3Part006
import ParameterIndexData.GibbsU3Part007
import ParameterIndexData.GibbsU3Part008

namespace MatrixBounds.Numeric.ParameterIndexData.GibbsU3

/-- Complete original parameter-array references; row dimensions are (945, 6, 3). -/
def table : CheckedIndexTable 17010 16629 :=
  ((((((((GibbsU3Part000.table).append GibbsU3Part001.table).append GibbsU3Part002.table).append GibbsU3Part003.table).append GibbsU3Part004.table).append GibbsU3Part005.table).append GibbsU3Part006.table).append GibbsU3Part007.table).append GibbsU3Part008.table

end MatrixBounds.Numeric.ParameterIndexData.GibbsU3
