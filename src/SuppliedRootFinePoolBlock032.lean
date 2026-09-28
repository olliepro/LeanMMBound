import SuppliedRootFinePoolSource
namespace MatrixBounds.Numeric.SuppliedRootFinePoolBlock032
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option exponentiation.threshold 1000
set_option Elab.async false

/-- Complete candidate vector at unchanged original root source position32. -/
def value032 (orbit : Fin 231) : ℤ := (if orbit.val < 220 then (if orbit.val < 202 then (if orbit.val = 175 then 4066574912410889461505292129558171940169469912083260392824535672978526901654356289001517740364543495101552883924992 else 0) else (if orbit.val < 208 then (if orbit.val = 202 then 24161186878022960089440152431930274185140673463562593835282344402618948276799222450166633428146566172981992128660897792 else 0) else (if orbit.val = 208 then 3264671815821817754613187549933432948520614621065836565332902624351351339566061817208147654115648026042975815393180372629979136 else 0))) else (if orbit.val < 223 then (if orbit.val = 220 then 562400250874418517090021119483065595164502318723367635911253896747247217550270377666302503799176468897021601147007270912 else 0) else (if orbit.val < 226 then (if orbit.val = 223 then 40808399311675967865034053040040070362884957017615118571985498015005451026465589920849782175460081235034852042855341427085279232 else 0) else (if orbit.val = 226 then 168057805502821114710871637942895847849284578388924833630625230810885127138787805849236557760139447755596249693446703981493485568 else 0))))

/-- Independent kernel verification of the exact total and all nonzero original coordinates. -/
theorem checked032 : sparseIntegerVectorCheck (SuppliedRootFinePoolSource.total 32)
    value032 (SuppliedRootFinePoolSource.numerator 32) = true := by decide +kernel

/-- Every original coordinate, including omitted zeros, is identified with its actual source. -/
def table032 : RootFineFiniteVectorCache SuppliedRootFinePoolSource.numerator 32 1 :=
  RootFineFiniteVectorCache.ofSparseCheck 32 _ value032
    (SuppliedRootFinePoolSource.numerator_nonnegative 32)
    (SuppliedRootFinePoolSource.numerator_normalized 32) checked032

/-- Complete candidate vector at unchanged original root source position33. -/
def value033 (orbit : Fin 231) : ℤ := (if orbit.val < 227 then (if orbit.val < 224 then (if orbit.val = 209 then 154552236613253475133127174695600617892636295179919996386235741897348764775687347865092053350743724429148160 else 0) else (if orbit.val = 224 then 2407864290066903542296886633822900245444912273126943437142353519413126884373259193539296249657997793002455564288 else 0)) else (if orbit.val < 228 then (if orbit.val = 227 then 39725873747655797763138603807028051067003005036880478196228104838511834274460697467463174535831901450301476361344122880 else 0) else (if orbit.val = 228 then 1839718721417385695208540235599802224794638168090743533583789978897209339759065045946570967155672214737603181415626917931909120 else 0)))

/-- Independent kernel verification of the exact total and all nonzero original coordinates. -/
theorem checked033 : sparseIntegerVectorCheck (SuppliedRootFinePoolSource.total 33)
    value033 (SuppliedRootFinePoolSource.numerator 33) = true := by decide +kernel

/-- Every original coordinate, including omitted zeros, is identified with its actual source. -/
def table033 : RootFineFiniteVectorCache SuppliedRootFinePoolSource.numerator 33 1 :=
  RootFineFiniteVectorCache.ofSparseCheck 33 _ value033
    (SuppliedRootFinePoolSource.numerator_nonnegative 33)
    (SuppliedRootFinePoolSource.numerator_normalized 33) checked033

/-- Complete candidate vector at unchanged original root source position34. -/
def value034 (_orbit : Fin 231) : ℤ := 0

/-- Independent kernel verification of the exact total and all nonzero original coordinates. -/
theorem checked034 : sparseIntegerVectorCheck (SuppliedRootFinePoolSource.total 34)
    value034 (SuppliedRootFinePoolSource.numerator 34) = true := by decide +kernel

/-- Every original coordinate, including omitted zeros, is identified with its actual source. -/
def table034 : RootFineFiniteVectorCache SuppliedRootFinePoolSource.numerator 34 1 :=
  RootFineFiniteVectorCache.ofSparseCheck 34 _ value034
    (SuppliedRootFinePoolSource.numerator_nonnegative 34)
    (SuppliedRootFinePoolSource.numerator_normalized 34) checked034

/-- Complete candidate vector at unchanged original root source position35. -/
def value035 (_orbit : Fin 231) : ℤ := 0

/-- Independent kernel verification of the exact total and all nonzero original coordinates. -/
theorem checked035 : sparseIntegerVectorCheck (SuppliedRootFinePoolSource.total 35)
    value035 (SuppliedRootFinePoolSource.numerator 35) = true := by decide +kernel

/-- Every original coordinate, including omitted zeros, is identified with its actual source. -/
def table035 : RootFineFiniteVectorCache SuppliedRootFinePoolSource.numerator 35 1 :=
  RootFineFiniteVectorCache.ofSparseCheck 35 _ value035
    (SuppliedRootFinePoolSource.numerator_nonnegative 35)
    (SuppliedRootFinePoolSource.numerator_normalized 35) checked035

/-- All complete original rows of this independently checked source block. -/
def table : RootFineFiniteVectorCache SuppliedRootFinePoolSource.numerator 32 4 :=
  ((table032).append (table033)).append ((table034).append (table035))

end MatrixBounds.Numeric.SuppliedRootFinePoolBlock032
