import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block900
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node900, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,5420917193675814501212006689028440064),(9,3011588198391376683975569627821006389248),(11,57782903549773301059046545577073286656),(12,1825620425317496984913856700573601285120),(15,16877659038487738877206289994972456132096)] orbit.val

/-- Exact candidate at original node900, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,488704409049974608516685988528620830720),(3,7152074218173466602384744470669005160448),(6,14137292855716620450754544416435539542016)] orbit.val

/-- Exact candidate at original node900, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,502666005602554907140045873023029346304),(3,7196207524220078160900424941096216297472),(6,14079197953117428593615504061513919889408)] orbit.val

/-- Exact candidate at original node900, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,4566326802953035008344574027769053184),(9,3229375720984623191020457299690427252736),(11,55805088793226704115336935772424330240),(12,1799789677052158292753463753221376133120),(15,16688534669307100438758372312921168763904)] orbit.val

/-- Exact candidate at original node900, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,490696745107599168775817240919123427328),(3,7443902285134443239331674846905755500544),(6,13843472452698019253548482787808286605312)] orbit.val

/-- Exact candidate at original node900, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,490670248414723305152443080368929636352),(3,7444282657871517654303692299028479868928),(6,13843118576653820702199839496235756027904)] orbit.val

/-- Exact candidate at original node900, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,11548440569123726951746854499385344),(11,110218444262607277809406634860388352),(12,1733302500596957925496700391971227877376),(15,20044647215458272005154513330172577882112)] orbit.val

/-- Exact candidate at original node900, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,61520905754078907707873058164310016),(3,1788244810679581854335301036950945792000),(6,19989765151354725728412965965624055431168)] orbit.val

/-- Exact candidate at original node900, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,1667942134247969429231151777109648605184),(3,120364197337366504011857132899461496832),(6,19989765151354725728412965965624055431168)] orbit.val

/-- Exact candidate at original node900, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,4772661642471603322486928361367011328),(9,3119873400778749958508666450975616139264),(11,68656990210730799434643597095040183808),(12,1347731979759284391473490379800794113024),(15,17237036450548824908916687519400348085760)] orbit.val

/-- Exact candidate at original node900, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,729526353670125416688853389348597399552),(3,7295111710077656270826038716498475745280),(6,13753433419192279974141082769786092388352)] orbit.val

/-- Exact candidate at original node900, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,729627807050443369170772820215833034752),(3,7294936979783010113757951686232716083200),(6,13753506696106608178727250369184616415232)] orbit.val

/-- Exact candidate at original node900, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,5362277122823222494422930280924839936),(9,3152078764778298756478972550326626811904),(11,74845797470208670242935707094119119872),(12,1320009846756530087691362364650472540160),(15,17225774796812200924748281323281022221312)] orbit.val

/-- Exact candidate at original node900, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,710104639947412264460770770014391238656),(3,7348612643787311341621707723950159560704),(6,13719354199205338055573496381668614733824)] orbit.val

/-- Exact candidate at original node900, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,770356646485316589779609091185047502848),(3,7580144397601715062719129888806309724160),(6,13427570438853030009157235895641808306176)] orbit.val

/-- Exact candidate at original node900, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,4772230720495688238754757075821133824),(9,3119873558789416572894604739099832090624),(11,68657175427792143654719716635134393856),(12,1347733384870435455165850477797498160128),(15,17237035133131921801702045185024879754752)] orbit.val

/-- Exact candidate at original node900, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,729526801303238006807791018315698143232),(3,7295112638444607907350125764505528958976),(6,13753432043192215747498058092811938430976)] orbit.val

/-- Exact candidate at original node900, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,729628408715785488656570142125363036160),(3,7294937849627282131860838010314572169216),(6,13753505224596994041138566723193230327808)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked90000 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 900 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked90001 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 900 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked90002 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 900 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked90010 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 900 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked90011 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 900 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked90012 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 900 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked90020 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 900 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked90021 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 900 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked90022 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 900 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked90030 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 900 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked90031 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 900 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked90032 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 900 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked90040 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 900 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked90041 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 900 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked90042 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 900 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked90050 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 900 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked90051 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 900 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked90052 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 900 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 900 1 :=
  RootFineParent3CacheTable.single 900 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 900 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 900 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 900 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 900 0 0) checked90000 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 900 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 900 0 1) checked90001 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 900 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 900 0 2) checked90002 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 900 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 900 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 900 1 0) checked90010 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 900 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 900 1 1) checked90011 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 900 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 900 1 2) checked90012 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 900 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 900 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 900 2 0) checked90020 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 900 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 900 2 1) checked90021 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 900 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 900 2 2) checked90022 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 900 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 900 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 900 3 0) checked90030 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 900 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 900 3 1) checked90031 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 900 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 900 3 2) checked90032 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 900 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 900 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 900 4 0) checked90040 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 900 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 900 4 1) checked90041 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 900 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 900 4 2) checked90042 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 900 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 900 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 900 5 0) checked90050 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 900 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 900 5 1) checked90051 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 900 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 900 5 2) checked90052 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block900
