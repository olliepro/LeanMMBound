import PairedFine4Children011
import RootFineParent4CacheTable
import RootFineSparseLookup
import SuppliedRootFineParent4IntegerValidity

namespace MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4Parent011
open scoped BigOperators
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000
set_option exponentiation.threshold 1000

/-- The complete original parent law evaluated from the checked literal children. -/
def source (axis : Fin 3) (orbit : Fin 231) : ℤ :=
  SuppliedRootFineParent3Integers.sparseIntegerParent (RootFineCachedParent4.weight 11)
    (RootFineCachedParent4.complement 11) OrbitLevel4.sizes OrbitLevel4.encoding.columns
    SuppliedRootFineParent4Integers.wordScale (fun column => PairedFine4Children011.numerator column axis) orbit

/-- Literal children preserve the complete original parent4 integer law. -/
theorem source_eq (axis : Fin 3) (orbit : Fin 231) :
    source axis orbit = SuppliedRootFineParent4Integers.numerator 11 axis orbit := by
  have childrenEq : (fun column => PairedFine4Children011.numerator column axis) =
      fun column => RootFineCachedParent4.child PairedFine4Children011.parent3 11 column axis := by
    funext column orbit
    rw [PairedFine4Children011.numerator_eq, RootFineCachedParent4.child_eq _ PairedFine4Children011.parent3_eq]
  rw [source, childrenEq]
  exact RootFineCachedParent4.numerator_eq _ PairedFine4Children011.parent3_eq 11 axis orbit

/-- Every parent4 source orbit mass is nonnegative. -/
theorem source_nonnegative (axis : Fin 3) (orbit : Fin 231) : 0 ≤ source axis orbit := by
  rw [source_eq]
  exact SuppliedRootFineParent4Integers.numerator_nonnegative 11 axis orbit

/-- Every complete parent4 source vector has total 2^406. -/
theorem source_normalized (axis : Fin 3) : ∑ orbit, source axis orbit = (2:ℤ)^406 := by
  simp only [source_eq]
  exact SuppliedRootFineParent4Integers.numerator_normalized 11 axis

/-- Prepared complete parent law on physical axis 0; omitted coordinates are zero. -/
def row0 (orbit : Fin 231) : ℤ := sparseIntegerLookup [(1,165263992197562149737978827008192759957101170741070304821162198818601447809077836456297302609928821211897803006255839576064)] orbit.val
/-- Independent kernel check of every nonzero value and the complete exact total on axis 0. -/
theorem checked0 : sparseIntegerVectorCheck ((2:ℤ)^406) row0 (source 0) = true := by
  decide +kernel
/-- Prepared complete parent law on physical axis 1; omitted coordinates are zero. -/
def row1 (orbit : Fin 231) : ℤ := sparseIntegerLookup [(110,729244501139575117618824670578254161519751483320997524436330195626557162903622963967986667785327076497661362176), (164,15353309769075219283169127584163010485210587315048175938794887599012069881228973329172206018444286328556996165688623104), (174,1188569502689891782199335658823007234969205638598508113619339243865311755480688841224290872898681294366353708921741377536), (185,1736068951943036760526537425893289559478306205112525354816032221701111678464489692055883381678240864167618674688), (194,82522403687437794170160918278462693668279882638362734023342045810460664604852673474498243886248522435042983572982988800), (201,3172448151650813990661315172540578901370788927881745291798112337681799686052925407684039234697799115000426999443802292224), (203,43135640835304581089967495387905778094720619645652232826303336952632311146779477956018953086524416956588705710080), (206,253017519684293747532583588387151275416403763383214477909652560573567734745696797549593615765244345211774715942439747584), (207,2956861762372670341659528737035034367178822618899671542991271549446167374957028259513615322945169815240098389476457316352), (215,1632798393730155070254843097956578653441962727625117692663715031290058359609556561734305527687269743690170594542680539136), (219,55822229028753764938025252596744648883947225495476096724035927611790210433724314125684258759852158674324075848120750047232), (221,3002090223789273445011890932802716192301149196989677715875587484108783514654082006916361836416818851673677387507808862208), (222,39975072265677961365136415299800459647301720395975086958978907817590094577523247609057910737134807717589941312250366132224), (225,57163029590155857755657138910127101612643079690569098059241792543290282267884235211981665640583355710049699173057135902720)] orbit.val
/-- Independent kernel check of every nonzero value and the complete exact total on axis 1. -/
theorem checked1 : sparseIntegerVectorCheck ((2:ℤ)^406) row1 (source 1) = true := by
  decide +kernel
/-- Prepared complete parent law on physical axis 2; omitted coordinates are zero. -/
def row2 (orbit : Fin 231) : ℤ := sparseIntegerLookup [(4,1203922809476021796944826216750186740205050839100934269735947945483687449579496392897004968184552700849965014972652060672), (7,2421228387421092645198890270262201951321840051086874369271660889596350752564977070940082505965469884894005416597791965184), (8,28889112195886549141213074285043112908105774699470832091566941184889041776233886886072842608650495162359451672771072884736), (22,4043620026320785553418103895778023021567581472060990011230545525718028228713918801467963408589931000784270071774429839360), (23,47802574148941937120832334725269548845215621335934222841062555446652937079527073313789209934581150162943662082940349710336), (26,80903534629515763480371597615089686490685302343416451238294547826261402522458483991130199183957222300066448747199543115776)] orbit.val
/-- Independent kernel check of every nonzero value and the complete exact total on axis 2. -/
theorem checked2 : sparseIntegerVectorCheck ((2:ℤ)^406) row2 (source 2) = true := by
  decide +kernel

/-- Complete original physical-axis and orbit lookup for this parent. -/
def value (axis : Fin 3) (orbit : Fin 231) : ℤ :=
  if axis = 0 then row0 orbit else if axis = 1 then row1 orbit else row2 orbit

/-- This complete original parent law is independently verified at all axes and orbit coordinates. -/
def table : RootFineParent4CacheTable 11 1 :=
  RootFineParent4CacheTable.single 11 value (by
    intro axis orbit
    have checked : value axis orbit = source axis orbit :=
      finThreeCases (predicate := fun selected => value selected orbit = source selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (source_nonnegative 0) (source_normalized 0) checked0 orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (source_nonnegative 1) (source_normalized 1) checked1 orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (source_nonnegative 2) (source_normalized 2) checked2 orbit)
        axis
    exact checked.trans (source_eq axis orbit))

end MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4Parent011
