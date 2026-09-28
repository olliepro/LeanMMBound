import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block688
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node688, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13827397673175959805113483770999078912),(9,3535077496285355769120793659676184018944),(11,62784024761746440074247443990490563328),(12,1895623345642348676269555116480608238080),(15,16270759218577434816386265171714883633920)] orbit.val

/-- Exact candidate at original node688, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,508564186201746432582824290011555299328),(3,7447822618580928895611981572523406917632),(6,13821684678157386333461169013098203316224)] orbit.val

/-- Exact candidate at original node688, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,508402767571069946336346602160055648256),(3,7448972419695286463509785758546255675392),(6,13820696295673705251809842514926854209536)] orbit.val

/-- Exact candidate at original node688, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13962740073107780145281453151529992192),(9,3721652589758483267746983123305768157184),(11,55130492996295060946214541680478600192),(12,1812873319332148066646502715913036204032),(15,16174452340780027486170993041582352579584)] orbit.val

/-- Exact candidate at original node688, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,491349776448832187690374593681444306944),(3,7902086127398360084162808787654517194752),(6,13384635579092869389802791494297204031488)] orbit.val

/-- Exact candidate at original node688, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,461358033358529353005616317436230893568),(3,7974363874603709403356627369016407621632),(6,13342349574977822905293731189180527017984)] orbit.val

/-- Exact candidate at original node688, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14683652979361094520195670463620317184),(9,3328702167070733495631608033554108252160),(11,57937280293029420959792356680757626880),(12,1626029047462636008092499430661370245120),(15,16750719335134301642451879384273309091840)] orbit.val

/-- Exact candidate at original node688, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,705599436100348188057191622284140347392),(3,7538665654015904737597071652050763251712),(6,13533806392823808736001711601298261934080)] orbit.val

/-- Exact candidate at original node688, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,509351893834916394228895034484606369792),(3,7205668900593089358489244880466148851712),(6,14063050688512055908937834960682410311680)] orbit.val

/-- Exact candidate at original node688, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14352074329864619341166737247682166784),(9,3418681769734281888317006975105627062272),(11,71006688313601284332378554365346650112),(12,1466135314962565214843073440730630180864),(15,16807895635599748654822349168183879473152)] orbit.val

/-- Exact candidate at original node688, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,734694367206747386388666525217454030848),(3,7299120396073345185601661723923433127936),(6,13744256719659969089665646626492278374400)] orbit.val

/-- Exact candidate at original node688, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,733924649690821855009222692687157657600),(3,7301063553501132499416042229886900764672),(6,13743083279748107307230709953059107110912)] orbit.val

/-- Exact candidate at original node688, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14734797189578289306599162985442181120),(9,3485696790832608644917213601589142487040),(11,59773618285103323928935278270507322368),(12,1793358714755370662055354713025389651968),(15,16424507561877400741447872119762683890688)] orbit.val

/-- Exact candidate at original node688, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,473580957509754332824548163969162936320),(3,7524168827949171573364779329011518013440),(6,13780321697481135755466647382652484583424)] orbit.val

/-- Exact candidate at original node688, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,658436226355420907782038636720751116288),(3,7249480794514501315288960793643170398208),(6,13870154462070139438584975445269244018688)] orbit.val

/-- Exact candidate at original node688, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14352073166200982412909278842505396224),(9,3418681703256901778692086213022656233472),(11,71006725360150906550473815620134761472),(12,1466134334144907605940636066430863546368),(15,16807896647011900388059869501717005595648)] orbit.val

/-- Exact candidate at original node688, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,734694643803360100670071801356587368448),(3,7299120439612978390676737057797420613632),(6,13744256399523723170309166016479157551104)] orbit.val

/-- Exact candidate at original node688, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,733924925456609692651566622515719569408),(3,7301063598649016925801397722708109688832),(6,13743082958834435043203010530409336274944)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked68800 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 688 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked68801 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 688 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked68802 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 688 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked68810 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 688 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked68811 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 688 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked68812 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 688 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked68820 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 688 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked68821 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 688 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked68822 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 688 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked68830 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 688 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked68831 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 688 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked68832 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 688 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked68840 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 688 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked68841 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 688 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked68842 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 688 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked68850 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 688 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked68851 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 688 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked68852 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 688 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 688 1 :=
  RootFineParent3CacheTable.single 688 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 688 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 688 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 688 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 688 0 0) checked68800 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 688 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 688 0 1) checked68801 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 688 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 688 0 2) checked68802 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 688 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 688 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 688 1 0) checked68810 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 688 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 688 1 1) checked68811 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 688 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 688 1 2) checked68812 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 688 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 688 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 688 2 0) checked68820 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 688 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 688 2 1) checked68821 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 688 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 688 2 2) checked68822 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 688 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 688 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 688 3 0) checked68830 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 688 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 688 3 1) checked68831 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 688 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 688 3 2) checked68832 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 688 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 688 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 688 4 0) checked68840 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 688 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 688 4 1) checked68841 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 688 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 688 4 2) checked68842 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 688 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 688 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 688 5 0) checked68850 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 688 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 688 5 1) checked68851 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 688 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 688 5 2) checked68852 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block688
