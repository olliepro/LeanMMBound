import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block864
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node864, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13975223713003701934191111999626149888),(9,3535152399050710449239716058389305884672),(11,63813549576508734182104623952173063168),(12,1910160440171367218150454851919646312448),(15,16254969870428471558149508229372414123008)] orbit.val

/-- Exact candidate at original node864, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,517960239932177106535536471601622024192),(3,7485497449026686454622714667771510128640),(6,13774613793981198100497723736260033380352)] orbit.val

/-- Exact candidate at original node864, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,510414087521437325064712398472046706688),(3,7450685418644081518944850952594141478912),(6,13816971976774542817646411524566977347584)] orbit.val

/-- Exact candidate at original node864, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13980378153655835414890836080736600064),(9,3181536903720845482797268422064416489472),(11,64274612152979575866690325910638886912),(12,1944799041086562825512395224494568767488),(15,16573480547826017942064730067082804789248)] orbit.val

/-- Exact candidate at original node864, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,527529297394479495221455673436300902400),(3,7552657800601778807637767941104930390016),(6,13697884384943803358796751261091934240768)] orbit.val

/-- Exact candidate at original node864, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,517679585034911209106401051508838760448),(3,7447858414367875858502509769033691168768),(6,13812533483537274594047064055090635603968)] orbit.val

/-- Exact candidate at original node864, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13957448780660183744363099522034827264),(9,3486151528754561435252133337649719017472),(11,60385444168131687724757307668708020224),(12,1797394504948450378773509414912055926784),(15,16420182556288257976161211715880647741440)] orbit.val

/-- Exact candidate at original node864, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,684518159631355799889908302630195560448),(3,7271362548573272417855720071096877187072),(6,13822190774735433443910346501906092785664)] orbit.val

/-- Exact candidate at original node864, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,473919749055798148286473519256731385856),(3,7528047167837929580371082255265861468160),(6,13776104566046333932998419101110572679168)] orbit.val

/-- Exact candidate at original node864, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14396548519150144498649073288185118720),(9,3418460527185055351625140428753631969280),(11,72435903864872392922871401324250081536),(12,1469756520634645943361514153345789046272),(15,16803021982736337829247799818921309317376)] orbit.val

/-- Exact candidate at original node864, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,754080961287005697724764304243574177792),(3,7330481462253575595005766371707344388096),(6,13693509059399480368925444199682246967296)] orbit.val

/-- Exact candidate at original node864, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,734727331134088643017167650630385270784),(3,7303721847998251974381705625579330469888),(6,13739622303807721044257101599423449792512)] orbit.val

/-- Exact candidate at original node864, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14814157682930993094202572552561229824),(9,3486116734721593024797116434004226080768),(11,60634714704075103396611202213171138560),(12,1803065104680609041070398884580346093568),(15,16413440771150853499297645782282860990464)] orbit.val

/-- Exact candidate at original node864, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,482643121070361859291483737978912636928),(3,7562039630472112401258930459644371402752),(6,13733388731397587401105560678009881493504)] orbit.val

/-- Exact candidate at original node864, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,658725030656690967871190413293144506368),(3,7251777622683536390551403953047262461952),(6,13867568829599834303233380509292758564864)] orbit.val

/-- Exact candidate at original node864, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14396560235014676295487994933496774656),(9,3418461191156671302417421631448707760128),(11,72435518875012403298550318157394945024),(12,1469766406101050191632674974180600297472),(15,16803011806572313088011839956912965755904)] orbit.val

/-- Exact candidate at original node864, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,754078129980634218010448204493802700800),(3,7330481026804543245944348730054569623552),(6,13693512326154884197701177941084793208832)] orbit.val

/-- Exact candidate at original node864, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,734724588632831116162448064980570865664),(3,7303721338272569973513914376042720526336),(6,13739625556034660571979612434609874141184)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked86400 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 864 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked86401 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 864 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked86402 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 864 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked86410 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 864 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked86411 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 864 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked86412 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 864 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked86420 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 864 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked86421 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 864 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked86422 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 864 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked86430 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 864 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked86431 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 864 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked86432 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 864 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked86440 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 864 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked86441 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 864 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked86442 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 864 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked86450 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 864 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked86451 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 864 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked86452 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 864 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 864 1 :=
  RootFineParent3CacheTable.single 864 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 864 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 864 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 864 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 864 0 0) checked86400 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 864 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 864 0 1) checked86401 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 864 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 864 0 2) checked86402 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 864 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 864 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 864 1 0) checked86410 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 864 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 864 1 1) checked86411 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 864 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 864 1 2) checked86412 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 864 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 864 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 864 2 0) checked86420 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 864 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 864 2 1) checked86421 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 864 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 864 2 2) checked86422 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 864 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 864 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 864 3 0) checked86430 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 864 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 864 3 1) checked86431 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 864 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 864 3 2) checked86432 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 864 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 864 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 864 4 0) checked86440 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 864 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 864 4 1) checked86441 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 864 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 864 4 2) checked86442 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 864 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 864 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 864 5 0) checked86450 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 864 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 864 5 1) checked86451 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 864 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 864 5 2) checked86452 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block864
