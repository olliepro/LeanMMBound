import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block354
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node354, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14009592681928463203895305182229037056),(9,3535835705066734568604269704066648506368),(11,63050530176266721167160419188901885952),(12,1904338384623930287269088200933254991872),(15,16260837270391201621411561246262131111936)] orbit.val

/-- Exact candidate at original node354, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,505348060753630710082437896643366879232),(3,7456747499038610655294401419997249273856),(6,13815975923147820296279135558992549380096)] orbit.val

/-- Exact candidate at original node354, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,508670742607930951629455015265859272704),(3,7445495244984058303482293108561827332096),(6,13823905495348072406544226751805478928384)] orbit.val

/-- Exact candidate at original node354, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,6129189910135839058027001409773240320),(9,8241829099852751887541722707793404755968),(11,55205313512832041026342974926736951296),(12,1186890707419709149968776994454285643776),(15,12288017172244632744061105197048964941824)] orbit.val

/-- Exact candidate at original node354, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,81273783493233366996550610539847352320),(3,8200497389389352696860183217520617979904),(6,13496300310057475597799241047572700200960)] orbit.val

/-- Exact candidate at original node354, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,95958961455586969134385274464608714752),(3,369858124355653321539200195770141638656),(6,21312254397128821370982389405398415179776)] orbit.val

/-- Exact candidate at original node354, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,56232188344499113607017818750976),(9,3492924034770771854778748795586745466880),(11,63441710374406146886287063952950614528),(12,1898412762341096875059469049644282956800),(15,16323292919221598440432356359431367744000)] orbit.val

/-- Exact candidate at original node354, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,628149583525707847522035063751954137088),(3,7279300301190324853802090897543673151488),(6,13870621598224028960331848914337538244608)] orbit.val

/-- Exact candidate at original node354, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,482538649806802926091680261466727907328),(3,7515468711860344786471978573552238460928),(6,13780064121272913949092316040614199164928)] orbit.val

/-- Exact candidate at original node354, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14353382243226685288276294770003804160),(9,3419738474812074031791235067687215300608),(11,70469368681385597719709829266424455168),(12,1465867621792817755620377162493273325568),(15,16807642635410557591236376521416248647680)] orbit.val

/-- Exact candidate at original node354, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,726308743188353512202337884130305376256),(3,7311943192031037512686696744755270778880),(6,13739819547720670636766940246747589378048)] orbit.val

/-- Exact candidate at original node354, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,735670932182732988824589979676066185216),(3,7295643636366130409819177066840130060288),(6,13746756914391198263012207829116969287680)] orbit.val

/-- Exact candidate at original node354, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,25372819045193154114332450095104),(9,3489658651242191094789144994050775973888),(11,59622893332593548843327624011180313600),(12,1792617601787832890282143348392321017856),(15,16436172311204625082548204794846438132736)] orbit.val

/-- Exact candidate at original node354, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,470272642149068413779396942471710638080),(3,7533350003528259402643015653505814757376),(6,13774448837262733845233562279655640137728)] orbit.val

/-- Exact candidate at original node354, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,659752214210630579506477542358078455808),(3,7245092907286063642142040795464639447040),(6,13873226361443367440007456537810447630336)] orbit.val

/-- Exact candidate at original node354, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14353380019886374731733321051176697856),(9,3419738347180455981468528725587507806208),(11,70469438225302013431050568668275343360),(12,1465865740563401567555954104554460938240),(15,16807644576951015724468708155771744747520)] orbit.val

/-- Exact candidate at original node354, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,726309264592810085098751278475819089920),(3,7311943278613596553940527001066838949888),(6,13739818939733655022616696596090507493376)] orbit.val

/-- Exact candidate at original node354, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,735671463274276066581728108763542454272),(3,7295643711533438651369891724650558259200),(6,13746756308132346943704355042219064819712)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked35400 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 354 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked35401 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 354 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked35402 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 354 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked35410 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 354 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked35411 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 354 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked35412 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 354 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked35420 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 354 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked35421 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 354 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked35422 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 354 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked35430 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 354 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked35431 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 354 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked35432 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 354 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked35440 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 354 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked35441 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 354 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked35442 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 354 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked35450 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 354 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked35451 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 354 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked35452 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 354 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 354 1 :=
  RootFineParent3CacheTable.single 354 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 354 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 354 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 354 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 354 0 0) checked35400 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 354 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 354 0 1) checked35401 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 354 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 354 0 2) checked35402 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 354 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 354 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 354 1 0) checked35410 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 354 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 354 1 1) checked35411 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 354 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 354 1 2) checked35412 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 354 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 354 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 354 2 0) checked35420 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 354 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 354 2 1) checked35421 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 354 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 354 2 2) checked35422 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 354 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 354 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 354 3 0) checked35430 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 354 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 354 3 1) checked35431 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 354 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 354 3 2) checked35432 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 354 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 354 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 354 4 0) checked35440 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 354 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 354 4 1) checked35441 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 354 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 354 4 2) checked35442 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 354 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 354 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 354 5 0) checked35450 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 354 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 354 5 1) checked35451 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 354 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 354 5 2) checked35452 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block354
