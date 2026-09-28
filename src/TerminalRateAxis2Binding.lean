import TerminalRateAxis2Block000
import TerminalRateAxis2Block001
import TerminalRateAxis2Block002
import TerminalRateAxis2Block003
import TerminalRateAxis2Block004
import TerminalRateAxis2Block005
import TerminalRateAxis2Block006
import TerminalRateAxis2Block007
import TerminalRateAxis2Block008
import TerminalRateAxis2Block009
import TerminalRateAxis2Block010
import TerminalRateAxis2Block011
import TerminalRateAxis2Block012
import TerminalRateAxis2Block013
import TerminalRateAxis2Block014
import TerminalRateAxis2Block015
import TerminalRateAxis2Block016
import TerminalRateAxis2Block017
import TerminalRateAxis2Block018
import TerminalRateAxis2Block019
import TerminalRateAxis2Block020
import TerminalRateAxis2Block021
import TerminalRateAxis2Block022
import TerminalRateAxis2Block023
import TerminalRateAxis2Block024
import TerminalRateAxis2Block025
import TerminalRateAxis2Block026
import TerminalRateAxis2Block027
import TerminalRateAxis2Block028
import TerminalRateAxis2Block029
import TerminalRateAxis2Block030
import TerminalRateAxis2Block031
import TerminalRateAxis2Block032
import TerminalRateAxis2Block033
import TerminalRateAxis2Block034
import TerminalRateAxis2Block035
import TerminalRateAxis2Block036
import TerminalRateAxis2Block037
import TerminalRateAxis2Block038
import TerminalRateAxis2Block039
import TerminalRateAxis2Block040
import TerminalRateAxis2Block041
import TerminalRateAxis2Block042
import TerminalRateAxis2Block043
import TerminalRateAxis2Block044
import TerminalRateAxis2Block045
import TerminalRateAxis2Block046
import TerminalRateAxis2Block047
import TerminalRateAxis2Block048
import TerminalRateAxis2Block049
import TerminalRateAxis2Block050
import TerminalRateAxis2Block051
import TerminalRateAxis2Block052
import TerminalRateAxis2Block053
import TerminalRateAxis2Block054
import TerminalRateAxis2Block055
import TerminalRateAxis2Block056
import TerminalRateAxis2Block057
import TerminalRateAxis2Block058
import TerminalRateAxis2Block059
import TerminalRateAxis2Block060
import TerminalRateAxis2Block061
import TerminalRateAxis2Block062
import TerminalRateAxis2Block063
import TerminalRateAxis2Block064
import TerminalRateAxis2Block065
import TerminalRateAxis2Block066
import TerminalRateAxis2Block067
import TerminalRateAxis2Block068
import TerminalRateAxis2Block069
import TerminalRateAxis2Block070
import TerminalRateAxis2Block071
import TerminalRateAxis2Block072
import TerminalRateAxis2Block073
import TerminalRateAxis2Block074
import TerminalRateAxis2Block075
import TerminalRateAxis2Block076
import TerminalRateAxis2Block077
import TerminalRateAxis2Block078
import TerminalRateAxis2Block079
import TerminalRateAxis2Block080
import TerminalRateAxis2Block081
import TerminalRateAxis2Block082
import TerminalRateAxis2Block083
import TerminalRateAxis2Block084
import TerminalRateAxis2Block085
import TerminalRateAxis2Block086
import TerminalRateAxis2Block087
import TerminalRateAxis2Block088
import TerminalRateAxis2Block089
import TerminalRateAxis2Block090
import TerminalRateAxis2Block091
import TerminalRateAxis2Block092
import TerminalRateAxis2Block093
import TerminalRateAxis2Block094
import TerminalRateAxis2Block095
import TerminalRateAxis2Block096
import TerminalRateAxis2Block097
import TerminalRateAxis2Block098
import TerminalRateAxis2Block099
import TerminalRateAxis2Block100
import TerminalRateAxis2Block101
import TerminalRateAxis2Block102
import TerminalRateAxis2Block103
import TerminalRateAxis2Block104
import TerminalRateAxis2Block105
import TerminalRateAxis2Block106
import TerminalRateAxis2Block107
import TerminalRateAxis2Block108
import TerminalRateAxis2Block109
import TerminalRateAxis2Block110
import TerminalRateAxis2Block111
import TerminalRateAxis2Block112
import TerminalRateAxis2Block113
import TerminalRateAxis2Block114
import TerminalRateAxis2Block115
import TerminalRateAxis2Block116
import TerminalRateAxis2Block117
import TerminalRateAxis2Block118
import TerminalRateAxis2Block119
import TerminalRateAxis2Block120
import TerminalRateAxis2Block121
import TerminalRateAxis2Block122
import TerminalRateAxis2Block123
import TerminalRateAxis2Block124
import TerminalRateAxis2Block125
import TerminalRateAxis2Block126
import TerminalRateAxis2Block127
import TerminalRateAxis2Block128
import TerminalRateAxis2Block129
import TerminalRateAxis2Block130
import TerminalRateAxis2Block131
import TerminalRateAxis2Block132
import TerminalRateAxis2Block133
import TerminalRateAxis2Block134
import TerminalRateCorrectionData2

namespace MatrixBounds.Numeric.SuppliedTerminalRates.TerminalRateAxis2Binding
open scoped BigOperators
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- All complete shared-logarithm corrections in original source-block order. -/
def corrections : Fin 135 → RationalLogExpression := TerminalRateCorrectionData2.corrections

/-- Every actual source block is identified with its unchanged certificate window and exact correction. -/
theorem boundaries : ∀ block, rationalLogValue (blockExpression block 2) =
    rationalLogValue (TerminalRateCertificateTable2.window block) + rationalLogValue (corrections block) := by
  intro block
  fin_cases block
  · exact TerminalRateAxis2Block000.boundary
  · exact TerminalRateAxis2Block001.boundary
  · exact TerminalRateAxis2Block002.boundary
  · exact TerminalRateAxis2Block003.boundary
  · exact TerminalRateAxis2Block004.boundary
  · exact TerminalRateAxis2Block005.boundary
  · exact TerminalRateAxis2Block006.boundary
  · exact TerminalRateAxis2Block007.boundary
  · exact TerminalRateAxis2Block008.boundary
  · exact TerminalRateAxis2Block009.boundary
  · exact TerminalRateAxis2Block010.boundary
  · exact TerminalRateAxis2Block011.boundary
  · exact TerminalRateAxis2Block012.boundary
  · exact TerminalRateAxis2Block013.boundary
  · exact TerminalRateAxis2Block014.boundary
  · exact TerminalRateAxis2Block015.boundary
  · exact TerminalRateAxis2Block016.boundary
  · exact TerminalRateAxis2Block017.boundary
  · exact TerminalRateAxis2Block018.boundary
  · exact TerminalRateAxis2Block019.boundary
  · exact TerminalRateAxis2Block020.boundary
  · exact TerminalRateAxis2Block021.boundary
  · exact TerminalRateAxis2Block022.boundary
  · exact TerminalRateAxis2Block023.boundary
  · exact TerminalRateAxis2Block024.boundary
  · exact TerminalRateAxis2Block025.boundary
  · exact TerminalRateAxis2Block026.boundary
  · exact TerminalRateAxis2Block027.boundary
  · exact TerminalRateAxis2Block028.boundary
  · exact TerminalRateAxis2Block029.boundary
  · exact TerminalRateAxis2Block030.boundary
  · exact TerminalRateAxis2Block031.boundary
  · exact TerminalRateAxis2Block032.boundary
  · exact TerminalRateAxis2Block033.boundary
  · exact TerminalRateAxis2Block034.boundary
  · exact TerminalRateAxis2Block035.boundary
  · exact TerminalRateAxis2Block036.boundary
  · exact TerminalRateAxis2Block037.boundary
  · exact TerminalRateAxis2Block038.boundary
  · exact TerminalRateAxis2Block039.boundary
  · exact TerminalRateAxis2Block040.boundary
  · exact TerminalRateAxis2Block041.boundary
  · exact TerminalRateAxis2Block042.boundary
  · exact TerminalRateAxis2Block043.boundary
  · exact TerminalRateAxis2Block044.boundary
  · exact TerminalRateAxis2Block045.boundary
  · exact TerminalRateAxis2Block046.boundary
  · exact TerminalRateAxis2Block047.boundary
  · exact TerminalRateAxis2Block048.boundary
  · exact TerminalRateAxis2Block049.boundary
  · exact TerminalRateAxis2Block050.boundary
  · exact TerminalRateAxis2Block051.boundary
  · exact TerminalRateAxis2Block052.boundary
  · exact TerminalRateAxis2Block053.boundary
  · exact TerminalRateAxis2Block054.boundary
  · exact TerminalRateAxis2Block055.boundary
  · exact TerminalRateAxis2Block056.boundary
  · exact TerminalRateAxis2Block057.boundary
  · exact TerminalRateAxis2Block058.boundary
  · exact TerminalRateAxis2Block059.boundary
  · exact TerminalRateAxis2Block060.boundary
  · exact TerminalRateAxis2Block061.boundary
  · exact TerminalRateAxis2Block062.boundary
  · exact TerminalRateAxis2Block063.boundary
  · exact TerminalRateAxis2Block064.boundary
  · exact TerminalRateAxis2Block065.boundary
  · exact TerminalRateAxis2Block066.boundary
  · exact TerminalRateAxis2Block067.boundary
  · exact TerminalRateAxis2Block068.boundary
  · exact TerminalRateAxis2Block069.boundary
  · exact TerminalRateAxis2Block070.boundary
  · exact TerminalRateAxis2Block071.boundary
  · exact TerminalRateAxis2Block072.boundary
  · exact TerminalRateAxis2Block073.boundary
  · exact TerminalRateAxis2Block074.boundary
  · exact TerminalRateAxis2Block075.boundary
  · exact TerminalRateAxis2Block076.boundary
  · exact TerminalRateAxis2Block077.boundary
  · exact TerminalRateAxis2Block078.boundary
  · exact TerminalRateAxis2Block079.boundary
  · exact TerminalRateAxis2Block080.boundary
  · exact TerminalRateAxis2Block081.boundary
  · exact TerminalRateAxis2Block082.boundary
  · exact TerminalRateAxis2Block083.boundary
  · exact TerminalRateAxis2Block084.boundary
  · exact TerminalRateAxis2Block085.boundary
  · exact TerminalRateAxis2Block086.boundary
  · exact TerminalRateAxis2Block087.boundary
  · exact TerminalRateAxis2Block088.boundary
  · exact TerminalRateAxis2Block089.boundary
  · exact TerminalRateAxis2Block090.boundary
  · exact TerminalRateAxis2Block091.boundary
  · exact TerminalRateAxis2Block092.boundary
  · exact TerminalRateAxis2Block093.boundary
  · exact TerminalRateAxis2Block094.boundary
  · exact TerminalRateAxis2Block095.boundary
  · exact TerminalRateAxis2Block096.boundary
  · exact TerminalRateAxis2Block097.boundary
  · exact TerminalRateAxis2Block098.boundary
  · exact TerminalRateAxis2Block099.boundary
  · exact TerminalRateAxis2Block100.boundary
  · exact TerminalRateAxis2Block101.boundary
  · exact TerminalRateAxis2Block102.boundary
  · exact TerminalRateAxis2Block103.boundary
  · exact TerminalRateAxis2Block104.boundary
  · exact TerminalRateAxis2Block105.boundary
  · exact TerminalRateAxis2Block106.boundary
  · exact TerminalRateAxis2Block107.boundary
  · exact TerminalRateAxis2Block108.boundary
  · exact TerminalRateAxis2Block109.boundary
  · exact TerminalRateAxis2Block110.boundary
  · exact TerminalRateAxis2Block111.boundary
  · exact TerminalRateAxis2Block112.boundary
  · exact TerminalRateAxis2Block113.boundary
  · exact TerminalRateAxis2Block114.boundary
  · exact TerminalRateAxis2Block115.boundary
  · exact TerminalRateAxis2Block116.boundary
  · exact TerminalRateAxis2Block117.boundary
  · exact TerminalRateAxis2Block118.boundary
  · exact TerminalRateAxis2Block119.boundary
  · exact TerminalRateAxis2Block120.boundary
  · exact TerminalRateAxis2Block121.boundary
  · exact TerminalRateAxis2Block122.boundary
  · exact TerminalRateAxis2Block123.boundary
  · exact TerminalRateAxis2Block124.boundary
  · exact TerminalRateAxis2Block125.boundary
  · exact TerminalRateAxis2Block126.boundary
  · exact TerminalRateAxis2Block127.boundary
  · exact TerminalRateAxis2Block128.boundary
  · exact TerminalRateAxis2Block129.boundary
  · exact TerminalRateAxis2Block130.boundary
  · exact TerminalRateAxis2Block131.boundary
  · exact TerminalRateAxis2Block132.boundary
  · exact TerminalRateAxis2Block133.boundary
  · exact TerminalRateAxis2Block134.boundary

/-- The finite collection of every shared-logarithm correction cancels exactly. -/
theorem corrections_checked : mergeNormalizeLogExpression (finiteLogSum corrections) = [] := TerminalRateCorrectionData2.checked

/-- The actual original terminal stage rate is exactly the complete supplied numerical certificate. -/
theorem rate_eq :
    SuppliedPathStages.terminal.rates 2 / (SuppliedPopulationWeights.rootWeight : ℝ) =
      certificateValue 2 := by
  apply rate_of_window_corrections 2 TerminalRateCertificateTable2.window corrections boundaries
  · exact TerminalRateCertificateTable2.windows_value
  · exact sum_corrections_zero corrections corrections_checked

end MatrixBounds.Numeric.SuppliedTerminalRates.TerminalRateAxis2Binding
