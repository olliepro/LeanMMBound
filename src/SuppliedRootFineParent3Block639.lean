import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block639
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node639, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,681576689642234140143071692515469950976),(3,7190566163877924455477119502172676947968),(6,13905928629419903066035783680945018634240)] orbit.val

/-- Exact candidate at original node639, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(10,3139415939627724377144179032064),(13,681576725801459027952421037027916513280),(16,21096494753999186694075829461461069987840)] orbit.val

/-- Exact candidate at original node639, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(1,21778071482940061661655974875633165533184)] orbit.val

/-- Exact candidate at original node639, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,681574989587275786335734595268789665792),(3,7190568885555279629937382262670614331392),(6,13905927607797506245382858017693761536000)] orbit.val

/-- Exact candidate at original node639, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(10,3946552845241792316378408026112),(13,681575069073960203604124230066617974784),(16,21096496409919548612810058329188139532288)] orbit.val

/-- Exact candidate at original node639, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(1,21778071482940061661655974875633165533184)] orbit.val

/-- Exact candidate at original node639, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,681576677788588496872566163668360757248),(3,7190566168705022435763806590692357046272),(6,13905928636446450729019602121272447729664)] orbit.val

/-- Exact candidate at original node639, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(10,3649447235813301050402618212352),(13,681576742057240887248080132421973966848),(16,21096494737233373538594593692808573353984)] orbit.val

/-- Exact candidate at original node639, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(1,21778071482940061661655974875633165533184)] orbit.val

/-- Exact candidate at original node639, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,681575016623452011193688320235098079232),(3,7190568874255797184475182592221973053440),(6,13905927592060812465987103963176094400512)] orbit.val

/-- Exact candidate at original node639, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(10,2792792728627817900172424249344),(13,681575035812112291741219573422792638464),(16,21096496444335156641286937402037948645376)] orbit.val

/-- Exact candidate at original node639, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(1,21778071482940061661655974875633165533184)] orbit.val

/-- Exact candidate at original node639, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,681575739849527904140333516638983815168),(3,7190548699956275141876666296523875680256),(6,13905947043134258615638975062470306037760)] orbit.val

/-- Exact candidate at original node639, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(10,3495942670941913896315126808576),(13,681575799460990698490727163214874804224),(16,21096495679983128292223333816103163920384)] orbit.val

/-- Exact candidate at original node639, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(1,21778071482940061661655974875633165533184)] orbit.val

/-- Exact candidate at original node639, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,681575012711877654134409114248256946176),(3,7190568876166860438049287273971829440512),(6,13905927594061323569472278487413079146496)] orbit.val

/-- Exact candidate at original node639, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(10,2782889208313534857973231255552),(13,681575037282079829320214313917447405568),(16,21096496442875092624022225703742486872064)] orbit.val

/-- Exact candidate at original node639, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(1,21778071482940061661655974875633165533184)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked63900 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 639 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked63901 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 639 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked63902 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 639 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked63910 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 639 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked63911 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 639 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked63912 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 639 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked63920 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 639 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked63921 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 639 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked63922 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 639 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked63930 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 639 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked63931 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 639 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked63932 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 639 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked63940 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 639 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked63941 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 639 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked63942 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 639 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked63950 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 639 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked63951 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 639 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked63952 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 639 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 639 1 :=
  RootFineParent3CacheTable.single 639 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 639 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 639 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 639 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 639 0 0) checked63900 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 639 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 639 0 1) checked63901 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 639 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 639 0 2) checked63902 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 639 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 639 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 639 1 0) checked63910 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 639 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 639 1 1) checked63911 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 639 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 639 1 2) checked63912 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 639 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 639 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 639 2 0) checked63920 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 639 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 639 2 1) checked63921 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 639 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 639 2 2) checked63922 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 639 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 639 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 639 3 0) checked63930 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 639 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 639 3 1) checked63931 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 639 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 639 3 2) checked63932 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 639 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 639 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 639 4 0) checked63940 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 639 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 639 4 1) checked63941 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 639 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 639 4 2) checked63942 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 639 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 639 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 639 5 0) checked63950 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 639 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 639 5 1) checked63951 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 639 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 639 5 2) checked63952 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block639
