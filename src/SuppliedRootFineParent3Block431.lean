import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block431
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node431, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,660563598845866364934622839109796757504),(3,7244717802243066081600518745883773239296),(6,13872790081851129215120833290639595536384)] orbit.val

/-- Exact candidate at original node431, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,15487267871286993195424994955303583744),(9,3486072126844686777132847451057499930624),(11,59423720283414499035246797891385290752),(12,1788174528028034637052413466585140568064),(15,16428913839912638755240042165143836160000)] orbit.val

/-- Exact candidate at original node431, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,470091864284122514934438606098374066176),(3,7532126473146126393072607011268510875648),(6,13775853145509812753648929258266280591360)] orbit.val

/-- Exact candidate at original node431, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,735621597916127698162738510645023473664),(3,7295674745644815020012630823267171565568),(6,13746775139379118943480605541720970493952)] orbit.val

/-- Exact candidate at original node431, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14353250769042753023749579383414718464),(9,3419730821079421304584873786465419526144),(11,70462945133249568115747405529137729536),(12,1465860624025584457940827829911451492352),(15,16807663841932763577990776274343742066688)] orbit.val

/-- Exact candidate at original node431, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,726192649747224193736176961928950710272),(3,7310364742489886595074814896846650998784),(6,13741514090702950872844983016857563824128)] orbit.val

/-- Exact candidate at original node431, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,508694023536061295436067679297972731904),(3,7445395928407077488090994795731646152704),(6,13823981530996922878128912400603546648576)] orbit.val

/-- Exact candidate at original node431, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13961572428255685546040083899175927808),(9,3535746380913940473290693346906282655744),(11,63047342088907591572891869690387632128),(12,1904288163805289978924962530487286620160),(15,16261028023703667932321387044650032697344)] orbit.val

/-- Exact candidate at original node431, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,505219032259934039082002026749325475840),(3,7455283533266625685674896604901060640768),(6,13817568917413501936899076243982779416576)] orbit.val

/-- Exact candidate at original node431, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,508629646156241437966542457323961450496),(3,7445529316428082242197778401049140264960),(6,13823912520355737981491654017260063817728)] orbit.val

/-- Exact candidate at original node431, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14014582486458892043301509879010689024),(9,3535734886898167236706200005716880654336),(11,63046711507636820430675970933806917120),(12,1904277354189411175946097692633971700736),(15,16260997947858387536529699696469495571968)] orbit.val

/-- Exact candidate at original node431, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,505269392922937276591938774068858191872),(3,7455129960115418093784334392437212446720),(6,13817672129901706291279701709127094894592)] orbit.val

/-- Exact candidate at original node431, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,735622119273942909660443785722299678720),(3,7295674819562847099282884536182769713152),(6,13746774544103271652712646553728096141312)] orbit.val

/-- Exact candidate at original node431, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14353248585316523724338774461359587328),(9,3419730695681047085132993460283732131840),(11,70463013379615561058281980146628816896),(12,1465858776589555199155919759778051792896),(15,16807665748704527292584440900963393204224)] orbit.val

/-- Exact candidate at original node431, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,726193161582518421216977426788063903744),(3,7310364827257511380475901074672273326080),(6,13741513494100031859963096374172828303360)] orbit.val

/-- Exact candidate at original node431, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,474259968121763390158076526168299798528),(3,7521840545896395348666984074169225838592),(6,13781970968921902922830914275295639896064)] orbit.val

/-- Exact candidate at original node431, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14911295138848879499657645431835328512),(9,3486599680771132345321150836074669408256),(11,59470571990897136751570369425809316864),(12,1790360193412568626600426167015828408320),(15,16426729741626614673483169857685023071232)] orbit.val

/-- Exact candidate at original node431, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,651746922925378543577193941687796236288),(3,7258258605688394181418368760857218777088),(6,13868065954326288936660412173088150519808)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked43100 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 431 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked43101 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 431 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked43102 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 431 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked43110 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 431 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked43111 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 431 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked43112 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 431 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked43120 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 431 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked43121 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 431 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked43122 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 431 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked43130 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 431 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked43131 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 431 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked43132 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 431 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked43140 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 431 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked43141 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 431 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked43142 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 431 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked43150 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 431 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked43151 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 431 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked43152 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 431 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 431 1 :=
  RootFineParent3CacheTable.single 431 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 431 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 431 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 431 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 431 0 0) checked43100 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 431 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 431 0 1) checked43101 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 431 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 431 0 2) checked43102 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 431 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 431 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 431 1 0) checked43110 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 431 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 431 1 1) checked43111 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 431 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 431 1 2) checked43112 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 431 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 431 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 431 2 0) checked43120 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 431 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 431 2 1) checked43121 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 431 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 431 2 2) checked43122 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 431 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 431 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 431 3 0) checked43130 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 431 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 431 3 1) checked43131 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 431 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 431 3 2) checked43132 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 431 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 431 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 431 4 0) checked43140 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 431 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 431 4 1) checked43141 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 431 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 431 4 2) checked43142 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 431 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 431 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 431 5 0) checked43150 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 431 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 431 5 1) checked43151 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 431 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 431 5 2) checked43152 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block431
