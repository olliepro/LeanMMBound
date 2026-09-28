import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block104
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node104, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,674899232108792588389809536478430101504),(3,6496515860243619784083225108880023355392),(6,14606656390587649289182940230274712076288)] orbit.val

/-- Exact candidate at original node104, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(9,1660463917922164138276050361075269369856),(11,63516374812131994632338345584672284672),(12,1236244964530164118029809652186068729856),(15,18817846225675601410717776516787155148800)] orbit.val

/-- Exact candidate at original node104, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,674881582264165470363509920419138240512),(3,8156997428010411040385575086014584586240),(6,12946192472665485150906889869199442706432)] orbit.val

/-- Exact candidate at original node104, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,703641839924304559261313728114816188416),(3,7284952533802441139666021067597277036544),(6,13789477109213315962728640079921072308224)] orbit.val

/-- Exact candidate at original node104, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,2654143444227855309383722336256),(9,2007058093711888558024704254381719027712),(11,62608664177949228347074854398921601024),(12,1199642706315415145534913669643560689664),(15,18508762016080665285521426787825241878528)] orbit.val

/-- Exact candidate at original node104, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,703670007840772919205387179663455944704),(3,7286211034736195343349239145017624231936),(6,13788190440363093399101348550952085356544)] orbit.val

/-- Exact candidate at original node104, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,700510123456984339994948221376451837952),(3,7283073231264866249264382874353689165824),(6,13794488128218211072396643779903024529408)] orbit.val

/-- Exact candidate at original node104, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,2802696248942100942371617243136),(9,2006730556327553850283865771556003119104),(11,62061452627692827178019908285722212864),(12,1194503215871007459704601971067362315264),(15,18514776255311111275547386282352460642816)] orbit.val

/-- Exact candidate at original node104, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,700541235423052359610710927301270306816),(3,7284396413911635501515398072190667587584),(6,13793133833605373800529865876141227638784)] orbit.val

/-- Exact candidate at original node104, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,703652012319101578050581669276528148480),(3,7284987284597781894841661168388424073216),(6,13789432186023178188763732037968213311488)] orbit.val

/-- Exact candidate at original node104, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,1950993501913759313241019777024),(9,2007057666429456358439990091299598368768),(11,62610216769195503599012130411774430208),(12,1199628233935391353936468683569136494592),(15,18508775363855024943766744657111636462592)] orbit.val

/-- Exact candidate at original node104, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,703677430712735938530926848229058281472),(3,7286183343265087750620977875975365722112),(6,13788210708962237972504070151428741529600)] orbit.val

/-- Exact candidate at original node104, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,703652138657972865531432277984476659712),(3,7284989428507245132505413654985196961792),(6,13789429915774843663619128942663491911680)] orbit.val

/-- Exact candidate at original node104, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,1931186461285193228842633789440),(9,2007058764774425053843643671698978373632),(11,62610223783197567527789958195995634688),(12,1199651838333984695214781513384227710976),(15,18508750654117267883784566503511330024448)] orbit.val

/-- Exact candidate at original node104, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,703677480080674771339622186037018624000),(3,7286183735960585186464437183545069273088),(6,13788210266898801703851915506051077636096)] orbit.val

/-- Exact candidate at original node104, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,703827216349370735641199836997336694784),(3,7285198652019400460278079891495903559680),(6,13789045614571290465736695147139925278720)] orbit.val

/-- Exact candidate at original node104, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(9,2007038336317607327441196412948612907008),(11,62639946785909654819321123967540046848),(12,1199108909327575938263921571490552260608),(15,18509284290508968741131535767226460318720)] orbit.val

/-- Exact candidate at original node104, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,703838152429555296372004879806662443008),(3,7286080109611927466440371184079248293888),(6,13788153220898578898843598811747254796288)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked10400 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 104 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked10401 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 104 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked10402 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 104 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked10410 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 104 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked10411 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 104 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked10412 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 104 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked10420 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 104 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked10421 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 104 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked10422 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 104 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked10430 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 104 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked10431 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 104 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked10432 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 104 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked10440 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 104 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked10441 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 104 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked10442 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 104 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked10450 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 104 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked10451 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 104 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked10452 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 104 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 104 1 :=
  RootFineParent3CacheTable.single 104 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 104 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 104 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 104 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 104 0 0) checked10400 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 104 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 104 0 1) checked10401 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 104 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 104 0 2) checked10402 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 104 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 104 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 104 1 0) checked10410 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 104 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 104 1 1) checked10411 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 104 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 104 1 2) checked10412 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 104 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 104 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 104 2 0) checked10420 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 104 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 104 2 1) checked10421 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 104 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 104 2 2) checked10422 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 104 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 104 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 104 3 0) checked10430 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 104 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 104 3 1) checked10431 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 104 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 104 3 2) checked10432 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 104 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 104 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 104 4 0) checked10440 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 104 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 104 4 1) checked10441 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 104 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 104 4 2) checked10442 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 104 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 104 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 104 5 0) checked10450 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 104 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 104 5 1) checked10451 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 104 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 104 5 2) checked10452 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block104
