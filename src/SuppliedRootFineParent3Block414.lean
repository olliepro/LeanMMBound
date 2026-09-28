import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block414
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node414, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,730152172323219977086125494317380272128),(3,7296860308897643008211514696841029484544),(6,13751059001719198676358334684474755776512)] orbit.val

/-- Exact candidate at original node414, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,730416484347035695633515749891609985024),(3,7301280741960750587036105825967201583104),(6,13746374256632275378986353299774353965056)] orbit.val

/-- Exact candidate at original node414, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,6708320706842332273139956192680869888),(9,3224662222620934143435020352202622369792),(11,69091138109773239252832744317299877888),(12,1377432971552561013487750832552897359872),(15,17100176829949950933207230990367665055744)] orbit.val

/-- Exact candidate at original node414, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,653724592598106450763407353957685657600),(3,7243834982574855885282818100442431488000),(6,13880511907767099325609749421233048387584)] orbit.val

/-- Exact candidate at original node414, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,455682321829913205300168617254268698624),(3,7525617605140744877454886289503000985600),(6,13796771555969403578900919968875895848960)] orbit.val

/-- Exact candidate at original node414, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,6304263668812353306777465608904638464),(9,3289996866841376937877859398425606356992),(11,54769783247781870260336406965526878208),(12,1708061958204538617921018002704028094464),(15,16718938610977551882289983601929099565056)] orbit.val

/-- Exact candidate at original node414, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,730009451032039971551862574938071236608),(3,7297090281965618463289934017951998935040),(6,13750971749942403226814178282743095361536)] orbit.val

/-- Exact candidate at original node414, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,730559445710478562394965485388054921216),(3,7301050898142591830973709381044220723200),(6,13746461139086991268287300009200889888768)] orbit.val

/-- Exact candidate at original node414, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,6708317879387282545331408323081142272),(9,3224662261789356986424452250010912817152),(11,69091152823576668797052269282054169600),(12,1377433284930636604822482813646238267392),(15,17100176465517104119066656134370879136768)] orbit.val

/-- Exact candidate at original node414, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,455418827377488986275586033901199425536),(3,7521177257444036803817242841214212898816),(6,13801475398118535871563146000517753208832)] orbit.val

/-- Exact candidate at original node414, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,654142833548464168073415714559575982080),(3,7247853346488223425024519793794405629952),(6,13876075302903374068558039367279183921152)] orbit.val

/-- Exact candidate at original node414, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,17616480970249818294346489287147520),(9,3290993480819182361693946036538816069632),(11,54781971086781699268754087303195826432),(12,1708549022562713466845691547548007976448),(15,16723729391990413884029288857753858513152)] orbit.val

/-- Exact candidate at original node414, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,494970497975006072728576622800356245504),(3,7445896772306556857633864180683807653888),(6,13837204212658498731293534072149001633792)] orbit.val

/-- Exact candidate at original node414, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,495158055525792559931851818130068209664),(3,7450156808704285640345885854642573672448),(6,13832756618709983461378237202860523651072)] orbit.val

/-- Exact candidate at original node414, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,6527305464850788156043155846029377536),(9,3336572306314393132075268640368658219008),(11,57462409178821779086020872827862184960),(12,1820533263779567501728051348331018983424),(15,16556976198202428460610590858259596768256)] orbit.val

/-- Exact candidate at original node414, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,494951113503161557016855539574521200640),(3,7445855243869443694009177557107849822208),(6,13837265125567456410629941778950794510336)] orbit.val

/-- Exact candidate at original node414, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,495152643689553060228961108552065220608),(3,7450250632024501152294316012551406616576),(6,13832668207226007449132697754529693696000)] orbit.val

/-- Exact candidate at original node414, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,6549968715400314569802436790198468608),(9,3336559613739929139857017705145972031488),(11,57459397265285698050240580990834556928),(12,1820486675514495998276085987969131905024),(15,16557015827704950510902828164737028571136)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked41400 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 414 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked41401 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 414 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked41402 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 414 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked41410 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 414 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked41411 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 414 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked41412 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 414 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked41420 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 414 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked41421 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 414 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked41422 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 414 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked41430 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 414 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked41431 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 414 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked41432 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 414 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked41440 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 414 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked41441 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 414 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked41442 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 414 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked41450 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 414 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked41451 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 414 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked41452 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 414 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 414 1 :=
  RootFineParent3CacheTable.single 414 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 414 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 414 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 414 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 414 0 0) checked41400 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 414 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 414 0 1) checked41401 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 414 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 414 0 2) checked41402 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 414 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 414 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 414 1 0) checked41410 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 414 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 414 1 1) checked41411 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 414 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 414 1 2) checked41412 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 414 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 414 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 414 2 0) checked41420 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 414 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 414 2 1) checked41421 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 414 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 414 2 2) checked41422 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 414 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 414 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 414 3 0) checked41430 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 414 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 414 3 1) checked41431 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 414 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 414 3 2) checked41432 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 414 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 414 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 414 4 0) checked41440 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 414 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 414 4 1) checked41441 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 414 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 414 4 2) checked41442 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 414 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 414 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 414 5 0) checked41450 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 414 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 414 5 1) checked41451 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 414 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 414 5 2) checked41452 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block414
