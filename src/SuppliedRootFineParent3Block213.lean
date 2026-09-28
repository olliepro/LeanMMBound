import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block213
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node213, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,735506122551748811546188314715642396672),(3,7296624582707007219122845393029324341248),(6,13745940777681305630986941167888198795264)] orbit.val

/-- Exact candidate at original node213, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,729203196684668466227115124229008261120),(3,7309759408036796163957767773770915774464),(6,13739108878218597031471091977633241497600)] orbit.val

/-- Exact candidate at original node213, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14347961759356589065072452667904622592),(9,3419059421486515109336398261871722889216),(11,70681071674275781948525134409390890496),(12,1465855391571923191589913340935402931200),(15,16808127636447990989716065685748744199680)] orbit.val

/-- Exact candidate at original node213, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,659591617739213026751577766406932922368),(3,7204642832087970190120580871114303995904),(6,13913837033112878444783816238111928614912)] orbit.val

/-- Exact candidate at original node213, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,473889491848072900532451661633940357120),(3,7599257109510536440464328030169216319488),(6,13704924881581452320659195183830008856576)] orbit.val

/-- Exact candidate at original node213, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,11222880997023944048699888108073648128),(9,3412263928047824715969203216806261555200),(11,59901664835761491972773870964467356672),(12,1798898150597956819885736142147738818560),(15,16495784858461494689779561757606624154624)] orbit.val

/-- Exact candidate at original node213, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,735506375917338625636374584740653563904),(3,7296624620242471356625599160999716323328),(6,13745940486780251679394001129892795645952)] orbit.val

/-- Exact candidate at original node213, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,729203446764067274153191074546587795456),(3,7309759449541794209310161773193055961088),(6,13739108586634200178192622027893521776640)] orbit.val

/-- Exact candidate at original node213, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14347960699679915436786937354254286848),(9,3419059360817549664038481749615442919424),(11,70681105168606493992991435750850425856),(12,1465854495857851949083402292534976714752),(15,16808128560396373639104312460377641186304)] orbit.val

/-- Exact candidate at original node213, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,474454220128856760750415198187914526720),(3,7522238523889113047655438948820337033216),(6,13781378738922091853250120728624913973248)] orbit.val

/-- Exact candidate at original node213, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,655366873628697522690620718131827441664),(3,7256643157618243125937931495202178990080),(6,13866061451693121013027422662299159101440)] orbit.val

/-- Exact candidate at original node213, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,11916521539518184210590756757894594560),(9,3486559942247190704028787310139937914880),(11,59546658353321902128740365995348444160),(12,1790850260277787301982210782709469706240),(15,16429198100522243569305645660030514873344)] orbit.val

/-- Exact candidate at original node213, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,508703165024197870887476453918629691392),(3,7446055546545292209928927070127120187392),(6,13823312771370571580839571351587415654400)] orbit.val

/-- Exact candidate at original node213, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,506537341959887520667705176023661281280),(3,7455709628921776556513780271211352162304),(6,13815824512058397584474489428398152089600)] orbit.val

/-- Exact candidate at original node213, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14007812390454446584238930552489508864),(9,3535366404562853242341363375664315498496),(11,63507386263746627520903180931617517568),(12,1913149616166985958787698955996481200128),(15,16252040263556021386421770432488261808128)] orbit.val

/-- Exact candidate at original node213, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,508702645065860989429677168752089628672),(3,7445748810355330878073771319114860593152),(6,13823620027518869794152526387766215311360)] orbit.val

/-- Exact candidate at original node213, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,506543641805614409460713287520945700864),(3,7455477795004654781815380310464493780992),(6,13816050046129792470379881277647726051328)] orbit.val

/-- Exact candidate at original node213, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13992347602777039628249512828595077120),(9,3534978047857827825238865968410598047744),(11,63316533021148420834553391774517602048),(12,1909038336336955018010725228058831401472),(15,16256746218121353357943580774560623404800)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked21300 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 213 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked21301 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 213 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked21302 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 213 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked21310 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 213 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked21311 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 213 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked21312 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 213 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked21320 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 213 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked21321 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 213 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked21322 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 213 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked21330 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 213 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked21331 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 213 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked21332 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 213 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked21340 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 213 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked21341 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 213 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked21342 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 213 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked21350 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 213 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked21351 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 213 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked21352 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 213 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 213 1 :=
  RootFineParent3CacheTable.single 213 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 213 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 213 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 213 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 213 0 0) checked21300 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 213 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 213 0 1) checked21301 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 213 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 213 0 2) checked21302 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 213 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 213 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 213 1 0) checked21310 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 213 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 213 1 1) checked21311 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 213 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 213 1 2) checked21312 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 213 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 213 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 213 2 0) checked21320 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 213 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 213 2 1) checked21321 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 213 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 213 2 2) checked21322 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 213 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 213 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 213 3 0) checked21330 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 213 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 213 3 1) checked21331 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 213 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 213 3 2) checked21332 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 213 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 213 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 213 4 0) checked21340 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 213 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 213 4 1) checked21341 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 213 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 213 4 2) checked21342 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 213 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 213 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 213 5 0) checked21350 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 213 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 213 5 1) checked21351 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 213 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 213 5 2) checked21352 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block213
