import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block185
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node185, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,691685124206418765923399977645469859840),(3,7256980693394373628570475125050280247296),(6,13829405665339269267162099772937415426048)] orbit.val

/-- Exact candidate at original node185, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,2040125184742306693033756721152),(9,575080861854489848833117586150727352320),(11,60466435184791980815502091026261826560),(12,1240823982854162575575788551240258504704),(15,19901700201006492071689259954182161128448)] orbit.val

/-- Exact candidate at original node185, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,694369452581929657657529717404637069312),(3,7265960745733875523734645630798680555520),(6,13817741284624256480263799527429847908352)] orbit.val

/-- Exact candidate at original node185, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,692033152403119202756667164263746371584),(3,7257271457172646041269317438516236386304),(6,13828766873364296417629990272853182775296)] orbit.val

/-- Exact candidate at original node185, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,1911379420656627144444247801856),(9,575092289026452724164217603887017754624),(11,60523312565222085549388240213482598400),(12,1241404592390232464558230875982508204032),(15,19901051287046774966727511011105909174272)] orbit.val

/-- Exact candidate at original node185, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,694716297157847457540859309166247804928),(3,7266203940652579838894562278305060356096),(6,13817151245129634365220553288161857372160)] orbit.val

/-- Exact candidate at original node185, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,691992399281825193903336202547203407872),(3,7260784133234106750414055743732423065600),(6,13825294950424129717338582929353539059712)] orbit.val

/-- Exact candidate at original node185, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,3164174740413431982642161516544),(9,575208086739912624092058086101563211776),(11,60488742677210412508780130570441390080),(12,1241389293547786208541716331053586976768),(15,19900985356810977676099988345265412438016)] orbit.val

/-- Exact candidate at original node185, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,694676090575164718471003915729841946624),(3,7269718173544494747574025533044289437696),(6,13813677218820402195610945426859034148864)] orbit.val

/-- Exact candidate at original node185, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,691617508585948317113769096731730903040),(3,7256954493209543121821287584614055936000),(6,13829499481144570222720918194287378694144)] orbit.val

/-- Exact candidate at original node185, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,2485783598885043591997441441792),(9,575078745264224759947055732424901132288),(11,60455160415534917024801916782154387456),(12,1240709665660652797010867305740086206464),(15,19901827909113865588788206328688582365184)] orbit.val

/-- Exact candidate at original node185, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,694299582716274174984705996057915424768),(3,7265887573772103728758983394466602156032),(6,13817884326451683757912285485108647952384)] orbit.val

/-- Exact candidate at original node185, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,691650348188770418156066837064977481728),(3,7256979314734397586535623614859862605824),(6,13829441820016893656964284423708325445632)] orbit.val

/-- Exact candidate at original node185, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,1133953075985408331807597789184),(9,575079786921443176394575764643584671744),(11,60460545338516956131988799428304511488),(12,1240763173377058290487125696126837177344),(15,19901767976169090162656876283626841383424)] orbit.val

/-- Exact candidate at original node185, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,694332515140810835379485062598427148288),(3,7265912492429715022226729000126361108480),(6,13817826475369535804049760812908377276416)] orbit.val

/-- Exact candidate at original node185, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,691938818754869330547519644266429153280),(3,7257178414216038574834881702834024218624),(6,13828954249969153756273573528532712161280)] orbit.val

/-- Exact candidate at original node185, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,2183726229299410804922055131136),(9,575089255424675894397004836985527861248),(11,60507999148306380876727460088947014400),(12,1241248743588591183729173027251155110400),(15,19901225482594761973353658746385480416000)] orbit.val

/-- Exact candidate at original node185, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,694623762289334605646749067885896794112),(3,7266157242310279717598291189954619899904),(6,13817290478340447338410934617792648839168)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked18500 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 185 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked18501 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 185 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked18502 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 185 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked18510 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 185 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked18511 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 185 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked18512 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 185 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked18520 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 185 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked18521 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 185 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked18522 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 185 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked18530 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 185 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked18531 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 185 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked18532 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 185 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked18540 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 185 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked18541 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 185 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked18542 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 185 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked18550 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 185 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked18551 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 185 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked18552 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 185 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 185 1 :=
  RootFineParent3CacheTable.single 185 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 185 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 185 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 185 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 185 0 0) checked18500 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 185 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 185 0 1) checked18501 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 185 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 185 0 2) checked18502 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 185 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 185 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 185 1 0) checked18510 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 185 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 185 1 1) checked18511 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 185 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 185 1 2) checked18512 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 185 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 185 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 185 2 0) checked18520 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 185 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 185 2 1) checked18521 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 185 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 185 2 2) checked18522 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 185 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 185 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 185 3 0) checked18530 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 185 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 185 3 1) checked18531 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 185 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 185 3 2) checked18532 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 185 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 185 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 185 4 0) checked18540 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 185 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 185 4 1) checked18541 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 185 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 185 4 2) checked18542 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 185 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 185 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 185 5 0) checked18550 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 185 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 185 5 1) checked18551 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 185 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 185 5 2) checked18552 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block185
