import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block160
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node160, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,726831374981955112315315838509664698368),(3,7301923418737533569700159944873555787776),(6,13749316689220572979640499092249945047040)] orbit.val

/-- Exact candidate at original node160, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,727100876773893274577082686080286720000),(3,7301508075259277757731056358075683307520),(6,13749462530906890629347835831477195505664)] orbit.val

/-- Exact candidate at original node160, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,12866004961253544457342701389437992960),(9,3351793654920177636333131779434740711424),(11,69655908566671886252173092973080811520),(12,1473896190048398235378171854969230970880),(15,16869859724443560359235155446866675046400)] orbit.val

/-- Exact candidate at original node160, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,656616611642945105041628223552131956736),(3,7249384191901984642518822005535290687488),(6,13872070679395131914095524646545742888960)] orbit.val

/-- Exact candidate at original node160, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,470877576364240403333217611763612123136),(3,7522523974486581189689634600353601159168),(6,13784669932089240068633122663515952250880)] orbit.val

/-- Exact candidate at original node160, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14454045347424696299612759255471357952),(9,3415396571885985131244968771175223132160),(11,59136432990738200061373282524148334592),(12,1788958010231247244312636703443775782912),(15,16500126422484666389737383359234546925568)] orbit.val

/-- Exact candidate at original node160, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,727101173137110195598104360403085557760),(3,7301507514967244461066960075259599912960),(6,13749462794835707004990910439970480062464)] orbit.val

/-- Exact candidate at original node160, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,726831700598232971371847148575744065536),(3,7301924077338056304249503911706795966464),(6,13749315705003772386034623815350625501184)] orbit.val

/-- Exact candidate at original node160, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,12866003787686387214802200785068228608),(9,3351793580846797445653117650570743644160),(11,69655948225603467403514332159282510848),(12,1473895072640270548365806736940239161344),(15,16869860877439703813018733955177831988224)] orbit.val

/-- Exact candidate at original node160, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,469994791932196074311763651445802401792),(3,7524632009295081879166951156235464867840),(6,13783444681712783708177260067951898263552)] orbit.val

/-- Exact candidate at original node160, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,658958560843472547187179624264961622016),(3,7247789105351379856303780947472903307264),(6,13871323816745209258165014303895300603904)] orbit.val

/-- Exact candidate at original node160, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,4951760157141521099596496896),(9,3417752544894280303575679446467026616320),(11,58910360370971931046838868403455493632),(12,1781586842580600680173771182110075843584),(15,16519821735089256986702543857553011082752)] orbit.val

/-- Exact candidate at original node160, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,506272053445740163778169292374918823936),(3,7448034813069598530351356090879706136576),(6,13823764616424722967526449492378540572672)] orbit.val

/-- Exact candidate at original node160, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,506430465100527652015299854013156032512),(3,7447731085570759759736438919465013346304),(6,13823909932268774249904236102154996154368)] orbit.val

/-- Exact candidate at original node160, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,12356178182665978043188717743664791552),(9,3463752658537757073202779311272561213440),(11,62514073151420483954319936763917108736),(12,1900943418694668215502543902008759546880),(15,16338505154373549910953143007844262872576)] orbit.val

/-- Exact candidate at original node160, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,506158711252973611339727848462232846336),(3,7448149966893529133958140948768360497152),(6,13823762804793558916358106078402572189696)] orbit.val

/-- Exact candidate at original node160, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,506136529895075827215053883065073926144),(3,7448381092133758203007292477096559902720),(6,13823553860911227631433628515471531704320)] orbit.val

/-- Exact candidate at original node160, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,12926866822515763821809392450944368640),(9,3463382068381745228249514694879565840384),(11,62124003718225641305415293363865858048),(12,1892735080147165809847248419828726079488),(15,16346903463870409218431987075110063386624)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked16000 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 160 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked16001 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 160 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked16002 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 160 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked16010 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 160 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked16011 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 160 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked16012 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 160 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked16020 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 160 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked16021 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 160 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked16022 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 160 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked16030 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 160 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked16031 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 160 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked16032 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 160 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked16040 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 160 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked16041 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 160 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked16042 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 160 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked16050 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 160 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked16051 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 160 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked16052 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 160 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 160 1 :=
  RootFineParent3CacheTable.single 160 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 160 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 160 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 160 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 160 0 0) checked16000 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 160 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 160 0 1) checked16001 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 160 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 160 0 2) checked16002 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 160 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 160 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 160 1 0) checked16010 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 160 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 160 1 1) checked16011 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 160 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 160 1 2) checked16012 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 160 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 160 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 160 2 0) checked16020 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 160 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 160 2 1) checked16021 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 160 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 160 2 2) checked16022 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 160 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 160 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 160 3 0) checked16030 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 160 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 160 3 1) checked16031 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 160 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 160 3 2) checked16032 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 160 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 160 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 160 4 0) checked16040 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 160 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 160 4 1) checked16041 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 160 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 160 4 2) checked16042 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 160 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 160 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 160 5 0) checked16050 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 160 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 160 5 1) checked16051 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 160 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 160 5 2) checked16052 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block160
