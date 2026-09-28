import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block102
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node102, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,734795044544544581472599854086224871424),(3,7300285423422780227387112505426267078656),(6,13742991014972736852796262516120673583104)] orbit.val

/-- Exact candidate at original node102, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,739905265398095178744320738979506814976),(3,7309238402263855283855482992451135733760),(6,13728927815278111199056171144202522984448)] orbit.val

/-- Exact candidate at original node102, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14286166407124825852472628973592903680),(9,3415415524322135216902806662201793839104),(11,71413887112384540495184149569980019712),(12,1465194022325451049716630073152756619264),(15,16811761882772966028688881361735042151424)] orbit.val

/-- Exact candidate at original node102, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,678277534363319409448095531266629173248),(3,7208929551106595115450456083821584449536),(6,13890864397470147136757423260544951910400)] orbit.val

/-- Exact candidate at original node102, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,472521977478322058452670842289554194432),(3,7522351718426211048596663988033807187968),(6,13783197787035528554606640045309804150784)] orbit.val

/-- Exact candidate at original node102, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13573020737770560681866337834200203264),(9,3505001744357989177456047091345965187072),(11,59562859394802324039376183282625527808),(12,1791134558950396952631669246668002066432),(15,16408799299499102646847016016502372548608)] orbit.val

/-- Exact candidate at original node102, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,734795181471159771955884639215647981568),(3,7300285446730171961846308982139887026176),(6,13742990854738729927853781254277630525440)] orbit.val

/-- Exact candidate at original node102, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,739905403630670636251105747913391734784),(3,7309238424195962109091197949965942915072),(6,13728927655113428916313671177753830883328)] orbit.val

/-- Exact candidate at original node102, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14286165827768887466914660320802766848),(9,3415415491333509050025993096689931517952),(11,71413905803795689449235034155840686080),(12,1465193534139283584781087586825785602048),(15,16811762385835704449932744497640804960256)] orbit.val

/-- Exact candidate at original node102, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,473686761269623644401364542890855890944),(3,7531838466214352971482049407377964269568),(6,13772546255456085045772560925364345372672)] orbit.val

/-- Exact candidate at original node102, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,664464176573744887510819424127271567360),(3,7265498233025032467297291956890149847040),(6,13848109073341284306847863494615744118784)] orbit.val

/-- Exact candidate at original node102, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,420928967391240828402780644193599488),(9,3486647587188790870452577498733855375360),(11,59996047113818682929361202866813943552),(12,1794909974811218979952055684883952927232),(15,16436096944858841887493577708504349687552)] orbit.val

/-- Exact candidate at original node102, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,508952650186263782621176768129772027904),(3,7448483183916121782876010054759764459520),(6,13820635648837676096158788052743629045760)] orbit.val

/-- Exact candidate at original node102, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,510881141719306030145834519038223450112),(3,7459600547016260035168847777065980657664),(6,13807589794204495596341292579528961425408)] orbit.val

/-- Exact candidate at original node102, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14116224360521323804840041707651203072),(9,3531363831628009761754151208836204068864),(11,63478954098864825844729115621837833216),(12,1909229560404731737461149141320890447872),(15,16259882912447934012791105368146581980160)] orbit.val

/-- Exact candidate at original node102, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,508947273506984291934987020926288134144),(3,7448284876368721941061462287339684364288),(6,13820839333064355428659525567367193034752)] orbit.val

/-- Exact candidate at original node102, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,510879311427261601705994047651458318336),(3,7459532124151653896392389469957875826688),(6,13807660047361146163557591358023831388160)] orbit.val

/-- Exact candidate at original node102, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13850826049897927098146989967482552320),(9,3531904884334894026686038796580912365568),(11,64032566916610737154816738633287215104),(12,1921142878744896606895497260509242568704),(15,16247140326893762363821475089942240831488)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked10200 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 102 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked10201 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 102 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked10202 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 102 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked10210 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 102 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked10211 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 102 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked10212 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 102 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked10220 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 102 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked10221 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 102 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked10222 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 102 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked10230 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 102 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked10231 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 102 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked10232 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 102 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked10240 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 102 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked10241 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 102 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked10242 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 102 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked10250 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 102 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked10251 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 102 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked10252 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 102 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 102 1 :=
  RootFineParent3CacheTable.single 102 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 102 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 102 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 102 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 102 0 0) checked10200 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 102 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 102 0 1) checked10201 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 102 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 102 0 2) checked10202 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 102 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 102 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 102 1 0) checked10210 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 102 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 102 1 1) checked10211 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 102 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 102 1 2) checked10212 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 102 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 102 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 102 2 0) checked10220 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 102 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 102 2 1) checked10221 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 102 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 102 2 2) checked10222 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 102 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 102 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 102 3 0) checked10230 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 102 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 102 3 1) checked10231 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 102 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 102 3 2) checked10232 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 102 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 102 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 102 4 0) checked10240 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 102 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 102 4 1) checked10241 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 102 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 102 4 2) checked10242 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 102 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 102 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 102 5 0) checked10250 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 102 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 102 5 1) checked10251 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 102 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 102 5 2) checked10252 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block102
