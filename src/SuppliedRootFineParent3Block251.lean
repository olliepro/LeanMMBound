import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block251
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node251, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,640670558071738521749091186876715368448),(3,7643587509040018230971407511123830767616),(6,13493813415828304908935476177632619397120)] orbit.val

/-- Exact candidate at original node251, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,10568252713712617546555909773977452544),(9,3213545829949046510740229367301385748480),(11,42438172490795561634492841013828018944),(12,1338746991978617677478700685065334241792),(15,17172772235807889294255996072478640071424)] orbit.val

/-- Exact candidate at original node251, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,443475152627485964255441884101199527936),(3,7286421188127813798107806432837752586240),(6,14048175142184761899292726558694213419008)] orbit.val

/-- Exact candidate at original node251, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,728411653556189560683678989174043574272),(3,7298757775520150002796151156505399263232),(6,13750902053863722098176144729953722695680)] orbit.val

/-- Exact candidate at original node251, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,10194327502669096364557025243954151424),(9,3253073866559570817638575558172545646592),(11,69296835912067702853673519812664930304),(12,1433485832500203594710823471962987077632),(15,17012020620465550450088345300441013727232)] orbit.val

/-- Exact candidate at original node251, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,728195987621032120597870835837784031232),(3,7299094827685666611473380627865829113856),(6,13750780667633362929584723411929552388096)] orbit.val

/-- Exact candidate at original node251, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,501950216975801252720045209047892230144),(3,7445944699328569471957801167229865164800),(6,13830176566635690936978128499355408138240)] orbit.val

/-- Exact candidate at original node251, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,8980387357407740185632159345319870464),(9,3364345553478035098211513305050766114816),(11,58852443082889041671859504886569476096),(12,1836465004470115785677236764003631939584),(15,16509428094551613995909733142346878132224)] orbit.val

/-- Exact candidate at original node251, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,501950341275744691580519503182952398848),(3,7445952845859533063594330628231236943872),(6,13830168295804783906481124744218976190464)] orbit.val

/-- Exact candidate at original node251, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,468123791526416061994958999702271426560),(3,7616282374587559122952810159566772764672),(6,13693665316826086476708205716364121341952)] orbit.val

/-- Exact candidate at original node251, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,2262954391813675142515599081472),(9,3324316446355733740450754842413645168640),(11,57065276426113257728416567582108804096),(12,1743053670780925257700189599745866217472),(15,16653636087114335013962938723375946261504)] orbit.val

/-- Exact candidate at original node251, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,712552553177681514168013725750051995648),(3,7246178052458913989398836402246658293760),(6,13819340877303466158089124747636455243776)] orbit.val

/-- Exact candidate at original node251, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,728198630007817985621764888589867417600),(3,7299095092105886992450910065747336101888),(6,13750777760826356683583299921295962013696)] orbit.val

/-- Exact candidate at original node251, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,10194319441203560538160675100857204736),(9,3253073255126130134117833222196301922304),(11,69297201627360075697470670236986081280),(12,1433476367987857066591419715701084585984),(15,17012030338757510824711090592397935738880)] orbit.val

/-- Exact candidate at original node251, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,728414307151126880902885953871290564608),(3,7298758468805047614059630845781614788608),(6,13750898706983887166693458075980260179968)] orbit.val

/-- Exact candidate at original node251, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,464068298989017871329938579937451573248),(3,7524150105653017125152572825093349048320),(6,13789853078298026665173463470602364911616)] orbit.val

/-- Exact candidate at original node251, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,15794198887013288596104631628117049344),(9,3316284170505199263510604857892824678400),(11,57141189687970543483205113803632813056),(12,1754810938595291503355366457317295372288),(15,16634040985264587062710693814991295620096)] orbit.val

/-- Exact candidate at original node251, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,655845313261858348150658310463350112256),(3,7247873090027063259928285417023903629312),(6,13874353079651140053577031148145911791616)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked25100 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 251 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked25101 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 251 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked25102 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 251 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked25110 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 251 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked25111 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 251 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked25112 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 251 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked25120 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 251 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked25121 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 251 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked25122 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 251 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked25130 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 251 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked25131 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 251 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked25132 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 251 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked25140 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 251 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked25141 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 251 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked25142 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 251 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked25150 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 251 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked25151 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 251 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked25152 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 251 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 251 1 :=
  RootFineParent3CacheTable.single 251 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 251 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 251 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 251 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 251 0 0) checked25100 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 251 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 251 0 1) checked25101 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 251 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 251 0 2) checked25102 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 251 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 251 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 251 1 0) checked25110 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 251 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 251 1 1) checked25111 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 251 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 251 1 2) checked25112 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 251 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 251 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 251 2 0) checked25120 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 251 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 251 2 1) checked25121 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 251 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 251 2 2) checked25122 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 251 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 251 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 251 3 0) checked25130 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 251 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 251 3 1) checked25131 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 251 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 251 3 2) checked25132 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 251 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 251 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 251 4 0) checked25140 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 251 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 251 4 1) checked25141 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 251 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 251 4 2) checked25142 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 251 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 251 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 251 5 0) checked25150 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 251 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 251 5 1) checked25151 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 251 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 251 5 2) checked25152 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block251
