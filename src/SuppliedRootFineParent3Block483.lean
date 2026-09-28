import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block483
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node483, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,735667140320950030065000698344281997312),(3,7295621896660389297624627083757725155328),(6,13746782445958722333966347093531158380544)] orbit.val

/-- Exact candidate at original node483, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,726306091200925149261350283372270714880),(3,7311942892630762934881146395212453511168),(6,13739822499108373577513478197048441307136)] orbit.val

/-- Exact candidate at original node483, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14353328125439927888592197279889227776),(9,3419734974457384789864243452819927990272),(11,70468985884364008290229861890412730880),(12,1465874973989937950366987684376790780928),(15,16807639220482934985245921679266144803328)] orbit.val

/-- Exact candidate at original node483, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,66609855796433216572929604154799685632),(3,7288527958925545828029641362735189983232),(6,14422933668218082617053403908743175864320)] orbit.val

/-- Exact candidate at original node483, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,8926078761832280103928990464290586624),(3,7179225987205150244307761286823863648256),(6,14589919416973079137244284598345011298304)] orbit.val

/-- Exact candidate at original node483, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14887511389155714631079384493559119872),(9,2808617507287944981889174198724172185600),(11,14917262440469558291531061821497029632),(12,859514620144792985061254565061090056192),(15,18080134581677698421782935665532847141888)] orbit.val

/-- Exact candidate at original node483, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,735668918249779744111715240746359455744),(3,7295622144308472984202816584497860968448),(6,13746780420381808933341443050388945108992)] orbit.val

/-- Exact candidate at original node483, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,726307836667183849673994612274561548288),(3,7311943179441149127705884157206436249600),(6,13739820466831728684276096106152167735296)] orbit.val

/-- Exact candidate at original node483, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14353320623523289819187731391196430336),(9,3419734543599781756823351055829136572416),(11,70469218276761776518576606430283410944),(12,1465868639924596432808531934662821454848),(15,16807645760515398405686327547319727664640)] orbit.val

/-- Exact candidate at original node483, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,474257886916632397047961205378379677696),(3,7532871589030102925518878396512131350528),(6,13770942006993326339089135273742654504960)] orbit.val

/-- Exact candidate at original node483, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,653203609561628596230206504251103903744),(3,7269914716679441829520842749538010660864),(6,13854953156698991235904925621844050968576)] orbit.val

/-- Exact candidate at original node483, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,3708868357698999303597776175104),(9,3431163545312311554072537909519089401856),(11,59763148425501378090394037867284546048),(12,1799591869212835066517602250286737882112),(15,16487552916280545305276441374362277528064)] orbit.val

/-- Exact candidate at original node483, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,508727415042876387376576692740083941376),(3,7446049434427928490260292965306076233728),(6,13823294633469256784019105217587005358080)] orbit.val

/-- Exact candidate at original node483, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,505414971959489206516429999597602996224),(3,7457055793663055759825453458119467204608),(6,13815600717317516695314091417916095332352)] orbit.val

/-- Exact candidate at original node483, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14029828025051821244161200768812056576),(9,3533967150636787850162281008393214754816),(11,62672173328260242332833303800920707072),(12,1896208667732615637152829900965642952704),(15,16271193663217346110763869461704575062016)] orbit.val

/-- Exact candidate at original node483, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,508695216832892011614056851489846984704),(3,7445689051828933639188599867411322109952),(6,13823687214278236010853318156731996438528)] orbit.val

/-- Exact candidate at original node483, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,505374420985394057992294259244711018496),(3,7456822482362119072155144944033590149120),(6,13815874579592548531508535672354864365568)] orbit.val

/-- Exact candidate at original node483, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14015995352377488604950773349084037120),(9,3535158448764647233750289068417458634752),(11,62683399508659580383676414818944136448),(12,1896366512837040508922054340903538300416),(15,16269847126477336849995004278144140424448)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked48300 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 483 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked48301 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 483 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked48302 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 483 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked48310 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 483 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked48311 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 483 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked48312 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 483 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked48320 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 483 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked48321 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 483 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked48322 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 483 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked48330 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 483 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked48331 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 483 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked48332 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 483 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked48340 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 483 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked48341 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 483 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked48342 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 483 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked48350 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 483 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked48351 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 483 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked48352 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 483 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 483 1 :=
  RootFineParent3CacheTable.single 483 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 483 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 483 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 483 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 483 0 0) checked48300 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 483 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 483 0 1) checked48301 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 483 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 483 0 2) checked48302 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 483 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 483 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 483 1 0) checked48310 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 483 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 483 1 1) checked48311 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 483 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 483 1 2) checked48312 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 483 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 483 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 483 2 0) checked48320 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 483 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 483 2 1) checked48321 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 483 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 483 2 2) checked48322 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 483 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 483 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 483 3 0) checked48330 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 483 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 483 3 1) checked48331 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 483 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 483 3 2) checked48332 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 483 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 483 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 483 4 0) checked48340 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 483 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 483 4 1) checked48341 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 483 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 483 4 2) checked48342 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 483 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 483 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 483 5 0) checked48350 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 483 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 483 5 1) checked48351 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 483 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 483 5 2) checked48352 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block483
