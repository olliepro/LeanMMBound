import SuppliedRootFineParent3Block145
import SuppliedRootFineParent3Block146
import RootFineParent4FromWindow
import RootFineParent4CacheTable
import RootFineSparseLookup
namespace MatrixBounds.Numeric.SuppliedRootFineParent4Block026
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option exponentiation.threshold 1000
set_option Elab.async false

/-- Complete original parent3 source window for parent26. -/
def window : RootFineParent3CacheTable 145 2 :=
  (SuppliedRootFineParent3Block145.table).append (SuppliedRootFineParent3Block146.table)

/-- The actual complete integer parent law evaluated from independently checked original children. -/
def source (axis : Fin 3) (orbit : Fin 231) : ℤ :=
  RootFineParent4FromWindow.numerator window 26 axis orbit

/-- Exact candidate for parent26, physical axis0, retaining all231 original orbit positions. -/
def row0 (orbit : Fin 231) : ℤ := sparseIntegerLookup [(2,2543393188245804675568040495900784699593549493046000415442923152617418290228131402524795622149830335782237871024860299264),(3,31792414379598908712066349543150621239062057033894301668221860958132258420125664901573450894422148608055275094232795185152),(6,49503045460989079697502321135297473985550858131241864685607591498793443110341769890919480171690466867381100916603613085696),(21,81425139168728356652842115833843880032894706082888138051889823209058327988382270261279575921666375400679189124394571005952)] orbit.val

/-- Independent kernel check of all nonzero orbit values and the complete exact denominator total. -/
theorem checked0 : sparseIntegerVectorCheck ((2:ℤ)^406) row0 (source 0) = true := by decide +kernel

/-- Exact candidate for parent26, physical axis1, retaining all231 original orbit positions. -/
def row1 (orbit : Fin 231) : ℤ := sparseIntegerLookup [(175,4359257146426754608214810633612071672954661191430031742687700639839672649483257047552111070766666276822581248),(202,22311832824421694798199273829007590379161599993317938473320529457927585464601320420930419320672622114124330958848),(208,2543393166348307153789222592141617207256831472670458672242965476144465650063746797274428545810071969276125157064548810752),(220,410228986643385387026965489754631733903109154473229352002322804814348704272257321005392255294769771869208502599680),(223,31792415803616948311336694481694573647531503399567822225618550012248465769569829709809188289496484293023662077815874912256),(226,130928182795051715547899401354583590708039899514888314795561962822822494416528130539705561091252038223084855121765759713280)] orbit.val

/-- Independent kernel check of all nonzero orbit values and the complete exact denominator total. -/
theorem checked1 : sparseIntegerVectorCheck ((2:ℤ)^406) row1 (source 1) = true := by decide +kernel

/-- Exact candidate for parent26, physical axis2, retaining all231 original orbit positions. -/
def row2 (orbit : Fin 231) : ℤ := sparseIntegerLookup [(1,165263992197562149737978827008192759957101170741070304821162198818601447809077836456297302609928821211897803006255839576064)] orbit.val

/-- Independent kernel check of all nonzero orbit values and the complete exact denominator total. -/
theorem checked2 : sparseIntegerVectorCheck ((2:ℤ)^406) row2 (source 2) = true := by decide +kernel

/-- Complete original physical-axis and orbit lookup for this parent. -/
def value (axis : Fin 3) (orbit : Fin 231) : ℤ :=
  if axis = 0 then row0 orbit else if axis = 1 then row1 orbit else row2 orbit

/-- This complete original parent law is independently verified at all axes and orbit coordinates. -/
def table : RootFineParent4CacheTable 26 1 :=
  RootFineParent4CacheTable.single 26 value (by
    intro axis orbit
    have checked : value axis orbit = source axis orbit :=
      finThreeCases (predicate := fun selected => value selected orbit = source selected orbit)

        (sparseIntegerVectorCheck_sound _ _ _
          (RootFineParent4FromWindow.numerator_nonnegative window 26 0)
          (RootFineParent4FromWindow.numerator_normalized window 26 0) checked0 orbit)

        (sparseIntegerVectorCheck_sound _ _ _
          (RootFineParent4FromWindow.numerator_nonnegative window 26 1)
          (RootFineParent4FromWindow.numerator_normalized window 26 1) checked1 orbit)

        (sparseIntegerVectorCheck_sound _ _ _
          (RootFineParent4FromWindow.numerator_nonnegative window 26 2)
          (RootFineParent4FromWindow.numerator_normalized window 26 2) checked2 orbit)

        axis
    exact checked.trans (RootFineParent4FromWindow.numerator_eq window 26 axis orbit))
end MatrixBounds.Numeric.SuppliedRootFineParent4Block026
