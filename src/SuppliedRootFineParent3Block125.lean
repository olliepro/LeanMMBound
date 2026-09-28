import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block125
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node125, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,646852494000079179539144145285991628800),(3,7239866477575229145972575727042951118848),(6,13891352511364753336144255003304222785536)] orbit.val

/-- Exact candidate at original node125, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,53145889936077046326709011341115392),(9,3014661798570424659582010404268981354496),(11,50354356026121395060743649535222530304),(12,1634388887593141889929479015614971018752),(15,17078613294860437640037415097202649514240)] orbit.val

/-- Exact candidate at original node125, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,438850285025593194109704816421916114944),(3,7516846907506138049650615346910625529856),(6,13822374290408330417895654712300623888384)] orbit.val

/-- Exact candidate at original node125, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,725176619160359571209807097705468526592),(3,7293403750299884913470981969382123503616),(6,13759491113479817176975185808545573502976)] orbit.val

/-- Exact candidate at original node125, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,41860917669634348288108387652075520),(9,2952851430388428203647952801859039657984),(11,67419993529306279687156861072426413824),(12,1301327122925150001142572723750119645696),(15,17456431075179507542830004380563927740160)] orbit.val

/-- Exact candidate at original node125, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,725176927522261306312093908892687269888),(3,7293445094926292054187370773426055675904),(6,13759449460491508301156510193314422587392)] orbit.val

/-- Exact candidate at original node125, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,482691887618405637076019711588477960192),(3,7442178930375417358703525237350572490752),(6,13853200664946238665876429926694115082240)] orbit.val

/-- Exact candidate at original node125, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,45935176409328820433645389333135360),(9,3058491322088223285788484040024293113856),(11,52252838244816183489764436859441729792),(12,1743424036023632005860971589495414414848),(15,16923857351406980857696321163864683139328)] orbit.val

/-- Exact candidate at original node125, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,483244951899423758389897118672576577536),(3,7441376596191494227274177400873924165632),(6,13853449934849143675991900356086664790016)] orbit.val

/-- Exact candidate at original node125, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,482662883546230843709587050703263629312),(3,7442146867781529833332178527863168827392),(6,13853261731612300984614209297066733076480)] orbit.val

/-- Exact candidate at original node125, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,45875369050150865141804462843625472),(9,3058048139479882717292947337058153660416),(11,52208788109733486030689936181950928896),(12,1743005798183823234832998570893448859648),(15,16924762881797572072634197227036768458752)] orbit.val

/-- Exact candidate at original node125, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,482665374569480399828091032173644087296),(3,7442121995401532976552428423277994573824),(6,13853284112969048285275455420181526872064)] orbit.val

/-- Exact candidate at original node125, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,725175978211278129810446280279082401792),(3,7293403584805307162802216506523025145856),(6,13759491919923476369043312088831057985536)] orbit.val

/-- Exact candidate at original node125, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,41860828537951519740728594915131392),(9,2952851562902481768912198948160893091840),(11,67419886885030541497848744459852468224),(12,1301329358142383257246615832353047273472),(15,17456428814181628142479570622064457568256)] orbit.val

/-- Exact candidate at original node125, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,725176286533204600629314031263080775680),(3,7293444929407316685759184596475423227904),(6,13759450266999540375267476247894661529600)] orbit.val

/-- Exact candidate at original node125, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,438791682733315486188326603669314207744),(3,7516879053202480251324580721826646196224),(6,13822400747004265924143067550137205129216)] orbit.val

/-- Exact candidate at original node125, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,51024892604448304311076644632657920),(9,3014596050272625291707390462587566030848),(11,50346689042345782048514685033033240576),(12,1634335986008323707098409917810761261056),(15,17078741732724162432497348733557172342784)] orbit.val

/-- Exact candidate at original node125, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,646930797972129212452531575336877424640),(3,7239707605058611432397531345465177538560),(6,13891433079909321016805911954831110569984)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked12500 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 125 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked12501 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 125 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked12502 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 125 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked12510 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 125 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked12511 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 125 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked12512 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 125 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked12520 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 125 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked12521 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 125 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked12522 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 125 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked12530 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 125 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked12531 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 125 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked12532 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 125 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked12540 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 125 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked12541 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 125 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked12542 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 125 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked12550 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 125 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked12551 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 125 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked12552 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 125 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 125 1 :=
  RootFineParent3CacheTable.single 125 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 125 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 125 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 125 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 125 0 0) checked12500 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 125 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 125 0 1) checked12501 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 125 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 125 0 2) checked12502 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 125 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 125 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 125 1 0) checked12510 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 125 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 125 1 1) checked12511 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 125 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 125 1 2) checked12512 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 125 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 125 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 125 2 0) checked12520 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 125 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 125 2 1) checked12521 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 125 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 125 2 2) checked12522 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 125 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 125 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 125 3 0) checked12530 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 125 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 125 3 1) checked12531 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 125 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 125 3 2) checked12532 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 125 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 125 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 125 4 0) checked12540 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 125 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 125 4 1) checked12541 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 125 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 125 4 2) checked12542 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 125 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 125 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 125 5 0) checked12550 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 125 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 125 5 1) checked12551 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 125 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 125 5 2) checked12552 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block125
