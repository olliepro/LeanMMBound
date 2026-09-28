import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block312
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node312, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,659922662963042906369371565348305764352),(3,7247485607289374941697112935576916459520),(6,13870663212687643813589490374707943309312)] orbit.val

/-- Exact candidate at original node312, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14736092258074507628602988154450870272),(9,3484965493411866423401306660877937672192),(11,59854347551065250363406080898230731776),(12,1792855487299470588011068460631386322944),(15,16425660062419584892251590685071159936000)] orbit.val

/-- Exact candidate at original node312, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,474397884758870043458188182974371987456),(3,7523989821358359701484054603991351296000),(6,13779683776822831916713732088667442249728)] orbit.val

/-- Exact candidate at original node312, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,735128029953083233223037635361568194560),(3,7299561086994704415527792954194322784256),(6,13743382365992274012905144286077274554368)] orbit.val

/-- Exact candidate at original node312, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14346806241365119305416256327371456512),(9,3417836705207981487153949032512130908160),(11,71298875001908513101687839539500270592),(12,1466161798943625921507580758160204658688),(15,16808427297545180620587340989093958239232)] orbit.val

/-- Exact candidate at original node312, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,737206853369253142581714008823048437760),(3,7298069532107786766074287654597942050816),(6,13742795097463021752999973212212175044608)] orbit.val

/-- Exact candidate at original node312, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,508959108009719532229663528347716550656),(3,7447683525074215013425365292956881256448),(6,13821428849856127116000946054328567726080)] orbit.val

/-- Exact candidate at original node312, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13952415440254453316703387172852465664),(9,3534310191551371434334369992185816809472),(11,63435435981304800418586532990479121408),(12,1908358482680671078205951435088308963328),(15,16258014957286459895380363528195708173312)] orbit.val

/-- Exact candidate at original node312, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,509626550370128401599602489835946770432),(3,7447514941591233649857420763853624442880),(6,13820929990978699610198951621943594319872)] orbit.val

/-- Exact candidate at original node312, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,508971994704675910974560261457468981248),(3,7447739383695230791360743384611114975232),(6,13821360104540154959320671229564581576704)] orbit.val

/-- Exact candidate at original node312, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13952165188199631698510055765092335616),(9,3534263184333743364846042847453695180800),(11,63436915465150603623215143973457108992),(12,1908377563915997583621342305383859077120),(15,16258041654036970477866864523057061830656)] orbit.val

/-- Exact candidate at original node312, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,509636665186455899435913512862686904320),(3,7447504997006516834232322102755254599680),(6,13820929820747088927987739260015224029184)] orbit.val

/-- Exact candidate at original node312, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,735128029692743565593958899871421300736),(3,7299561086987649034671229550306258845696),(6,13743382366259669061390786425455485386752)] orbit.val

/-- Exact candidate at original node312, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14346806241365119305416256327371456512),(9,3417836705272354369196788806806885367808),(11,71298874966220728176060257688618743808),(12,1466161799860989049635305105252319596544),(15,16808427296599132395342404449557970368512)] orbit.val

/-- Exact candidate at original node312, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,737206853103469185858134863238167265280),(3,7298069532031899271955101844310664937472),(6,13742795097804693203842738168084333330432)] orbit.val

/-- Exact candidate at original node312, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,472865827321556720160361621359622619136),(3,7524730818111177047319378690312190820352),(6,13780474837507327894176234563961352093696)] orbit.val

/-- Exact candidate at original node312, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13223364286472315909012856420534583296),(9,3485044645644090438130815663615590268928),(11,59901290528728046208637354552666675200),(12,1793158843964545851333607457337614159872),(15,16426743338516225010073901543706759845888)] orbit.val

/-- Exact candidate at original node312, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,660234157288766066855876047290652164096),(3,7248166798794304467329412640539932622848),(6,13869670526856991127470686187802580746240)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked31200 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 312 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked31201 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 312 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked31202 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 312 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked31210 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 312 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked31211 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 312 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked31212 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 312 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked31220 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 312 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked31221 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 312 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked31222 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 312 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked31230 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 312 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked31231 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 312 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked31232 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 312 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked31240 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 312 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked31241 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 312 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked31242 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 312 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked31250 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 312 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked31251 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 312 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked31252 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 312 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 312 1 :=
  RootFineParent3CacheTable.single 312 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 312 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 312 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 312 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 312 0 0) checked31200 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 312 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 312 0 1) checked31201 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 312 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 312 0 2) checked31202 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 312 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 312 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 312 1 0) checked31210 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 312 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 312 1 1) checked31211 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 312 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 312 1 2) checked31212 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 312 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 312 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 312 2 0) checked31220 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 312 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 312 2 1) checked31221 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 312 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 312 2 2) checked31222 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 312 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 312 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 312 3 0) checked31230 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 312 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 312 3 1) checked31231 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 312 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 312 3 2) checked31232 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 312 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 312 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 312 4 0) checked31240 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 312 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 312 4 1) checked31241 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 312 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 312 4 2) checked31242 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 312 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 312 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 312 5 0) checked31250 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 312 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 312 5 1) checked31251 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 312 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 312 5 2) checked31252 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block312
