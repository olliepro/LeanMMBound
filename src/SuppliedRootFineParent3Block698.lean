import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block698
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node698, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,644611771948235478802803668702321442816),(3,7241951456623974183887357160726019964928),(6,13891508254367851998965814046204824125440)] orbit.val

/-- Exact candidate at original node698, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,109523031155656163680875318345728),(9,2999543937523121238916269812932616912896),(11,49509779662387029041281710955756772352),(12,1624630103978914046173056207027901581312),(15,17104387552252608191869203463841571920896)] orbit.val

/-- Exact candidate at original node698, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,434049330053024107626452350186167468032),(3,7517516473558867187574155424021044264960),(6,13826505679328170366455367101425953800192)] orbit.val

/-- Exact candidate at original node698, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,711369353121181352783696844941139378176),(3,7299622310418596954905117829930162323456),(6,13767079819400283353967160200761863831552)] orbit.val

/-- Exact candidate at original node698, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,10606670256597138195335696351232),(9,2941009744923958903174278274448646733824),(11,64920819624326068452647780626454112768),(12,1307084604284197177565470030393466235904),(15,17465056303500909255866440594828902099456)] orbit.val

/-- Exact candidate at original node698, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,712122235520503969231639812417335066624),(3,7298815467663827614773457691810816065536),(6,13767133779755730077650877371405014401024)] orbit.val

/-- Exact candidate at original node698, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,478383462957703541434187554095817031680),(3,7444037805932280773519723208568284905472),(6,13855650214050077346702064112969063596032)] orbit.val

/-- Exact candidate at original node698, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,147805088930517263301855835848704),(9,3042016777352359577186280622604274368512),(11,51344192630701327992042329813509399552),(12,1730926626513729471872764312396737689600),(15,16953783738638182354087624308962808226816)] orbit.val

/-- Exact candidate at original node698, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,478652416987907412441508246322788958208),(3,7443665330651819709729370406957030047744),(6,13855753735300334539485096222353346527232)] orbit.val

/-- Exact candidate at original node698, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,478355465585212056816877211121369481216),(3,7444117862422003127019441489911706812416),(6,13855598154932846477819656174600089239552)] orbit.val

/-- Exact candidate at original node698, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,135381122696249186862968225136640),(9,3041999336440997458977758383408381165568),(11,51341956206780735847361991279203322880),(12,1730896106365682792863734291515668686848),(15,16953833948545477977717933346461687221248)] orbit.val

/-- Exact candidate at original node698, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,478655008213408787268714904056991055872),(3,7443581113646294783425761386146677391360),(6,13855835361080358090961498585429497085952)] orbit.val

/-- Exact candidate at original node698, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,711368033391416123508466623112602976256),(3,7299621679585663404092347146403816931328),(6,13767081769962982134055161106116745625600)] orbit.val

/-- Exact candidate at original node698, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,9423199579040314652532133593088),(9,2941009550151424882169687342920037826560),(11,64920576246703997231430193212006793216),(12,1307082466688327078357289955698642386944),(15,17465058880430406124857252731270344933376)] orbit.val

/-- Exact candidate at original node698, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,712120914135022418673275344704438796288),(3,7298814838704487832158048182551076405248),(6,13767135730100551410824651348377650331648)] orbit.val

/-- Exact candidate at original node698, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,433710631345882480195624647042543910912),(3,7517979762201009731489150025429189394432),(6,13826381089393169449971200203161432227840)] orbit.val

/-- Exact candidate at original node698, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,134905753721163600837406961434624),(9,2999574334100916258429200530012672884736),(11,49505835253542113324901125675537626112),(12,1624517496695740449415631797131599222784),(15,17104473681984109119322640585406394364928)] orbit.val

/-- Exact candidate at original node698, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,645193183045395902310087896724523712512),(3,7241172568019530514876117933014533537792),(6,13891705731875135244469769045894108282880)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked69800 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 698 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked69801 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 698 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked69802 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 698 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked69810 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 698 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked69811 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 698 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked69812 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 698 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked69820 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 698 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked69821 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 698 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked69822 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 698 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked69830 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 698 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked69831 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 698 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked69832 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 698 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked69840 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 698 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked69841 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 698 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked69842 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 698 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked69850 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 698 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked69851 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 698 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked69852 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 698 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 698 1 :=
  RootFineParent3CacheTable.single 698 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 698 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 698 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 698 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 698 0 0) checked69800 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 698 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 698 0 1) checked69801 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 698 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 698 0 2) checked69802 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 698 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 698 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 698 1 0) checked69810 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 698 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 698 1 1) checked69811 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 698 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 698 1 2) checked69812 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 698 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 698 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 698 2 0) checked69820 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 698 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 698 2 1) checked69821 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 698 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 698 2 2) checked69822 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 698 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 698 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 698 3 0) checked69830 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 698 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 698 3 1) checked69831 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 698 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 698 3 2) checked69832 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 698 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 698 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 698 4 0) checked69840 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 698 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 698 4 1) checked69841 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 698 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 698 4 2) checked69842 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 698 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 698 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 698 5 0) checked69850 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 698 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 698 5 1) checked69851 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 698 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 698 5 2) checked69852 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block698
