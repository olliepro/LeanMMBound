import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block241
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node241, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,655947526051204354118825298749183492096),(3,7243626802522372968308897489737658400768),(6,13878497154366484339228252087146323640320)] orbit.val

/-- Exact candidate at original node241, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,8431468794369136418902425864081768448),(9,3328538396833616972733034209067143266304),(11,55951674627340255582019204635438169088),(12,1728438760948030120900408197480834238464),(15,16656711181736705176021610838585668090880)] orbit.val

/-- Exact candidate at original node241, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,460132936762710584345377363138661318656),(3,7521765105275670127545467538733965246464),(6,13796173440901680949765129973760538968064)] orbit.val

/-- Exact candidate at original node241, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,731981489070091813765055096711765032960),(3,7297143239875706809351821628232578367488),(6,13748946753994263038539098150688822132736)] orbit.val

/-- Exact candidate at original node241, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,9031335968146967724810696705917845504),(9,3262597704776162206866188403144810037248),(11,69668343879192721807955840154324659456),(12,1398089336884709499305636107017615648256),(15,17038684761431850265951383828610497342720)] orbit.val

/-- Exact candidate at original node241, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,732175847273947611765765680401506893824),(3,7296839197307397675359531223271025410048),(6,13749056438358716374530677971960633229312)] orbit.val

/-- Exact candidate at original node241, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,498932357490989520562252241024187367424),(3,7445598648746267995909611838730227679232),(6,13833540476702804145184110795878750486528)] orbit.val

/-- Exact candidate at original node241, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,8773913784424849237493157616668377088),(9,3376308123321875161297728748579561930752),(11,58904736447447319871337826793067120640),(12,1842326447290487525991859389833054515200),(15,16491758262095826805257555752810813589504)] orbit.val

/-- Exact candidate at original node241, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,498933468647802459006556162479982903296),(3,7445576642607505886131591781139708116992),(6,13833561371684753316517826932013474512896)] orbit.val

/-- Exact candidate at original node241, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,498620849239756633165082676811941281792),(3,7445977097743518972902521901755096104960),(6,13833473535956786055588370297066128146432)] orbit.val

/-- Exact candidate at original node241, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,8677980537156057764271253410281422848),(9,3375277218003888959719564195658031169536),(11,58845247503511865599025593790995869952),(12,1841840917378690876599709588685582278144),(15,16493430119516813901973404244088274792704)] orbit.val

/-- Exact candidate at original node241, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,498488838081861744579221288964384096256),(3,7446140380113557197065327349511552499712),(6,13833442264744642720011426237157228937216)] orbit.val

/-- Exact candidate at original node241, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,731981450381041689071259995080048508928),(3,7297143233147212772743585204365225361408),(6,13748946799411807199841129676187891662848)] orbit.val

/-- Exact candidate at original node241, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,9031336091940971653348724195830267904),(9,3262597715625468711163261132360734736384),(11,69668338334808980116945425400564672000),(12,1398089498375137765399722923287743575040),(15,17038684594512705233322696670388292281856)] orbit.val

/-- Exact candidate at original node241, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,732175808544080919591782466689962082304),(3,7296839191080233900845644373745974902784),(6,13749056483315746841218548035197228548096)] orbit.val

/-- Exact candidate at original node241, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,460813891092090519277777121868387450880),(3,7521367874235727122946894108500470792192),(6,13795889717612244019431303645264307290112)] orbit.val

/-- Exact candidate at original node241, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,6684903110102227077197883817771139072),(9,3328899522432948944925662069496603475968),(11,55898279168330202042474143824140802048),(12,1727988799355494708583592969889744736256),(15,16658599978873185579027047808604905379840)] orbit.val

/-- Exact candidate at original node241, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,657465048644331497597056242530775990272),(3,7241794874177092962575330336275626459136),(6,13878811560118637201483588296826763083776)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked24100 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 241 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked24101 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 241 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked24102 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 241 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked24110 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 241 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked24111 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 241 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked24112 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 241 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked24120 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 241 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked24121 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 241 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked24122 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 241 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked24130 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 241 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked24131 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 241 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked24132 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 241 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked24140 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 241 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked24141 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 241 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked24142 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 241 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked24150 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 241 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked24151 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 241 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked24152 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 241 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 241 1 :=
  RootFineParent3CacheTable.single 241 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 241 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 241 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 241 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 241 0 0) checked24100 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 241 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 241 0 1) checked24101 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 241 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 241 0 2) checked24102 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 241 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 241 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 241 1 0) checked24110 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 241 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 241 1 1) checked24111 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 241 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 241 1 2) checked24112 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 241 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 241 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 241 2 0) checked24120 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 241 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 241 2 1) checked24121 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 241 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 241 2 2) checked24122 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 241 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 241 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 241 3 0) checked24130 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 241 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 241 3 1) checked24131 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 241 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 241 3 2) checked24132 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 241 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 241 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 241 4 0) checked24140 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 241 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 241 4 1) checked24141 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 241 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 241 4 2) checked24142 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 241 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 241 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 241 5 0) checked24150 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 241 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 241 5 1) checked24151 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 241 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 241 5 2) checked24152 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block241
