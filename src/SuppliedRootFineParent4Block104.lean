import SuppliedRootFineParent3Block944
import RootFineParent4FromWindow
import RootFineParent4CacheTable
import RootFineSparseLookup
namespace MatrixBounds.Numeric.SuppliedRootFineParent4Block104
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option exponentiation.threshold 1000
set_option Elab.async false

/-- Complete original parent3 source window for parent104. -/
def window : RootFineParent3CacheTable 944 1 :=
  SuppliedRootFineParent3Block944.table

/-- The actual complete integer parent law evaluated from independently checked original children. -/
def source (axis : Fin 3) (orbit : Fin 231) : ℤ :=
  RootFineParent4FromWindow.numerator window 104 axis orbit

/-- Exact candidate for parent104, physical axis0, retaining all231 original orbit positions. -/
def row0 (orbit : Fin 231) : ℤ := sparseIntegerLookup [(209,467048609610258830303937608469391528945248006887124266079036483413786900967771354653324122375399881005594802643401703424),(224,10607684011024182421797742707350954025180751650305689479491327899571505532618110205071012873855488781297635221164617891840),(227,35484752211392651488157173973594640088789864459670894360535503193095086702505874566284856386441696809251001063435938037760),(228,118704507365535056997719972718777774314185306624206596715056331242521068672986080330288109227256235740343571919011881943040)] orbit.val

/-- Independent kernel check of all nonzero orbit values and the complete exact denominator total. -/
theorem checked0 : sparseIntegerVectorCheck ((2:ℤ)^406) row0 (source 0) = true := by decide +kernel

/-- Exact candidate for parent104, physical axis1, retaining all231 original orbit positions. -/
def row1 (orbit : Fin 231) : ℤ := sparseIntegerLookup [(1,165263992197562149737978827008192759957101170741070304821162198818601447809077836456297302609928821211897803006255839576064)] orbit.val

/-- Independent kernel check of all nonzero orbit values and the complete exact denominator total. -/
theorem checked1 : sparseIntegerVectorCheck ((2:ℤ)^406) row1 (source 1) = true := by decide +kernel

/-- Exact candidate for parent104, physical axis2, retaining all231 original orbit positions. -/
def row2 (orbit : Fin 231) : ℤ := sparseIntegerLookup [(1,165263992197562149737978827008192759957101170741070304821162198818601447809077836456297302609928821211897803006255839576064)] orbit.val

/-- Independent kernel check of all nonzero orbit values and the complete exact denominator total. -/
theorem checked2 : sparseIntegerVectorCheck ((2:ℤ)^406) row2 (source 2) = true := by decide +kernel

/-- Complete original physical-axis and orbit lookup for this parent. -/
def value (axis : Fin 3) (orbit : Fin 231) : ℤ :=
  if axis = 0 then row0 orbit else if axis = 1 then row1 orbit else row2 orbit

/-- This complete original parent law is independently verified at all axes and orbit coordinates. -/
def table : RootFineParent4CacheTable 104 1 :=
  RootFineParent4CacheTable.single 104 value (by
    intro axis orbit
    have checked : value axis orbit = source axis orbit :=
      finThreeCases (predicate := fun selected => value selected orbit = source selected orbit)

        (sparseIntegerVectorCheck_sound _ _ _
          (RootFineParent4FromWindow.numerator_nonnegative window 104 0)
          (RootFineParent4FromWindow.numerator_normalized window 104 0) checked0 orbit)

        (sparseIntegerVectorCheck_sound _ _ _
          (RootFineParent4FromWindow.numerator_nonnegative window 104 1)
          (RootFineParent4FromWindow.numerator_normalized window 104 1) checked1 orbit)

        (sparseIntegerVectorCheck_sound _ _ _
          (RootFineParent4FromWindow.numerator_nonnegative window 104 2)
          (RootFineParent4FromWindow.numerator_normalized window 104 2) checked2 orbit)

        axis
    exact checked.trans (RootFineParent4FromWindow.numerator_eq window 104 axis orbit))
end MatrixBounds.Numeric.SuppliedRootFineParent4Block104
