import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block302
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node302, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14000694294649677533356513783359471616),(9,3538409604172987511778807428757457993728),(11,62313046719051230554885148698926707712),(12,1893206581543985670963365216451183384576),(15,16270141556209387570825560567942237975552)] orbit.val

/-- Exact candidate at original node302, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,508850347775605320632765277358232961024),(3,7442280629887711240303294768325351964672),(6,13826940505276745100719914829949580607488)] orbit.val

/-- Exact candidate at original node302, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,500485730892215094555141466349748879360),(3,7476592863778297773465128147380695203840),(6,13800992888269548793635705261902721449984)] orbit.val

/-- Exact candidate at original node302, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,2086691656102309328850868568277909504),(9,33811954511164308350390790426627932160),(11,38634261087546433097241507671336358912),(12,1754931107430130687109852071230628550656),(15,19948607468255117923769639637736294781952)] orbit.val

/-- Exact candidate at original node302, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,240823262332103096852123773566976),(3,32878954187416780902516616792436113408),(6,21745192287929382548650361406716955852800)] orbit.val

/-- Exact candidate at original node302, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,164053216445193097762449074946048),(3,44134099697820953076583020998911066112),(6,21733937219189024263386294092185179521024)] orbit.val

/-- Exact candidate at original node302, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,75138008624465441165277243899904),(9,3839131659643557923166253798091579719680),(11,686517522899645241955855836888576),(12,55639887828417562082022115900062204928),(15,17883299173812554652297015840508442820096)] orbit.val

/-- Exact candidate at original node302, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,114569209612361943819234306020266213376),(3,9570136622549721724343229390258947751936),(6,12093365650777977993493511179353951567872)] orbit.val

/-- Exact candidate at original node302, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,102724468666490670609260342996369408),(3,10725214989614809250082467394204624486400),(6,11052753768856585920902898221085544677376)] orbit.val

/-- Exact candidate at original node302, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14374150450212313484769239035214299136),(9,3422441310840161760805642830120486961152),(11,69531796849949656144792296106475888640),(12,1465789453249318910474087895660422021120),(15,16805934771550419020746682614710566363136)] orbit.val

/-- Exact candidate at original node302, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,736931084880712791470797252889956843520),(3,7290365885107334536196991490088350253056),(6,13750774512952014333988186132654858436608)] orbit.val

/-- Exact candidate at original node302, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,713761386366243479010899729943661379584),(3,7337026511369265205799105479335032651776),(6,13727283585204552976845969666354471501824)] orbit.val

/-- Exact candidate at original node302, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,8561593311697689981202343133184),(9,3493423011009866844991934809508291805184),(11,58683853102188587363509578579895556608),(12,1777266136304562307238345694850121387008),(15,16448698473961850610364494811492513651200)] orbit.val

/-- Exact candidate at original node302, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,474436238627222424784745379175971422208),(3,7518685061905617810838660438543669657600),(6,13784950182407221426032569057913524453376)] orbit.val

/-- Exact candidate at original node302, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,643455002696934877797973731318159114240),(3,7281169001551200972731972046783942492160),(6,13853447478691925811126029097531063926784)] orbit.val

/-- Exact candidate at original node302, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14374141878715481472796215633678172160),(9,3422440813237783569654187531668513882112),(11,69532014312098707718976496725993759232),(12,1465782371420100435904189502995823508480),(15,16805942142091363466905825128609156211200)] orbit.val

/-- Exact candidate at original node302, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,736932883273006783972442726897851301888),(3,7290366024952808292658100904539656814592),(6,13750772574714246585025431244195657416704)] orbit.val

/-- Exact candidate at original node302, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,713763104828863041980684309624933842944),(3,7337026746603808602387904661053224517632),(6,13727281631507390017287385904955007172608)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked30200 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 302 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked30201 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 302 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked30202 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 302 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked30210 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 302 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked30211 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 302 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked30212 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 302 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked30220 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 302 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked30221 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 302 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked30222 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 302 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked30230 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 302 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked30231 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 302 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked30232 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 302 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked30240 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 302 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked30241 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 302 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked30242 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 302 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked30250 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 302 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked30251 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 302 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked30252 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 302 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 302 1 :=
  RootFineParent3CacheTable.single 302 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 302 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 302 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 302 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 302 0 0) checked30200 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 302 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 302 0 1) checked30201 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 302 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 302 0 2) checked30202 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 302 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 302 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 302 1 0) checked30210 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 302 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 302 1 1) checked30211 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 302 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 302 1 2) checked30212 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 302 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 302 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 302 2 0) checked30220 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 302 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 302 2 1) checked30221 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 302 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 302 2 2) checked30222 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 302 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 302 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 302 3 0) checked30230 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 302 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 302 3 1) checked30231 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 302 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 302 3 2) checked30232 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 302 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 302 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 302 4 0) checked30240 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 302 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 302 4 1) checked30241 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 302 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 302 4 2) checked30242 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 302 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 302 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 302 5 0) checked30250 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 302 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 302 5 1) checked30251 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 302 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 302 5 2) checked30252 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block302
