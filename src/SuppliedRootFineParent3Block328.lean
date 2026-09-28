import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block328
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node328, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,734189365291373087482591689854326669312),(3,7299890914854384563496727777566057824256),(6,13743991202794304010676655408212781039616)] orbit.val

/-- Exact candidate at original node328, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,734960181408563456097829930957184958464),(3,7299464483752603073390924273629322543104),(6,13743646817778895132167220671046658031616)] orbit.val

/-- Exact candidate at original node328, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14342464260760768819790948541489217536),(9,3418125170803072672079673965673036382208),(11,71047020790510779259717545273010457600),(12,1465946168971062646793141629773235021824),(15,16808610658114654794703650786372394454016)] orbit.val

/-- Exact candidate at original node328, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,815826727165514915476720379039787778048),(3,8343809572497818628092157392950044655616),(6,12618435183276728118087097103643333099520)] orbit.val

/-- Exact candidate at original node328, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,149037994027671886290649486019316940800),(3,5652975468210601640127249432781697056768),(6,15976058020701788135238075956832151535616)] orbit.val

/-- Exact candidate at original node328, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,6417584799043740159972153432299536384),(9,3357686476565186292008960111638749380608),(11,33442015787834797235673338088555087104),(12,1658608287544023591510617856170189518336),(15,16721917118243973240740751416303372010752)] orbit.val

/-- Exact candidate at original node328, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,734189293131042900574836996662345334784),(3,7299890902968489603241444847306697342976),(6,13743991286840529157839693031664122855424)] orbit.val

/-- Exact candidate at original node328, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,734960109042212575288366380982630088704),(3,7299464472369834416465841466128325410816),(6,13743646901528014669901767028522210033664)] orbit.val

/-- Exact candidate at original node328, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14342464562818138405423735616875528192),(9,3418125188203557864274979109655126474752),(11,71047011084529032621075126066833267200),(12,1465946425673527569098649180705997179904),(15,16808610393415629057255847723588333083136)] orbit.val

/-- Exact candidate at original node328, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,473234335008922598527368297884571140096),(3,7524494305315034517852880149545555591168),(6,13780342842616104545275726428203038801920)] orbit.val

/-- Exact candidate at original node328, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,659546625881475220942615682481051926528),(3,7248043568072756120738709592963335323648),(6,13870481288985830319974649600188778283008)] orbit.val

/-- Exact candidate at original node328, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14994002006956978741512556813574209536),(9,3485030568176200977043368156543441698816),(11,59715810293695711945124234115854436608),(12,1791322100515255420804924713068656455168),(15,16427009001947952573121045215091638733056)] orbit.val

/-- Exact candidate at original node328, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,508587072673231092298123435199535513600),(3,7448844605560455628877508608238454571008),(6,13820639804706374940480342832195175448576)] orbit.val

/-- Exact candidate at original node328, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,508759154362814026306438353445283954688),(3,7449139526614440062909205693732180983808),(6,13820172801962807572440330828455700594688)] orbit.val

/-- Exact candidate at original node328, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13982898376746613377762081215814303744),(9,3534744088213020998163936001634064138240),(11,63595835117750513725664820568921474560),(12,1913046821772612174699389233651623916544),(15,16252701839459931361689222738562741700096)] orbit.val

/-- Exact candidate at original node328, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,508498367020506762859896446933666889728),(3,7448050166131080770612974779273572253696),(6,13821522949788474128183103649425926389760)] orbit.val

/-- Exact candidate at original node328, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,508680552581412979733257272336519790592),(3,7448443412674390470881249170548252999680),(6,13820947517684258211041468432748392742912)] orbit.val

/-- Exact candidate at original node328, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13960234913271400206917392988995846144),(9,3533605499700269046668538170671802351616),(11,63687274747703364235879828483847231488),(12,1915194909466924852281641239492093267968),(15,16251623564111892998262998243996426835968)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked32800 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 328 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked32801 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 328 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked32802 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 328 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked32810 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 328 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked32811 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 328 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked32812 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 328 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked32820 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 328 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked32821 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 328 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked32822 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 328 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked32830 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 328 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked32831 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 328 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked32832 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 328 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked32840 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 328 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked32841 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 328 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked32842 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 328 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked32850 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 328 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked32851 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 328 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked32852 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 328 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 328 1 :=
  RootFineParent3CacheTable.single 328 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 328 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 328 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 328 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 328 0 0) checked32800 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 328 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 328 0 1) checked32801 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 328 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 328 0 2) checked32802 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 328 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 328 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 328 1 0) checked32810 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 328 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 328 1 1) checked32811 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 328 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 328 1 2) checked32812 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 328 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 328 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 328 2 0) checked32820 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 328 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 328 2 1) checked32821 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 328 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 328 2 2) checked32822 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 328 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 328 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 328 3 0) checked32830 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 328 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 328 3 1) checked32831 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 328 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 328 3 2) checked32832 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 328 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 328 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 328 4 0) checked32840 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 328 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 328 4 1) checked32841 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 328 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 328 4 2) checked32842 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 328 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 328 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 328 5 0) checked32850 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 328 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 328 5 1) checked32851 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 328 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 328 5 2) checked32852 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block328
