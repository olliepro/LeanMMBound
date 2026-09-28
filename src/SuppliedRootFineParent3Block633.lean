import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block633
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node633, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,11929484420665634470195476754153340928),(9,3534385866944815193401971082039945854976),(11,63819628385770824273529559244859656960),(12,1914973631132044914638765215128004815360),(15,16252962872056765094871513542466201864960)] orbit.val

/-- Exact candidate at original node633, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,513111017558117347713895486376871198720),(3,7475360571888016976227799857833697083392),(6,13789599893493927337714279531422597251072)] orbit.val

/-- Exact candidate at original node633, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,509669890731503135549290882652962816000),(3,7448557231950236119534623982260060160000),(6,13819844360258322406572060010720142557184)] orbit.val

/-- Exact candidate at original node633, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,11650704780402708259657183615755747328),(9,2804259580139171401009289215374855766016),(11,72837979329136214430372060161948994048),(12,2062049811459261792856473313222759902208),(15,16827273407232089545100183103257845123584)] orbit.val

/-- Exact candidate at original node633, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,509587473695011692889659288216989073408),(3,8856166005407391555934542280494801747968),(6,12412318003837658412831773306921374711808)] orbit.val

/-- Exact candidate at original node633, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,667386682698462238214285898455797727232),(3,6053045281212905569408605402307252715520),(6,15057639519028693854033083574870115090432)] orbit.val

/-- Exact candidate at original node633, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,46123059777320640940497977718157082624),(9,3486895286442891636848970347113554640896),(11,59911759318809125140441067470544003840),(12,1786374721676257668738421482221708589568),(15,16398766655724782589987644001109201216256)] orbit.val

/-- Exact candidate at original node633, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,668482720890157502886786389776464347136),(3,7301562586608389591897269047739595882496),(6,13808026175441514566871919438117105303552)] orbit.val

/-- Exact candidate at original node633, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,473591237959525772827572175884093751296),(3,7552516089412731988062674692967583711232),(6,13751964155567803900765728006781488070656)] orbit.val

/-- Exact candidate at original node633, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14348566205863690859128517113491226624),(9,3417313310458010548257736521476967759872),(11,71701032470054757779984747300296555520),(12,1466372129887290236962293136940758796288),(15,16808336443918842427796831952801651194880)] orbit.val

/-- Exact candidate at original node633, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,743868662937093086297901642140285403136),(3,7324105833900067820336502698924658655232),(6,13710096986102900755021570534568221474816)] orbit.val

/-- Exact candidate at original node633, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,735183515742168640316142283135291228160),(3,7300670538049022390435281653641634643968),(6,13742217429148870630904550938856239661056)] orbit.val

/-- Exact candidate at original node633, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13162769993570187686638782055737982976),(9,3484872267628595231883293340848965550080),(11,60094702325233103177187453605221404672),(12,1795891464035246597274716378552066564096),(15,16424050278957416541634138920571174031360)] orbit.val

/-- Exact candidate at original node633, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,477773885529311427876860263230343217152),(3,7552176809033572062499042387216547446784),(6,13748120788377178171280072225186274869248)] orbit.val

/-- Exact candidate at original node633, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,659610296844032224747319178625271463936),(3,7248723286347959545944541127506810372096),(6,13869737899748069890964114569501083697152)] orbit.val

/-- Exact candidate at original node633, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14348565225415179745107339393384841216),(9,3417313254780419341358473277613956661248),(11,71701064282094717748970502571233344000),(12,1466371303219511914026898232728452402176),(15,16808337295432620508776525523326138284544)] orbit.val

/-- Exact candidate at original node633, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,743868897583454557522363646863019606016),(3,7324105871075628415238699935452025061376),(6,13710096714280978688894911293318120865792)] orbit.val

/-- Exact candidate at original node633, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,735183747012853277672220831462832734208),(3,7300670577877302836263200266023105200128),(6,13742217158049905547720553778147227598848)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked63300 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 633 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked63301 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 633 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked63302 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 633 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked63310 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 633 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked63311 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 633 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked63312 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 633 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked63320 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 633 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked63321 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 633 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked63322 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 633 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked63330 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 633 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked63331 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 633 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked63332 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 633 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked63340 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 633 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked63341 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 633 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked63342 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 633 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked63350 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 633 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked63351 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 633 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked63352 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 633 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 633 1 :=
  RootFineParent3CacheTable.single 633 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 633 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 633 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 633 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 633 0 0) checked63300 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 633 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 633 0 1) checked63301 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 633 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 633 0 2) checked63302 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 633 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 633 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 633 1 0) checked63310 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 633 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 633 1 1) checked63311 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 633 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 633 1 2) checked63312 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 633 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 633 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 633 2 0) checked63320 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 633 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 633 2 1) checked63321 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 633 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 633 2 2) checked63322 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 633 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 633 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 633 3 0) checked63330 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 633 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 633 3 1) checked63331 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 633 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 633 3 2) checked63332 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 633 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 633 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 633 4 0) checked63340 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 633 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 633 4 1) checked63341 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 633 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 633 4 2) checked63342 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 633 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 633 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 633 5 0) checked63350 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 633 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 633 5 1) checked63351 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 633 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 633 5 2) checked63352 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block633
