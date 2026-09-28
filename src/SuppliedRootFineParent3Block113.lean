import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block113
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node113, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,735175729186210582975930389046178611200),(3,7300666230945907461824219608704360644608),(6,13742229522807943616855824877882626277376)] orbit.val

/-- Exact candidate at original node113, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,743863071216718664020319052721190600704),(3,7324071905186873202305735551937534754816),(6,13710136506536469795329920270974440177664)] orbit.val

/-- Exact candidate at original node113, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14339474496916610226464476367786344448),(9,3416871571624475477201223785662235279360),(11,71696966301766908141077728460309776896),(12,1466177451846831373009450772658037746688),(15,16808986018670071293077758112484796385792)] orbit.val

/-- Exact candidate at original node113, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,661168842070234925762854822011912323072),(3,7247753229338860450990804683996805464064),(6,13869149411530966284902315369624447746048)] orbit.val

/-- Exact candidate at original node113, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,476767713721723355404390579853819117568),(3,7553028510192833849663799569012347633664),(6,13748275259025504456587784726766998781952)] orbit.val

/-- Exact candidate at original node113, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14759602507198913099546355079414022144),(9,3483885518032391809062823124518836371456),(11,59800292272934756431090742050936233984),(12,1787091191153152020653870511634063736832),(15,16432534878974384162408644142349915168768)] orbit.val

/-- Exact candidate at original node113, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,735176041594611448796908819272158937088),(3,7300666284645893814261603677145378324480),(6,13742229156699556398597462379215628271616)] orbit.val

/-- Exact candidate at original node113, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,743863388198664550447621998737453219840),(3,7324071955556206333579316900586990862336),(6,13710136139185190777629035976308721451008)] orbit.val

/-- Exact candidate at original node113, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14339473174796648269678342775521673216),(9,3416871496412190450378659803891043926016),(11,71697009288299830042885297846777458688),(12,1466176335095054822997357406022979985408),(15,16808987168969719909967394025096842489856)] orbit.val

/-- Exact candidate at original node113, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,473550148480462298204310697783467180032),(3,7525108469692711739271237372824946475008),(6,13779412864766887624180426805024751878144)] orbit.val

/-- Exact candidate at original node113, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,667632874159298611095449181846899785728),(3,7272472417130122994115048597669220974592),(6,13837966191650640056445477096117044772864)] orbit.val

/-- Exact candidate at original node113, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14479417666342113582433460646320275456),(9,3484149544507381271282510744045504954368),(11,59972877342937120385058573229732106240),(12,1793355367225628061792383204364269445120),(15,16426114276197773094613588893347338752000)] orbit.val

/-- Exact candidate at original node113, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,509562492178991644019989234683039711232),(3,7448663891947720173406053625412471226368),(6,13819845098813349844229932015537654595584)] orbit.val

/-- Exact candidate at original node113, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,513007063889959491739416444660176912384),(3,7475498211702132724441931063874054782976),(6,13789566207347969445474627367098933837824)] orbit.val

/-- Exact candidate at original node113, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13867713295053354998912041079864819712),(9,3533522949832668489755751243096594055168),(11,63605202461134260204085717393312752640),(12,1910305014589034426194925271557182502912),(15,16256770602762171130502300602506211402752)] orbit.val

/-- Exact candidate at original node113, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,509550894346273242327622285540712251392),(3,7448579651715903524199517246792275066880),(6,13819940936877884895128835343300178214912)] orbit.val

/-- Exact candidate at original node113, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,512997189188550555932381494059510792192),(3,7475406803566752942347697851089280827392),(6,13789667490184758163375895530484373913600)] orbit.val

/-- Exact candidate at original node113, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13998510296073569479767931250421006336),(9,3533470698210809751839569036814206369792),(11,63627538820569049565597925596786478080),(12,1910785631777651646228535047735567673344),(15,16256189103834957644542504934236184005632)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked11300 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 113 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked11301 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 113 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked11302 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 113 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked11310 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 113 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked11311 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 113 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked11312 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 113 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked11320 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 113 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked11321 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 113 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked11322 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 113 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked11330 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 113 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked11331 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 113 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked11332 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 113 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked11340 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 113 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked11341 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 113 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked11342 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 113 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked11350 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 113 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked11351 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 113 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked11352 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 113 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 113 1 :=
  RootFineParent3CacheTable.single 113 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 113 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 113 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 113 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 113 0 0) checked11300 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 113 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 113 0 1) checked11301 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 113 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 113 0 2) checked11302 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 113 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 113 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 113 1 0) checked11310 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 113 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 113 1 1) checked11311 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 113 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 113 1 2) checked11312 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 113 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 113 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 113 2 0) checked11320 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 113 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 113 2 1) checked11321 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 113 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 113 2 2) checked11322 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 113 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 113 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 113 3 0) checked11330 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 113 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 113 3 1) checked11331 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 113 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 113 3 2) checked11332 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 113 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 113 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 113 4 0) checked11340 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 113 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 113 4 1) checked11341 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 113 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 113 4 2) checked11342 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 113 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 113 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 113 5 0) checked11350 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 113 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 113 5 1) checked11351 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 113 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 113 5 2) checked11352 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block113
