import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block562
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node562, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,730039136404686833388360933801600221184),(3,7296960014880855293377281508670621876224),(6,13751072331654519534890332433160943435776)] orbit.val

/-- Exact candidate at original node562, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,729337515627470642157783746385880809472),(3,7298043217250959417066932650122286202880),(6,13750690750061631602431258479124998520832)] orbit.val

/-- Exact candidate at original node562, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,7033894223098717686710339047727824896),(9,3234203608251345110670991246492235202560),(11,69054829968649851406720668167320570880),(12,1381594133535406955469177263043537135616),(15,17086185016961561026422375358882344799232)] orbit.val

/-- Exact candidate at original node562, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,653955004522747368482873045157484167168),(3,7243797922291514160866228971935545425920),(6,13880318556125800132306872858540135940096)] orbit.val

/-- Exact candidate at original node562, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,456007529925131215512012097940745093120),(3,7521867268694407088783046593375425789952),(6,13800196684320523357360916184316994650112)] orbit.val

/-- Exact candidate at original node562, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,7502469779389518116644644323722264576),(9,3299417956678436460971053359034823344128),(11,54930508304445449528989480238078446080),(12,1711306657154171649438684163913271045120),(15,16704913891023618583600603228123270433280)] orbit.val

/-- Exact candidate at original node562, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,730047745353404416628287537234443239424),(3,7296962178540828933245063809512337571840),(6,13751061559045828311782623528886384721920)] orbit.val

/-- Exact candidate at original node562, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,729346108448487654045341237155532374016),(3,7298045404144409453785166841548166397952),(6,13750679970347164553825466796929466761216)] orbit.val

/-- Exact candidate at original node562, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,7033880902863894976018581133151174656),(9,3234202149289491211278922066878372249600),(11,69056178866320468906881598904682283008),(12,1381570384768788871051009057591568629760),(15,17086208889112597215443143571125391196160)] orbit.val

/-- Exact candidate at original node562, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,456121063014694107228423670297092161536),(3,7518705962875844962091643773174771875840),(6,13803244457049522592335907432161301495808)] orbit.val

/-- Exact candidate at original node562, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,653248121609858421627513543450620329984),(3,7241191951934085040282737698463929073664),(6,13883631409396118199745723633718616129536)] orbit.val

/-- Exact candidate at original node562, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,7257389332972498213666612945757405184),(9,3298827492817968878899448884347048820736),(11,54919888344620861986327805066714996736),(12,1711007543962120204851132854644937736192),(15,16706059168482379217705398718628706574336)] orbit.val

/-- Exact candidate at original node562, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,495388359321443316711393071691930271744),(3,7445807852718104248455826792280030707712),(6,13836875270900514096488755011661204553728)] orbit.val

/-- Exact candidate at original node562, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,495186062472959658759258174517678178304),(3,7446277462940741516655090883542046998528),(6,13836607957526360486241625817573440356352)] orbit.val

/-- Exact candidate at original node562, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,6858887526110011605580126683953889280),(9,3346222223930681905170887536733728014336),(11,57673347560462631225135189903044843520),(12,1823841703278105070813025411423982702592),(15,16543475320644702042841346610888456083456)] orbit.val

/-- Exact candidate at original node562, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,496903648427829263244439746563444572160),(3,7442861568348448494993598973437504651264),(6,13838306266163783903417936155632216309760)] orbit.val

/-- Exact candidate at original node562, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,496532431651008859881231576193466105856),(3,7443395598256471687999333711685949063168),(6,13838143453032581113775409587753750364160)] orbit.val

/-- Exact candidate at original node562, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,6845133432917612645168028761035112448),(9,3348101419029670459684755437933060685824),(11,57916655342030496035710806624679837440),(12,1826275218391710977983659699481192268288),(15,16538933056743732115306680902833197629184)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked56200 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 562 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked56201 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 562 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked56202 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 562 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked56210 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 562 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked56211 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 562 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked56212 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 562 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked56220 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 562 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked56221 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 562 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked56222 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 562 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked56230 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 562 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked56231 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 562 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked56232 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 562 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked56240 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 562 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked56241 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 562 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked56242 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 562 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked56250 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 562 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked56251 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 562 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked56252 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 562 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 562 1 :=
  RootFineParent3CacheTable.single 562 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 562 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 562 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 562 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 562 0 0) checked56200 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 562 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 562 0 1) checked56201 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 562 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 562 0 2) checked56202 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 562 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 562 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 562 1 0) checked56210 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 562 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 562 1 1) checked56211 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 562 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 562 1 2) checked56212 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 562 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 562 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 562 2 0) checked56220 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 562 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 562 2 1) checked56221 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 562 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 562 2 2) checked56222 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 562 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 562 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 562 3 0) checked56230 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 562 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 562 3 1) checked56231 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 562 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 562 3 2) checked56232 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 562 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 562 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 562 4 0) checked56240 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 562 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 562 4 1) checked56241 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 562 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 562 4 2) checked56242 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 562 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 562 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 562 5 0) checked56250 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 562 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 562 5 1) checked56251 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 562 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 562 5 2) checked56252 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block562
