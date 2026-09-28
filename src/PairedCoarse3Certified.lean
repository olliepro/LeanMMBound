import SuppliedPairedCoarseBinding
import PairedCoarse3Boundary000
import PairedCoarse3Boundary001
import PairedCoarse3Boundary002
import PairedCoarse3Boundary003
import PairedCoarse3Boundary004
import PairedCoarse3Boundary005
import PairedCoarse3Boundary006
import PairedCoarse3Boundary007
import PairedCoarse3Boundary008
import PairedCoarse3Boundary009
import PairedCoarse3Boundary010
import PairedCoarse3Boundary011
import PairedCoarse3Boundary012
import PairedCoarse3Boundary013
import PairedCoarse3Boundary014
import PairedCoarse3Boundary015
import PairedCoarse3Boundary016
import PairedCoarse3Boundary017
import PairedCoarse3Boundary018
import PairedCoarse3Boundary019
import PairedCoarse3Boundary020
import PairedCoarse3Boundary021
import PairedCoarse3Boundary022
import PairedCoarse3Boundary023
import PairedCoarse3Boundary024
import PairedCoarse3Boundary025
import PairedCoarse3Boundary026
import PairedCoarse3Boundary027
import PairedCoarse3Boundary028
import PairedCoarse3Boundary029
import PairedCoarse3Boundary030
import PairedCoarse3Boundary031
import PairedCoarse3Boundary032
import PairedCoarse3Boundary033
import PairedCoarse3Boundary034
import PairedCoarse3Boundary035
import PairedCoarse3Boundary036
import PairedCoarse3Boundary037
import PairedCoarse3Boundary038
import PairedCoarse3Boundary039
import PairedCoarse3Boundary040
import PairedCoarse3Boundary041
import PairedCoarse3Boundary042
import PairedCoarse3Boundary043
import PairedCoarse3Boundary044
import PairedCoarse3Boundary045
import PairedCoarse3Boundary046
import PairedCoarse3Boundary047
import PairedCoarse3Boundary048
import PairedCoarse3Boundary049
import PairedCoarse3Boundary050
import PairedCoarse3Boundary051
import PairedCoarse3Boundary052
import PairedCoarse3Boundary053
import PairedCoarse3Boundary054
import PairedCoarse3Boundary055
import PairedCoarse3Boundary056
import PairedCoarse3Boundary057
import PairedCoarse3Boundary058
import PairedCoarse3Boundary059
import PairedCoarse3Boundary060
import PairedCoarse3Boundary061
import PairedCoarse3Boundary062
import PairedCoarse3Boundary063
import PairedCoarse3Boundary064
import PairedCoarse3Boundary065
import PairedCoarse3Boundary066
import PairedCoarse3Boundary067
import PairedCoarse3Boundary068
import PairedCoarse3Boundary069
import PairedCoarse3Boundary070
import PairedCoarse3Boundary071
import PairedCoarse3Boundary072
import PairedCoarse3Boundary073
import PairedCoarse3Boundary074
import PairedCoarse3Boundary075
import PairedCoarse3Boundary076
import PairedCoarse3Boundary077
import PairedCoarse3Boundary078
import PairedCoarse3Boundary079
import PairedCoarse3Boundary080
import PairedCoarse3Boundary081
import PairedCoarse3Boundary082
import PairedCoarse3Boundary083
import PairedCoarse3Boundary084
import PairedCoarse3Boundary085
import PairedCoarse3Boundary086
import PairedCoarse3Boundary087
import PairedCoarse3Boundary088
import PairedCoarse3Boundary089
import PairedCoarse3Boundary090
import PairedCoarse3Boundary091
import PairedCoarse3Boundary092
import PairedCoarse3Boundary093
import PairedCoarse3Boundary094
import PairedCoarse3Boundary095
import PairedCoarse3Boundary096
import PairedCoarse3Boundary097
import PairedCoarse3Boundary098
import PairedCoarse3Boundary099
import PairedCoarse3Boundary100
import PairedCoarse3Boundary101
import PairedCoarse3Boundary102
import PairedCoarse3Boundary103
import PairedCoarse3Boundary104
import PairedCoarse3Boundary105
import PairedCoarse3Boundary106
import PairedCoarse3Boundary107
import PairedCoarse3Boundary108
import PairedCoarse3Boundary109
import PairedCoarse3Boundary110
import PairedCoarse3Boundary111
import PairedCoarse3Boundary112
import PairedCoarse3Boundary113
import PairedCoarse3Boundary114
import PairedCoarse3Boundary115
import PairedCoarse3Boundary116
import PairedCoarse3Boundary117
import PairedCoarse3Boundary118
import PairedCoarse3Boundary119
import PairedCoarse3Boundary120
import PairedCoarse3Boundary121
import PairedCoarse3Boundary122
import PairedCoarse3Boundary123
import PairedCoarse3Boundary124
import PairedCoarse3Boundary125
import PairedCoarse3Boundary126
import PairedCoarse3Boundary127
import PairedCoarse3Boundary128
import PairedCoarse3Boundary129
import PairedCoarse3Boundary130
import PairedCoarse3Boundary131
import PairedCoarse3Boundary132
import PairedCoarse3Boundary133
import PairedCoarse3Boundary134

namespace MatrixBounds.Numeric.SuppliedPairedCoarse.PairedCoarse3Certified
open scoped BigOperators
set_option maxRecDepth 100000
set_option maxHeartbeats 16000000

/-- Every complete actual source block has its independently checked original certificate window and correction. -/
theorem boundaries (block : Fin 135) : rationalLogValue (block3 block) =
    rationalLogValue (PairedCoarse3CertificateTable.window block) + rationalLogValue (PairedCoarse3Corrections.corrections block) := by
  fin_cases block
  · exact PairedCoarse3Boundary000.value
  · exact PairedCoarse3Boundary001.value
  · exact PairedCoarse3Boundary002.value
  · exact PairedCoarse3Boundary003.value
  · exact PairedCoarse3Boundary004.value
  · exact PairedCoarse3Boundary005.value
  · exact PairedCoarse3Boundary006.value
  · exact PairedCoarse3Boundary007.value
  · exact PairedCoarse3Boundary008.value
  · exact PairedCoarse3Boundary009.value
  · exact PairedCoarse3Boundary010.value
  · exact PairedCoarse3Boundary011.value
  · exact PairedCoarse3Boundary012.value
  · exact PairedCoarse3Boundary013.value
  · exact PairedCoarse3Boundary014.value
  · exact PairedCoarse3Boundary015.value
  · exact PairedCoarse3Boundary016.value
  · exact PairedCoarse3Boundary017.value
  · exact PairedCoarse3Boundary018.value
  · exact PairedCoarse3Boundary019.value
  · exact PairedCoarse3Boundary020.value
  · exact PairedCoarse3Boundary021.value
  · exact PairedCoarse3Boundary022.value
  · exact PairedCoarse3Boundary023.value
  · exact PairedCoarse3Boundary024.value
  · exact PairedCoarse3Boundary025.value
  · exact PairedCoarse3Boundary026.value
  · exact PairedCoarse3Boundary027.value
  · exact PairedCoarse3Boundary028.value
  · exact PairedCoarse3Boundary029.value
  · exact PairedCoarse3Boundary030.value
  · exact PairedCoarse3Boundary031.value
  · exact PairedCoarse3Boundary032.value
  · exact PairedCoarse3Boundary033.value
  · exact PairedCoarse3Boundary034.value
  · exact PairedCoarse3Boundary035.value
  · exact PairedCoarse3Boundary036.value
  · exact PairedCoarse3Boundary037.value
  · exact PairedCoarse3Boundary038.value
  · exact PairedCoarse3Boundary039.value
  · exact PairedCoarse3Boundary040.value
  · exact PairedCoarse3Boundary041.value
  · exact PairedCoarse3Boundary042.value
  · exact PairedCoarse3Boundary043.value
  · exact PairedCoarse3Boundary044.value
  · exact PairedCoarse3Boundary045.value
  · exact PairedCoarse3Boundary046.value
  · exact PairedCoarse3Boundary047.value
  · exact PairedCoarse3Boundary048.value
  · exact PairedCoarse3Boundary049.value
  · exact PairedCoarse3Boundary050.value
  · exact PairedCoarse3Boundary051.value
  · exact PairedCoarse3Boundary052.value
  · exact PairedCoarse3Boundary053.value
  · exact PairedCoarse3Boundary054.value
  · exact PairedCoarse3Boundary055.value
  · exact PairedCoarse3Boundary056.value
  · exact PairedCoarse3Boundary057.value
  · exact PairedCoarse3Boundary058.value
  · exact PairedCoarse3Boundary059.value
  · exact PairedCoarse3Boundary060.value
  · exact PairedCoarse3Boundary061.value
  · exact PairedCoarse3Boundary062.value
  · exact PairedCoarse3Boundary063.value
  · exact PairedCoarse3Boundary064.value
  · exact PairedCoarse3Boundary065.value
  · exact PairedCoarse3Boundary066.value
  · exact PairedCoarse3Boundary067.value
  · exact PairedCoarse3Boundary068.value
  · exact PairedCoarse3Boundary069.value
  · exact PairedCoarse3Boundary070.value
  · exact PairedCoarse3Boundary071.value
  · exact PairedCoarse3Boundary072.value
  · exact PairedCoarse3Boundary073.value
  · exact PairedCoarse3Boundary074.value
  · exact PairedCoarse3Boundary075.value
  · exact PairedCoarse3Boundary076.value
  · exact PairedCoarse3Boundary077.value
  · exact PairedCoarse3Boundary078.value
  · exact PairedCoarse3Boundary079.value
  · exact PairedCoarse3Boundary080.value
  · exact PairedCoarse3Boundary081.value
  · exact PairedCoarse3Boundary082.value
  · exact PairedCoarse3Boundary083.value
  · exact PairedCoarse3Boundary084.value
  · exact PairedCoarse3Boundary085.value
  · exact PairedCoarse3Boundary086.value
  · exact PairedCoarse3Boundary087.value
  · exact PairedCoarse3Boundary088.value
  · exact PairedCoarse3Boundary089.value
  · exact PairedCoarse3Boundary090.value
  · exact PairedCoarse3Boundary091.value
  · exact PairedCoarse3Boundary092.value
  · exact PairedCoarse3Boundary093.value
  · exact PairedCoarse3Boundary094.value
  · exact PairedCoarse3Boundary095.value
  · exact PairedCoarse3Boundary096.value
  · exact PairedCoarse3Boundary097.value
  · exact PairedCoarse3Boundary098.value
  · exact PairedCoarse3Boundary099.value
  · exact PairedCoarse3Boundary100.value
  · exact PairedCoarse3Boundary101.value
  · exact PairedCoarse3Boundary102.value
  · exact PairedCoarse3Boundary103.value
  · exact PairedCoarse3Boundary104.value
  · exact PairedCoarse3Boundary105.value
  · exact PairedCoarse3Boundary106.value
  · exact PairedCoarse3Boundary107.value
  · exact PairedCoarse3Boundary108.value
  · exact PairedCoarse3Boundary109.value
  · exact PairedCoarse3Boundary110.value
  · exact PairedCoarse3Boundary111.value
  · exact PairedCoarse3Boundary112.value
  · exact PairedCoarse3Boundary113.value
  · exact PairedCoarse3Boundary114.value
  · exact PairedCoarse3Boundary115.value
  · exact PairedCoarse3Boundary116.value
  · exact PairedCoarse3Boundary117.value
  · exact PairedCoarse3Boundary118.value
  · exact PairedCoarse3Boundary119.value
  · exact PairedCoarse3Boundary120.value
  · exact PairedCoarse3Boundary121.value
  · exact PairedCoarse3Boundary122.value
  · exact PairedCoarse3Boundary123.value
  · exact PairedCoarse3Boundary124.value
  · exact PairedCoarse3Boundary125.value
  · exact PairedCoarse3Boundary126.value
  · exact PairedCoarse3Boundary127.value
  · exact PairedCoarse3Boundary128.value
  · exact PairedCoarse3Boundary129.value
  · exact PairedCoarse3Boundary130.value
  · exact PairedCoarse3Boundary131.value
  · exact PairedCoarse3Boundary132.value
  · exact PairedCoarse3Boundary133.value
  · exact PairedCoarse3Boundary134.value

/-- The actual complete original source expression is exactly the independently certified coarse expression. -/
theorem expression_eq : rationalLogValue expression3 = CertifiedLevel3Rate0.value := by
  rw [← blocks3_value]
  simp_rw [boundaries]
  rw [Finset.sum_add_distrib, PairedCoarse3CertificateTable.windows_value, PairedCoarse3Corrections.cancelled, add_zero]

/-- The actual full-history coarse extraction rate equals its supplied certificate at the original population unit. -/
theorem normalized_rate_eq : SuppliedPathStages.level3.rates 0 / (SuppliedPopulationWeights.rootWeight : ℝ) =
    CertifiedLevel3Rate0.value := by
  rw [normalized_stage3, expression_eq]

end MatrixBounds.Numeric.SuppliedPairedCoarse.PairedCoarse3Certified
