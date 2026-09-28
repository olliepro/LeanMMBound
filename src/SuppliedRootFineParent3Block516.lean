import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block516
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node516, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(9,2883425973253378958968945425001784279040),(11,32603017524966682234664070055691892736),(12,1756363829558380306500195898451524161536),(15,17105678662603335713952169482124165199872)] orbit.val

/-- Exact candidate at original node516, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,856272465053546906163882229760),(3,6287021631106676691942991687999331237888),(6,15491049850977112504659436281469952065536)] orbit.val

/-- Exact candidate at original node516, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,539311700971067851748688888830218993664),(3,8631135904185839142331096877139620790272),(6,12607623877783154667576189109663325749248)] orbit.val

/-- Exact candidate at original node516, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,84801967734106133715192858768572416),(9,654276069563109182889685134868480),(11,70661515544037103144854255731225295360),(12,1995018403929612135821703359088248949760),(15,19712306107222608753446519178269787847168)] orbit.val

/-- Exact candidate at original node516, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,41926531176997397098775194650395279360),(3,329857985472859566913262204715060428800),(6,21406286966290204697643937476267709825024)] orbit.val

/-- Exact candidate at original node516, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,288941822199848274404357658257930584064),(3,82842302082437358027830851280304078848),(6,21406287358657776029223786366094930870272)] orbit.val

/-- Exact candidate at original node516, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13972398095056992425147570350198882304),(9,3536360733130034539845509311508330315776),(11,63265821567192696368273634591925793536),(12,1907639871981584416825299957449098402304),(15,16256832658166193016191744401733612139264)] orbit.val

/-- Exact candidate at original node516, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,511019061837289068604968613314182512640),(3,7563394100496629443115872857684401192960),(6,13703658320606143149935133404634581827584)] orbit.val

/-- Exact candidate at original node516, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,511429538139944301498574746121723183104),(3,7443761750828398997031918869574781501440),(6,13822880193971718363125481259936660848640)] orbit.val

/-- Exact candidate at original node516, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13972526494197867104789682887363395584),(9,3536360614010492199649077739615000985600),(11,63265800448349256422633810694857000960),(12,1907639659797143519373778982962848133120),(15,16256832882189878819105694659473096017920)] orbit.val

/-- Exact candidate at original node516, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,511018073382003125818085527960556666880),(3,7563356268003986143405676735632959864832),(6,13703697141554072392432212612039649001472)] orbit.val

/-- Exact candidate at original node516, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,511430914804712445486581676523342790656),(3,7443799583894057073350378760297586360320),(6,13822840984241292142819014438812236382208)] orbit.val

/-- Exact candidate at original node516, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13972428711790044031172529155339190272),(9,3536360732615051483502791117150294638592),(11,63265818932799920649355049564335153152),(12,1907639848145257749516029125998370013184),(15,16256832654535162463956627053764826537984)] orbit.val

/-- Exact candidate at original node516, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,511017791492571820997031984854523183104),(3,7563356753088895496529048600681243475968),(6,13703696938358594344129894290097398874112)] orbit.val

/-- Exact candidate at original node516, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,511430890743597146184385885676435931136),(3,7443799466963705418362044282333437100032),(6,13822841125232759097109544707623292502016)] orbit.val

/-- Exact candidate at original node516, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13977847041644471897814692932962222080),(9,3536359700836594580552605678626622406656),(11,63265796771170754023707630436761682688),(12,1907639241288854843471494619779950017024),(15,16256828897001797011710352253856869204736)] orbit.val

/-- Exact candidate at original node516, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,511017829016449584145057047169514602496),(3,7563355997609312549431879307870167105536),(6,13703697656314299528079038520593483825152)] orbit.val

/-- Exact candidate at original node516, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,511430657795515565638922012478754783232),(3,7443799251935949102628377317235237060608),(6,13822841573208596993388675545919173689344)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked51600 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 516 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked51601 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 516 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked51602 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 516 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked51610 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 516 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked51611 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 516 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked51612 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 516 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked51620 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 516 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked51621 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 516 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked51622 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 516 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked51630 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 516 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked51631 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 516 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked51632 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 516 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked51640 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 516 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked51641 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 516 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked51642 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 516 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked51650 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 516 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked51651 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 516 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked51652 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 516 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 516 1 :=
  RootFineParent3CacheTable.single 516 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 516 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 516 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 516 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 516 0 0) checked51600 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 516 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 516 0 1) checked51601 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 516 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 516 0 2) checked51602 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 516 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 516 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 516 1 0) checked51610 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 516 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 516 1 1) checked51611 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 516 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 516 1 2) checked51612 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 516 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 516 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 516 2 0) checked51620 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 516 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 516 2 1) checked51621 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 516 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 516 2 2) checked51622 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 516 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 516 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 516 3 0) checked51630 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 516 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 516 3 1) checked51631 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 516 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 516 3 2) checked51632 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 516 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 516 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 516 4 0) checked51640 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 516 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 516 4 1) checked51641 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 516 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 516 4 2) checked51642 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 516 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 516 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 516 5 0) checked51650 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 516 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 516 5 1) checked51651 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 516 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 516 5 2) checked51652 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block516
