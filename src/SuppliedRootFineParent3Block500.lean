import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block500
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node500, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,654026022448692979111045831447197777920),(3,7242735104701913586165867982529553760256),(6,13881310355789455096379061061656413995008)] orbit.val

/-- Exact candidate at original node500, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,6407219982656738127950364228049698816),(9,3277905538334115985889391981528640126976),(11,54533910342618598427298852356454506496),(12,1704042051922051755221837255057038589952),(15,16735182762358618583989496422462982610944)] orbit.val

/-- Exact candidate at original node500, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,455005103821260221026161236106748624896),(3,7520663319049660061803654128315203059712),(6,13802403060069141378826159511211213848576)] orbit.val

/-- Exact candidate at original node500, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,729864723415778505184441093009841324032),(3,7296903527140131547580940010724628889600),(6,13751303232384151608890593771898695319552)] orbit.val

/-- Exact candidate at original node500, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,6324207853390231582744226021066670080),(9,3212532870547682053448616395924484128768),(11,69005557191626123507088310527172452096),(12,1373356708123337817059355199880180187648),(15,17116852139224025436058170743280262094592)] orbit.val

/-- Exact candidate at original node500, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,729999365689572854539746800626334433280),(3,7296686015080368168870593693902052524032),(6,13751386102170120638245634381104778575872)] orbit.val

/-- Exact candidate at original node500, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,494289509889946031001385870086197215232),(3,7445844629289522646925611122207592808448),(6,13837937343760592983728977883339375509504)] orbit.val

/-- Exact candidate at original node500, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,6171814542726269500255821664738082816),(9,3324203387559851958641064969013462827008),(11,57185561261778247203409141004301551616),(12,1816483166409195065009269560874159730688),(15,16574027553166510121301975383076503341056)] orbit.val

/-- Exact candidate at original node500, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,494287960235814773789979443647951667200),(3,7445877777873187959654111022050095136768),(6,13837905744831058928211884409935118729216)] orbit.val

/-- Exact candidate at original node500, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,494345729811311658664795483897220562944),(3,7445875872387040772463648018914787459072),(6,13837849880741709230527531372821157511168)] orbit.val

/-- Exact candidate at original node500, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,42981109804143060332780206776385536),(9,3326246161812484332119348982370541764608),(11,57154930592101293006169795411063966720),(12,1816488489203329701565753214103992985600),(15,16578138920222342191904370103540790430720)] orbit.val

/-- Exact candidate at original node500, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,494264957939727267585643931161761677312),(3,7445656579368388041046701198778818363392),(6,13838149945631946353023629745692585492480)] orbit.val

/-- Exact candidate at original node500, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,729864584464042708709006024373652422656),(3,7296903470908337230009037896565699641344),(6,13751303427567681722937930954693813469184)] orbit.val

/-- Exact candidate at original node500, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,6324207808824390168470536124698198016),(9,3212532865912834546364152646702163034112),(11,69005532511457915020155986103627584000),(12,1373356729666504000400848482623119612928),(15,17116852147040440809702347224079557104128)] orbit.val

/-- Exact candidate at original node500, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,729999226677905652275021201393076666368),(3,7296685958888698216459416025941806153728),(6,13751386297373457792921537648298282713088)] orbit.val

/-- Exact candidate at original node500, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,454915427934333281939521393568012828672),(3,7520463249034196626081439610421181939712),(6,13802692805971531753635013871643970764800)] orbit.val

/-- Exact candidate at original node500, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,6521119478474479110809484922282049536),(9,3277668697007533950149116583471141093376),(11,54547887132410025429424869316531894784),(12,1704099204429284793152538403793459907584),(15,16735234574892358413814085534129750587904)] orbit.val

/-- Exact candidate at original node500, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,653754544204407463152468318385512382464),(3,7242738754886094758587613209443587588096),(6,13881578183849559439915893347804065562624)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked50000 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 500 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked50001 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 500 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked50002 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 500 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked50010 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 500 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked50011 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 500 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked50012 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 500 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked50020 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 500 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked50021 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 500 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked50022 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 500 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked50030 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 500 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked50031 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 500 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked50032 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 500 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked50040 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 500 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked50041 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 500 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked50042 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 500 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked50050 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 500 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked50051 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 500 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked50052 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 500 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 500 1 :=
  RootFineParent3CacheTable.single 500 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 500 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 500 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 500 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 500 0 0) checked50000 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 500 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 500 0 1) checked50001 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 500 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 500 0 2) checked50002 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 500 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 500 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 500 1 0) checked50010 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 500 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 500 1 1) checked50011 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 500 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 500 1 2) checked50012 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 500 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 500 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 500 2 0) checked50020 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 500 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 500 2 1) checked50021 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 500 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 500 2 2) checked50022 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 500 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 500 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 500 3 0) checked50030 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 500 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 500 3 1) checked50031 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 500 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 500 3 2) checked50032 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 500 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 500 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 500 4 0) checked50040 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 500 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 500 4 1) checked50041 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 500 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 500 4 2) checked50042 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 500 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 500 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 500 5 0) checked50050 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 500 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 500 5 1) checked50051 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 500 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 500 5 2) checked50052 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block500
