import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block310
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node310, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,732513548365678240590607675927472111616),(3,7298572484112146765257742412062503469056),(6,13746985450462236655807624787643189952512)] orbit.val

/-- Exact candidate at original node310, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,733149465551594826105366560996983832576),(3,7297692465566590230647264913332375650304),(6,13747229551821876604903343401303806050304)] orbit.val

/-- Exact candidate at original node310, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,10789585271083530599851483491496624128),(9,3328603588117819784072228699337815752704),(11,70107270444200453639220040106801323008),(12,1420749609892044682245792069532987246592),(15,16947821429214913211098882583164064586752)] orbit.val

/-- Exact candidate at original node310, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,657141542044368353794142433339166949376),(3,7246153692442538373475018011920855728128),(6,13874776248453154934386814430373142855680)] orbit.val

/-- Exact candidate at original node310, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,463366661359445842494224249757181673472),(3,7524179209612812969402941795592220704768),(6,13790525611967802849758808830283763154944)] orbit.val

/-- Exact candidate at original node310, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,11119103780380708306159098381673168896),(9,3394540016457239483075190176596900184064),(11,56759561306413712628738365758487234560),(12,1734714943564296106625246991548889755648),(15,16580937857831731651020640243347215190016)] orbit.val

/-- Exact candidate at original node310, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,732513548486961708526728947336516468736),(3,7298572484134464341878725252541757521920),(6,13746985450318635611250520675754891542528)] orbit.val

/-- Exact candidate at original node310, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,733149465672891618396247538949886574592),(3,7297692465588894482913488047267771318272),(6,13747229551678275560346239289415507640320)] orbit.val

/-- Exact candidate at original node310, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,10789585271083530599851483491496624128),(9,3328603588088109223129379572740236771328),(11,70107270461630483828531543988400703488),(12,1420749609461282554924462842516013805568),(15,16947821429657955869173749432897017628672)] orbit.val

/-- Exact candidate at original node310, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,464511566450208563451795449750394765312),(3,7523068333706144786821038455569589993472),(6,13790491582783708311383140970313180774400)] orbit.val

/-- Exact candidate at original node310, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,656897295214971747915943696857479249920),(3,7245469682946702529922001089842770870272),(6,13875704504778387383818030088932915412992)] orbit.val

/-- Exact candidate at original node310, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,11107704249143030139029858593028440064),(9,3394957565308581617687016682775944101888),(11,57221217004291428255225845049688511488),(12,1749400574492286409366449327944561743872),(15,16565384421885759176208253161269942735872)] orbit.val

/-- Exact candidate at original node310, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,501727530699756728126828717474953822208),(3,7447188131218022425213247410006178922496),(6,13829155821022282508315898748152032788480)] orbit.val

/-- Exact candidate at original node310, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,501874131691199819976376112800711311360),(3,7446833643302405350454042681721239896064),(6,13829363707946456491225556081111214325760)] orbit.val

/-- Exact candidate at original node310, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,10499039387080968792555877746683674624),(9,3443059029650377093687785028631272620032),(11,60371068740309360668155253747964875776),(12,1863769934661070229591702931192997402624),(15,16400372410501224008915775784314246960128)] orbit.val

/-- Exact candidate at original node310, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,501746189090865876390707708894300340224),(3,7447135952490644246593550274251867553792),(6,13829189341358551538671716892486997639168)] orbit.val

/-- Exact candidate at original node310, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,501873436170939568986535077989626937344),(3,7446875660325294277737712361475183476736),(6,13829322386443827814931727436168355119104)] orbit.val

/-- Exact candidate at original node310, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,10499290812702947653289709758813569024),(9,3443047875221363673711667176670031249408),(11,60372503109940470539341363713751187968),(12,1863786144195281554263862032520944417792),(15,16400365669600773015487814592969625108992)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked31000 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 310 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked31001 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 310 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked31002 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 310 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked31010 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 310 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked31011 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 310 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked31012 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 310 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked31020 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 310 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked31021 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 310 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked31022 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 310 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked31030 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 310 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked31031 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 310 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked31032 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 310 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked31040 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 310 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked31041 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 310 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked31042 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 310 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked31050 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 310 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked31051 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 310 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked31052 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 310 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 310 1 :=
  RootFineParent3CacheTable.single 310 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 310 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 310 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 310 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 310 0 0) checked31000 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 310 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 310 0 1) checked31001 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 310 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 310 0 2) checked31002 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 310 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 310 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 310 1 0) checked31010 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 310 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 310 1 1) checked31011 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 310 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 310 1 2) checked31012 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 310 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 310 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 310 2 0) checked31020 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 310 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 310 2 1) checked31021 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 310 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 310 2 2) checked31022 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 310 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 310 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 310 3 0) checked31030 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 310 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 310 3 1) checked31031 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 310 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 310 3 2) checked31032 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 310 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 310 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 310 4 0) checked31040 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 310 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 310 4 1) checked31041 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 310 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 310 4 2) checked31042 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 310 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 310 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 310 5 0) checked31050 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 310 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 310 5 1) checked31051 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 310 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 310 5 2) checked31052 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block310
