module

public import SplitCertificateData.Part000
public import SplitCertificateData.Part001
public import SplitCertificateData.Part002
public import SplitCertificateData.Part003
public import SplitCertificateData.Part004
public import SplitCertificateData.Part005
public import SplitCertificateData.Part006
public import SplitCertificateData.Part007
public import SplitCertificateData.Part008
public import SplitCertificateData.Part009
public import SplitCertificateData.Part010
public import SplitCertificateData.Part011
public import SplitCertificateData.Part012
public import SplitCertificateData.Part013
public import SplitCertificateData.Part014
public import SplitCertificateData.Part015
public import SplitCertificateData.Part016
public import SplitCertificateData.Part017
public import SplitCertificateData.Part018
public import SplitCertificateData.Part019
public import SplitCertificateData.Part020
public import SplitCertificateData.Part021
public import SplitCertificateData.Part022
public import SplitCertificateData.Part023
public import SplitCertificateData.Part024
public import SplitCertificateData.Part025
public import SplitCertificateData.Part026
public import SplitCertificateData.Part027
public import SplitCertificateData.Part028
public import SplitCertificateData.Part029
public import SplitCertificateData.Part030
public import SplitCertificateData.Part031
public import SplitCertificateData.Part032
public import SplitCertificateData.Part033
public import SplitCertificateData.Part034
public import SplitCertificateData.Part035
public import SplitCertificateData.Part036
public import SplitCertificateData.Part037
public import SplitCertificateData.Part038
public import SplitCertificateData.Part039
public import SplitCertificateData.Part040
public import SplitCertificateData.Part041
public import SplitCertificateData.Part042
public import SplitCertificateData.Part043
public import SplitCertificateData.Part044
public import SplitCertificateData.Part045
public import SplitCertificateData.Part046
public import SplitCertificateData.Part047
public import SplitCertificateData.Part048
public import SplitCertificateData.Part049
public import SplitCertificateData.Part050
public import SplitCertificateData.Part051
public import SplitCertificateData.Part052
public import SplitCertificateData.Part053
public import SplitCertificateData.Part054
public import SplitCertificateData.Part055
public import SplitCertificateData.Part056
public import SplitCertificateData.Part057
public import SplitCertificateData.Part058
public import SplitCertificateData.Part059
public import SplitCertificateData.Part060
public import SplitCertificateData.Part061
public import SplitCertificateData.Part062
public import SplitCertificateData.Part063
public import SplitCertificateData.Part064
public import SplitCertificateData.Part065
public import SplitCertificateData.Part066
public import SplitCertificateData.Part067
public import SplitCertificateData.Part068
public import SplitCertificateData.Part069
public import SplitCertificateData.Part070
public import SplitCertificateData.Part071
public import SplitCertificateData.Part072
public import SplitCertificateData.Part073
public import SplitCertificateData.Part074
public import SplitCertificateData.Part075
public import SplitCertificateData.Part076
public import SplitCertificateData.Part077
public import SplitCertificateData.Part078
public import SplitCertificateData.Part079
public import SplitCertificateData.Part080
public import SplitCertificateData.Part081
public import SplitCertificateData.Part082
public import SplitCertificateData.Part083
public import SplitCertificateData.Part084
public import SplitCertificateData.Part085
public import SplitCertificateData.Part086

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

namespace MatrixBounds.Numeric.SplitCertificateData
/-- All distinct split rows, retaining their parent shapes. -/
def rows : List SplitRow := Part000.rows ++ Part001.rows ++ Part002.rows ++ Part003.rows ++ Part004.rows ++ Part005.rows ++ Part006.rows ++ Part007.rows ++ Part008.rows ++ Part009.rows ++ Part010.rows ++ Part011.rows ++ Part012.rows ++ Part013.rows ++ Part014.rows ++ Part015.rows ++ Part016.rows ++ Part017.rows ++ Part018.rows ++ Part019.rows ++ Part020.rows ++ Part021.rows ++ Part022.rows ++ Part023.rows ++ Part024.rows ++ Part025.rows ++ Part026.rows ++ Part027.rows ++ Part028.rows ++ Part029.rows ++ Part030.rows ++ Part031.rows ++ Part032.rows ++ Part033.rows ++ Part034.rows ++ Part035.rows ++ Part036.rows ++ Part037.rows ++ Part038.rows ++ Part039.rows ++ Part040.rows ++ Part041.rows ++ Part042.rows ++ Part043.rows ++ Part044.rows ++ Part045.rows ++ Part046.rows ++ Part047.rows ++ Part048.rows ++ Part049.rows ++ Part050.rows ++ Part051.rows ++ Part052.rows ++ Part053.rows ++ Part054.rows ++ Part055.rows ++ Part056.rows ++ Part057.rows ++ Part058.rows ++ Part059.rows ++ Part060.rows ++ Part061.rows ++ Part062.rows ++ Part063.rows ++ Part064.rows ++ Part065.rows ++ Part066.rows ++ Part067.rows ++ Part068.rows ++ Part069.rows ++ Part070.rows ++ Part071.rows ++ Part072.rows ++ Part073.rows ++ Part074.rows ++ Part075.rows ++ Part076.rows ++ Part077.rows ++ Part078.rows ++ Part079.rows ++ Part080.rows ++ Part081.rows ++ Part082.rows ++ Part083.rows ++ Part084.rows ++ Part085.rows ++ Part086.rows

/-- Every contextual row has admissible support and complementary symmetry. -/
theorem rows_checked : rows.all (fun row => row.check 17592186044416) = true := by
  simp only [rows, List.all_append, Part000.rows_checked, Part001.rows_checked, Part002.rows_checked, Part003.rows_checked, Part004.rows_checked, Part005.rows_checked, Part006.rows_checked, Part007.rows_checked, Part008.rows_checked, Part009.rows_checked, Part010.rows_checked, Part011.rows_checked, Part012.rows_checked, Part013.rows_checked, Part014.rows_checked, Part015.rows_checked, Part016.rows_checked, Part017.rows_checked, Part018.rows_checked, Part019.rows_checked, Part020.rows_checked, Part021.rows_checked, Part022.rows_checked, Part023.rows_checked, Part024.rows_checked, Part025.rows_checked, Part026.rows_checked, Part027.rows_checked, Part028.rows_checked, Part029.rows_checked, Part030.rows_checked, Part031.rows_checked, Part032.rows_checked, Part033.rows_checked, Part034.rows_checked, Part035.rows_checked, Part036.rows_checked, Part037.rows_checked, Part038.rows_checked, Part039.rows_checked, Part040.rows_checked, Part041.rows_checked, Part042.rows_checked, Part043.rows_checked, Part044.rows_checked, Part045.rows_checked, Part046.rows_checked, Part047.rows_checked, Part048.rows_checked, Part049.rows_checked, Part050.rows_checked, Part051.rows_checked, Part052.rows_checked, Part053.rows_checked, Part054.rows_checked, Part055.rows_checked, Part056.rows_checked, Part057.rows_checked, Part058.rows_checked, Part059.rows_checked, Part060.rows_checked, Part061.rows_checked, Part062.rows_checked, Part063.rows_checked, Part064.rows_checked, Part065.rows_checked, Part066.rows_checked, Part067.rows_checked, Part068.rows_checked, Part069.rows_checked, Part070.rows_checked, Part071.rows_checked, Part072.rows_checked, Part073.rows_checked, Part074.rows_checked, Part075.rows_checked, Part076.rows_checked, Part077.rows_checked, Part078.rows_checked, Part079.rows_checked, Part080.rows_checked, Part081.rows_checked, Part082.rows_checked, Part083.rows_checked, Part084.rows_checked, Part085.rows_checked, Part086.rows_checked, Bool.and_true]
end MatrixBounds.Numeric.SplitCertificateData
