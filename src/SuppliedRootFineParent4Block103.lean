import SuppliedRootFineParent3Block942
import SuppliedRootFineParent3Block943
import RootFineParent4FromWindow
import RootFineParent4CacheTable
import RootFineSparseLookup
namespace MatrixBounds.Numeric.SuppliedRootFineParent4Block103
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option exponentiation.threshold 1000
set_option Elab.async false

/-- Complete original parent3 source window for parent103. -/
def window : RootFineParent3CacheTable 942 2 :=
  (SuppliedRootFineParent3Block942.table).append (SuppliedRootFineParent3Block943.table)

/-- The actual complete integer parent law evaluated from independently checked original children. -/
def source (axis : Fin 3) (orbit : Fin 231) : ℤ :=
  RootFineParent4FromWindow.numerator window 103 axis orbit

/-- Exact candidate for parent103, physical axis0, retaining all231 original orbit positions. -/
def row0 (orbit : Fin 231) : ℤ := sparseIntegerLookup [(175,146421648797438645406849550609488861013846980125748976907809116953197191980170578882390332264404548404880053448877277184),(202,412308693031724045293978298650264056067160190974581324075075186405023394015189472795737430664569155053875947835964260352),(208,2621418982410936450096087484450061895803641966019686135835474962495064160423448973806698912623808738226518232908674629632),(220,9706026590795249953195173830053733292703168240351068439955288579400706105680096257637444161539855882639405654905423134720),(223,35068209262187728688311599846115258646544954690371047208450169764563700468816751974865585746071058107560164086762218455040),(226,117309607020339071955675137998313953204968398673228172735938381208783756488162179198309446026765124780012959030394681819136)] orbit.val

/-- Independent kernel check of all nonzero orbit values and the complete exact denominator total. -/
theorem checked0 : sparseIntegerVectorCheck ((2:ℤ)^406) row0 (source 0) = true := by decide +kernel

/-- Exact candidate for parent103, physical axis1, retaining all231 original orbit positions. -/
def row1 (orbit : Fin 231) : ℤ := sparseIntegerLookup [(2,3039695048748038781390953059198423027253078644085554317769150709056984573978912346805105215085981302804909894666775691264),(3,34572279414565843638923582661813593998580715362676544052935343937057908162653282162345865153869211510278153406891260116992),(6,49319767436086334496828794542987904563476100896961357302615984048792874083280281623640470505868688395007536894484313800704),(21,78332250298161932820835496744192838367791275837346849147841720123693680989165360323505861735104940003807202810213489967104)] orbit.val

/-- Independent kernel check of all nonzero orbit values and the complete exact denominator total. -/
theorem checked1 : sparseIntegerVectorCheck ((2:ℤ)^406) row1 (source 1) = true := by decide +kernel

/-- Exact candidate for parent103, physical axis2, retaining all231 original orbit positions. -/
def row2 (orbit : Fin 231) : ℤ := sparseIntegerLookup [(1,165263992197562149737978827008192759957101170741070304821162198818601447809077836456297302609928821211897803006255839576064)] orbit.val

/-- Independent kernel check of all nonzero orbit values and the complete exact denominator total. -/
theorem checked2 : sparseIntegerVectorCheck ((2:ℤ)^406) row2 (source 2) = true := by decide +kernel

/-- Complete original physical-axis and orbit lookup for this parent. -/
def value (axis : Fin 3) (orbit : Fin 231) : ℤ :=
  if axis = 0 then row0 orbit else if axis = 1 then row1 orbit else row2 orbit

/-- This complete original parent law is independently verified at all axes and orbit coordinates. -/
def table : RootFineParent4CacheTable 103 1 :=
  RootFineParent4CacheTable.single 103 value (by
    intro axis orbit
    have checked : value axis orbit = source axis orbit :=
      finThreeCases (predicate := fun selected => value selected orbit = source selected orbit)

        (sparseIntegerVectorCheck_sound _ _ _
          (RootFineParent4FromWindow.numerator_nonnegative window 103 0)
          (RootFineParent4FromWindow.numerator_normalized window 103 0) checked0 orbit)

        (sparseIntegerVectorCheck_sound _ _ _
          (RootFineParent4FromWindow.numerator_nonnegative window 103 1)
          (RootFineParent4FromWindow.numerator_normalized window 103 1) checked1 orbit)

        (sparseIntegerVectorCheck_sound _ _ _
          (RootFineParent4FromWindow.numerator_nonnegative window 103 2)
          (RootFineParent4FromWindow.numerator_normalized window 103 2) checked2 orbit)

        axis
    exact checked.trans (RootFineParent4FromWindow.numerator_eq window 103 axis orbit))
end MatrixBounds.Numeric.SuppliedRootFineParent4Block103
