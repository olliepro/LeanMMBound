import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block485
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node485, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,657047428731013338208560933738645553152),(3,7244122606439823459264426364819197657088),(6,13876901447769224864182987577075322322944)] orbit.val

/-- Exact candidate at original node485, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,11005833514629655610669145613494386688),(9,3391305762931457657457773237776527917056),(11,57243028055144518417102356997842182400),(12,1749167952368963848640488204978958548480),(15,16569348906069865981529941930266342498560)] orbit.val

/-- Exact candidate at original node485, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,464956166108686455620834256110221262848),(3,7521613968605880195998618734067307249664),(6,13791501348225495010036521885455637020672)] orbit.val

/-- Exact candidate at original node485, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,733128130257627476573140321931624448000),(3,7297586953383438701775864300393103097856),(6,13747356399298995483306970253308437987328)] orbit.val

/-- Exact candidate at original node485, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,10690270021145013039133765873694670848),(9,3325479387798250119446873727433518874624),(11,70088986443961569221432550738019490816),(12,1419647560483073131743042556970309502976),(15,16952165278193631828205492274617622993920)] orbit.val

/-- Exact candidate at original node485, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,732495775646874120511560842660640980992),(3,7298516920540066636466642140669216292864),(6,13747058786753120904677771892303308259328)] orbit.val

/-- Exact candidate at original node485, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,501763629083791313812792932133129682944),(3,7447278121676691843064169983671328047104),(6,13829029732179578504779011959828707803136)] orbit.val

/-- Exact candidate at original node485, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,10403569575045284194293684776441217024),(9,3440023436864871582855072880282310803456),(11,60300039594271857693377079231846578432),(12,1862751613480022839783434763536314600960),(15,16404592823425850097129796467806252333312)] orbit.val

/-- Exact candidate at original node485, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,501606205807734172481928257867219992576),(3,7447688331986906648832970187630006239232),(6,13828776945145420840341076430135939301376)] orbit.val

/-- Exact candidate at original node485, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,502204194055014592270046146509402013696),(3,7446055863127012567359915809905622122496),(6,13829811425758034502026012919218141396992)] orbit.val

/-- Exact candidate at original node485, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,10402968055028435270876590192384278528),(9,3440634375283043954316686050963836895232),(11,60379082490971523082629541812941959936),(12,1863512947041570643192457030706426386944),(15,16403142110069447105793325661957576012544)] orbit.val

/-- Exact candidate at original node485, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,502042626591083394974147018402161491968),(3,7446372774160309351656574481962041868288),(6,13829656082188668915025253375268962172928)] orbit.val

/-- Exact candidate at original node485, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,733128016498216190994327195030999007232),(3,7297586932103398741948255520197661687808),(6,13747356534338446728713392160404504838144)] orbit.val

/-- Exact candidate at original node485, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,10690270377671744353323285044642447360),(9,3325479414448623285182540285461865168896),(11,70088970069514301468034186265281769472),(12,1419647961704144825261944010140668502016),(15,16952164866340107505390133108720707645440)] orbit.val

/-- Exact candidate at original node485, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,732495662152571977651784441036118425600),(3,7298516898846364729205751002209777090560),(6,13747058921941124954798439432387270017024)] orbit.val

/-- Exact candidate at original node485, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,465787701803823948770755938066362269696),(3,7521675341942844384402743349108847673344),(6,13790608439193393328482475588457955590144)] orbit.val

/-- Exact candidate at original node485, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,11006359525255868283030992450570158080),(9,3391664985014764102563992160117423341568),(11,57316369376050192409089100617896889856),(12,1749969442416469909439954483427914408960),(15,16568114326607521588959908139019360734720)] orbit.val

/-- Exact candidate at original node485, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,656963320579237118218161597019534131200),(3,7245979390392192139494570221554716639232),(6,13875128771968632403943243057058914762752)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked48500 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 485 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked48501 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 485 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked48502 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 485 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked48510 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 485 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked48511 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 485 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked48512 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 485 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked48520 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 485 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked48521 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 485 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked48522 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 485 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked48530 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 485 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked48531 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 485 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked48532 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 485 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked48540 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 485 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked48541 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 485 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked48542 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 485 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked48550 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 485 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked48551 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 485 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked48552 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 485 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 485 1 :=
  RootFineParent3CacheTable.single 485 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 485 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 485 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 485 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 485 0 0) checked48500 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 485 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 485 0 1) checked48501 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 485 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 485 0 2) checked48502 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 485 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 485 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 485 1 0) checked48510 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 485 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 485 1 1) checked48511 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 485 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 485 1 2) checked48512 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 485 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 485 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 485 2 0) checked48520 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 485 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 485 2 1) checked48521 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 485 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 485 2 2) checked48522 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 485 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 485 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 485 3 0) checked48530 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 485 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 485 3 1) checked48531 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 485 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 485 3 2) checked48532 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 485 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 485 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 485 4 0) checked48540 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 485 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 485 4 1) checked48541 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 485 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 485 4 2) checked48542 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 485 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 485 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 485 5 0) checked48550 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 485 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 485 5 1) checked48551 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 485 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 485 5 2) checked48552 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block485
