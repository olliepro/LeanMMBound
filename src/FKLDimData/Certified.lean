module

public import FKLDimData.Blocks00
public import FKLDimData.Blocks01
public import FKLDimData.Blocks02
public import FKLDimData.Blocks03
public import FKLDimData.Blocks04
public import FKLDimData.Blocks05
public import FKLDimData.Blocks06
public import FKLDimData.Blocks07
public import FKLDimData.Blocks08
public import FKLDimData.Blocks09
public import FKLDimData.Blocks10
public import FKLDimData.Blocks11
public import FKLDimData.Blocks12
public import FKLDimData.Blocks13
public import FKLDimData.Blocks14
public import FKLDimData.Blocks15
public import FKLDimData.Blocks16
public import FKLDimData.Blocks17
public import FKLDimData.Blocks18
public import FKLDimData.Blocks19
public import SuppliedDimensionVolumeExpression

@[expose] public section

namespace MatrixBounds.Numeric.FKLDimData

open FKL FKLDim SuppliedDimensionRates
open scoped BigOperators
set_option maxRecDepth 100000

def corrs : List (List Raw) := [corr000, corr001, corr002, corr003, corr004, corr005, corr006, corr007, corr008, corr009, corr010, corr011, corr012, corr013, corr014, corr015, corr016, corr017, corr018, corr019, corr020, corr021, corr022, corr023, corr024, corr025, corr026, corr027, corr028, corr029, corr030, corr031, corr032, corr033, corr034, corr035, corr036, corr037, corr038, corr039, corr040, corr041, corr042, corr043, corr044, corr045, corr046, corr047, corr048, corr049, corr050, corr051, corr052, corr053, corr054, corr055, corr056, corr057, corr058, corr059, corr060, corr061, corr062, corr063, corr064, corr065, corr066, corr067, corr068, corr069, corr070, corr071, corr072, corr073, corr074, corr075, corr076, corr077, corr078, corr079, corr080, corr081, corr082, corr083, corr084, corr085, corr086, corr087, corr088, corr089, corr090, corr091, corr092, corr093, corr094, corr095, corr096, corr097, corr098, corr099, corr100, corr101, corr102, corr103, corr104, corr105, corr106, corr107, corr108, corr109, corr110, corr111, corr112, corr113, corr114, corr115, corr116, corr117, corr118, corr119, corr120, corr121, corr122, corr123, corr124, corr125, corr126, corr127, corr128, corr129, corr130, corr131, corr132, corr133, corr134, corr135, corr136, corr137, corr138, corr139, corr140, corr141, corr142, corr143, corr144, corr145, corr146, corr147, corr148, corr149, corr150, corr151, corr152, corr153, corr154, corr155, corr156, corr157, corr158, corr159, corr160, corr161, corr162, corr163, corr164, corr165, corr166, corr167, corr168, corr169, corr170, corr171, corr172, corr173, corr174, corr175, corr176, corr177, corr178, corr179, corr180, corr181, corr182, corr183, corr184, corr185, corr186, corr187, corr188, corr189, corr190, corr191, corr192, corr193, corr194, corr195, corr196, corr197, corr198, corr199, corr200, corr201, corr202, corr203, corr204, corr205, corr206, corr207, corr208, corr209, corr210, corr211, corr212, corr213, corr214, corr215, corr216, corr217, corr218, corr219, corr220, corr221, corr222, corr223, corr224, corr225, corr226, corr227, corr228, corr229, corr230, corr231, corr232, corr233, corr234, corr235, corr236, corr237, corr238, corr239, corr240, corr241, corr242, corr243, corr244, corr245, corr246, corr247, corr248, corr249, corr250, corr251, corr252, corr253, corr254, corr255, corr256, corr257, corr258, corr259, corr260, corr261, corr262, corr263, corr264, corr265, corr266]
def corrKeys : Nat := 0x80000000000002000000000000080000000000002000000000000080000000000002800000000000100000000000004000000000000000000000008
theorem corr_check : check2 225 corrKeys 53 9 4 corrs.flatten [] = true := by decide +kernel
theorem corr_sum : (corrs.map (rawValue 44 220)).sum = 0 := corrections_cancel corrs 225 corrKeys 53 9 4 corr_check

/-- Every source block agrees with its three certificate windows up to its raw correction. -/
theorem all_boundaries : ∀ block, rationalLogValue (orderedBlockExpression block) =
    rationalLogValue (SuppliedDimensionRates.certificateWindow block) + rawValue 44 220 (corrs.getD block.val []) := by
  intro block
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
  · exact boundary135
  · exact boundary136
  · exact boundary137
  · exact boundary138
  · exact boundary139
  · exact boundary140
  · exact boundary141
  · exact boundary142
  · exact boundary143
  · exact boundary144
  · exact boundary145
  · exact boundary146
  · exact boundary147
  · exact boundary148
  · exact boundary149
  · exact boundary150
  · exact boundary151
  · exact boundary152
  · exact boundary153
  · exact boundary154
  · exact boundary155
  · exact boundary156
  · exact boundary157
  · exact boundary158
  · exact boundary159
  · exact boundary160
  · exact boundary161
  · exact boundary162
  · exact boundary163
  · exact boundary164
  · exact boundary165
  · exact boundary166
  · exact boundary167
  · exact boundary168
  · exact boundary169
  · exact boundary170
  · exact boundary171
  · exact boundary172
  · exact boundary173
  · exact boundary174
  · exact boundary175
  · exact boundary176
  · exact boundary177
  · exact boundary178
  · exact boundary179
  · exact boundary180
  · exact boundary181
  · exact boundary182
  · exact boundary183
  · exact boundary184
  · exact boundary185
  · exact boundary186
  · exact boundary187
  · exact boundary188
  · exact boundary189
  · exact boundary190
  · exact boundary191
  · exact boundary192
  · exact boundary193
  · exact boundary194
  · exact boundary195
  · exact boundary196
  · exact boundary197
  · exact boundary198
  · exact boundary199
  · exact boundary200
  · exact boundary201
  · exact boundary202
  · exact boundary203
  · exact boundary204
  · exact boundary205
  · exact boundary206
  · exact boundary207
  · exact boundary208
  · exact boundary209
  · exact boundary210
  · exact boundary211
  · exact boundary212
  · exact boundary213
  · exact boundary214
  · exact boundary215
  · exact boundary216
  · exact boundary217
  · exact boundary218
  · exact boundary219
  · exact boundary220
  · exact boundary221
  · exact boundary222
  · exact boundary223
  · exact boundary224
  · exact boundary225
  · exact boundary226
  · exact boundary227
  · exact boundary228
  · exact boundary229
  · exact boundary230
  · exact boundary231
  · exact boundary232
  · exact boundary233
  · exact boundary234
  · exact boundary235
  · exact boundary236
  · exact boundary237
  · exact boundary238
  · exact boundary239
  · exact boundary240
  · exact boundary241
  · exact boundary242
  · exact boundary243
  · exact boundary244
  · exact boundary245
  · exact boundary246
  · exact boundary247
  · exact boundary248
  · exact boundary249
  · exact boundary250
  · exact boundary251
  · exact boundary252
  · exact boundary253
  · exact boundary254
  · exact boundary255
  · exact boundary256
  · exact boundary257
  · exact boundary258
  · exact boundary259
  · exact boundary260
  · exact boundary261
  · exact boundary262
  · exact boundary263
  · exact boundary264
  · exact boundary265
  · exact boundary266

end MatrixBounds.Numeric.FKLDimData

namespace MatrixBounds.Numeric.SuppliedDimensionRates

open scoped BigOperators
set_option maxRecDepth 100000

/-- The complete original source dimension expression equals the supplied dimension certificate exactly. -/
theorem expression_value_eq : rationalLogValue expression = CertifiedPipelineScalar.volume :=
  FKLDim.expression_of_raw_corrections (fun block => FKLDimData.corrs.getD block.val []) FKLDimData.all_boundaries (by
    rw [FKLDim.sum_getD FKLDimData.corrs 267 (by decide) (FKL.rawValue 44 220), FKLDimData.corr_sum])

/-- The four actual source matrix families have exactly the certified normalized volume rate. -/
theorem volume_eq :
    (SuppliedWaitingZero4.volumeRate + SuppliedWaitingZero3.volumeRate +
      SuppliedWaitingZero2.volumeRate + SuppliedTerminalMatrix.volumeRate) /
        (SuppliedPopulationWeights.rootWeight : ℝ) = CertifiedPipelineScalar.volume :=
  normalized_volume.trans expression_value_eq

end MatrixBounds.Numeric.SuppliedDimensionRates
