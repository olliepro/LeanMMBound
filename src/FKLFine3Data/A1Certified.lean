module

public import FKLFine3Data.A1Corr
public import SuppliedPairedFineBlocks
public import PairedFine3TableA1

@[expose] public section

namespace MatrixBounds.Numeric.FKLFine3Data.A1

open FKL FKLFine3 SuppliedPairedFine
open scoped BigOperators
set_option maxRecDepth 100000

/-- Fast block boundaries of fine axis 2. -/
theorem boundaries (block : Fin 135) :
    (∑ offset : Fin 7, rationalLogValue (sourceSum3 (finProdFinEquiv (block, offset)) 1)) =
      rationalLogValue (MatrixBounds.Numeric.SuppliedPairedFine.PairedFine3TableA1.window block) + rawValue 134 310 (corrs.getD block.val []) := by
  fin_cases block
  · exact boundary000
  · exact boundary001
  · exact boundary002
  · exact boundary003
  · exact boundary004
  · exact boundary005
  · exact boundary006
  · exact boundary007
  · exact boundary008
  · exact boundary009
  · exact boundary010
  · exact boundary011
  · exact boundary012
  · exact boundary013
  · exact boundary014
  · exact boundary015
  · exact boundary016
  · exact boundary017
  · exact boundary018
  · exact boundary019
  · exact boundary020
  · exact boundary021
  · exact boundary022
  · exact boundary023
  · exact boundary024
  · exact boundary025
  · exact boundary026
  · exact boundary027
  · exact boundary028
  · exact boundary029
  · exact boundary030
  · exact boundary031
  · exact boundary032
  · exact boundary033
  · exact boundary034
  · exact boundary035
  · exact boundary036
  · exact boundary037
  · exact boundary038
  · exact boundary039
  · exact boundary040
  · exact boundary041
  · exact boundary042
  · exact boundary043
  · exact boundary044
  · exact boundary045
  · exact boundary046
  · exact boundary047
  · exact boundary048
  · exact boundary049
  · exact boundary050
  · exact boundary051
  · exact boundary052
  · exact boundary053
  · exact boundary054
  · exact boundary055
  · exact boundary056
  · exact boundary057
  · exact boundary058
  · exact boundary059
  · exact boundary060
  · exact boundary061
  · exact boundary062
  · exact boundary063
  · exact boundary064
  · exact boundary065
  · exact boundary066
  · exact boundary067
  · exact boundary068
  · exact boundary069
  · exact boundary070
  · exact boundary071
  · exact boundary072
  · exact boundary073
  · exact boundary074
  · exact boundary075
  · exact boundary076
  · exact boundary077
  · exact boundary078
  · exact boundary079
  · exact boundary080
  · exact boundary081
  · exact boundary082
  · exact boundary083
  · exact boundary084
  · exact boundary085
  · exact boundary086
  · exact boundary087
  · exact boundary088
  · exact boundary089
  · exact boundary090
  · exact boundary091
  · exact boundary092
  · exact boundary093
  · exact boundary094
  · exact boundary095
  · exact boundary096
  · exact boundary097
  · exact boundary098
  · exact boundary099
  · exact boundary100
  · exact boundary101
  · exact boundary102
  · exact boundary103
  · exact boundary104
  · exact boundary105
  · exact boundary106
  · exact boundary107
  · exact boundary108
  · exact boundary109
  · exact boundary110
  · exact boundary111
  · exact boundary112
  · exact boundary113
  · exact boundary114
  · exact boundary115
  · exact boundary116
  · exact boundary117
  · exact boundary118
  · exact boundary119
  · exact boundary120
  · exact boundary121
  · exact boundary122
  · exact boundary123
  · exact boundary124
  · exact boundary125
  · exact boundary126
  · exact boundary127
  · exact boundary128
  · exact boundary129
  · exact boundary130
  · exact boundary131
  · exact boundary132
  · exact boundary133
  · exact boundary134

theorem expression_eq : rationalLogValue (expression3 1) = CertifiedLevel3Rate2.value := by
  rw [expression3_blocks]
  simp_rw [boundaries]
  rw [Finset.sum_add_distrib, MatrixBounds.Numeric.SuppliedPairedFine.PairedFine3TableA1.windows_value]
  have : (∑ block : Fin 135, rawValue 134 310 (corrs.getD block.val [])) = 0 := by
    rw [sum_getD corrs 135 (by decide) (rawValue 134 310), corr_sum]
  rw [this, add_zero]

end MatrixBounds.Numeric.FKLFine3Data.A1
