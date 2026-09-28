import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block880
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node880, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,734668114142147780637396190948451418112),(3,7299367357907233428817390152440451432448),(6,13744036010890680452201188532244262682624)] orbit.val

/-- Exact candidate at original node880, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,734977329563776240527027445258491265024),(3,7298888066256204728659187553998596997120),(6,13744206087120080692469759876376077271040)] orbit.val

/-- Exact candidate at original node880, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14351369803332981559827728857296797696),(9,3418455154044964117832019819893639610368),(11,71092658738140102811665083739758077952),(12,1466156937565456406596020790197386063872),(15,16808015362788168052856441452945084983296)] orbit.val

/-- Exact candidate at original node880, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,846558213399783587149727754006795649024),(3,8277226587097148884176234624229763448832),(6,12654286682443129190330012497396606435328)] orbit.val

/-- Exact candidate at original node880, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,782866423097360857639249241869249413120),(3,6087875675809262781165969272947538395136),(6,14907329384033438022850756360816377724928)] orbit.val

/-- Exact candidate at original node880, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,17800913372408204203738910180341972992),(9,2255973760238065247115141458821413601280),(11,89406666737452889985712787718510028800),(12,1800221457730262707399689445241947795456),(15,17614668684861872612951692273670952134656)] orbit.val

/-- Exact candidate at original node880, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,734668768463092251468496994972152627200),(3,7299367430316513140390208967397827674112),(6,13744035284160456269797268913263185231872)] orbit.val

/-- Exact candidate at original node880, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,734980266316231846879856084243303104512),(3,7298885766725956704220143137688584716288),(6,13744205449897873110555975653701277712384)] orbit.val

/-- Exact candidate at original node880, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14350978133959832136933314073181814784),(9,3418455063407946201513617612879360425984),(11,71092736809392331789475236545310226944),(12,1466155246076663925577968501336814652416),(15,16808017458512099370637980210798498413056)] orbit.val

/-- Exact candidate at original node880, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,759784388973112383185194762639641673728),(3,7334992514154366081772623065526315253760),(6,13683294579812583196698157047467208605696)] orbit.val

/-- Exact candidate at original node880, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,752704083962614164490177563552739491840),(3,7343326465142546740490606356910510702592),(6,13682040933834900756675190955169915338752)] orbit.val

/-- Exact candidate at original node880, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,12889431689039379422249681420288),(9,3440375701229981228409994759585417658368),(11,75003080466160697728531731672484712448),(12,1501094577092281663409565803217759166464),(15,16761598111262206383068503158907822575616)] orbit.val

/-- Exact candidate at original node880, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,4620497025957764594345653596848128),(3,7978941154638542826639804458710287253504),(6,13799125707804492877251576071269281431552)] orbit.val

/-- Exact candidate at original node880, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,4595506443659935456524136859303936),(3,7978453769538093579920787465317050744832),(6,13799613117895524421799730886179255484416)] orbit.val

/-- Exact candidate at original node880, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13524573186810302967872390170236944384),(9,241827315424736770825405996008879423488),(11,24326950550052779114116288109641359360),(12,1105044702099739214689491430086382141440),(15,20393347941678722594059088771258025664512)] orbit.val

/-- Exact candidate at original node880, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,3407113263510726233688849403346944),(3,266292371815978443690718548596287864832),(6,21511775704010819707239022638187474321408)] orbit.val

/-- Exact candidate at original node880, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,2864427632043567579181989570281472),(3,3382240469884006577111690150621818650624),(6,18395828148628423040976705543021776601088)] orbit.val

/-- Exact candidate at original node880, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,5449378762250707507659592246799368192),(9,3116059167561162620433749890246083870720),(11,32717828419629931349627238723968273920),(12,1486170416573176418913259507054961812480),(15,17137674691623841983451678647361352207872)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked88000 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 880 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked88001 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 880 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked88002 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 880 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked88010 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 880 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked88011 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 880 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked88012 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 880 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked88020 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 880 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked88021 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 880 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked88022 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 880 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked88030 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 880 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked88031 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 880 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked88032 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 880 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked88040 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 880 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked88041 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 880 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked88042 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 880 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked88050 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 880 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked88051 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 880 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked88052 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 880 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 880 1 :=
  RootFineParent3CacheTable.single 880 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 880 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 880 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 880 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 880 0 0) checked88000 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 880 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 880 0 1) checked88001 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 880 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 880 0 2) checked88002 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 880 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 880 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 880 1 0) checked88010 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 880 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 880 1 1) checked88011 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 880 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 880 1 2) checked88012 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 880 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 880 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 880 2 0) checked88020 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 880 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 880 2 1) checked88021 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 880 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 880 2 2) checked88022 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 880 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 880 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 880 3 0) checked88030 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 880 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 880 3 1) checked88031 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 880 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 880 3 2) checked88032 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 880 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 880 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 880 4 0) checked88040 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 880 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 880 4 1) checked88041 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 880 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 880 4 2) checked88042 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 880 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 880 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 880 5 0) checked88050 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 880 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 880 5 1) checked88051 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 880 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 880 5 2) checked88052 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block880
