import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block456
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node456, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13934186144302436135182317919898959872),(9,3534900827861838249016588281421192232960),(11,63357056132729135505942807767152722944),(12,1908134133551003799485521435429265209344),(15,16257745279250188041512740033095656408064)] orbit.val

/-- Exact candidate at original node456, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,508327303104492745451345921149147021312),(3,7448290856954638281549650617583999647744),(6,13821453322880930634654978336900018864128)] orbit.val

/-- Exact candidate at original node456, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,508592761607626779601609311314516115456),(3,7447678151016667171505124136401915346944),(6,13821800570315767710549241427916734070784)] orbit.val

/-- Exact candidate at original node456, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13960643072005872911077069429445492736),(9,3295749879371011064332977954627445063680),(11,63047593530703980112226059823489752064),(12,1925322790183099012576820525574342559744),(15,16479990576783241731722873266178442664960)] orbit.val

/-- Exact candidate at original node456, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,523375494926667715428660055728831070208),(3,7662914363932126660583538490549414658048),(6,13591781624081267285643776329354919804928)] orbit.val

/-- Exact candidate at original node456, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,517998458707457871606684688661155414016),(3,7607047172670025267777164526611450560512),(6,13653025851562578522272125660360559558656)] orbit.val

/-- Exact candidate at original node456, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14732847538003378132638139956315815936),(9,3485462218491662294250453418439258144768),(11,59450415117191721295580812305636126720),(12,1783766281788248281843634556458035322880),(15,16434659720004955986133667948473920122880)] orbit.val

/-- Exact candidate at original node456, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,660495850052474925108253743671029006336),(3,7247179206899934459476034277158951059456),(6,13870396425987652277071686854803185467392)] orbit.val

/-- Exact candidate at original node456, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,472781150267037538671996743731894026240),(3,7524914643392764645984954596167881064448),(6,13780375689280259476999023535733390442496)] orbit.val

/-- Exact candidate at original node456, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14352207967967740276538173157940396032),(9,3418703917273866328912768296373433925632),(11,70994100577137862343811127102948892672),(12,1466131248372654821966046439428849418240),(15,16807890008748434908156810839569992900608)] orbit.val

/-- Exact candidate at original node456, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,733694308187126612272377861336647860224),(3,7300441916811188899369503777616562225152),(6,13743935257941746150014093236679955447808)] orbit.val

/-- Exact candidate at original node456, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,734721807492681179414208566857704669184),(3,7299038678306388925077966730181581209600),(6,13744310997140991557163799578593879654400)] orbit.val

/-- Exact candidate at original node456, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14710506458873195660524640959427772416),(9,3485634878376200925464781293537275674624),(11,59707760218329250404984197636084367360),(12,1791432755823402807734953376609285111808),(15,16426585582063255482390731366891092606976)] orbit.val

/-- Exact candidate at original node456, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,473103690739900535330870859061140652032),(3,7524877660177892699693651903590631997440),(6,13780090132022268426631452112981392883712)] orbit.val

/-- Exact candidate at original node456, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,659324170973670525430332234633802940416),(3,7247686883240975479238292980156403286016),(6,13871060428725415656987349660842959306752)] orbit.val

/-- Exact candidate at original node456, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14352207878836057447990793365203451904),(9,3418703912148794566271293958291059638272),(11,70994103428299303164399142306370492928),(12,1466131172841927984420860252569681382400),(15,16807890086642203750351430729100850567680)] orbit.val

/-- Exact candidate at original node456, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,733694329422916043703840046435042066432),(3,7300441920487704818517034244588143902720),(6,13743935233029440799435100584609979564032)] orbit.val

/-- Exact candidate at original node456, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,734721828785248682942130054781955211264),(3,7299038681455709557200593389865639346176),(6,13744310972699103421513251430985570975744)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked45600 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 456 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked45601 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 456 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked45602 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 456 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked45610 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 456 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked45611 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 456 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked45612 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 456 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked45620 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 456 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked45621 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 456 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked45622 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 456 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked45630 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 456 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked45631 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 456 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked45632 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 456 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked45640 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 456 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked45641 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 456 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked45642 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 456 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked45650 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 456 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked45651 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 456 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked45652 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 456 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 456 1 :=
  RootFineParent3CacheTable.single 456 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 456 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 456 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 456 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 456 0 0) checked45600 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 456 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 456 0 1) checked45601 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 456 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 456 0 2) checked45602 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 456 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 456 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 456 1 0) checked45610 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 456 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 456 1 1) checked45611 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 456 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 456 1 2) checked45612 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 456 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 456 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 456 2 0) checked45620 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 456 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 456 2 1) checked45621 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 456 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 456 2 2) checked45622 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 456 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 456 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 456 3 0) checked45630 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 456 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 456 3 1) checked45631 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 456 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 456 3 2) checked45632 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 456 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 456 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 456 4 0) checked45640 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 456 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 456 4 1) checked45641 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 456 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 456 4 2) checked45642 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 456 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 456 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 456 5 0) checked45650 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 456 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 456 5 1) checked45651 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 456 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 456 5 2) checked45652 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block456
