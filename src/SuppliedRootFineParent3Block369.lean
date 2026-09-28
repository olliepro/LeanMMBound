import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block369
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node369, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13983571568539976767555571359567314944),(9,3540685885628101154311238538759149453312),(11,61301367012026162963561548985230302720),(12,1885200067940434479801927766553076679680),(15,16276900590790959887811691449976141782528)] orbit.val

/-- Exact candidate at original node369, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,499176933622213490026282044003985653760),(3,7485802510583567029494506637457528717312),(6,13793092038734281142135186194171651162112)] orbit.val

/-- Exact candidate at original node369, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,495089049166970697128213958702621786112),(3,7453795072930435396493106061257637625856),(6,13829187360842655568034654855672906121216)] orbit.val

/-- Exact candidate at original node369, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,11796849286661007799575247567177383936),(9,3538818845312712965503581030005361082368),(11,63836754711750270235312052350721179648),(12,1912567428821274849273019756439468015616),(15,16251051604807662568844486789270437871616)] orbit.val

/-- Exact candidate at original node369, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,512690032812074889314077185055578390528),(3,7473013413925950192248008201454282080256),(6,13792368036202036580093889489123305062400)] orbit.val

/-- Exact candidate at original node369, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,512304828382422621166064763862675095552),(3,7444099837369428955552498216639012012032),(6,13821666817188210084937411895131478425600)] orbit.val

/-- Exact candidate at original node369, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,8486119855984899301973215923794870272),(9,10284184252816778416846623981564418064384),(11,23623847882365149092303802735326353408),(12,1440623453455443591717805872077546803200),(15,10021153808929489604697268003332079441920)] orbit.val

/-- Exact candidate at original node369, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,210497413485533832837185836101780111360),(3,15103507927611860303432263076851660881920),(6,6464066141842667525386525962679724539904)] orbit.val

/-- Exact candidate at original node369, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,1133559930098920577752074316384374358016),(3,14159865106202477539826204619309878083584),(6,6484646446638663544077695939938913091584)] orbit.val

/-- Exact candidate at original node369, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14377429961350307057061332998336544768),(9,3422969386147337794738985833852007612416),(11,69357228648294900409447904088352524288),(12,1465764372440534085670590270534751285248),(15,16805603065742544573779889534159717566464)] orbit.val

/-- Exact candidate at original node369, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,711581290402244141781513779030832185344),(3,7349703379497536442689913604543283724288),(6,13716786813040281077184547492059049623552)] orbit.val

/-- Exact candidate at original node369, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,737419909945086646663944176533260730368),(3,7288988697741794087580179524448797327360),(6,13751662875253180927411851174651107475456)] orbit.val

/-- Exact candidate at original node369, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,40072275235327835270635569105602609152),(9,3487291443140709542646937754370796683264),(11,59260495245771539991624236900602672128),(12,1792223249776946438458112819589756622848),(15,16399224019541306305288664495666406945792)] orbit.val

/-- Exact candidate at original node369, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,463723654982515119063257971287857823744),(3,7564487374644297653609036929292813991936),(6,13749860453313248888983679975052493717504)] orbit.val

/-- Exact candidate at original node369, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,655929215160919927873319682753708425216),(3,7243491569159428347911024001063434846208),(6,13878650698619713385871631191816022261760)] orbit.val

/-- Exact candidate at original node369, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14377432224304698870736475513935626240),(9,3422969517690846369203493844632947654656),(11,69357169923497379585775773638469400576),(12,1465766257775599591401089925867509813248),(15,16805601105325813622594878855980303038464)] orbit.val

/-- Exact candidate at original node369, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,711580827892388810105709937103680307200),(3,7349703312976191865837027728879496724480),(6,13716787342071480985713237209649988501504)] orbit.val

/-- Exact candidate at original node369, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,737419423319719119800902373386483662848),(3,7288988660678910915470232876469255667712),(6,13751663398941431626384839625777426202624)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked36900 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 369 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked36901 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 369 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked36902 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 369 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked36910 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 369 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked36911 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 369 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked36912 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 369 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked36920 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 369 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked36921 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 369 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked36922 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 369 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked36930 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 369 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked36931 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 369 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked36932 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 369 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked36940 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 369 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked36941 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 369 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked36942 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 369 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked36950 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 369 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked36951 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 369 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked36952 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 369 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 369 1 :=
  RootFineParent3CacheTable.single 369 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 369 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 369 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 369 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 369 0 0) checked36900 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 369 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 369 0 1) checked36901 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 369 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 369 0 2) checked36902 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 369 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 369 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 369 1 0) checked36910 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 369 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 369 1 1) checked36911 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 369 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 369 1 2) checked36912 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 369 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 369 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 369 2 0) checked36920 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 369 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 369 2 1) checked36921 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 369 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 369 2 2) checked36922 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 369 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 369 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 369 3 0) checked36930 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 369 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 369 3 1) checked36931 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 369 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 369 3 2) checked36932 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 369 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 369 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 369 4 0) checked36940 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 369 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 369 4 1) checked36941 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 369 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 369 4 2) checked36942 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 369 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 369 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 369 5 0) checked36950 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 369 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 369 5 1) checked36951 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 369 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 369 5 2) checked36952 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block369
