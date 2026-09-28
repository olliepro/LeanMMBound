import SuppliedRootFineParent3Block001
import SuppliedRootFineParent3Block002
import RootFineParent4FromWindow
import RootFineParent4CacheTable
import RootFineSparseLookup
namespace MatrixBounds.Numeric.SuppliedRootFineParent4Block001
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option exponentiation.threshold 1000
set_option Elab.async false

/-- Complete original parent3 source window for parent1. -/
def window : RootFineParent3CacheTable 1 2 :=
  (SuppliedRootFineParent3Block001.table).append (SuppliedRootFineParent3Block002.table)

/-- The actual complete integer parent law evaluated from independently checked original children. -/
def source (axis : Fin 3) (orbit : Fin 231) : ℤ :=
  RootFineParent4FromWindow.numerator window 1 axis orbit

/-- Exact candidate for parent1, physical axis0, retaining all231 original orbit positions. -/
def row0 (orbit : Fin 231) : ℤ := sparseIntegerLookup [(1,165263992197562149737978827008192759957101170741070304821162198818601447809077836456297302609928821211897803006255839576064)] orbit.val

/-- Independent kernel check of all nonzero orbit values and the complete exact denominator total. -/
theorem checked0 : sparseIntegerVectorCheck ((2:ℤ)^406) row0 (source 0) = true := by decide +kernel

/-- Exact candidate for parent1, physical axis1, retaining all231 original orbit positions. -/
def row1 (orbit : Fin 231) : ℤ := sparseIntegerLookup [(2,2809010595231868742415697438770688944392557429601748438155524306686174596768639105331198208822567583249321707772181479424),(3,34418373798094346367655261131705160832671848014558868442343612198854121755340291162232835286686377977816669269680675880960),(6,49158792437936686248939511668766710408225335329568710817049363183548781674294928999253978925610939156438747548473886769152),(21,78877815366299248378968356768950199771811429967340977123613699129512369782673977189479290188808936494393064480329095446528)] orbit.val

/-- Independent kernel check of all nonzero orbit values and the complete exact denominator total. -/
theorem checked1 : sparseIntegerVectorCheck ((2:ℤ)^406) row1 (source 1) = true := by decide +kernel

/-- Exact candidate for parent1, physical axis2, retaining all231 original orbit positions. -/
def row2 (orbit : Fin 231) : ℤ := sparseIntegerLookup [(175,46429336461717488613452151717832184315750891538241708092250382874905578041711472631378557860243671624550673257622142976),(202,201613762408788985778213846220585496490510922187057257516045466352052731127740285046799163720516064184845992173431160832),(208,2605438901706848575088190349393136821790098372207670788009457799691352979063385444723708167277286904435609313024898236416),(220,5450471991594403358951056676829488554684635885133581659029645310150795685061591923480015124120740539042626421373827809280),(223,32537509561140586388734130058720843057599234004440060157501035666311249382814555255213724362540636313498056591224904613888),(226,124422528644249804940813783925310873842220940665563693251013764193221091452968852075201677234409397719112114015201155612672)] orbit.val

/-- Independent kernel check of all nonzero orbit values and the complete exact denominator total. -/
theorem checked2 : sparseIntegerVectorCheck ((2:ℤ)^406) row2 (source 2) = true := by decide +kernel

/-- Complete original physical-axis and orbit lookup for this parent. -/
def value (axis : Fin 3) (orbit : Fin 231) : ℤ :=
  if axis = 0 then row0 orbit else if axis = 1 then row1 orbit else row2 orbit

/-- This complete original parent law is independently verified at all axes and orbit coordinates. -/
def table : RootFineParent4CacheTable 1 1 :=
  RootFineParent4CacheTable.single 1 value (by
    intro axis orbit
    have checked : value axis orbit = source axis orbit :=
      finThreeCases (predicate := fun selected => value selected orbit = source selected orbit)

        (sparseIntegerVectorCheck_sound _ _ _
          (RootFineParent4FromWindow.numerator_nonnegative window 1 0)
          (RootFineParent4FromWindow.numerator_normalized window 1 0) checked0 orbit)

        (sparseIntegerVectorCheck_sound _ _ _
          (RootFineParent4FromWindow.numerator_nonnegative window 1 1)
          (RootFineParent4FromWindow.numerator_normalized window 1 1) checked1 orbit)

        (sparseIntegerVectorCheck_sound _ _ _
          (RootFineParent4FromWindow.numerator_nonnegative window 1 2)
          (RootFineParent4FromWindow.numerator_normalized window 1 2) checked2 orbit)

        axis
    exact checked.trans (RootFineParent4FromWindow.numerator_eq window 1 axis orbit))
end MatrixBounds.Numeric.SuppliedRootFineParent4Block001
