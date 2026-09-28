import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block842
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node842, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,10551421463061046602111452898782085120),(9,3443010965439929401084647006230116564992),(11,60484558233208243075082666530787894272),(12,1865489134081251935062845722683679553536),(15,16398535403722611035831288027289799435264)] orbit.val

/-- Exact candidate at original node842, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,502313423859582593435965597835862212608),(3,7447344560741288502359557439343095185408),(6,13828413498339190565860451838454208135168)] orbit.val

/-- Exact candidate at original node842, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,502250829313295286868786496937945726976),(3,7447452455554249549218476316467109298176),(6,13828368198072516825568712062228110508032)] orbit.val

/-- Exact candidate at original node842, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,10541247556835143004294137537873575936),(9,3441822009811536995493176405723080294400),(11,60850384262738587160129583440167305216),(12,1872757093676897508229092424095322865664),(15,16392100747632053427769282324836721491968)] orbit.val

/-- Exact candidate at original node842, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,502993656505793843779205293192551333888),(3,7445674289876497146483156610435600351232),(6,13829403536557770671393612972005013848064)] orbit.val

/-- Exact candidate at original node842, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,502518058426660223222756446597875236864),(3,7445212776155073053726272856174876426240),(6,13830340648358328384706945572860413870080)] orbit.val

/-- Exact candidate at original node842, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,9897007442411719613585454105106579456),(9,3395135463620576407659383652211255934976),(11,57230411996923446307218225869050751488),(12,1750204343052048983172710345846359829504),(15,16565604256828101104903077197601392437760)] orbit.val

/-- Exact candidate at original node842, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,658047561262708906071303546657902166016),(3,7244173434651983901440086567668936605696),(6,13875850487025368854144584761306326761472)] orbit.val

/-- Exact candidate at original node842, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,465304591143907140946723069911621435392),(3,7522539418241251417694899071391688032256),(6,13790227473554903103014352734329856065536)] orbit.val

/-- Exact candidate at original node842, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,10844646457282548572265826531468640256),(9,3328666663405968725382343867834241646592),(11,70072253839982915778747978071315457024),(12,1422774926175700928581758138431521404928),(15,16945712993061126543340859064764618384384)] orbit.val

/-- Exact candidate at original node842, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,732440851908824804644534240707883302912),(3,7298369117088025710888997189212558065664),(6,13747261513943211146122443445712724164608)] orbit.val

/-- Exact candidate at original node842, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,732674282321682739206271066661743230976),(3,7298006294864837914838696032183645110272),(6,13747390905753541007611007776787777191936)] orbit.val

/-- Exact candidate at original node842, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,9875081830814001786516774553097601024),(9,3395007090303130947510303649442473967616),(11,57324347330375229996762169655711371264),(12,1751338307634277124580379083542821068800),(15,16564526655841464357782013198439061524480)] orbit.val

/-- Exact candidate at original node842, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,464393107512131792292362019976685551616),(3,7523062382304609780862133748344123555840),(6,13790615993123320088501479107312356425728)] orbit.val

/-- Exact candidate at original node842, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,655658146165163242337984718940147810304),(3,7247096312977800901967309490273747206144),(6,13875317023797097517350680666419270516736)] orbit.val

/-- Exact candidate at original node842, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,10844646521655430615105600826223099904),(9,3328666663445582806639476036631013621760),(11,70072253803787960739829732600569604096),(12,1422774927459342081990457909267895791616),(15,16945712991709693381671105596307463415808)] orbit.val

/-- Exact candidate at original node842, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,732674253109782814985450994592364101632),(3,7298004440843121915624777590111710740480),(6,13747392788987156931045746290929090691072)] orbit.val

/-- Exact candidate at original node842, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,732440880373860731305753993122320220160),(3,7298370970994999440319891279609644187648),(6,13747259631571201490030329602901201125376)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked84200 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 842 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked84201 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 842 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked84202 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 842 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked84210 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 842 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked84211 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 842 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked84212 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 842 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked84220 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 842 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked84221 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 842 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked84222 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 842 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked84230 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 842 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked84231 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 842 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked84232 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 842 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked84240 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 842 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked84241 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 842 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked84242 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 842 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked84250 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 842 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked84251 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 842 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked84252 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 842 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 842 1 :=
  RootFineParent3CacheTable.single 842 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 842 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 842 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 842 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 842 0 0) checked84200 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 842 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 842 0 1) checked84201 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 842 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 842 0 2) checked84202 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 842 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 842 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 842 1 0) checked84210 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 842 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 842 1 1) checked84211 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 842 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 842 1 2) checked84212 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 842 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 842 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 842 2 0) checked84220 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 842 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 842 2 1) checked84221 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 842 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 842 2 2) checked84222 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 842 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 842 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 842 3 0) checked84230 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 842 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 842 3 1) checked84231 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 842 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 842 3 2) checked84232 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 842 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 842 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 842 4 0) checked84240 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 842 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 842 4 1) checked84241 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 842 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 842 4 2) checked84242 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 842 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 842 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 842 5 0) checked84250 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 842 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 842 5 1) checked84251 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 842 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 842 5 2) checked84252 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block842
