import SuppliedRootFineParent3Block051
import SuppliedRootFineParent3Block052
import RootFineParent4FromWindow
import RootFineParent4CacheTable
import RootFineSparseLookup
namespace MatrixBounds.Numeric.SuppliedRootFineParent4Block012
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option exponentiation.threshold 1000
set_option Elab.async false

/-- Complete original parent3 source window for parent12. -/
def window : RootFineParent3CacheTable 51 2 :=
  (SuppliedRootFineParent3Block051.table).append (SuppliedRootFineParent3Block052.table)

/-- The actual complete integer parent law evaluated from independently checked original children. -/
def source (axis : Fin 3) (orbit : Fin 231) : ℤ :=
  RootFineParent4FromWindow.numerator window 12 axis orbit

/-- Exact candidate for parent12, physical axis0, retaining all231 original orbit positions. -/
def row0 (orbit : Fin 231) : ℤ := sparseIntegerLookup [(1,165263992197562149737978827008192759957101170741070304821162198818601447809077836456297302609928821211897803006255839576064)] orbit.val

/-- Independent kernel check of all nonzero orbit values and the complete exact denominator total. -/
theorem checked0 : sparseIntegerVectorCheck ((2:ℤ)^406) row0 (source 0) = true := by decide +kernel

/-- Exact candidate for parent12, physical axis1, retaining all231 original orbit positions. -/
def row1 (orbit : Fin 231) : ℤ := sparseIntegerLookup [(175,1975496848983185921953233831397686754036537158392258675981612256658199289909085628455088044550553506030813184),(202,15330077641270724881096276791804024465133575850894955545965781063471491346006246571256584377023904799109660278784),(208,2543397638236036378057819605699025204743895191860259321999273755622767340666061142395101938290737911176773247279847964672),(220,466100387989853912984502176471404353763908304677760959131387228160602442930997658385625545611822050619306723508224),(223,31792471768404091843772611654561381202080839576687844391683762710152803465683557037565906215809212242909216038469672894464),(226,130928122309489580388174774696411947053236660056726284041664855416796886166397625800042480413318285980921307748583904116736)] orbit.val

/-- Independent kernel check of all nonzero orbit values and the complete exact denominator total. -/
theorem checked1 : sparseIntegerVectorCheck ((2:ℤ)^406) row1 (source 1) = true := by decide +kernel

/-- Exact candidate for parent12, physical axis2, retaining all231 original orbit positions. -/
def row2 (orbit : Fin 231) : ℤ := sparseIntegerLookup [(2,2543397648275031053434857952797378845673227667689779436331877383307234554630873678823643331897285119486560951667655704576),(3,31792470267180055533803035564644517414366464295616090452900723020134339222053801906932697416823686426995369042018335457280),(6,49502800530369581992977326318634765262872749863209567465116399648296996597616095598044696009383951117362360629343291441152),(21,81425323751737481157763607172116098434188728914554867466813198766862877434777065272496265851823898548053512383226556973056)] orbit.val

/-- Independent kernel check of all nonzero orbit values and the complete exact denominator total. -/
theorem checked2 : sparseIntegerVectorCheck ((2:ℤ)^406) row2 (source 2) = true := by decide +kernel

/-- Complete original physical-axis and orbit lookup for this parent. -/
def value (axis : Fin 3) (orbit : Fin 231) : ℤ :=
  if axis = 0 then row0 orbit else if axis = 1 then row1 orbit else row2 orbit

/-- This complete original parent law is independently verified at all axes and orbit coordinates. -/
def table : RootFineParent4CacheTable 12 1 :=
  RootFineParent4CacheTable.single 12 value (by
    intro axis orbit
    have checked : value axis orbit = source axis orbit :=
      finThreeCases (predicate := fun selected => value selected orbit = source selected orbit)

        (sparseIntegerVectorCheck_sound _ _ _
          (RootFineParent4FromWindow.numerator_nonnegative window 12 0)
          (RootFineParent4FromWindow.numerator_normalized window 12 0) checked0 orbit)

        (sparseIntegerVectorCheck_sound _ _ _
          (RootFineParent4FromWindow.numerator_nonnegative window 12 1)
          (RootFineParent4FromWindow.numerator_normalized window 12 1) checked1 orbit)

        (sparseIntegerVectorCheck_sound _ _ _
          (RootFineParent4FromWindow.numerator_nonnegative window 12 2)
          (RootFineParent4FromWindow.numerator_normalized window 12 2) checked2 orbit)

        axis
    exact checked.trans (RootFineParent4FromWindow.numerator_eq window 12 axis orbit))
end MatrixBounds.Numeric.SuppliedRootFineParent4Block012
