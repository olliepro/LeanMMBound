import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block080
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node80, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,734399981221677368310244225614308442112),(3,7303070899424098897816521262411372560384),(6,13740600602294285395529209387607484530688)] orbit.val

/-- Exact candidate at original node80, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,753861888116634038748500300167452295168),(3,7335289985273139206780075933788123693056),(6,13688919609550288416127398641677589544960)] orbit.val

/-- Exact candidate at original node80, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13598851827363016812333874641293541376),(9,3387814190193806181110970025976059133952),(11,72167066889889631428128022800627382272),(12,1456713058702149937314554712015499726848),(15,16847778315326852894989988240199685748736)] orbit.val

/-- Exact candidate at original node80, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,644472503027225764412548387057145217024),(3,7262206068217773306949615559607280730112),(6,13871392911695062590293810928968739586048)] orbit.val

/-- Exact candidate at original node80, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,484647094205615767585151063497786785792),(3,7563185888920924966167076094025274490880),(6,13730238499813520927903747718110104256512)] orbit.val

/-- Exact candidate at original node80, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,11810578215008288166777117340698935296),(9,3456585923459778000400954660301393887232),(11,61868493386213052420389222429321441280),(12,1847440437561577199886385778763709063168),(15,16400366050317485120781468096798042206208)] orbit.val

/-- Exact candidate at original node80, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,734399983387879977552869715381881667584),(3,7303070899659499964787533505948100329472),(6,13740600599892681719315571654303183536128)] orbit.val

/-- Exact candidate at original node80, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,753861890368159314474336578582511353856),(3,7335289985814406659682057555545488883712),(6,13688919606757495687499580741505165295616)] orbit.val

/-- Exact candidate at original node80, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13598851817459496498050832442100547584),(9,3387814189673871364611110310518426959872),(11,72167067201362230008064256524895596544),(12,1456713050873740104024265977923328122880),(15,16847778323373628466514483498224414306304)] orbit.val

/-- Exact candidate at original node80, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,472235380333273867166861782203011956736),(3,7525111462709026391983936654966958063616),(6,13780724639897761402505176438463195512832)] orbit.val

/-- Exact candidate at original node80, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,679224808643856840530272120013517225984),(3,7279920957644819329392768826468959518720),(6,13818925716651385491732933929150688788480)] orbit.val

/-- Exact candidate at original node80, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,8709116600909424477679942031990849536),(9,3455960442375656445034552759855221833728),(11,59602284756919349429466895143736630272),(12,1785197058449114490036650983568964208640),(15,16468602580757461952677624295033252011008)] orbit.val

/-- Exact candidate at original node80, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,508546489931070097344769830332080848896),(3,7450382852975254949628993682399899418624),(6,13819142140033736614682211362901185265664)] orbit.val

/-- Exact candidate at original node80, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,516156882099648510871315843623780614144),(3,7490304548026865686670732258284819972096),(6,13771610052813547464113926773724564946944)] orbit.val

/-- Exact candidate at original node80, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14609211822040023291011697235535593472),(9,3503892229639534427630482557853157556224),(11,63235400254015365257353791845238926592),(12,1904238873047040596463426391089026508288),(15,16292095768177431249013700437610206948608)] orbit.val

/-- Exact candidate at original node80, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,508654245255111836543400959548629975040),(3,7450284906899917621812283052059034386432),(6,13819132330785032203300290864025501171712)] orbit.val

/-- Exact candidate at original node80, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,516275943207230846511511566344125415424),(3,7490485884691597037365390828810406985728),(6,13771309655041233777779072480478633132032)] orbit.val

/-- Exact candidate at original node80, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,12117670816572031409573276046399111168),(9,3504361931141905039370909052679405699072),(11,63238863880647517841472823310456669184),(12,1904470099196305105595208168027019376640),(15,16293882917904631967438811555569884677120)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked08000 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 80 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked08001 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 80 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked08002 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 80 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked08010 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 80 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked08011 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 80 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked08012 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 80 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked08020 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 80 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked08021 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 80 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked08022 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 80 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked08030 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 80 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked08031 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 80 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked08032 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 80 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked08040 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 80 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked08041 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 80 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked08042 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 80 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked08050 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 80 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked08051 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 80 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked08052 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 80 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 80 1 :=
  RootFineParent3CacheTable.single 80 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 80 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 80 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 80 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 80 0 0) checked08000 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 80 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 80 0 1) checked08001 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 80 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 80 0 2) checked08002 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 80 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 80 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 80 1 0) checked08010 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 80 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 80 1 1) checked08011 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 80 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 80 1 2) checked08012 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 80 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 80 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 80 2 0) checked08020 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 80 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 80 2 1) checked08021 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 80 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 80 2 2) checked08022 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 80 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 80 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 80 3 0) checked08030 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 80 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 80 3 1) checked08031 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 80 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 80 3 2) checked08032 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 80 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 80 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 80 4 0) checked08040 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 80 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 80 4 1) checked08041 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 80 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 80 4 2) checked08042 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 80 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 80 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 80 5 0) checked08050 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 80 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 80 5 1) checked08051 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 80 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 80 5 2) checked08052 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block080
