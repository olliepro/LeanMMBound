import CertificateData.Part000
import CertificateData.Part001
import CertificateData.Part002
import CertificateData.Part003
import CertificateData.Part004
import CertificateData.Part005
import CertificateData.Part006
import CertificateData.Part007
import CertificateData.Part008
import CertificateData.Part009
import CertificateData.Part010
import CertificateData.Part011
import CertificateData.Part012
import CertificateData.Part013
import CertificateData.Part014
import CertificateData.Part015
import CertificateData.Part016
import CertificateData.Part017
import CertificateData.Part018
import CertificateData.Part019
import CertificateData.Part020
import CertificateData.Part021
import CertificateData.Part022
import CertificateData.Part023
import CertificateData.Part024
import CertificateData.Part025
import CertificateData.Part026
import CertificateData.Part027
import CertificateData.Part028
import CertificateData.Part029
import CertificateData.Part030
import CertificateData.Part031
import CertificateData.Part032
import CertificateData.Part033
import CertificateData.Part034
import CertificateData.Part035
import CertificateData.Part036
import CertificateData.Part037
import CertificateData.Part038
import CertificateData.Part039
import CertificateData.Part040
import CertificateData.Part041
import CertificateData.Part042
import CertificateData.Part043
import CertificateData.Part044
import CertificateData.Part045
import CertificateData.Part046
import CertificateData.Part047
import CertificateData.Part048
import CertificateData.Part049
import CertificateData.Part050
import CertificateData.Part051
import CertificateData.Part052
import CertificateData.Part053
import CertificateData.Part054
import CertificateData.Part055
import CertificateData.Part056
import CertificateData.Part057
import CertificateData.Part058
import CertificateData.Part059

namespace MatrixBounds.Numeric.CertificateData
/-- The complete deduplicated collection of supplied dyadic probability rows. -/
def rows : List DyadicRow := Part000.rows ++ Part001.rows ++ Part002.rows ++ Part003.rows ++ Part004.rows ++ Part005.rows ++ Part006.rows ++ Part007.rows ++ Part008.rows ++ Part009.rows ++ Part010.rows ++ Part011.rows ++ Part012.rows ++ Part013.rows ++ Part014.rows ++ Part015.rows ++ Part016.rows ++ Part017.rows ++ Part018.rows ++ Part019.rows ++ Part020.rows ++ Part021.rows ++ Part022.rows ++ Part023.rows ++ Part024.rows ++ Part025.rows ++ Part026.rows ++ Part027.rows ++ Part028.rows ++ Part029.rows ++ Part030.rows ++ Part031.rows ++ Part032.rows ++ Part033.rows ++ Part034.rows ++ Part035.rows ++ Part036.rows ++ Part037.rows ++ Part038.rows ++ Part039.rows ++ Part040.rows ++ Part041.rows ++ Part042.rows ++ Part043.rows ++ Part044.rows ++ Part045.rows ++ Part046.rows ++ Part047.rows ++ Part048.rows ++ Part049.rows ++ Part050.rows ++ Part051.rows ++ Part052.rows ++ Part053.rows ++ Part054.rows ++ Part055.rows ++ Part056.rows ++ Part057.rows ++ Part058.rows ++ Part059.rows

/-- All translated probability rows pass exact support and mass checks. -/
theorem rows_checked : rows.all (fun row => row.check 17592186044416) = true := by
  simp only [rows, List.all_append, Part000.rows_checked, Part001.rows_checked, Part002.rows_checked, Part003.rows_checked, Part004.rows_checked, Part005.rows_checked, Part006.rows_checked, Part007.rows_checked, Part008.rows_checked, Part009.rows_checked, Part010.rows_checked, Part011.rows_checked, Part012.rows_checked, Part013.rows_checked, Part014.rows_checked, Part015.rows_checked, Part016.rows_checked, Part017.rows_checked, Part018.rows_checked, Part019.rows_checked, Part020.rows_checked, Part021.rows_checked, Part022.rows_checked, Part023.rows_checked, Part024.rows_checked, Part025.rows_checked, Part026.rows_checked, Part027.rows_checked, Part028.rows_checked, Part029.rows_checked, Part030.rows_checked, Part031.rows_checked, Part032.rows_checked, Part033.rows_checked, Part034.rows_checked, Part035.rows_checked, Part036.rows_checked, Part037.rows_checked, Part038.rows_checked, Part039.rows_checked, Part040.rows_checked, Part041.rows_checked, Part042.rows_checked, Part043.rows_checked, Part044.rows_checked, Part045.rows_checked, Part046.rows_checked, Part047.rows_checked, Part048.rows_checked, Part049.rows_checked, Part050.rows_checked, Part051.rows_checked, Part052.rows_checked, Part053.rows_checked, Part054.rows_checked, Part055.rows_checked, Part056.rows_checked, Part057.rows_checked, Part058.rows_checked, Part059.rows_checked, Bool.and_true]

/-- Every translated row denotes a normalized nonnegative real distribution. -/
theorem probabilities_valid (row : DyadicRow) (present : row ∈ rows) :
    (∀ i, 0 ≤ row.probability 17592186044416 i) ∧
    ∑ i, row.probability 17592186044416 i = 1 := by
  have checked := (List.all_eq_true.mp rows_checked) row present
  exact DyadicRow.probability_valid (by decide) checked
end MatrixBounds.Numeric.CertificateData
