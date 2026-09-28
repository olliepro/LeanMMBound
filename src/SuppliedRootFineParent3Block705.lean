import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block705
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node705, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13924119671464901879806779404587106304),(9,3535055073432858351613600721942746234880),(11,61756667704884997941039380269695621888),(12,1872692999536142434178787621343135025664),(15,16294642622594710976042740372673001544448)] orbit.val

/-- Exact candidate at original node705, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,508413741367546109336105872959404507136),(3,7449200097465111783261877870793758605312),(6,13820457644107403769057991131880002420736)] orbit.val

/-- Exact candidate at original node705, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,508572382802792235375713832180427784192),(3,7447917545658269028866536574235678081024),(6,13821581554479000397413724469217059667968)] orbit.val

/-- Exact candidate at original node705, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13948537622791952805841392263799767040),(9,3306151099603256833361152020244319961088),(11,63679209138411306447215563958063377920),(12,1928111508498144606600324847039263974400),(15,16466181128077456962441441052127718452736)] orbit.val

/-- Exact candidate at original node705, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,520896044294212642714403364877560184832),(3,7630231631702227193769215448365599293440),(6,13626943806943621825172356062390006054912)] orbit.val

/-- Exact candidate at original node705, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,511391902659980979895506733222575734784),(3,7324775952889029773446059507735060283392),(6,13941903627391050908314408634675529515008)] orbit.val

/-- Exact candidate at original node705, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14735169537183305563278247144026275840),(9,3484581394586750847892840205863199178752),(11,58227334910099363713245275509178591232),(12,1745551886055488048627994823891650686976),(15,16474975697850540095858616323225110800384)] orbit.val

/-- Exact candidate at original node705, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,669890403999203420410637725754554580992),(3,7241298674658937926792028723881256681472),(6,13866882404281920314453308425997354270720)] orbit.val

/-- Exact candidate at original node705, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,469326546569088406456379914764989497344),(3,7528610676579608136874335118517606547456),(6,13780134259791365118325259842350569488384)] orbit.val

/-- Exact candidate at original node705, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14352075543045857840839406648823906304),(9,3418681832799899249671419699566611529728),(11,71006764934541347495484093839099780096),(12,1466135536233281586759253638373398104064),(15,16807895273429293619888978037205232212992)] orbit.val

/-- Exact candidate at original node705, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,733926313390662330745622728686356660224),(3,7301091066017796315664697915411097714688),(6,13743054103531603015245654231535711158272)] orbit.val

/-- Exact candidate at original node705, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,734694929204415594420500016466334056448),(3,7299116127920883844684078197477258297344),(6,13744260425814762222551396661689573179392)] orbit.val

/-- Exact candidate at original node705, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14684859059775528851923814783983288320),(9,3328765288276554374115048358608849862656),(11,47724337055620066128107398750629490176),(12,1346853848570208649649187917099319763968),(15,17040043149977903042911707386390383128064)] orbit.val

/-- Exact candidate at original node705, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,450872619026361418496329127766970597376),(3,7289236148504241251190936250464073678848),(6,14037962715409458991968709497402121256960)] orbit.val

/-- Exact candidate at original node705, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,713827686669012314291523486498252914688),(3,7525240876706047870618338636387045081088),(6,13539002919565001476746112752747867537408)] orbit.val

/-- Exact candidate at original node705, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14352075141953285112376197581507657728),(9,3418681809873249722106177008434830901248),(11,71006777708747545838468081841104795392),(12,1466135197997609630045167312964058255872),(15,16807895622218501478553786274811663922944)] orbit.val

/-- Exact candidate at original node705, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,733926408479197924842465926603190829056),(3,7301091081541679111795153040280811208704),(6,13743053992919184625018355908749163495424)] orbit.val

/-- Exact candidate at original node705, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,734695024582450689204506493475859988480),(3,7299116142967100254155992241469613146112),(6,13744260315390510718295476140687692398592)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked70500 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 705 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked70501 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 705 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked70502 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 705 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked70510 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 705 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked70511 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 705 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked70512 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 705 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked70520 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 705 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked70521 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 705 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked70522 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 705 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked70530 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 705 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked70531 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 705 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked70532 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 705 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked70540 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 705 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked70541 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 705 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked70542 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 705 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked70550 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 705 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked70551 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 705 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked70552 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 705 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 705 1 :=
  RootFineParent3CacheTable.single 705 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 705 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 705 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 705 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 705 0 0) checked70500 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 705 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 705 0 1) checked70501 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 705 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 705 0 2) checked70502 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 705 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 705 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 705 1 0) checked70510 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 705 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 705 1 1) checked70511 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 705 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 705 1 2) checked70512 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 705 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 705 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 705 2 0) checked70520 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 705 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 705 2 1) checked70521 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 705 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 705 2 2) checked70522 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 705 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 705 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 705 3 0) checked70530 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 705 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 705 3 1) checked70531 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 705 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 705 3 2) checked70532 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 705 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 705 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 705 4 0) checked70540 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 705 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 705 4 1) checked70541 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 705 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 705 4 2) checked70542 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 705 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 705 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 705 5 0) checked70550 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 705 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 705 5 1) checked70551 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 705 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 705 5 2) checked70552 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block705
