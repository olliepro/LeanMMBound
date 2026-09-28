import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block429
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node429, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,733146656661235581282957045541915066368),(3,7297643644622661909657155177737575464960),(6,13747281181656164170715862652353675001856)] orbit.val

/-- Exact candidate at original node429, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,732512384935527523945798701547964596224),(3,7298580037244086655749963094765640613888),(6,13746979060760447481960213079319560323072)] orbit.val

/-- Exact candidate at original node429, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,10789075353677828637433210343035764736),(9,3328598270234420143821342040875132256256),(11,70107093199273011336160428719766657024),(12,1420746860117592394127932171029142786048),(15,16947830184035098283733107024666088069120)] orbit.val

/-- Exact candidate at original node429, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,645568824354501840722215780585127804928),(3,7254486979892953740626266095788369117184),(6,13878015678692606080307492999259668611072)] orbit.val

/-- Exact candidate at original node429, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,468873539818034442682955635060522352640),(3,7519876940717628664253493390906799161344),(6,13789321002404398554719525849665844019200)] orbit.val

/-- Exact candidate at original node429, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,8148659550339612838455871885212123136),(9,3394664994174481825626157426462286675968),(11,58905832324508951303878397285633327616),(12,1800112050589288695538383344282889681920),(15,16516239946301442576349099835717143724544)] orbit.val

/-- Exact candidate at original node429, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,733146277265007041401707864895910838272),(3,7297643573908843925531277926161608343552),(6,13747281631766210694722989084575646351360)] orbit.val

/-- Exact candidate at original node429, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,732512006429282374064504217277571268608),(3,7298579965140157505752837515754816405504),(6,13746979511370621781838633142600777859072)] orbit.val

/-- Exact candidate at original node429, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,10789076561907306979964358644581007360),(9,3328598359212598407497334679524584980480),(11,70107038684773904606073153137146094336),(12,1420748198502953001701448887863342479872),(15,16947828809977829040871153796463510971136)] orbit.val

/-- Exact candidate at original node429, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,464523410129185223462079620482682847232),(3,7522759865075194568957948590656302612480),(6,13790788207735681869235946664494180073472)] orbit.val

/-- Exact candidate at original node429, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,656459685831404288890437755570235637760),(3,7245906868098122046161969865399335911424),(6,13875704929010535326603567254663593984000)] orbit.val

/-- Exact candidate at original node429, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,11106636109911293298654985732279500800),(9,3394979300430917850436910181950313988096),(11,57203566179821275406703433709762958848),(12,1749336413570823797464762636537690477568),(15,16565445566648587445048943637703118607872)] orbit.val

/-- Exact candidate at original node429, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,501880355308669168510628535215635562496),(3,7446842089264498013361764771729177051136),(6,13829349038366894479783581568688352919552)] orbit.val

/-- Exact candidate at original node429, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,501731509972194734795570801354356031488),(3,7447127354276133494183471776587273207808),(6,13829212618691733432676932297691536293888)] orbit.val

/-- Exact candidate at original node429, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,10495897351660217940314071881104752640),(9,3443050448804621905031569791056959504384),(11,60371762666064975638479927294668168448),(12,1863774357115843933676299586348689671680),(15,16400379017001870629369311499051743436032)] orbit.val

/-- Exact candidate at original node429, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,501874079960360531092641003961388630016),(3,7446727805980026065565035402720972898304),(6,13829469596999675064998298468950804004864)] orbit.val

/-- Exact candidate at original node429, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,501729648279776654375399898882403991552),(3,7447250514121952828118828198560505266176),(6,13829091320538332179161746778190256275456)] orbit.val

/-- Exact candidate at original node429, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,10495734844795380869874625323269619712),(9,3443047628475155043349670783776590921728),(11,60371294478361965250121693992242128896),(12,1863772226086904085782084439911470444544),(15,16400384599054845186404223332629592418304)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked42900 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 429 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked42901 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 429 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked42902 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 429 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked42910 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 429 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked42911 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 429 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked42912 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 429 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked42920 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 429 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked42921 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 429 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked42922 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 429 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked42930 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 429 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked42931 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 429 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked42932 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 429 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked42940 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 429 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked42941 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 429 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked42942 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 429 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked42950 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 429 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked42951 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 429 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked42952 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 429 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 429 1 :=
  RootFineParent3CacheTable.single 429 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 429 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 429 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 429 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 429 0 0) checked42900 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 429 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 429 0 1) checked42901 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 429 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 429 0 2) checked42902 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 429 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 429 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 429 1 0) checked42910 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 429 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 429 1 1) checked42911 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 429 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 429 1 2) checked42912 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 429 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 429 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 429 2 0) checked42920 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 429 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 429 2 1) checked42921 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 429 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 429 2 2) checked42922 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 429 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 429 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 429 3 0) checked42930 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 429 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 429 3 1) checked42931 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 429 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 429 3 2) checked42932 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 429 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 429 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 429 4 0) checked42940 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 429 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 429 4 1) checked42941 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 429 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 429 4 2) checked42942 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 429 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 429 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 429 5 0) checked42950 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 429 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 429 5 1) checked42951 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 429 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 429 5 2) checked42952 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block429
