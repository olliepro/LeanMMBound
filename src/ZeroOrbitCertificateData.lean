import ZeroOrbitCertificateData.Part000
import ZeroOrbitCertificateData.Part001
import ZeroOrbitCertificateData.Part002
import ZeroOrbitCertificateData.Part003
import ZeroOrbitCertificateData.Part004
import ZeroOrbitCertificateData.Part005
import ZeroOrbitCertificateData.Part006
import ZeroOrbitCertificateData.Part007
import ZeroOrbitCertificateData.Part008
import ZeroOrbitCertificateData.Part009
import ZeroOrbitCertificateData.Part010
import ZeroOrbitCertificateData.Part011
import ZeroOrbitCertificateData.Part012
import ZeroOrbitCertificateData.Part013
import ZeroOrbitCertificateData.Part014
import ZeroOrbitCertificateData.Part015
import ZeroOrbitCertificateData.Part016
import ZeroOrbitCertificateData.Part017
import ZeroOrbitCertificateData.Part018
import ZeroOrbitCertificateData.Part019
import ZeroOrbitCertificateData.Part020
import ZeroOrbitCertificateData.Part021
import ZeroOrbitCertificateData.Part022
import ZeroOrbitCertificateData.Part023
import ZeroOrbitCertificateData.Part024
import ZeroOrbitCertificateData.Part025
import ZeroOrbitCertificateData.Part026
import ZeroOrbitCertificateData.Part027
import ZeroOrbitCertificateData.Part028
import ZeroOrbitCertificateData.Part029
import ZeroOrbitCertificateData.Part030
import ZeroOrbitCertificateData.Part031
import ZeroOrbitCertificateData.Part032
import ZeroOrbitCertificateData.Part033
import ZeroOrbitCertificateData.Part034
import ZeroOrbitCertificateData.Part035
import ZeroOrbitCertificateData.Part036
import ZeroOrbitCertificateData.Part037

namespace MatrixBounds.Numeric.ZeroOrbitCertificateData
open scoped BigOperators

/-- Every distinct supplied zero-leaf law at this word level. -/
def rows2 : List ZeroOrbitRow := Part000.rows ++ Part001.rows ++ Part002.rows ++ Part003.rows ++ Part004.rows ++ Part005.rows ++ Part006.rows ++ Part007.rows ++ Part008.rows ++ Part009.rows ++ Part010.rows ++ Part011.rows ++ Part012.rows ++ Part013.rows ++ Part014.rows ++ Part015.rows ++ Part016.rows ++ Part017.rows ++ Part018.rows ++ Part019.rows ++ Part020.rows ++ Part021.rows ++ Part022.rows ++ Part023.rows ++ Part024.rows ++ Part025.rows ++ Part026.rows ++ Part027.rows ++ Part028.rows ++ Part029.rows ++ Part030.rows ++ Part031.rows ++ Part032.rows ++ Part033.rows

/-- All supplied rows at this level pass the complete exact support and normalization check. -/
theorem rows2_checked : rows2.all (fun entry => entry.check 6 17592186044416 OrbitLevel2.totalAt) = true := by
  simp only [rows2, List.all_append, Part000.rows_checked, Part001.rows_checked, Part002.rows_checked, Part003.rows_checked, Part004.rows_checked, Part005.rows_checked, Part006.rows_checked, Part007.rows_checked, Part008.rows_checked, Part009.rows_checked, Part010.rows_checked, Part011.rows_checked, Part012.rows_checked, Part013.rows_checked, Part014.rows_checked, Part015.rows_checked, Part016.rows_checked, Part017.rows_checked, Part018.rows_checked, Part019.rows_checked, Part020.rows_checked, Part021.rows_checked, Part022.rows_checked, Part023.rows_checked, Part024.rows_checked, Part025.rows_checked, Part026.rows_checked, Part027.rows_checked, Part028.rows_checked, Part029.rows_checked, Part030.rows_checked, Part031.rows_checked, Part032.rows_checked, Part033.rows_checked, Bool.and_true]

/-- Membership in the checked supplied rows implies exact normalized masses and the actual full-word coarse support. -/
theorem rows2_valid (entry : ZeroOrbitRow) (present : entry ∈ rows2) :
    (∑ orbit : Fin 6, entry.row.orbitNumerator orbit) = 17592186044416 ∧
      ∀ orbit : Fin 6, OrbitLevel2.total orbit ≠ entry.total → entry.row.orbitNumerator orbit = 0 :=
  entry.check_sound OrbitLevel2.totalAt OrbitLevel2.total OrbitLevel2.totalAt_correct
    (List.all_eq_true.mp rows2_checked entry present)

/-- Every distinct supplied zero-leaf law at this word level. -/
def rows3 : List ZeroOrbitRow := Part034.rows ++ Part035.rows ++ Part036.rows

/-- All supplied rows at this level pass the complete exact support and normalization check. -/
theorem rows3_checked : rows3.all (fun entry => entry.check 21 17592186044416 OrbitLevel3.totalAt) = true := by
  simp only [rows3, List.all_append, Part034.rows_checked, Part035.rows_checked, Part036.rows_checked, Bool.and_true]

/-- Membership in the checked supplied rows implies exact normalized masses and the actual full-word coarse support. -/
theorem rows3_valid (entry : ZeroOrbitRow) (present : entry ∈ rows3) :
    (∑ orbit : Fin 21, entry.row.orbitNumerator orbit) = 17592186044416 ∧
      ∀ orbit : Fin 21, OrbitLevel3.total orbit ≠ entry.total → entry.row.orbitNumerator orbit = 0 :=
  entry.check_sound OrbitLevel3.totalAt OrbitLevel3.total OrbitLevel3.totalAt_correct
    (List.all_eq_true.mp rows3_checked entry present)

/-- Every distinct supplied zero-leaf law at this word level. -/
def rows4 : List ZeroOrbitRow := Part037.rows

/-- All supplied rows at this level pass the complete exact support and normalization check. -/
theorem rows4_checked : rows4.all (fun entry => entry.check 231 17592186044416 OrbitLevel4.totalAt) = true := by
  simp only [rows4, Part037.rows_checked]

/-- Membership in the checked supplied rows implies exact normalized masses and the actual full-word coarse support. -/
theorem rows4_valid (entry : ZeroOrbitRow) (present : entry ∈ rows4) :
    (∑ orbit : Fin 231, entry.row.orbitNumerator orbit) = 17592186044416 ∧
      ∀ orbit : Fin 231, OrbitLevel4.total orbit ≠ entry.total → entry.row.orbitNumerator orbit = 0 :=
  entry.check_sound OrbitLevel4.totalAt OrbitLevel4.total OrbitLevel4.totalAt_correct
    (List.all_eq_true.mp rows4_checked entry present)

end MatrixBounds.Numeric.ZeroOrbitCertificateData
