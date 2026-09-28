import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block921
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node921, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,11430257256076441267569261879723294720),(9,480375000458240104919465387313078468608),(11,19252953215360074612302234267977331712),(12,949453273384211461911811414598076438528),(15,20317559998626173578944826577574309999616)] orbit.val

/-- Exact candidate at original node921, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,43836963052436492976025452791757537280),(3,10777585066931291094628336406806961061888),(6,10956649452956334074051613016034446934016)] orbit.val

/-- Exact candidate at original node921, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,39578447807207142778408198182306578432),(3,10782822097980982812567997947591906033664),(6,10955670937151871706309568729858952921088)] orbit.val

/-- Exact candidate at original node921, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,12606531070179676109314276587261132800),(9,5903904065134681447532173666124054921216),(11,69414785153284383097528686362731833344),(12,1872204831577142826198105579985538723840),(15,13919941270004773328718852666573578921984)] orbit.val

/-- Exact candidate at original node921, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,691076785823658550485784925389524566016),(3,10868173460070594485097140530895260745728),(6,10218821237045808626073049419348380221440)] orbit.val

/-- Exact candidate at original node921, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,725357468882000433958554840710414073856),(3,11271695929385590313015991087282008358912),(6,9781018084672470914681428947640743100416)] orbit.val

/-- Exact candidate at original node921, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,18101292550862500472181474441427943424),(9,2033214963690285158807138422172954918912),(11,21679040793202078158954945363525540352),(12,1203015494527766819842772677194002910208),(15,18502060691377945104374927356461254220288)] orbit.val

/-- Exact candidate at original node921, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,40157451780465597444843045543175258112),(3,2761896209345589396361684506419545505792),(6,18976017821814006667849447323670444769280)] orbit.val

/-- Exact candidate at original node921, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,3844760483735564987285730817692663808),(3,3009554467254569828979789512411849949184),(6,18764672255201756267688899632403622920192)] orbit.val

/-- Exact candidate at original node921, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14351040065624117505937706726568493056),(9,3418458836510536658952732914621293264896),(11,71092767262301927747443200089376483328),(12,1466157110625161276893571362877863768064),(15,16808011728476437680556289691318063523840)] orbit.val

/-- Exact candidate at original node921, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,734668936732484856356822261718002434048),(3,7299367932599625735135246444710798032896),(6,13744034613607951070163906169204365066240)] orbit.val

/-- Exact candidate at original node921, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,734980334464320094655257033356009799680),(3,7298885777672333446466258712430722940928),(6,13744205370803408120534459129846432792576)] orbit.val

/-- Exact candidate at original node921, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,9806670511064444301840117572827086848),(9,1009401516511691434943672781163406032896),(11,51332617562618588694209182676087678976),(12,1766374142138405084440230638309455540224),(15,18941156536216282109276022155911389194240)] orbit.val

/-- Exact candidate at original node921, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,720684801765718492167797658718568448),(3,4670061006940458603834977015174216548352),(6,17107289791197837339328830062800230416384)] orbit.val

/-- Exact candidate at original node921, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,4693355484839469288145010503224131584),(3,3845078866589158342500365039174697353216),(6,17928299260866063849867464825955244048384)] orbit.val

/-- Exact candidate at original node921, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14351040328067405834438325005182828544),(9,3418458851281637207705890354717643505664),(11,71092759013057887900033480399408591872),(12,1466157328521933361981681739748119418880),(15,16808011503795365798233930975762811188224)] orbit.val

/-- Exact candidate at original node921, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,734668875434337326209301059099173060608),(3,7299367922622137563387712939737651085312),(6,13744034684883586772058960876796341387264)] orbit.val

/-- Exact candidate at original node921, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,734980273027151392685885057105402003456),(3,7298885767838818206697717502188950913024),(6,13744205442074092062272372316338812616704)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked92100 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 921 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked92101 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 921 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked92102 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 921 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked92110 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 921 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked92111 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 921 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked92112 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 921 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked92120 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 921 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked92121 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 921 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked92122 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 921 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked92130 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 921 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked92131 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 921 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked92132 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 921 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked92140 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 921 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked92141 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 921 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked92142 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 921 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked92150 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 921 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked92151 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 921 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked92152 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 921 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 921 1 :=
  RootFineParent3CacheTable.single 921 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 921 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 921 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 921 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 921 0 0) checked92100 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 921 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 921 0 1) checked92101 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 921 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 921 0 2) checked92102 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 921 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 921 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 921 1 0) checked92110 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 921 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 921 1 1) checked92111 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 921 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 921 1 2) checked92112 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 921 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 921 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 921 2 0) checked92120 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 921 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 921 2 1) checked92121 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 921 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 921 2 2) checked92122 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 921 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 921 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 921 3 0) checked92130 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 921 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 921 3 1) checked92131 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 921 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 921 3 2) checked92132 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 921 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 921 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 921 4 0) checked92140 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 921 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 921 4 1) checked92141 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 921 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 921 4 2) checked92142 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 921 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 921 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 921 5 0) checked92150 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 921 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 921 5 1) checked92151 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 921 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 921 5 2) checked92152 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block921
