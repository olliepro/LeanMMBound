import SuppliedRootFineParent3Block053
import RootFineParent4FromWindow
import RootFineParent4CacheTable
import RootFineSparseLookup
namespace MatrixBounds.Numeric.SuppliedRootFineParent4Block013
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option exponentiation.threshold 1000
set_option Elab.async false

/-- Complete original parent3 source window for parent13. -/
def window : RootFineParent3CacheTable 53 1 :=
  SuppliedRootFineParent3Block053.table

/-- The actual complete integer parent law evaluated from independently checked original children. -/
def source (axis : Fin 3) (orbit : Fin 231) : ℤ :=
  RootFineParent4FromWindow.numerator window 13 axis orbit

/-- Exact candidate for parent13, physical axis0, retaining all231 original orbit positions. -/
def row0 (orbit : Fin 231) : ℤ := sparseIntegerLookup [(1,165263992197562149737978827008192759957101170741070304821162198818601447809077836456297302609928821211897803006255839576064)] orbit.val

/-- Independent kernel check of all nonzero orbit values and the complete exact denominator total. -/
theorem checked0 : sparseIntegerVectorCheck ((2:ℤ)^406) row0 (source 0) = true := by decide +kernel

/-- Exact candidate for parent13, physical axis1, retaining all231 original orbit positions. -/
def row1 (orbit : Fin 231) : ℤ := sparseIntegerLookup [(209,13883600126954138980697733982716548499158847932080488356650713429513902692749492262404963470242878586880),(224,216301139962891083569608932251428336816826470816290283609625720392842874988614731722897614953107958408413184),(227,3568619632380147122092939616154154785034405770470758012596847362424706636225359096969383267681629666753636036771840),(228,165263988628942301042808141897215435213316400295611169024774521999389987402000093958549314333064338370248219674418515804160)] orbit.val

/-- Independent kernel check of all nonzero orbit values and the complete exact denominator total. -/
theorem checked1 : sparseIntegerVectorCheck ((2:ℤ)^406) row1 (source 1) = true := by decide +kernel

/-- Exact candidate for parent13, physical axis2, retaining all231 original orbit positions. -/
def row2 (orbit : Fin 231) : ℤ := sparseIntegerLookup [(1,165263992197562149737978827008192759957101170741070304821162198818601447809077836456297302609928821211897803006255839576064)] orbit.val

/-- Independent kernel check of all nonzero orbit values and the complete exact denominator total. -/
theorem checked2 : sparseIntegerVectorCheck ((2:ℤ)^406) row2 (source 2) = true := by decide +kernel

/-- Complete original physical-axis and orbit lookup for this parent. -/
def value (axis : Fin 3) (orbit : Fin 231) : ℤ :=
  if axis = 0 then row0 orbit else if axis = 1 then row1 orbit else row2 orbit

/-- This complete original parent law is independently verified at all axes and orbit coordinates. -/
def table : RootFineParent4CacheTable 13 1 :=
  RootFineParent4CacheTable.single 13 value (by
    intro axis orbit
    have checked : value axis orbit = source axis orbit :=
      finThreeCases (predicate := fun selected => value selected orbit = source selected orbit)

        (sparseIntegerVectorCheck_sound _ _ _
          (RootFineParent4FromWindow.numerator_nonnegative window 13 0)
          (RootFineParent4FromWindow.numerator_normalized window 13 0) checked0 orbit)

        (sparseIntegerVectorCheck_sound _ _ _
          (RootFineParent4FromWindow.numerator_nonnegative window 13 1)
          (RootFineParent4FromWindow.numerator_normalized window 13 1) checked1 orbit)

        (sparseIntegerVectorCheck_sound _ _ _
          (RootFineParent4FromWindow.numerator_nonnegative window 13 2)
          (RootFineParent4FromWindow.numerator_normalized window 13 2) checked2 orbit)

        axis
    exact checked.trans (RootFineParent4FromWindow.numerator_eq window 13 axis orbit))
end MatrixBounds.Numeric.SuppliedRootFineParent4Block013
