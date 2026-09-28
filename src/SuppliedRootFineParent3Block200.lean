import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block200
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node200, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,702278173691762587948437421193215082496),(3,7295229969377341003267426701253260869632),(6,13780563339870958070440110753186689581056)] orbit.val

/-- Exact candidate at original node200, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,2916586732556355927662336671744),(9,2528221075991466512737303143558882000896),(11,62648849929567034736614825231394500608),(12,1244749914714289600427607837704004378624),(15,17942451639388151781198093141476547981312)] orbit.val

/-- Exact candidate at original node200, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,702304371539094791993648253400525045760),(3,7296403331511234048409649930638177861632),(6,13779363779889732821252676691594462625792)] orbit.val

/-- Exact candidate at original node200, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,702279849581381004538037682270715772928),(3,7295230448013422239425081437910349119488),(6,13780561185345258417692855755452100640768)] orbit.val

/-- Exact candidate at original node200, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,3634591955341876487103828721664),(9,2528220770517382418676866509450988486656),(11,62649127218217839565157054831709311488),(12,1244743845893133389938488160800628431872),(15,17942457735676736058133586663446010581504)] orbit.val

/-- Exact candidate at original node200, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,702306047404966419281457031045483331584),(3,7296403815400120799810542431901709238272),(6,13779361620134974442563975412685972963328)] orbit.val

/-- Exact candidate at original node200, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,466726860215051855324905194786167717888),(3,7437496901641583042830911337647078113280),(6,13873847721083426763500158343199919702016)] orbit.val

/-- Exact candidate at original node200, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,293604714997392210558375090454528),(9,2617423239297117993642147985358134968320),(11,46360573809499156950776107801247440896),(12,1659389141117114696918930654161982275584),(15,17454898235111614816751909569936710393856)] orbit.val

/-- Exact candidate at original node200, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,466749056685819215815652378788663132160),(3,7438670562052483815598166698490553434112),(6,13872651864201758630242155798353948966912)] orbit.val

/-- Exact candidate at original node200, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,466769790490692878717937507642680279040),(3,7437499519384031701991343977128192376832),(6,13873802173065337080946693390862292877312)] orbit.val

/-- Exact candidate at original node200, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,298412874109976627546083288940544),(9,2617046011881019678708265807414244147200),(11,46364819071177438471784891512127911424),(12,1659452069728031906426890043021505795072),(15,17455208283846958528072406587601998738944)] orbit.val

/-- Exact candidate at original node200, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,466786823313191974321130083476498808832),(3,7438596410866973132152528815364035837952),(6,13872688248759896555182315976792630886400)] orbit.val

/-- Exact candidate at original node200, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,702276675246919321943640516356684644352),(3,7295229530188531259480734291781362909184),(6,13780565277504611080231600067495117979648)] orbit.val

/-- Exact candidate at original node200, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,2659095204384996830483318833152),(9,2528221335255724820353064876232266481664),(11,62648601419148753593783665446820379648),(12,1244755105021047098612180094467296200704),(15,17942446438585045784711949409003463638016)] orbit.val

/-- Exact candidate at original node200, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,702302873198851399777044561870859534336),(3,7296402891415639285377837889724782477312),(6,13779365718325570976501092424037523521536)] orbit.val

/-- Exact candidate at original node200, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,702282415168526063810336866189705216000),(3,7295231193712860102102215244065202503680),(6,13780557874058675495743422765378257813504)] orbit.val

/-- Exact candidate at original node200, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,2961152573970629617558705143808),(9,2528220314801943396785538192485782650880),(11,62649552148071267449799999936704907264),(12,1244734753207648781615110746469737754624),(15,17942466859821245641834896319182235076608)] orbit.val

/-- Exact candidate at original node200, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,702308612992438621685751137753408471040),(3,7296404559044251054141950058935080714240),(6,13779358310903371985828273678944676347904)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked20000 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 200 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked20001 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 200 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked20002 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 200 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked20010 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 200 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked20011 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 200 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked20012 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 200 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked20020 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 200 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked20021 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 200 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked20022 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 200 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked20030 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 200 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked20031 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 200 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked20032 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 200 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked20040 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 200 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked20041 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 200 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked20042 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 200 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked20050 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 200 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked20051 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 200 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked20052 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 200 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 200 1 :=
  RootFineParent3CacheTable.single 200 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 200 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 200 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 200 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 200 0 0) checked20000 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 200 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 200 0 1) checked20001 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 200 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 200 0 2) checked20002 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 200 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 200 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 200 1 0) checked20010 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 200 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 200 1 1) checked20011 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 200 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 200 1 2) checked20012 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 200 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 200 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 200 2 0) checked20020 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 200 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 200 2 1) checked20021 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 200 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 200 2 2) checked20022 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 200 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 200 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 200 3 0) checked20030 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 200 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 200 3 1) checked20031 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 200 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 200 3 2) checked20032 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 200 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 200 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 200 4 0) checked20040 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 200 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 200 4 1) checked20041 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 200 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 200 4 2) checked20042 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 200 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 200 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 200 5 0) checked20050 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 200 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 200 5 1) checked20051 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 200 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 200 5 2) checked20052 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block200
