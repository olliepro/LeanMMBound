import PairedFine4Children103
import RootFineParent4CacheTable
import RootFineSparseLookup
import SuppliedRootFineParent4IntegerValidity

namespace MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4Parent103
open scoped BigOperators
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000
set_option exponentiation.threshold 1000

/-- The complete original parent law evaluated from the checked literal children. -/
def source (axis : Fin 3) (orbit : Fin 231) : ℤ :=
  SuppliedRootFineParent3Integers.sparseIntegerParent (RootFineCachedParent4.weight 103)
    (RootFineCachedParent4.complement 103) OrbitLevel4.sizes OrbitLevel4.encoding.columns
    SuppliedRootFineParent4Integers.wordScale (fun column => PairedFine4Children103.numerator column axis) orbit

/-- Literal children preserve the complete original parent4 integer law. -/
theorem source_eq (axis : Fin 3) (orbit : Fin 231) :
    source axis orbit = SuppliedRootFineParent4Integers.numerator 103 axis orbit := by
  have childrenEq : (fun column => PairedFine4Children103.numerator column axis) =
      fun column => RootFineCachedParent4.child PairedFine4Children103.parent3 103 column axis := by
    funext column orbit
    rw [PairedFine4Children103.numerator_eq, RootFineCachedParent4.child_eq _ PairedFine4Children103.parent3_eq]
  rw [source, childrenEq]
  exact RootFineCachedParent4.numerator_eq _ PairedFine4Children103.parent3_eq 103 axis orbit

/-- Every parent4 source orbit mass is nonnegative. -/
theorem source_nonnegative (axis : Fin 3) (orbit : Fin 231) : 0 ≤ source axis orbit := by
  rw [source_eq]
  exact SuppliedRootFineParent4Integers.numerator_nonnegative 103 axis orbit

/-- Every complete parent4 source vector has total 2^406. -/
theorem source_normalized (axis : Fin 3) : ∑ orbit, source axis orbit = (2:ℤ)^406 := by
  simp only [source_eq]
  exact SuppliedRootFineParent4Integers.numerator_normalized 103 axis

/-- Prepared complete parent law on physical axis 0; omitted coordinates are zero. -/
def row0 (orbit : Fin 231) : ℤ := sparseIntegerLookup [(175,146421648797438645406849550609488861013846980125748976907809116953197191980170578882390332264404548404880053448877277184), (202,412308693031724045293978298650264056067160190974581324075075186405023394015189472795737430664569155053875947835964260352), (208,2621418982410936450096087484450061895803641966019686135835474962495064160423448973806698912623808738226518232908674629632), (220,9706026590795249953195173830053733292703168240351068439955288579400706105680096257637444161539855882639405654905423134720), (223,35068209262187728688311599846115258646544954690371047208450169764563700468816751974865585746071058107560164086762218455040), (226,117309607020339071955675137998313953204968398673228172735938381208783756488162179198309446026765124780012959030394681819136)] orbit.val
/-- Independent kernel check of every nonzero value and the complete exact total on axis 0. -/
theorem checked0 : sparseIntegerVectorCheck ((2:ℤ)^406) row0 (source 0) = true := by
  decide +kernel
/-- Prepared complete parent law on physical axis 1; omitted coordinates are zero. -/
def row1 (orbit : Fin 231) : ℤ := sparseIntegerLookup [(2,3039695048748038781390953059198423027253078644085554317769150709056984573978912346805105215085981302804909894666775691264), (3,34572279414565843638923582661813593998580715362676544052935343937057908162653282162345865153869211510278153406891260116992), (6,49319767436086334496828794542987904563476100896961357302615984048792874083280281623640470505868688395007536894484313800704), (21,78332250298161932820835496744192838367791275837346849147841720123693680989165360323505861735104940003807202810213489967104)] orbit.val
/-- Independent kernel check of every nonzero value and the complete exact total on axis 1. -/
theorem checked1 : sparseIntegerVectorCheck ((2:ℤ)^406) row1 (source 1) = true := by
  decide +kernel
/-- Prepared complete parent law on physical axis 2; omitted coordinates are zero. -/
def row2 (orbit : Fin 231) : ℤ := sparseIntegerLookup [(1,165263992197562149737978827008192759957101170741070304821162198818601447809077836456297302609928821211897803006255839576064)] orbit.val
/-- Independent kernel check of every nonzero value and the complete exact total on axis 2. -/
theorem checked2 : sparseIntegerVectorCheck ((2:ℤ)^406) row2 (source 2) = true := by
  decide +kernel

/-- Complete original physical-axis and orbit lookup for this parent. -/
def value (axis : Fin 3) (orbit : Fin 231) : ℤ :=
  if axis = 0 then row0 orbit else if axis = 1 then row1 orbit else row2 orbit

/-- This complete original parent law is independently verified at all axes and orbit coordinates. -/
def table : RootFineParent4CacheTable 103 1 :=
  RootFineParent4CacheTable.single 103 value (by
    intro axis orbit
    have checked : value axis orbit = source axis orbit :=
      finThreeCases (predicate := fun selected => value selected orbit = source selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (source_nonnegative 0) (source_normalized 0) checked0 orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (source_nonnegative 1) (source_normalized 1) checked1 orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (source_nonnegative 2) (source_normalized 2) checked2 orbit)
        axis
    exact checked.trans (source_eq axis orbit))

end MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4Parent103
