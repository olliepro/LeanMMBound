import TerminalRateAxis0Block000
import TerminalRateAxis0Block001
import TerminalRateAxis0Block002
import TerminalRateAxis0Block003
import TerminalRateAxis0Block004
import TerminalRateAxis0Block005
import TerminalRateAxis0Block006
import TerminalRateAxis0Block007
import TerminalRateAxis0Block008
import TerminalRateAxis0Block009
import TerminalRateAxis0Block010
import TerminalRateAxis0Block011
import TerminalRateAxis0Block012
import TerminalRateAxis0Block013
import TerminalRateAxis0Block014
import TerminalRateAxis0Block015
import TerminalRateAxis0Block016
import TerminalRateAxis0Block017
import TerminalRateAxis0Block018
import TerminalRateAxis0Block019
import TerminalRateAxis0Block020
import TerminalRateAxis0Block021
import TerminalRateAxis0Block022
import TerminalRateAxis0Block023
import TerminalRateAxis0Block024
import TerminalRateAxis0Block025
import TerminalRateAxis0Block026
import TerminalRateAxis0Block027
import TerminalRateAxis0Block028
import TerminalRateAxis0Block029
import TerminalRateAxis0Block030
import TerminalRateAxis0Block031
import TerminalRateAxis0Block032
import TerminalRateAxis0Block033
import TerminalRateAxis0Block034
import TerminalRateAxis0Block035
import TerminalRateAxis0Block036
import TerminalRateAxis0Block037
import TerminalRateAxis0Block038
import TerminalRateAxis0Block039
import TerminalRateAxis0Block040
import TerminalRateAxis0Block041
import TerminalRateAxis0Block042
import TerminalRateAxis0Block043
import TerminalRateAxis0Block044
import TerminalRateAxis0Block045
import TerminalRateAxis0Block046
import TerminalRateAxis0Block047
import TerminalRateAxis0Block048
import TerminalRateAxis0Block049
import TerminalRateAxis0Block050
import TerminalRateAxis0Block051
import TerminalRateAxis0Block052
import TerminalRateAxis0Block053
import TerminalRateAxis0Block054
import TerminalRateAxis0Block055
import TerminalRateAxis0Block056
import TerminalRateAxis0Block057
import TerminalRateAxis0Block058
import TerminalRateAxis0Block059
import TerminalRateAxis0Block060
import TerminalRateAxis0Block061
import TerminalRateAxis0Block062
import TerminalRateAxis0Block063
import TerminalRateAxis0Block064
import TerminalRateAxis0Block065
import TerminalRateAxis0Block066
import TerminalRateAxis0Block067
import TerminalRateAxis0Block068
import TerminalRateAxis0Block069
import TerminalRateAxis0Block070
import TerminalRateAxis0Block071
import TerminalRateAxis0Block072
import TerminalRateAxis0Block073
import TerminalRateAxis0Block074
import TerminalRateAxis0Block075
import TerminalRateAxis0Block076
import TerminalRateAxis0Block077
import TerminalRateAxis0Block078
import TerminalRateAxis0Block079
import TerminalRateAxis0Block080
import TerminalRateAxis0Block081
import TerminalRateAxis0Block082
import TerminalRateAxis0Block083
import TerminalRateAxis0Block084
import TerminalRateAxis0Block085
import TerminalRateAxis0Block086
import TerminalRateAxis0Block087
import TerminalRateAxis0Block088
import TerminalRateAxis0Block089
import TerminalRateAxis0Block090
import TerminalRateAxis0Block091
import TerminalRateAxis0Block092
import TerminalRateAxis0Block093
import TerminalRateAxis0Block094
import TerminalRateAxis0Block095
import TerminalRateAxis0Block096
import TerminalRateAxis0Block097
import TerminalRateAxis0Block098
import TerminalRateAxis0Block099
import TerminalRateAxis0Block100
import TerminalRateAxis0Block101
import TerminalRateAxis0Block102
import TerminalRateAxis0Block103
import TerminalRateAxis0Block104
import TerminalRateAxis0Block105
import TerminalRateAxis0Block106
import TerminalRateAxis0Block107
import TerminalRateAxis0Block108
import TerminalRateAxis0Block109
import TerminalRateAxis0Block110
import TerminalRateAxis0Block111
import TerminalRateAxis0Block112
import TerminalRateAxis0Block113
import TerminalRateAxis0Block114
import TerminalRateAxis0Block115
import TerminalRateAxis0Block116
import TerminalRateAxis0Block117
import TerminalRateAxis0Block118
import TerminalRateAxis0Block119
import TerminalRateAxis0Block120
import TerminalRateAxis0Block121
import TerminalRateAxis0Block122
import TerminalRateAxis0Block123
import TerminalRateAxis0Block124
import TerminalRateAxis0Block125
import TerminalRateAxis0Block126
import TerminalRateAxis0Block127
import TerminalRateAxis0Block128
import TerminalRateAxis0Block129
import TerminalRateAxis0Block130
import TerminalRateAxis0Block131
import TerminalRateAxis0Block132
import TerminalRateAxis0Block133
import TerminalRateAxis0Block134
import TerminalRateCorrectionData0

namespace MatrixBounds.Numeric.SuppliedTerminalRates.TerminalRateAxis0Binding
open scoped BigOperators
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- All complete shared-logarithm corrections in original source-block order. -/
def corrections : Fin 135 → RationalLogExpression := TerminalRateCorrectionData0.corrections

/-- Every actual source block is identified with its unchanged certificate window and exact correction. -/
theorem boundaries : ∀ block, rationalLogValue (blockExpression block 0) =
    rationalLogValue (TerminalRateCertificateTable0.window block) + rationalLogValue (corrections block) := by
  intro block
  fin_cases block
  · exact TerminalRateAxis0Block000.boundary
  · exact TerminalRateAxis0Block001.boundary
  · exact TerminalRateAxis0Block002.boundary
  · exact TerminalRateAxis0Block003.boundary
  · exact TerminalRateAxis0Block004.boundary
  · exact TerminalRateAxis0Block005.boundary
  · exact TerminalRateAxis0Block006.boundary
  · exact TerminalRateAxis0Block007.boundary
  · exact TerminalRateAxis0Block008.boundary
  · exact TerminalRateAxis0Block009.boundary
  · exact TerminalRateAxis0Block010.boundary
  · exact TerminalRateAxis0Block011.boundary
  · exact TerminalRateAxis0Block012.boundary
  · exact TerminalRateAxis0Block013.boundary
  · exact TerminalRateAxis0Block014.boundary
  · exact TerminalRateAxis0Block015.boundary
  · exact TerminalRateAxis0Block016.boundary
  · exact TerminalRateAxis0Block017.boundary
  · exact TerminalRateAxis0Block018.boundary
  · exact TerminalRateAxis0Block019.boundary
  · exact TerminalRateAxis0Block020.boundary
  · exact TerminalRateAxis0Block021.boundary
  · exact TerminalRateAxis0Block022.boundary
  · exact TerminalRateAxis0Block023.boundary
  · exact TerminalRateAxis0Block024.boundary
  · exact TerminalRateAxis0Block025.boundary
  · exact TerminalRateAxis0Block026.boundary
  · exact TerminalRateAxis0Block027.boundary
  · exact TerminalRateAxis0Block028.boundary
  · exact TerminalRateAxis0Block029.boundary
  · exact TerminalRateAxis0Block030.boundary
  · exact TerminalRateAxis0Block031.boundary
  · exact TerminalRateAxis0Block032.boundary
  · exact TerminalRateAxis0Block033.boundary
  · exact TerminalRateAxis0Block034.boundary
  · exact TerminalRateAxis0Block035.boundary
  · exact TerminalRateAxis0Block036.boundary
  · exact TerminalRateAxis0Block037.boundary
  · exact TerminalRateAxis0Block038.boundary
  · exact TerminalRateAxis0Block039.boundary
  · exact TerminalRateAxis0Block040.boundary
  · exact TerminalRateAxis0Block041.boundary
  · exact TerminalRateAxis0Block042.boundary
  · exact TerminalRateAxis0Block043.boundary
  · exact TerminalRateAxis0Block044.boundary
  · exact TerminalRateAxis0Block045.boundary
  · exact TerminalRateAxis0Block046.boundary
  · exact TerminalRateAxis0Block047.boundary
  · exact TerminalRateAxis0Block048.boundary
  · exact TerminalRateAxis0Block049.boundary
  · exact TerminalRateAxis0Block050.boundary
  · exact TerminalRateAxis0Block051.boundary
  · exact TerminalRateAxis0Block052.boundary
  · exact TerminalRateAxis0Block053.boundary
  · exact TerminalRateAxis0Block054.boundary
  · exact TerminalRateAxis0Block055.boundary
  · exact TerminalRateAxis0Block056.boundary
  · exact TerminalRateAxis0Block057.boundary
  · exact TerminalRateAxis0Block058.boundary
  · exact TerminalRateAxis0Block059.boundary
  · exact TerminalRateAxis0Block060.boundary
  · exact TerminalRateAxis0Block061.boundary
  · exact TerminalRateAxis0Block062.boundary
  · exact TerminalRateAxis0Block063.boundary
  · exact TerminalRateAxis0Block064.boundary
  · exact TerminalRateAxis0Block065.boundary
  · exact TerminalRateAxis0Block066.boundary
  · exact TerminalRateAxis0Block067.boundary
  · exact TerminalRateAxis0Block068.boundary
  · exact TerminalRateAxis0Block069.boundary
  · exact TerminalRateAxis0Block070.boundary
  · exact TerminalRateAxis0Block071.boundary
  · exact TerminalRateAxis0Block072.boundary
  · exact TerminalRateAxis0Block073.boundary
  · exact TerminalRateAxis0Block074.boundary
  · exact TerminalRateAxis0Block075.boundary
  · exact TerminalRateAxis0Block076.boundary
  · exact TerminalRateAxis0Block077.boundary
  · exact TerminalRateAxis0Block078.boundary
  · exact TerminalRateAxis0Block079.boundary
  · exact TerminalRateAxis0Block080.boundary
  · exact TerminalRateAxis0Block081.boundary
  · exact TerminalRateAxis0Block082.boundary
  · exact TerminalRateAxis0Block083.boundary
  · exact TerminalRateAxis0Block084.boundary
  · exact TerminalRateAxis0Block085.boundary
  · exact TerminalRateAxis0Block086.boundary
  · exact TerminalRateAxis0Block087.boundary
  · exact TerminalRateAxis0Block088.boundary
  · exact TerminalRateAxis0Block089.boundary
  · exact TerminalRateAxis0Block090.boundary
  · exact TerminalRateAxis0Block091.boundary
  · exact TerminalRateAxis0Block092.boundary
  · exact TerminalRateAxis0Block093.boundary
  · exact TerminalRateAxis0Block094.boundary
  · exact TerminalRateAxis0Block095.boundary
  · exact TerminalRateAxis0Block096.boundary
  · exact TerminalRateAxis0Block097.boundary
  · exact TerminalRateAxis0Block098.boundary
  · exact TerminalRateAxis0Block099.boundary
  · exact TerminalRateAxis0Block100.boundary
  · exact TerminalRateAxis0Block101.boundary
  · exact TerminalRateAxis0Block102.boundary
  · exact TerminalRateAxis0Block103.boundary
  · exact TerminalRateAxis0Block104.boundary
  · exact TerminalRateAxis0Block105.boundary
  · exact TerminalRateAxis0Block106.boundary
  · exact TerminalRateAxis0Block107.boundary
  · exact TerminalRateAxis0Block108.boundary
  · exact TerminalRateAxis0Block109.boundary
  · exact TerminalRateAxis0Block110.boundary
  · exact TerminalRateAxis0Block111.boundary
  · exact TerminalRateAxis0Block112.boundary
  · exact TerminalRateAxis0Block113.boundary
  · exact TerminalRateAxis0Block114.boundary
  · exact TerminalRateAxis0Block115.boundary
  · exact TerminalRateAxis0Block116.boundary
  · exact TerminalRateAxis0Block117.boundary
  · exact TerminalRateAxis0Block118.boundary
  · exact TerminalRateAxis0Block119.boundary
  · exact TerminalRateAxis0Block120.boundary
  · exact TerminalRateAxis0Block121.boundary
  · exact TerminalRateAxis0Block122.boundary
  · exact TerminalRateAxis0Block123.boundary
  · exact TerminalRateAxis0Block124.boundary
  · exact TerminalRateAxis0Block125.boundary
  · exact TerminalRateAxis0Block126.boundary
  · exact TerminalRateAxis0Block127.boundary
  · exact TerminalRateAxis0Block128.boundary
  · exact TerminalRateAxis0Block129.boundary
  · exact TerminalRateAxis0Block130.boundary
  · exact TerminalRateAxis0Block131.boundary
  · exact TerminalRateAxis0Block132.boundary
  · exact TerminalRateAxis0Block133.boundary
  · exact TerminalRateAxis0Block134.boundary

/-- The finite collection of every shared-logarithm correction cancels exactly. -/
theorem corrections_checked : mergeNormalizeLogExpression (finiteLogSum corrections) = [] := TerminalRateCorrectionData0.checked

/-- The actual original terminal stage rate is exactly the complete supplied numerical certificate. -/
theorem rate_eq :
    SuppliedPathStages.terminal.rates 0 / (SuppliedPopulationWeights.rootWeight : ℝ) =
      certificateValue 0 := by
  apply rate_of_window_corrections 0 TerminalRateCertificateTable0.window corrections boundaries
  · exact TerminalRateCertificateTable0.windows_value
  · exact sum_corrections_zero corrections corrections_checked

end MatrixBounds.Numeric.SuppliedTerminalRates.TerminalRateAxis0Binding
