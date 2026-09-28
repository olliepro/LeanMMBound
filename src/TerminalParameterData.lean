import CertificateData.TerminalPart000
import CertificateData.TerminalPart001
import CertificateData.TerminalPart002
import CertificateData.TerminalPart003
import CertificateData.TerminalPart004
import CertificateData.TerminalPart005
import CertificateData.TerminalPart006
import CertificateData.TerminalPart007
import CertificateData.TerminalPart008
import CertificateData.TerminalPart009
import CertificateData.TerminalPart010
import CertificateData.TerminalPart011
import CertificateData.TerminalPart012
import CertificateData.TerminalPart013
import CertificateData.TerminalPart014
import CertificateData.TerminalPart015
import CertificateData.TerminalPart016
import CertificateData.TerminalPart017
import CertificateData.TerminalPart018
import CertificateData.TerminalPart019
import CertificateData.TerminalPart020
import CertificateData.TerminalPart021
import CertificateData.TerminalPart022
import CertificateData.TerminalPart023
import CertificateData.TerminalPart024
import CertificateData.TerminalPart025
import CertificateData.TerminalPart026
import CertificateData.TerminalPart027
import CertificateData.TerminalPart028
import CertificateData.TerminalPart029
import CertificateData.TerminalPart030
import CertificateData.TerminalPart031
import CertificateData.TerminalPart032
import CertificateData.TerminalPart033
import CertificateData.TerminalPart034
import CertificateData.TerminalPart035
import CertificateData.TerminalPart036
import CertificateData.TerminalPart037
import CertificateData.TerminalPart038
import CertificateData.TerminalPart039
import CertificateData.TerminalPart040
import CertificateData.TerminalPart041
import CertificateData.TerminalPart042
import CertificateData.TerminalPart043
import CertificateData.TerminalPart044
import CertificateData.TerminalPart045
import CertificateData.TerminalPart046
import CertificateData.TerminalPart047
import CertificateData.TerminalPart048
import CertificateData.TerminalPart049
import CertificateData.TerminalPart050
import CertificateData.TerminalPart051
import CertificateData.TerminalPart052
import CertificateData.TerminalPart053
import CertificateData.TerminalPart054
import CertificateData.TerminalPart055
import CertificateData.TerminalPart056
import CertificateData.TerminalPart057
import CertificateData.TerminalPart058
import CertificateData.TerminalPart059
import CertificateData.TerminalPart060
import CertificateData.TerminalPart061
import CertificateData.TerminalPart062
import CertificateData.TerminalPart063
import CertificateData.TerminalPart064
import CertificateData.TerminalPart065
import CertificateData.TerminalPart066

namespace MatrixBounds.Numeric.TerminalParameterData
set_option maxRecDepth 100000
set_option maxHeartbeats 4000000

/-- The common exact dyadic denominator of all exported terminal parameters. -/
def denominator : ℕ := 17592186044416

/-- The entire mu array, flattened without changing the original row-major order. -/
def numerators : List ℕ := TerminalPart000.numerators ++ TerminalPart001.numerators ++ TerminalPart002.numerators ++ TerminalPart003.numerators ++ TerminalPart004.numerators ++ TerminalPart005.numerators ++ TerminalPart006.numerators ++ TerminalPart007.numerators ++ TerminalPart008.numerators ++ TerminalPart009.numerators ++ TerminalPart010.numerators ++ TerminalPart011.numerators ++ TerminalPart012.numerators ++ TerminalPart013.numerators ++ TerminalPart014.numerators ++ TerminalPart015.numerators ++ TerminalPart016.numerators ++ TerminalPart017.numerators ++ TerminalPart018.numerators ++ TerminalPart019.numerators ++ TerminalPart020.numerators ++ TerminalPart021.numerators ++ TerminalPart022.numerators ++ TerminalPart023.numerators ++ TerminalPart024.numerators ++ TerminalPart025.numerators ++ TerminalPart026.numerators ++ TerminalPart027.numerators ++ TerminalPart028.numerators ++ TerminalPart029.numerators ++ TerminalPart030.numerators ++ TerminalPart031.numerators ++ TerminalPart032.numerators ++ TerminalPart033.numerators ++ TerminalPart034.numerators ++ TerminalPart035.numerators ++ TerminalPart036.numerators ++ TerminalPart037.numerators ++ TerminalPart038.numerators ++ TerminalPart039.numerators ++ TerminalPart040.numerators ++ TerminalPart041.numerators ++ TerminalPart042.numerators ++ TerminalPart043.numerators ++ TerminalPart044.numerators ++ TerminalPart045.numerators ++ TerminalPart046.numerators ++ TerminalPart047.numerators ++ TerminalPart048.numerators ++ TerminalPart049.numerators ++ TerminalPart050.numerators ++ TerminalPart051.numerators ++ TerminalPart052.numerators ++ TerminalPart053.numerators ++ TerminalPart054.numerators ++ TerminalPart055.numerators ++ TerminalPart056.numerators ++ TerminalPart057.numerators ++ TerminalPart058.numerators ++ TerminalPart059.numerators ++ TerminalPart060.numerators ++ TerminalPart061.numerators ++ TerminalPart062.numerators ++ TerminalPart063.numerators ++ TerminalPart064.numerators ++ TerminalPart065.numerators ++ TerminalPart066.numerators

/-- Every supplied terminal parameter satisfies the strict interior inequalities in integer arithmetic. -/
theorem numerators_checked :
    numerators.all (fun n => decide (0 < n ∧ 2*n < denominator)) = true := by
  simp only [numerators, denominator, List.all_append, TerminalPart000.numerators_checked, TerminalPart001.numerators_checked, TerminalPart002.numerators_checked, TerminalPart003.numerators_checked, TerminalPart004.numerators_checked, TerminalPart005.numerators_checked, TerminalPart006.numerators_checked, TerminalPart007.numerators_checked, TerminalPart008.numerators_checked, TerminalPart009.numerators_checked, TerminalPart010.numerators_checked, TerminalPart011.numerators_checked, TerminalPart012.numerators_checked, TerminalPart013.numerators_checked, TerminalPart014.numerators_checked, TerminalPart015.numerators_checked, TerminalPart016.numerators_checked, TerminalPart017.numerators_checked, TerminalPart018.numerators_checked, TerminalPart019.numerators_checked, TerminalPart020.numerators_checked, TerminalPart021.numerators_checked, TerminalPart022.numerators_checked, TerminalPart023.numerators_checked, TerminalPart024.numerators_checked, TerminalPart025.numerators_checked, TerminalPart026.numerators_checked, TerminalPart027.numerators_checked, TerminalPart028.numerators_checked, TerminalPart029.numerators_checked, TerminalPart030.numerators_checked, TerminalPart031.numerators_checked, TerminalPart032.numerators_checked, TerminalPart033.numerators_checked, TerminalPart034.numerators_checked, TerminalPart035.numerators_checked, TerminalPart036.numerators_checked, TerminalPart037.numerators_checked, TerminalPart038.numerators_checked, TerminalPart039.numerators_checked, TerminalPart040.numerators_checked, TerminalPart041.numerators_checked, TerminalPart042.numerators_checked, TerminalPart043.numerators_checked, TerminalPart044.numerators_checked, TerminalPart045.numerators_checked, TerminalPart046.numerators_checked, TerminalPart047.numerators_checked, TerminalPart048.numerators_checked, TerminalPart049.numerators_checked, TerminalPart050.numerators_checked, TerminalPart051.numerators_checked, TerminalPart052.numerators_checked, TerminalPart053.numerators_checked, TerminalPart054.numerators_checked, TerminalPart055.numerators_checked, TerminalPart056.numerators_checked, TerminalPart057.numerators_checked, TerminalPart058.numerators_checked, TerminalPart059.numerators_checked, TerminalPart060.numerators_checked, TerminalPart061.numerators_checked, TerminalPart062.numerators_checked, TerminalPart063.numerators_checked, TerminalPart064.numerators_checked, TerminalPart065.numerators_checked, TerminalPart066.numerators_checked, Bool.and_true]

/-- The flattened array has precisely the supplied 945 by 3 by 6 entries. -/
theorem numerators_length : numerators.length = 17010 := by
  norm_num only [numerators, List.length_append, TerminalPart000.numerators_length, TerminalPart001.numerators_length, TerminalPart002.numerators_length, TerminalPart003.numerators_length, TerminalPart004.numerators_length, TerminalPart005.numerators_length, TerminalPart006.numerators_length, TerminalPart007.numerators_length, TerminalPart008.numerators_length, TerminalPart009.numerators_length, TerminalPart010.numerators_length, TerminalPart011.numerators_length, TerminalPart012.numerators_length, TerminalPart013.numerators_length, TerminalPart014.numerators_length, TerminalPart015.numerators_length, TerminalPart016.numerators_length, TerminalPart017.numerators_length, TerminalPart018.numerators_length, TerminalPart019.numerators_length, TerminalPart020.numerators_length, TerminalPart021.numerators_length, TerminalPart022.numerators_length, TerminalPart023.numerators_length, TerminalPart024.numerators_length, TerminalPart025.numerators_length, TerminalPart026.numerators_length, TerminalPart027.numerators_length, TerminalPart028.numerators_length, TerminalPart029.numerators_length, TerminalPart030.numerators_length, TerminalPart031.numerators_length, TerminalPart032.numerators_length, TerminalPart033.numerators_length, TerminalPart034.numerators_length, TerminalPart035.numerators_length, TerminalPart036.numerators_length, TerminalPart037.numerators_length, TerminalPart038.numerators_length, TerminalPart039.numerators_length, TerminalPart040.numerators_length, TerminalPart041.numerators_length, TerminalPart042.numerators_length, TerminalPart043.numerators_length, TerminalPart044.numerators_length, TerminalPart045.numerators_length, TerminalPart046.numerators_length, TerminalPart047.numerators_length, TerminalPart048.numerators_length, TerminalPart049.numerators_length, TerminalPart050.numerators_length, TerminalPart051.numerators_length, TerminalPart052.numerators_length, TerminalPart053.numerators_length, TerminalPart054.numerators_length, TerminalPart055.numerators_length, TerminalPart056.numerators_length, TerminalPart057.numerators_length, TerminalPart058.numerators_length, TerminalPart059.numerators_length, TerminalPart060.numerators_length, TerminalPart061.numerators_length, TerminalPart062.numerators_length, TerminalPart063.numerators_length, TerminalPart064.numerators_length, TerminalPart065.numerators_length, TerminalPart066.numerators_length]

/-- Kernel-checked membership supplies the integer bounds needed to instantiate each terminal split. -/
theorem numerator_bounds (numerator : ℕ) (present : numerator ∈ numerators) :
    0 < numerator ∧ 2*numerator < denominator := by
  exact of_decide_eq_true ((List.all_eq_true.mp numerators_checked) numerator present)

end MatrixBounds.Numeric.TerminalParameterData
