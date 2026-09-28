import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block115
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node115, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,126550596667387314784123748352),(3,2874216058560374471571353370624),(6,21778071479939295006428213089277688414208)] orbit.val

/-- Exact candidate at original node115, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(9,1067862878954230463721813368043995136),(11,600434004452572758385388541448192),(12,7230853746987158075870990356774903808),(15,21769772165880115820543623686519805186048)] orbit.val

/-- Exact candidate at original node115, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,8985698670282378962802919342080),(3,1067850892488904953581064209647534080),(6,21777003623061874086420014848620598657024)] orbit.val

/-- Exact candidate at original node115, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,717390575116253140896552621542324830208),(3,7292392854087505921488128309382189416448),(6,13768288053736302599271293944708651286528)] orbit.val

/-- Exact candidate at original node115, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,5476646733798522336153725566976),(9,2729474472126526436355838416832348291072),(11,65637482841694367530543905018360960000),(12,1264937232375893519483233987772677478400),(15,17718022290119300604487836229856053236736)] orbit.val

/-- Exact candidate at original node115, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,717393032232624039239460839704938676224),(3,7292588411105618258232958175280824844288),(6,13768090039601819364183555860647402012672)] orbit.val

/-- Exact candidate at original node115, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,474851376258128659137547358195733757952),(3,7439081613323169747411321696711469957120),(6,13864138493358763255107105820725961818112)] orbit.val

/-- Exact candidate at original node115, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,160357800928871019289332955480064),(9,2827243640918692159781617038743962648576),(11,49074065291719661598104405008440812544),(12,1697997998944501869583424149217820162048),(15,17203755617427347041821809993329986429952)] orbit.val

/-- Exact candidate at original node115, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,474861868304194038599975802661595250688),(3,7439442432860005267007508389951833112576),(6,13863767181775862356048490683019737169920)] orbit.val

/-- Exact candidate at original node115, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,474838524686109940350466049553243045888),(3,7439155848191650513036466047225379684352),(6,13864077110062301208269042778854542802944)] orbit.val

/-- Exact candidate at original node115, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,138545297436662618845610386653184),(9,2827448022016481927122901941781727805440),(11,49072181475832469956166965075845577728),(12,1697961735592556191487931921211647854592),(15,17203589405309893636426355201953557642240)] orbit.val

/-- Exact candidate at original node115, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,474838913065326255364704131202334851072),(3,7439302458512174884945960273222213566464),(6,13863930111362560521345310471208617115648)] orbit.val

/-- Exact candidate at original node115, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,717405647566259340374711179519182503936),(3,7292425772542090048290029415379947749376),(6,13768240062831712272991234280734035279872)] orbit.val

/-- Exact candidate at original node115, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,4149575011684594681461864398848),(9,2729471851531257273134334482876278505472),(11,65639826852316915841276223379616126464),(12,1264889108660405394120648477396340397056),(15,17718070691746507066875121010519066105344)] orbit.val

/-- Exact candidate at original node115, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,717405544647578853789696651806250106880),(3,7292563177524736304129328598886654148608),(6,13768102760767746503736949624940261277696)] orbit.val

/-- Exact candidate at original node115, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,680866650379948948589445533850969047040),(3,7258096050399016983819726284112888070144),(6,13839108782161095729246803057669308416000)] orbit.val

/-- Exact candidate at original node115, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,69324642199981295394350956544),(9,2718160455573325313053728728169379266560),(11,68312920662846137680490399841593303040),(12,1224838580287948879686984981590432071680),(15,17766759526346616689034789470637409935360)] orbit.val

/-- Exact candidate at original node115, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,733198418357379624953330098824712028160),(3,7403705014958549222784350416178348294144),(6,13641168049624132813918294360630105210880)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked11500 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 115 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked11501 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 115 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked11502 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 115 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked11510 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 115 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked11511 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 115 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked11512 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 115 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked11520 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 115 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked11521 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 115 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked11522 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 115 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked11530 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 115 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked11531 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 115 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked11532 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 115 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked11540 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 115 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked11541 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 115 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked11542 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 115 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked11550 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 115 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked11551 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 115 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked11552 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 115 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 115 1 :=
  RootFineParent3CacheTable.single 115 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 115 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 115 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 115 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 115 0 0) checked11500 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 115 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 115 0 1) checked11501 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 115 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 115 0 2) checked11502 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 115 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 115 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 115 1 0) checked11510 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 115 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 115 1 1) checked11511 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 115 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 115 1 2) checked11512 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 115 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 115 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 115 2 0) checked11520 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 115 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 115 2 1) checked11521 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 115 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 115 2 2) checked11522 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 115 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 115 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 115 3 0) checked11530 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 115 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 115 3 1) checked11531 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 115 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 115 3 2) checked11532 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 115 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 115 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 115 4 0) checked11540 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 115 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 115 4 1) checked11541 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 115 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 115 4 2) checked11542 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 115 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 115 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 115 5 0) checked11550 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 115 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 115 5 1) checked11551 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 115 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 115 5 2) checked11552 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block115
