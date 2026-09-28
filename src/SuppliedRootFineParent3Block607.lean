import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block607
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node607, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13957624261136632525587827022691827712),(9,3534287935825731080510655686933745762304),(11,63219788103086656761781702279065818368),(12,1904961916102314173760564335768152987136),(15,16261644218647793118097385323629509137664)] orbit.val

/-- Exact candidate at original node607, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,508700111473242611331827432663505960960),(3,7448306527213152421910199027588304732160),(6,13821064844253666628413948415381354840064)] orbit.val

/-- Exact candidate at original node607, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,508523562109770396363226929380531896320),(3,7448056038325621921127324912053074788352),(6,13821491882504669344165423034199558848512)] orbit.val

/-- Exact candidate at original node607, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,6361620322660376745561864198556745728),(9,1617947822675415991934003937949293477888),(11,66816733433348920671049058399035817984),(12,2077527197665230793190502645205407694848),(15,18009418108843405579114857369880871796736)] orbit.val

/-- Exact candidate at original node607, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,541203545128427231770161537872562225152),(3,6429756343357820631651226201576322367488),(6,14807111594453813798234587136184280940544)] orbit.val

/-- Exact candidate at original node607, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,558531043668356779702053792397471514624),(3,8030340658808427398854619813633314521088),(6,13189199780463277483099301269602379497472)] orbit.val

/-- Exact candidate at original node607, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,16587049504060308632805062466145878016),(9,3485263108527704523586954472573649289216),(11,59723313621394310827071936285748717568),(12,1791442865328887044430371354805960519680),(15,16425055145958015474178772049501661128704)] orbit.val

/-- Exact candidate at original node607, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,659549491102096035129649144104398880768),(3,7248056638596769499080595810587106082816),(6,13870465353241196127445729920941660569600)] orbit.val

/-- Exact candidate at original node607, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,473315686676625896362585200606681497600),(3,7524530195660483194041528932746626334720),(6,13780225600602952571251860742279857700864)] orbit.val

/-- Exact candidate at original node607, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14351592934597422513909997775043428352),(9,3418568322913522432740582216224351453184),(11,71051405667955948894025800359042111488),(12,1466146316013320088118896226647926591488),(15,16807953845410665769388560634626801948672)] orbit.val

/-- Exact candidate at original node607, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,734967242358953369476261982695329890304),(3,7299467437192437361453348834850535112704),(6,13743636803388670930726364058087300530176)] orbit.val

/-- Exact candidate at original node607, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,734199095943749103766483668182170075136),(3,7299940002556033836942950545518592262144),(6,13743932384440278720946540661932403195904)] orbit.val

/-- Exact candidate at original node607, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14765356185106463061421946830596341760),(9,3485321109469921873180473702962302025728),(11,59469909740478489170553106509665330176),(12,1783569006538062591220426780532311996416),(15,16434946101006492245023099338798289839104)] orbit.val

/-- Exact candidate at original node607, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,472876966171344955347502577633093222400),(3,7525396845495910648739091089127228047360),(6,13779797671272806057569381208872844263424)] orbit.val

/-- Exact candidate at original node607, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,661077734979520585880908308441676644352),(3,7246604310000809520117927406056249491456),(6,13870389437959731555657139161135239397376)] orbit.val

/-- Exact candidate at original node607, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14351592795948138113947406986341515264),(9,3418568315005561461785573020168745910272),(11,71051410079921539200187636308435456000),(12,1466146199359080630912152887056735559680),(15,16807953965699549891644113925112907091968)] orbit.val

/-- Exact candidate at original node607, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,734967275258868549531954419682171158528),(3,7299467442346798989030246048262772490240),(6,13743636765334394123093774407688221884416)] orbit.val

/-- Exact candidate at original node607, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,734199128751922713730280625411496869888),(3,7299940007985352160425979519373414498304),(6,13743932346202786787499714730848254164992)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked60700 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 607 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked60701 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 607 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked60702 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 607 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked60710 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 607 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked60711 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 607 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked60712 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 607 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked60720 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 607 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked60721 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 607 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked60722 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 607 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked60730 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 607 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked60731 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 607 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked60732 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 607 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked60740 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 607 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked60741 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 607 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked60742 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 607 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked60750 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 607 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked60751 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 607 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked60752 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 607 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 607 1 :=
  RootFineParent3CacheTable.single 607 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 607 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 607 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 607 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 607 0 0) checked60700 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 607 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 607 0 1) checked60701 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 607 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 607 0 2) checked60702 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 607 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 607 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 607 1 0) checked60710 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 607 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 607 1 1) checked60711 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 607 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 607 1 2) checked60712 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 607 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 607 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 607 2 0) checked60720 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 607 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 607 2 1) checked60721 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 607 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 607 2 2) checked60722 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 607 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 607 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 607 3 0) checked60730 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 607 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 607 3 1) checked60731 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 607 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 607 3 2) checked60732 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 607 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 607 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 607 4 0) checked60740 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 607 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 607 4 1) checked60741 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 607 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 607 4 2) checked60742 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 607 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 607 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 607 5 0) checked60750 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 607 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 607 5 1) checked60751 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 607 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 607 5 2) checked60752 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block607
