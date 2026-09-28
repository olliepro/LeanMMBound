import SuppliedRootFineParent3Block000
import RootFineParent4FromWindow
import RootFineParent4CacheTable
import RootFineSparseLookup
namespace MatrixBounds.Numeric.SuppliedRootFineParent4Block000
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option exponentiation.threshold 1000
set_option Elab.async false

/-- Complete original parent3 source window for parent0. -/
def window : RootFineParent3CacheTable 0 1 :=
  SuppliedRootFineParent3Block000.table

/-- The actual complete integer parent law evaluated from independently checked original children. -/
def source (axis : Fin 3) (orbit : Fin 231) : ℤ :=
  RootFineParent4FromWindow.numerator window 0 axis orbit

/-- Exact candidate for parent0, physical axis0, retaining all231 original orbit positions. -/
def row0 (orbit : Fin 231) : ℤ := sparseIntegerLookup [(1,165263992197562149737978827008192759957101170741070304821162198818601447809077836456297302609928821211897803006255839576064)] orbit.val

/-- Independent kernel check of all nonzero orbit values and the complete exact denominator total. -/
theorem checked0 : sparseIntegerVectorCheck ((2:ℤ)^406) row0 (source 0) = true := by decide +kernel

/-- Exact candidate for parent0, physical axis1, retaining all231 original orbit positions. -/
def row1 (orbit : Fin 231) : ℤ := sparseIntegerLookup [(1,165263992197562149737978827008192759957101170741070304821162198818601447809077836456297302609928821211897803006255839576064)] orbit.val

/-- Independent kernel check of all nonzero orbit values and the complete exact denominator total. -/
theorem checked1 : sparseIntegerVectorCheck ((2:ℤ)^406) row1 (source 1) = true := by decide +kernel

/-- Exact candidate for parent0, physical axis2, retaining all231 original orbit positions. -/
def row2 (orbit : Fin 231) : ℤ := sparseIntegerLookup [(209,202781487287888213978831108293665700832374748466703922853875405236735382053097382546477188294373311518437456243830292480),(224,6323430423988293740898393293247788270724191665663004277944607711170339822980376885965550505895212792475824845252240343040),(227,29741150616714310995887189527313426127221478476014186470065675298604762629288615659920383024165558209924690687789577011200),(228,128996629669571656787214413079337879858323125850926410150298040403589609974755746527864891891573676897978850016970191929344)] orbit.val

/-- Independent kernel check of all nonzero orbit values and the complete exact denominator total. -/
theorem checked2 : sparseIntegerVectorCheck ((2:ℤ)^406) row2 (source 2) = true := by decide +kernel

/-- Complete original physical-axis and orbit lookup for this parent. -/
def value (axis : Fin 3) (orbit : Fin 231) : ℤ :=
  if axis = 0 then row0 orbit else if axis = 1 then row1 orbit else row2 orbit

/-- This complete original parent law is independently verified at all axes and orbit coordinates. -/
def table : RootFineParent4CacheTable 0 1 :=
  RootFineParent4CacheTable.single 0 value (by
    intro axis orbit
    have checked : value axis orbit = source axis orbit :=
      finThreeCases (predicate := fun selected => value selected orbit = source selected orbit)

        (sparseIntegerVectorCheck_sound _ _ _
          (RootFineParent4FromWindow.numerator_nonnegative window 0 0)
          (RootFineParent4FromWindow.numerator_normalized window 0 0) checked0 orbit)

        (sparseIntegerVectorCheck_sound _ _ _
          (RootFineParent4FromWindow.numerator_nonnegative window 0 1)
          (RootFineParent4FromWindow.numerator_normalized window 0 1) checked1 orbit)

        (sparseIntegerVectorCheck_sound _ _ _
          (RootFineParent4FromWindow.numerator_nonnegative window 0 2)
          (RootFineParent4FromWindow.numerator_normalized window 0 2) checked2 orbit)

        axis
    exact checked.trans (RootFineParent4FromWindow.numerator_eq window 0 axis orbit))
end MatrixBounds.Numeric.SuppliedRootFineParent4Block000
