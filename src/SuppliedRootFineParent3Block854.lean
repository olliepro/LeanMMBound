import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block854
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node854, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,11022865742370724458030471811709272064),(9,3443087881041318597503339658823665188864),(11,60442119313802280674564127955163549696),(12,1864988522588218760497974879299717029888),(15,16398530094254351298522065737742910492672)] orbit.val

/-- Exact candidate at original node854, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,501962520441805024103393283549010329600),(3,7446894484014539865348871665741121716224),(6,13829214478483716772203709926343033487360)] orbit.val

/-- Exact candidate at original node854, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,501951000578195713839089260698603094016),(3,7446883129529112390099230410749100687360),(6,13829237352832753557717655204185461751808)] orbit.val

/-- Exact candidate at original node854, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,10555163790462127406673120648486715392),(9,3439318286871967696298567403000807030784),(11,61148896524292731313871583126697135104),(12,1881247540944870869912018416436612720640),(15,16385801594808468236724844352420561931264)] orbit.val

/-- Exact candidate at original node854, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,502010958946758669833604590975708037120),(3,7447493526387624406949258531367725039616),(6,13828566997605678584873111753289732456448)] orbit.val

/-- Exact candidate at original node854, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,502075074826305161960671122335719227392),(3,7448005201912010834152598203407062269952),(6,13827991206201745665542705549890384035840)] orbit.val

/-- Exact candidate at original node854, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,1277012279139077389891093952091652096),(9,3396230984758910518532009626896168910848),(11,57328864134983148410254157666757582848),(12,1751939811068692419000161243877905383424),(15,16571294810698336498323658753240242003968)] orbit.val

/-- Exact candidate at original node854, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,656697975611879403818146749379122298880),(3,7246648564027353145651135967488064356352),(6,13874724943300829112186692158765978877952)] orbit.val

/-- Exact candidate at original node854, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,464439525096043755053115641077392474112),(3,7522372598770205495846240282177825669120),(6,13791259359073812410756618952377947389952)] orbit.val

/-- Exact candidate at original node854, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,10844723174902663165852222579995049984),(9,3328665084428303897351227797300083425280),(11,70073052270020015899603019792583147520),(12,1422755781840199715575440788105952657408),(15,16945732841226635369663851047854551252992)] orbit.val

/-- Exact candidate at original node854, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,732679985128533276101503581825160708096),(3,7298010504120087932054786606817976778752),(6,13747380993691440453499684686990028046336)] orbit.val

/-- Exact candidate at original node854, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,732446396405364135976828409402831667200),(3,7298369535377273605447873127129259442176),(6,13747255551157423920231273339101074423808)] orbit.val

/-- Exact candidate at original node854, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,8185102385742827177177871475066011648),(9,3395519532066643419104618161201485971456),(11,57249964619906307116783103893447285760),(12,1750620027002587588615621244876722718720),(15,16566496856865181519641774494186443545600)] orbit.val

/-- Exact candidate at original node854, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,465505655947003563074332704170471063552),(3,7522296634314137460966458015690874945536),(6,13790269192678920637615184155771819524096)] orbit.val

/-- Exact candidate at original node854, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,658290141122762002827307462232410947584),(3,7243860803038221108884871557487876112384),(6,13875920538779078549943795855912878473216)] orbit.val

/-- Exact candidate at original node854, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,10844723174902663165852222579995049984),(9,3328665084428303897351227797300083425280),(11,70073052269719122937224902888811309568),(12,1422755781837911320175792976549329415168),(15,16945732841229224658025876976314946333184)] orbit.val

/-- Exact candidate at original node854, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,732679985127088185439301559143077249024),(3,7298010504121533022716988629500060237824),(6,13747380993691440453499684686990028046336)] orbit.val

/-- Exact candidate at original node854, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,732446396403919045314626386720748208128),(3,7298369535378718696110075149811342901248),(6,13747255551157423920231273339101074423808)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked85400 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 854 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked85401 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 854 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked85402 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 854 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked85410 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 854 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked85411 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 854 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked85412 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 854 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked85420 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 854 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked85421 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 854 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked85422 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 854 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked85430 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 854 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked85431 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 854 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked85432 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 854 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked85440 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 854 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked85441 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 854 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked85442 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 854 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked85450 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 854 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked85451 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 854 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked85452 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 854 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 854 1 :=
  RootFineParent3CacheTable.single 854 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 854 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 854 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 854 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 854 0 0) checked85400 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 854 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 854 0 1) checked85401 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 854 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 854 0 2) checked85402 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 854 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 854 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 854 1 0) checked85410 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 854 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 854 1 1) checked85411 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 854 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 854 1 2) checked85412 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 854 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 854 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 854 2 0) checked85420 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 854 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 854 2 1) checked85421 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 854 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 854 2 2) checked85422 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 854 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 854 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 854 3 0) checked85430 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 854 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 854 3 1) checked85431 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 854 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 854 3 2) checked85432 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 854 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 854 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 854 4 0) checked85440 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 854 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 854 4 1) checked85441 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 854 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 854 4 2) checked85442 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 854 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 854 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 854 5 0) checked85450 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 854 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 854 5 1) checked85451 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 854 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 854 5 2) checked85452 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block854
