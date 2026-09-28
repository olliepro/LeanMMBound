import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block143
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node143, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,215780610758099790450085781999049506816),(3,7028415506576041818901625088720873979904),(6,14533875365605920052304264004913242046464)] orbit.val

/-- Exact candidate at original node143, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13514155653984668007216974661681152),(9,63140832770941894444742569504198885376),(11,8004105411724163996970168052241418240),(12,538686835542705462703163631833139081216),(15,21168226195059036155843091289268924467200)] orbit.val

/-- Exact candidate at original node143, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,266046865222341563307980667747093708800),(3,6973216323335128048963205275267840868352),(6,14538808294382592049384788932618230956032)] orbit.val

/-- Exact candidate at original node143, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,430237117543472277432038739339942821888),(3,7194934277169242765127554847837310156800),(6,14152900088227346619096381288455912554496)] orbit.val

/-- Exact candidate at original node143, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,4615040466455897664823935107072),(9,63213741918043228130138101870898446336),(11,24275385603391813950246965003446371328),(12,811923705207830319236967976546671294464),(15,20878658645595755833882724167388214313984)] orbit.val

/-- Exact candidate at original node143, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,432902688422730973861888815424304316416),(3,7255482447346421029485218202294056648704),(6,14089686347170909658308867857914804568064)] orbit.val

/-- Exact candidate at original node143, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,326344728958814346955400429935177760768),(3,6947582181982397502020592402865623924736),(6,14504144571998849812679982042832363847680)] orbit.val

/-- Exact candidate at original node143, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,12214793981710104304598455490183168),(9,62011433665364923984220074326525739008),(11,8506098847276623280253546239507038208),(12,572467012430811768735349156769810612224),(15,21135074723202626635551847499841831960576)] orbit.val

/-- Exact candidate at original node143, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,186704784696138676424326194035970539520),(3,7099621695959232158173022955671321051136),(6,14491745002284690827058625725925873942528)] orbit.val

/-- Exact candidate at original node143, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,525002411406422800863175073857468891136),(3,8485730893544161693103197349415753875456),(6,12767338177989477167689602452359942766592)] orbit.val

/-- Exact candidate at original node143, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,12236571822881212714394480883531776),(9,60928206925508809422991895210387046400),(11,31431679881685064782449567102738992128),(12,1062681963156570677111661435513779578880),(15,20623017396404474229126157583325376384000)] orbit.val

/-- Exact candidate at original node143, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,536602721524051427561761749900550209536),(3,8485216522971524685030299983801858654208),(6,12756252238444485549063913141930756669440)] orbit.val

/-- Exact candidate at original node143, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,418199657995954997557227583689147285504),(3,7280737978511998382643646712781266223104),(6,14079133846432108281455100579162752024576)] orbit.val

/-- Exact candidate at original node143, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,12110405925837403898297861739118592),(9,63797596500820988227860748827581480960),(11,22582668033058917442108503841420088576),(12,848963462184030791541355351846325573120),(15,20842715645816225127040751973256099271936)] orbit.val

/-- Exact candidate at original node143, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,415429279811294181675517096537331073024),(3,7284894545007409160229696593879403331584),(6,14077747658121358319750761185216431128576)] orbit.val

/-- Exact candidate at original node143, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,355618060289090760490323832756697563136),(3,7408507519325494890963650724741448204288),(6,14013945903325476010202000318135019765760)] orbit.val

/-- Exact candidate at original node143, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13744868063226205758289374645059584),(9,63006923489627713375045160943413624832),(11,13473977417649256909266802538777056256),(12,691897866095856587007384904015747930112),(15,21009678971068864878158519718760581862400)] orbit.val

/-- Exact candidate at original node143, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,292985544095166302131235524677346525184),(3,7488490338400615025049357311409429413888),(6,13996595600444280334475382039546389594112)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked14300 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 143 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked14301 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 143 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked14302 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 143 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked14310 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 143 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked14311 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 143 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked14312 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 143 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked14320 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 143 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked14321 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 143 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked14322 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 143 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked14330 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 143 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked14331 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 143 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked14332 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 143 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked14340 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 143 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked14341 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 143 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked14342 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 143 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked14350 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 143 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked14351 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 143 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked14352 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 143 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 143 1 :=
  RootFineParent3CacheTable.single 143 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 143 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 143 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 143 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 143 0 0) checked14300 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 143 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 143 0 1) checked14301 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 143 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 143 0 2) checked14302 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 143 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 143 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 143 1 0) checked14310 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 143 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 143 1 1) checked14311 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 143 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 143 1 2) checked14312 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 143 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 143 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 143 2 0) checked14320 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 143 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 143 2 1) checked14321 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 143 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 143 2 2) checked14322 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 143 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 143 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 143 3 0) checked14330 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 143 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 143 3 1) checked14331 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 143 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 143 3 2) checked14332 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 143 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 143 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 143 4 0) checked14340 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 143 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 143 4 1) checked14341 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 143 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 143 4 2) checked14342 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 143 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 143 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 143 5 0) checked14350 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 143 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 143 5 1) checked14351 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 143 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 143 5 2) checked14352 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block143
