import TerminalRateAxis1Block000
import TerminalRateAxis1Block001
import TerminalRateAxis1Block002
import TerminalRateAxis1Block003
import TerminalRateAxis1Block004
import TerminalRateAxis1Block005
import TerminalRateAxis1Block006
import TerminalRateAxis1Block007
import TerminalRateAxis1Block008
import TerminalRateAxis1Block009
import TerminalRateAxis1Block010
import TerminalRateAxis1Block011
import TerminalRateAxis1Block012
import TerminalRateAxis1Block013
import TerminalRateAxis1Block014
import TerminalRateAxis1Block015
import TerminalRateAxis1Block016
import TerminalRateAxis1Block017
import TerminalRateAxis1Block018
import TerminalRateAxis1Block019
import TerminalRateAxis1Block020
import TerminalRateAxis1Block021
import TerminalRateAxis1Block022
import TerminalRateAxis1Block023
import TerminalRateAxis1Block024
import TerminalRateAxis1Block025
import TerminalRateAxis1Block026
import TerminalRateAxis1Block027
import TerminalRateAxis1Block028
import TerminalRateAxis1Block029
import TerminalRateAxis1Block030
import TerminalRateAxis1Block031
import TerminalRateAxis1Block032
import TerminalRateAxis1Block033
import TerminalRateAxis1Block034
import TerminalRateAxis1Block035
import TerminalRateAxis1Block036
import TerminalRateAxis1Block037
import TerminalRateAxis1Block038
import TerminalRateAxis1Block039
import TerminalRateAxis1Block040
import TerminalRateAxis1Block041
import TerminalRateAxis1Block042
import TerminalRateAxis1Block043
import TerminalRateAxis1Block044
import TerminalRateAxis1Block045
import TerminalRateAxis1Block046
import TerminalRateAxis1Block047
import TerminalRateAxis1Block048
import TerminalRateAxis1Block049
import TerminalRateAxis1Block050
import TerminalRateAxis1Block051
import TerminalRateAxis1Block052
import TerminalRateAxis1Block053
import TerminalRateAxis1Block054
import TerminalRateAxis1Block055
import TerminalRateAxis1Block056
import TerminalRateAxis1Block057
import TerminalRateAxis1Block058
import TerminalRateAxis1Block059
import TerminalRateAxis1Block060
import TerminalRateAxis1Block061
import TerminalRateAxis1Block062
import TerminalRateAxis1Block063
import TerminalRateAxis1Block064
import TerminalRateAxis1Block065
import TerminalRateAxis1Block066
import TerminalRateAxis1Block067
import TerminalRateAxis1Block068
import TerminalRateAxis1Block069
import TerminalRateAxis1Block070
import TerminalRateAxis1Block071
import TerminalRateAxis1Block072
import TerminalRateAxis1Block073
import TerminalRateAxis1Block074
import TerminalRateAxis1Block075
import TerminalRateAxis1Block076
import TerminalRateAxis1Block077
import TerminalRateAxis1Block078
import TerminalRateAxis1Block079
import TerminalRateAxis1Block080
import TerminalRateAxis1Block081
import TerminalRateAxis1Block082
import TerminalRateAxis1Block083
import TerminalRateAxis1Block084
import TerminalRateAxis1Block085
import TerminalRateAxis1Block086
import TerminalRateAxis1Block087
import TerminalRateAxis1Block088
import TerminalRateAxis1Block089
import TerminalRateAxis1Block090
import TerminalRateAxis1Block091
import TerminalRateAxis1Block092
import TerminalRateAxis1Block093
import TerminalRateAxis1Block094
import TerminalRateAxis1Block095
import TerminalRateAxis1Block096
import TerminalRateAxis1Block097
import TerminalRateAxis1Block098
import TerminalRateAxis1Block099
import TerminalRateAxis1Block100
import TerminalRateAxis1Block101
import TerminalRateAxis1Block102
import TerminalRateAxis1Block103
import TerminalRateAxis1Block104
import TerminalRateAxis1Block105
import TerminalRateAxis1Block106
import TerminalRateAxis1Block107
import TerminalRateAxis1Block108
import TerminalRateAxis1Block109
import TerminalRateAxis1Block110
import TerminalRateAxis1Block111
import TerminalRateAxis1Block112
import TerminalRateAxis1Block113
import TerminalRateAxis1Block114
import TerminalRateAxis1Block115
import TerminalRateAxis1Block116
import TerminalRateAxis1Block117
import TerminalRateAxis1Block118
import TerminalRateAxis1Block119
import TerminalRateAxis1Block120
import TerminalRateAxis1Block121
import TerminalRateAxis1Block122
import TerminalRateAxis1Block123
import TerminalRateAxis1Block124
import TerminalRateAxis1Block125
import TerminalRateAxis1Block126
import TerminalRateAxis1Block127
import TerminalRateAxis1Block128
import TerminalRateAxis1Block129
import TerminalRateAxis1Block130
import TerminalRateAxis1Block131
import TerminalRateAxis1Block132
import TerminalRateAxis1Block133
import TerminalRateAxis1Block134
import TerminalRateCorrectionData1

namespace MatrixBounds.Numeric.SuppliedTerminalRates.TerminalRateAxis1Binding
open scoped BigOperators
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- All complete shared-logarithm corrections in original source-block order. -/
def corrections : Fin 135 → RationalLogExpression := TerminalRateCorrectionData1.corrections

/-- Every actual source block is identified with its unchanged certificate window and exact correction. -/
theorem boundaries : ∀ block, rationalLogValue (blockExpression block 1) =
    rationalLogValue (TerminalRateCertificateTable1.window block) + rationalLogValue (corrections block) := by
  intro block
  fin_cases block
  · exact TerminalRateAxis1Block000.boundary
  · exact TerminalRateAxis1Block001.boundary
  · exact TerminalRateAxis1Block002.boundary
  · exact TerminalRateAxis1Block003.boundary
  · exact TerminalRateAxis1Block004.boundary
  · exact TerminalRateAxis1Block005.boundary
  · exact TerminalRateAxis1Block006.boundary
  · exact TerminalRateAxis1Block007.boundary
  · exact TerminalRateAxis1Block008.boundary
  · exact TerminalRateAxis1Block009.boundary
  · exact TerminalRateAxis1Block010.boundary
  · exact TerminalRateAxis1Block011.boundary
  · exact TerminalRateAxis1Block012.boundary
  · exact TerminalRateAxis1Block013.boundary
  · exact TerminalRateAxis1Block014.boundary
  · exact TerminalRateAxis1Block015.boundary
  · exact TerminalRateAxis1Block016.boundary
  · exact TerminalRateAxis1Block017.boundary
  · exact TerminalRateAxis1Block018.boundary
  · exact TerminalRateAxis1Block019.boundary
  · exact TerminalRateAxis1Block020.boundary
  · exact TerminalRateAxis1Block021.boundary
  · exact TerminalRateAxis1Block022.boundary
  · exact TerminalRateAxis1Block023.boundary
  · exact TerminalRateAxis1Block024.boundary
  · exact TerminalRateAxis1Block025.boundary
  · exact TerminalRateAxis1Block026.boundary
  · exact TerminalRateAxis1Block027.boundary
  · exact TerminalRateAxis1Block028.boundary
  · exact TerminalRateAxis1Block029.boundary
  · exact TerminalRateAxis1Block030.boundary
  · exact TerminalRateAxis1Block031.boundary
  · exact TerminalRateAxis1Block032.boundary
  · exact TerminalRateAxis1Block033.boundary
  · exact TerminalRateAxis1Block034.boundary
  · exact TerminalRateAxis1Block035.boundary
  · exact TerminalRateAxis1Block036.boundary
  · exact TerminalRateAxis1Block037.boundary
  · exact TerminalRateAxis1Block038.boundary
  · exact TerminalRateAxis1Block039.boundary
  · exact TerminalRateAxis1Block040.boundary
  · exact TerminalRateAxis1Block041.boundary
  · exact TerminalRateAxis1Block042.boundary
  · exact TerminalRateAxis1Block043.boundary
  · exact TerminalRateAxis1Block044.boundary
  · exact TerminalRateAxis1Block045.boundary
  · exact TerminalRateAxis1Block046.boundary
  · exact TerminalRateAxis1Block047.boundary
  · exact TerminalRateAxis1Block048.boundary
  · exact TerminalRateAxis1Block049.boundary
  · exact TerminalRateAxis1Block050.boundary
  · exact TerminalRateAxis1Block051.boundary
  · exact TerminalRateAxis1Block052.boundary
  · exact TerminalRateAxis1Block053.boundary
  · exact TerminalRateAxis1Block054.boundary
  · exact TerminalRateAxis1Block055.boundary
  · exact TerminalRateAxis1Block056.boundary
  · exact TerminalRateAxis1Block057.boundary
  · exact TerminalRateAxis1Block058.boundary
  · exact TerminalRateAxis1Block059.boundary
  · exact TerminalRateAxis1Block060.boundary
  · exact TerminalRateAxis1Block061.boundary
  · exact TerminalRateAxis1Block062.boundary
  · exact TerminalRateAxis1Block063.boundary
  · exact TerminalRateAxis1Block064.boundary
  · exact TerminalRateAxis1Block065.boundary
  · exact TerminalRateAxis1Block066.boundary
  · exact TerminalRateAxis1Block067.boundary
  · exact TerminalRateAxis1Block068.boundary
  · exact TerminalRateAxis1Block069.boundary
  · exact TerminalRateAxis1Block070.boundary
  · exact TerminalRateAxis1Block071.boundary
  · exact TerminalRateAxis1Block072.boundary
  · exact TerminalRateAxis1Block073.boundary
  · exact TerminalRateAxis1Block074.boundary
  · exact TerminalRateAxis1Block075.boundary
  · exact TerminalRateAxis1Block076.boundary
  · exact TerminalRateAxis1Block077.boundary
  · exact TerminalRateAxis1Block078.boundary
  · exact TerminalRateAxis1Block079.boundary
  · exact TerminalRateAxis1Block080.boundary
  · exact TerminalRateAxis1Block081.boundary
  · exact TerminalRateAxis1Block082.boundary
  · exact TerminalRateAxis1Block083.boundary
  · exact TerminalRateAxis1Block084.boundary
  · exact TerminalRateAxis1Block085.boundary
  · exact TerminalRateAxis1Block086.boundary
  · exact TerminalRateAxis1Block087.boundary
  · exact TerminalRateAxis1Block088.boundary
  · exact TerminalRateAxis1Block089.boundary
  · exact TerminalRateAxis1Block090.boundary
  · exact TerminalRateAxis1Block091.boundary
  · exact TerminalRateAxis1Block092.boundary
  · exact TerminalRateAxis1Block093.boundary
  · exact TerminalRateAxis1Block094.boundary
  · exact TerminalRateAxis1Block095.boundary
  · exact TerminalRateAxis1Block096.boundary
  · exact TerminalRateAxis1Block097.boundary
  · exact TerminalRateAxis1Block098.boundary
  · exact TerminalRateAxis1Block099.boundary
  · exact TerminalRateAxis1Block100.boundary
  · exact TerminalRateAxis1Block101.boundary
  · exact TerminalRateAxis1Block102.boundary
  · exact TerminalRateAxis1Block103.boundary
  · exact TerminalRateAxis1Block104.boundary
  · exact TerminalRateAxis1Block105.boundary
  · exact TerminalRateAxis1Block106.boundary
  · exact TerminalRateAxis1Block107.boundary
  · exact TerminalRateAxis1Block108.boundary
  · exact TerminalRateAxis1Block109.boundary
  · exact TerminalRateAxis1Block110.boundary
  · exact TerminalRateAxis1Block111.boundary
  · exact TerminalRateAxis1Block112.boundary
  · exact TerminalRateAxis1Block113.boundary
  · exact TerminalRateAxis1Block114.boundary
  · exact TerminalRateAxis1Block115.boundary
  · exact TerminalRateAxis1Block116.boundary
  · exact TerminalRateAxis1Block117.boundary
  · exact TerminalRateAxis1Block118.boundary
  · exact TerminalRateAxis1Block119.boundary
  · exact TerminalRateAxis1Block120.boundary
  · exact TerminalRateAxis1Block121.boundary
  · exact TerminalRateAxis1Block122.boundary
  · exact TerminalRateAxis1Block123.boundary
  · exact TerminalRateAxis1Block124.boundary
  · exact TerminalRateAxis1Block125.boundary
  · exact TerminalRateAxis1Block126.boundary
  · exact TerminalRateAxis1Block127.boundary
  · exact TerminalRateAxis1Block128.boundary
  · exact TerminalRateAxis1Block129.boundary
  · exact TerminalRateAxis1Block130.boundary
  · exact TerminalRateAxis1Block131.boundary
  · exact TerminalRateAxis1Block132.boundary
  · exact TerminalRateAxis1Block133.boundary
  · exact TerminalRateAxis1Block134.boundary

/-- The finite collection of every shared-logarithm correction cancels exactly. -/
theorem corrections_checked : mergeNormalizeLogExpression (finiteLogSum corrections) = [] := TerminalRateCorrectionData1.checked

/-- The actual original terminal stage rate is exactly the complete supplied numerical certificate. -/
theorem rate_eq :
    SuppliedPathStages.terminal.rates 1 / (SuppliedPopulationWeights.rootWeight : ℝ) =
      certificateValue 1 := by
  apply rate_of_window_corrections 1 TerminalRateCertificateTable1.window corrections boundaries
  · exact TerminalRateCertificateTable1.windows_value
  · exact sum_corrections_zero corrections corrections_checked

end MatrixBounds.Numeric.SuppliedTerminalRates.TerminalRateAxis1Binding
