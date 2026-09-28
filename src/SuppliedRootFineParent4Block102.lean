import SuppliedRootFineParent3Block940
import SuppliedRootFineParent3Block941
import RootFineParent4FromWindow
import RootFineParent4CacheTable
import RootFineSparseLookup
namespace MatrixBounds.Numeric.SuppliedRootFineParent4Block102
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option exponentiation.threshold 1000
set_option Elab.async false

/-- Complete original parent3 source window for parent102. -/
def window : RootFineParent3CacheTable 940 2 :=
  (SuppliedRootFineParent3Block940.table).append (SuppliedRootFineParent3Block941.table)

/-- The actual complete integer parent law evaluated from independently checked original children. -/
def source (axis : Fin 3) (orbit : Fin 231) : ℤ :=
  RootFineParent4FromWindow.numerator window 102 axis orbit

/-- Exact candidate for parent102, physical axis0, retaining all231 original orbit positions. -/
def row0 (orbit : Fin 231) : ℤ := sparseIntegerLookup [(175,146785551963530596672396600680891393470632389974085595316497775468364939129334077153942138726736221663638258652949774336),(202,426289104884487325405151725341106498499941475357873049141094710729361078589907598980577474529475051460872645520553672704),(208,2621411720082813379353490288601919423973723748662236971968638125188970081241174980397551475069496720500241793386085875712),(220,9692308706560202888064130800597860719382258452792878936370737770932919603332625303687387038856310167564534479623582384128),(223,35066749949807824792253647915786086678235554533923472388732798315980798264819151917618265746844942706502925183758521860096),(226,117310447164263290756230009677184895243539060140359757879632432120301033841965642578459578735901860344205590645314146009088)] orbit.val

/-- Independent kernel check of all nonzero orbit values and the complete exact denominator total. -/
theorem checked0 : sparseIntegerVectorCheck ((2:ℤ)^406) row0 (source 0) = true := by decide +kernel

/-- Exact candidate for parent102, physical axis1, retaining all231 original orbit positions. -/
def row1 (orbit : Fin 231) : ℤ := sparseIntegerLookup [(1,165263992197562149737978827008192759957101170741070304821162198818601447809077836456297302609928821211897803006255839576064)] orbit.val

/-- Independent kernel check of all nonzero orbit values and the complete exact denominator total. -/
theorem checked1 : sparseIntegerVectorCheck ((2:ℤ)^406) row1 (source 1) = true := by decide +kernel

/-- Exact candidate for parent102, physical axis2, retaining all231 original orbit positions. -/
def row2 (orbit : Fin 231) : ℤ := sparseIntegerLookup [(2,3029483692607582112036182420506324233651772192402601136883018411333299359569626154642305986379892458814212056573534011392),(3,34574223559516385257001699388175362737787785760724608404930023368309113019415775280319760033649297025303607019616178536448),(6,49328631702076088884676916812892753793376532125414243097524787185597118234443330446393127652441700758161008032283157856256),(21,78331653243362093484264028386618319192285080662528852181824369853361917195649104574942108937457930969618975897782969171968)] orbit.val

/-- Independent kernel check of all nonzero orbit values and the complete exact denominator total. -/
theorem checked2 : sparseIntegerVectorCheck ((2:ℤ)^406) row2 (source 2) = true := by decide +kernel

/-- Complete original physical-axis and orbit lookup for this parent. -/
def value (axis : Fin 3) (orbit : Fin 231) : ℤ :=
  if axis = 0 then row0 orbit else if axis = 1 then row1 orbit else row2 orbit

/-- This complete original parent law is independently verified at all axes and orbit coordinates. -/
def table : RootFineParent4CacheTable 102 1 :=
  RootFineParent4CacheTable.single 102 value (by
    intro axis orbit
    have checked : value axis orbit = source axis orbit :=
      finThreeCases (predicate := fun selected => value selected orbit = source selected orbit)

        (sparseIntegerVectorCheck_sound _ _ _
          (RootFineParent4FromWindow.numerator_nonnegative window 102 0)
          (RootFineParent4FromWindow.numerator_normalized window 102 0) checked0 orbit)

        (sparseIntegerVectorCheck_sound _ _ _
          (RootFineParent4FromWindow.numerator_nonnegative window 102 1)
          (RootFineParent4FromWindow.numerator_normalized window 102 1) checked1 orbit)

        (sparseIntegerVectorCheck_sound _ _ _
          (RootFineParent4FromWindow.numerator_nonnegative window 102 2)
          (RootFineParent4FromWindow.numerator_normalized window 102 2) checked2 orbit)

        axis
    exact checked.trans (RootFineParent4FromWindow.numerator_eq window 102 axis orbit))
end MatrixBounds.Numeric.SuppliedRootFineParent4Block102
