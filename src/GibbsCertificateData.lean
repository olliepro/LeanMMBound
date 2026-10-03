module

public import GibbsCertificateData.Part000
public import GibbsCertificateData.Part001
public import GibbsCertificateData.Part002
public import GibbsCertificateData.Part003
public import GibbsCertificateData.Part004
public import GibbsCertificateData.Part005
public import GibbsCertificateData.Part006
public import GibbsCertificateData.Part007
public import GibbsCertificateData.Part008
public import GibbsCertificateData.Part009
public import GibbsCertificateData.Part010
public import GibbsCertificateData.Part011
public import GibbsCertificateData.Part012
public import GibbsCertificateData.Part013
public import GibbsCertificateData.Part014
public import GibbsCertificateData.Part015
public import GibbsCertificateData.Part016
public import GibbsCertificateData.Part017
public import GibbsCertificateData.Part018
public import GibbsCertificateData.Part019
public import GibbsCertificateData.Part020
public import GibbsCertificateData.Part021
public import GibbsCertificateData.Part022
public import GibbsCertificateData.Part023
public import GibbsCertificateData.Part024
public import GibbsCertificateData.Part025
public import GibbsCertificateData.Part026
public import GibbsCertificateData.Part027
public import GibbsCertificateData.Part028
public import GibbsCertificateData.Part029
public import GibbsCertificateData.Part030
public import GibbsCertificateData.Part031
public import GibbsCertificateData.Part032
public import GibbsCertificateData.Part033
public import GibbsCertificateData.Part034
public import GibbsCertificateData.Part035
public import GibbsCertificateData.Part036
public import GibbsCertificateData.Part037
public import GibbsCertificateData.Part038
public import GibbsCertificateData.Part039
public import GibbsCertificateData.Part040
public import GibbsCertificateData.Part041
public import GibbsCertificateData.Part042
public import GibbsCertificateData.Part043
public import GibbsCertificateData.Part044
public import GibbsCertificateData.Part045
public import GibbsCertificateData.Part046
public import GibbsCertificateData.Part047
public import GibbsCertificateData.Part048
public import GibbsCertificateData.Part049
public import GibbsCertificateData.Part050
public import GibbsCertificateData.Part051
public import GibbsCertificateData.Part052
public import GibbsCertificateData.Part053
public import GibbsCertificateData.Part054
public import GibbsCertificateData.Part055
public import GibbsCertificateData.Part056
public import GibbsCertificateData.Part057
public import GibbsCertificateData.Part058
public import GibbsCertificateData.Part059
public import GibbsCertificateData.Part060
public import GibbsCertificateData.Part061
public import GibbsCertificateData.Part062
public import GibbsCertificateData.Part063
public import GibbsCertificateData.Part064
public import GibbsCertificateData.Part065
public import GibbsCertificateData.Part066
public import GibbsCertificateData.Part067
public import GibbsCertificateData.Part068
public import GibbsCertificateData.Part069
public import GibbsCertificateData.Part070
public import GibbsCertificateData.Part071
public import GibbsCertificateData.Part072
public import GibbsCertificateData.Part073
public import GibbsCertificateData.Part074
public import GibbsCertificateData.Part075
public import GibbsCertificateData.Part076
public import GibbsCertificateData.Part077
public import GibbsCertificateData.Part078
public import GibbsCertificateData.Part079
public import GibbsCertificateData.Part080
public import GibbsCertificateData.Part081
public import GibbsCertificateData.Part082
public import GibbsCertificateData.Part083
public import GibbsCertificateData.Part084
public import GibbsCertificateData.Part085
public import GibbsCertificateData.Part086
public import GibbsCertificateData.Part087
public import GibbsCertificateData.Part088
public import GibbsCertificateData.Part089
public import GibbsCertificateData.Part090
public import GibbsCertificateData.Part091
public import GibbsCertificateData.Part092
public import GibbsCertificateData.Part093
public import GibbsCertificateData.Part094
public import GibbsCertificateData.Part095
public import GibbsCertificateData.Part096
public import GibbsCertificateData.Part097
public import GibbsCertificateData.Part098
public import GibbsCertificateData.Part099
public import GibbsCertificateData.Part100
public import GibbsCertificateData.Part101
public import GibbsCertificateData.Part102
public import GibbsCertificateData.Part103
public import GibbsCertificateData.Part104
public import GibbsCertificateData.Part105
public import GibbsCertificateData.Part106
public import GibbsCertificateData.Part107
public import GibbsCertificateData.Part108
public import GibbsCertificateData.Part109
public import GibbsCertificateData.Part110
public import GibbsCertificateData.Part111
public import GibbsCertificateData.Part112
public import GibbsCertificateData.Part113
public import GibbsCertificateData.Part114
public import GibbsCertificateData.Part115
public import GibbsCertificateData.Part116
public import GibbsCertificateData.Part117
public import GibbsCertificateData.Part118
public import GibbsCertificateData.Part119
public import GibbsCertificateData.Part120
public import GibbsCertificateData.Part121
public import GibbsCertificateData.Part122
public import GibbsCertificateData.Part123
public import GibbsCertificateData.Part124
public import GibbsCertificateData.Part125
public import GibbsCertificateData.Part126
public import GibbsCertificateData.Part127
public import GibbsCertificateData.Part128
public import GibbsCertificateData.Part129

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

namespace MatrixBounds.Numeric.GibbsCertificateData
/-- The complete deduplicated Gibbs coordinate-potential table from the supplied file. -/
def rows : List GibbsRow := Part000.rows ++ Part001.rows ++ Part002.rows ++ Part003.rows ++ Part004.rows ++ Part005.rows ++ Part006.rows ++ Part007.rows ++ Part008.rows ++ Part009.rows ++ Part010.rows ++ Part011.rows ++ Part012.rows ++ Part013.rows ++ Part014.rows ++ Part015.rows ++ Part016.rows ++ Part017.rows ++ Part018.rows ++ Part019.rows ++ Part020.rows ++ Part021.rows ++ Part022.rows ++ Part023.rows ++ Part024.rows ++ Part025.rows ++ Part026.rows ++ Part027.rows ++ Part028.rows ++ Part029.rows ++ Part030.rows ++ Part031.rows ++ Part032.rows ++ Part033.rows ++ Part034.rows ++ Part035.rows ++ Part036.rows ++ Part037.rows ++ Part038.rows ++ Part039.rows ++ Part040.rows ++ Part041.rows ++ Part042.rows ++ Part043.rows ++ Part044.rows ++ Part045.rows ++ Part046.rows ++ Part047.rows ++ Part048.rows ++ Part049.rows ++ Part050.rows ++ Part051.rows ++ Part052.rows ++ Part053.rows ++ Part054.rows ++ Part055.rows ++ Part056.rows ++ Part057.rows ++ Part058.rows ++ Part059.rows ++ Part060.rows ++ Part061.rows ++ Part062.rows ++ Part063.rows ++ Part064.rows ++ Part065.rows ++ Part066.rows ++ Part067.rows ++ Part068.rows ++ Part069.rows ++ Part070.rows ++ Part071.rows ++ Part072.rows ++ Part073.rows ++ Part074.rows ++ Part075.rows ++ Part076.rows ++ Part077.rows ++ Part078.rows ++ Part079.rows ++ Part080.rows ++ Part081.rows ++ Part082.rows ++ Part083.rows ++ Part084.rows ++ Part085.rows ++ Part086.rows ++ Part087.rows ++ Part088.rows ++ Part089.rows ++ Part090.rows ++ Part091.rows ++ Part092.rows ++ Part093.rows ++ Part094.rows ++ Part095.rows ++ Part096.rows ++ Part097.rows ++ Part098.rows ++ Part099.rows ++ Part100.rows ++ Part101.rows ++ Part102.rows ++ Part103.rows ++ Part104.rows ++ Part105.rows ++ Part106.rows ++ Part107.rows ++ Part108.rows ++ Part109.rows ++ Part110.rows ++ Part111.rows ++ Part112.rows ++ Part113.rows ++ Part114.rows ++ Part115.rows ++ Part116.rows ++ Part117.rows ++ Part118.rows ++ Part119.rows ++ Part120.rows ++ Part121.rows ++ Part122.rows ++ Part123.rows ++ Part124.rows ++ Part125.rows ++ Part126.rows ++ Part127.rows ++ Part128.rows ++ Part129.rows

/-- Lean checks positivity for every exact supplied potential, without floating-point assumptions. -/
theorem rows_checked : rows.all GibbsRow.check = true := by
  unfold rows
  simp only [List.all_append, Part000.rows_checked, Part001.rows_checked, Part002.rows_checked, Part003.rows_checked, Part004.rows_checked, Part005.rows_checked, Part006.rows_checked, Part007.rows_checked, Part008.rows_checked, Part009.rows_checked, Part010.rows_checked, Part011.rows_checked, Part012.rows_checked, Part013.rows_checked, Part014.rows_checked, Part015.rows_checked, Part016.rows_checked, Part017.rows_checked, Part018.rows_checked, Part019.rows_checked, Part020.rows_checked, Part021.rows_checked, Part022.rows_checked, Part023.rows_checked, Part024.rows_checked, Part025.rows_checked, Part026.rows_checked, Part027.rows_checked, Part028.rows_checked, Part029.rows_checked, Part030.rows_checked, Part031.rows_checked, Part032.rows_checked, Part033.rows_checked, Part034.rows_checked, Part035.rows_checked, Part036.rows_checked, Part037.rows_checked, Part038.rows_checked, Part039.rows_checked, Part040.rows_checked, Part041.rows_checked, Part042.rows_checked, Part043.rows_checked, Part044.rows_checked, Part045.rows_checked, Part046.rows_checked, Part047.rows_checked, Part048.rows_checked, Part049.rows_checked, Part050.rows_checked, Part051.rows_checked, Part052.rows_checked, Part053.rows_checked, Part054.rows_checked, Part055.rows_checked, Part056.rows_checked, Part057.rows_checked, Part058.rows_checked, Part059.rows_checked, Part060.rows_checked, Part061.rows_checked, Part062.rows_checked, Part063.rows_checked, Part064.rows_checked, Part065.rows_checked, Part066.rows_checked, Part067.rows_checked, Part068.rows_checked, Part069.rows_checked, Part070.rows_checked, Part071.rows_checked, Part072.rows_checked, Part073.rows_checked, Part074.rows_checked, Part075.rows_checked, Part076.rows_checked, Part077.rows_checked, Part078.rows_checked, Part079.rows_checked, Part080.rows_checked, Part081.rows_checked, Part082.rows_checked, Part083.rows_checked, Part084.rows_checked, Part085.rows_checked, Part086.rows_checked, Part087.rows_checked, Part088.rows_checked, Part089.rows_checked, Part090.rows_checked, Part091.rows_checked, Part092.rows_checked, Part093.rows_checked, Part094.rows_checked, Part095.rows_checked, Part096.rows_checked, Part097.rows_checked, Part098.rows_checked, Part099.rows_checked, Part100.rows_checked, Part101.rows_checked, Part102.rows_checked, Part103.rows_checked, Part104.rows_checked, Part105.rows_checked, Part106.rows_checked, Part107.rows_checked, Part108.rows_checked, Part109.rows_checked, Part110.rows_checked, Part111.rows_checked, Part112.rows_checked, Part113.rows_checked, Part114.rows_checked, Part115.rows_checked, Part116.rows_checked, Part117.rows_checked, Part118.rows_checked, Part119.rows_checked, Part120.rows_checked, Part121.rows_checked, Part122.rows_checked, Part123.rows_checked, Part124.rows_checked, Part125.rows_checked, Part126.rows_checked, Part127.rows_checked, Part128.rows_checked, Part129.rows_checked, Bool.and_true]

/-- Every supplied coordinate-potential row is admissible for the proved Gibbs bound. -/
theorem potentials_positive (row : GibbsRow) (present : row ∈ rows) (symbol : Fin row.entries.length) :
    0 < row.potential symbol :=
  GibbsRow.potential_positive ((List.all_eq_true.mp rows_checked) row present) symbol

end MatrixBounds.Numeric.GibbsCertificateData
