import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block564
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node564, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,659001333057023750417384224139656560640),(3,7247177571287277132946513779083028987904),(6,13871892578595760778292076872410479984640)] orbit.val

/-- Exact candidate at original node564, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14134635257325343994505917562531872768),(9,3467291140329343263864395389404197158912),(11,59139209957162008376198997316446072832),(12,1781772207277118420019613420583732355072),(15,16455734290119112625401261150766258073600)] orbit.val

/-- Exact candidate at original node564, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,470890995722180483032463673681804001280),(3,7525230395887345755245290961007548563456),(6,13781950091330535423378220240943812968448)] orbit.val

/-- Exact candidate at original node564, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,735096928687940797376004159754360324096),(3,7297877555971753811674258033404859645952),(6,13745096998280367052605712682473945563136)] orbit.val

/-- Exact candidate at original node564, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13757060836730497054249643194928070656),(9,3400380222575535452504450693171964280832),(11,70820114247179899560455617538466483200),(12,1455437265443919459252554781652060530688),(15,16837676819836696353284264140075746167808)] orbit.val

/-- Exact candidate at original node564, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,733072638531015312378437262470107103232),(3,7301344916576004943257264791091981320192),(6,13743653927833041406020272822071077109760)] orbit.val

/-- Exact candidate at original node564, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,507287311391716423379766808162095595520),(3,7447112516745344359239045794947181576192),(6,13823671654803000879037162272523888361472)] orbit.val

/-- Exact candidate at original node564, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13385038290009755930318067622872088576),(9,3516234524255335177933906986524299231232),(11,62648099419615020187979319176234143744),(12,1897345275086548504224229806940175458304),(15,16288458545888553203379540695369584611328)] orbit.val

/-- Exact candidate at original node564, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,506660123875290657924803248689441144832),(3,7449238921776683169130308530577673814016),(6,13822172437288087834600863096366050574336)] orbit.val

/-- Exact candidate at original node564, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,507256215325018642946620086571382079488),(3,7446988517712097717718678708141737115648),(6,13823826749902945300990676080920046338048)] orbit.val

/-- Exact candidate at original node564, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13383086707248383471163815751111933952),(9,3516406574023601327427137138138741211136),(11,62644266282647632192382116933978841600),(12,1897289674365578706418162142472905374720),(15,16288347881560985612147129662336428171776)] orbit.val

/-- Exact candidate at original node564, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,506627572453367418029061051049681354752),(3,7449168894743676095360069897607773683712),(6,13822275015743018148266843926975710494720)] orbit.val

/-- Exact candidate at original node564, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,735097266896010080052570651034392723456),(3,7297877611517748704577166339839067422720),(6,13745096604526302877026237884759705387008)] orbit.val

/-- Exact candidate at original node564, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13757059479948213997472861905487921152),(9,3400380142124288179426157388027679211520),(11,70820160334084888291931847704900972544),(12,1455436071490352253179449067847039492096),(15,16837678049511388126760963710148057935872)] orbit.val

/-- Exact candidate at original node564, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,733072974991260050991951108243095289856),(3,7301344974389759196723085458490865483776),(6,13743653533559042413940938308899204759552)] orbit.val

/-- Exact candidate at original node564, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,471536942107291769324467673233266573312),(3,7523868894380664141075636423155251150848),(6,13782665646452105751255870779244647809024)] orbit.val

/-- Exact candidate at original node564, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14129422801851209443744990608863789056),(9,3467098077004279220126584850717316481024),(11,59115058076155903287080768660563501824),(12,1781882307827231864326659334315019188736),(15,16455846617230543464471904931331402572544)] orbit.val

/-- Exact candidate at original node564, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,656769259522203966439667718694453116928),(3,7250142473822255742312613330435927179264),(6,13871159749595601952903693826502785236992)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked56400 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 564 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked56401 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 564 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked56402 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 564 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked56410 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 564 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked56411 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 564 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked56412 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 564 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked56420 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 564 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked56421 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 564 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked56422 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 564 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked56430 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 564 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked56431 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 564 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked56432 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 564 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked56440 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 564 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked56441 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 564 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked56442 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 564 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked56450 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 564 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked56451 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 564 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked56452 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 564 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 564 1 :=
  RootFineParent3CacheTable.single 564 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 564 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 564 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 564 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 564 0 0) checked56400 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 564 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 564 0 1) checked56401 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 564 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 564 0 2) checked56402 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 564 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 564 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 564 1 0) checked56410 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 564 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 564 1 1) checked56411 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 564 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 564 1 2) checked56412 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 564 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 564 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 564 2 0) checked56420 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 564 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 564 2 1) checked56421 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 564 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 564 2 2) checked56422 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 564 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 564 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 564 3 0) checked56430 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 564 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 564 3 1) checked56431 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 564 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 564 3 2) checked56432 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 564 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 564 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 564 4 0) checked56440 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 564 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 564 4 1) checked56441 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 564 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 564 4 2) checked56442 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 564 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 564 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 564 5 0) checked56450 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 564 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 564 5 1) checked56451 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 564 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 564 5 2) checked56452 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block564
