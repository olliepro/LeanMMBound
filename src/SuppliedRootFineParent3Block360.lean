import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block360
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node360, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,737355473964831493064282265057115504640),(3,7289086313401978260984715533518903443456),(6,13751629695573251907606977077057146585088)] orbit.val

/-- Exact candidate at original node360, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,711587827341833722344049446225616830464),(3,7349678007731052268737807682838326149120),(6,13716805647867175670574117746569222553600)] orbit.val

/-- Exact candidate at original node360, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14377387232611911082875764580164829184),(9,3422977552897198082278357596569671303168),(11,69352665709946749165286400717504041984),(12,1465755907021457031262069405528197060608),(15,16805607970078847887867385708237628298240)] orbit.val

/-- Exact candidate at original node360, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,663636119869019483083944537523138592768),(3,7237831827919405655637278236487949746176),(6,13876603535151636522934752101622077194240)] orbit.val

/-- Exact candidate at original node360, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,462916919286438961846264623121542676480),(3,7563929212934508144862868058985038086144),(6,13751225350719114554946842193526584770560)] orbit.val

/-- Exact candidate at original node360, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,15198105395181853114869631181003948032),(9,3483347013887521701414732034899957514240),(11,58958126693036580813096188899062685184),(12,1783618592261417764703280757160031077376),(15,16436949644702903761609996263493110308352)] orbit.val

/-- Exact candidate at original node360, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,737355016598525404510531123120833560576),(3,7289086274517736681286646637193055961088),(6,13751630191823799575858797115319276011520)] orbit.val

/-- Exact candidate at original node360, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,711587392387887093188145513438895931392),(3,7349677941611436836586050026355929645056),(6,13716806148940737731881779335838339956736)] orbit.val

/-- Exact candidate at original node360, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14377389292544136453748542012307537920),(9,3422977672462398836617526067426685353984),(11,69352609981631022756260481662229083648),(12,1465757635236676404681703656291704640512),(15,16805606175966811261146736128240238917120)] orbit.val

/-- Exact candidate at original node360, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,476380010589689197810017568947913621504),(3,7519155542677760406805256061734958923776),(6,13782535929672612057040701244950292987904)] orbit.val

/-- Exact candidate at original node360, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,638273188848624022354960084789324939264),(3,7298821854858370868798676706378265919488),(6,13840976439233066770502338084465574674432)] orbit.val

/-- Exact candidate at original node360, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,48039087603403662802176218536316239872),(9,3486567003447271267523592292545318617088),(11,58776184214066946692055942476167028736),(12,1784242726681502913946104232385689862144),(15,16400446480993816870692046189689673785344)] orbit.val

/-- Exact candidate at original node360, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,506637048820387028442276536439181148160),(3,7364525892226598076884136625383539736576),(6,13906908541893076556329561713810444648448)] orbit.val

/-- Exact candidate at original node360, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,502364893262458412952740213520857038848),(3,7565741886410778980361624204838694813696),(6,13709964703266824268341610457273613680640)] orbit.val

/-- Exact candidate at original node360, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13984772900216420400564981166889762816),(9,3534499015818165993773071278200003231744),(11,62583097617383067622743101032390034944),(12,1900392706634439410883506734239274300416),(15,16266611889969856768976088780994608203264)] orbit.val

/-- Exact candidate at original node360, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,504027239699175132317589986414585446400),(3,7445540260957541382791567788311696113664),(6,13828503982283345146546817100906883973120)] orbit.val

/-- Exact candidate at original node360, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,500313175140587257871540233296691593216),(3,7486099475086351065824798196888242225152),(6,13791658832713123337959636445448231714816)] orbit.val

/-- Exact candidate at original node360, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,36033958663518849041763707912192),(9,3541796849315757806417282672880089300992),(11,61934651918207508583026830809493686272),(12,1891900554253916682054557872008258351104),(15,16282439391418221001082258458171616282624)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked36000 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 360 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked36001 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 360 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked36002 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 360 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked36010 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 360 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked36011 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 360 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked36012 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 360 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked36020 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 360 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked36021 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 360 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked36022 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 360 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked36030 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 360 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked36031 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 360 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked36032 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 360 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked36040 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 360 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked36041 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 360 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked36042 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 360 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked36050 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 360 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked36051 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 360 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked36052 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 360 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 360 1 :=
  RootFineParent3CacheTable.single 360 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 360 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 360 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 360 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 360 0 0) checked36000 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 360 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 360 0 1) checked36001 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 360 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 360 0 2) checked36002 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 360 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 360 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 360 1 0) checked36010 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 360 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 360 1 1) checked36011 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 360 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 360 1 2) checked36012 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 360 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 360 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 360 2 0) checked36020 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 360 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 360 2 1) checked36021 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 360 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 360 2 2) checked36022 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 360 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 360 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 360 3 0) checked36030 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 360 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 360 3 1) checked36031 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 360 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 360 3 2) checked36032 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 360 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 360 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 360 4 0) checked36040 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 360 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 360 4 1) checked36041 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 360 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 360 4 2) checked36042 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 360 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 360 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 360 5 0) checked36050 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 360 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 360 5 1) checked36051 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 360 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 360 5 2) checked36052 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block360
