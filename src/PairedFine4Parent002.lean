import PairedFine4Children002
import RootFineParent4CacheTable
import RootFineSparseLookup
import SuppliedRootFineParent4IntegerValidity

namespace MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4Parent002
open scoped BigOperators
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000
set_option exponentiation.threshold 1000

/-- The complete original parent law evaluated from the checked literal children. -/
def source (axis : Fin 3) (orbit : Fin 231) : ℤ :=
  SuppliedRootFineParent3Integers.sparseIntegerParent (RootFineCachedParent4.weight 2)
    (RootFineCachedParent4.complement 2) OrbitLevel4.sizes OrbitLevel4.encoding.columns
    SuppliedRootFineParent4Integers.wordScale (fun column => PairedFine4Children002.numerator column axis) orbit

/-- Literal children preserve the complete original parent4 integer law. -/
theorem source_eq (axis : Fin 3) (orbit : Fin 231) :
    source axis orbit = SuppliedRootFineParent4Integers.numerator 2 axis orbit := by
  have childrenEq : (fun column => PairedFine4Children002.numerator column axis) =
      fun column => RootFineCachedParent4.child PairedFine4Children002.parent3 2 column axis := by
    funext column orbit
    rw [PairedFine4Children002.numerator_eq, RootFineCachedParent4.child_eq _ PairedFine4Children002.parent3_eq]
  rw [source, childrenEq]
  exact RootFineCachedParent4.numerator_eq _ PairedFine4Children002.parent3_eq 2 axis orbit

/-- Every parent4 source orbit mass is nonnegative. -/
theorem source_nonnegative (axis : Fin 3) (orbit : Fin 231) : 0 ≤ source axis orbit := by
  rw [source_eq]
  exact SuppliedRootFineParent4Integers.numerator_nonnegative 2 axis orbit

/-- Every complete parent4 source vector has total 2^406. -/
theorem source_normalized (axis : Fin 3) : ∑ orbit, source axis orbit = (2:ℤ)^406 := by
  simp only [source_eq]
  exact SuppliedRootFineParent4Integers.numerator_normalized 2 axis

/-- Prepared complete parent law on physical axis 0; omitted coordinates are zero. -/
def row0 (orbit : Fin 231) : ℤ := sparseIntegerLookup [(1,165263992197562149737978827008192759957101170741070304821162198818601447809077836456297302609928821211897803006255839576064)] orbit.val
/-- Independent kernel check of every nonzero value and the complete exact total on axis 0. -/
theorem checked0 : sparseIntegerVectorCheck ((2:ℤ)^406) row0 (source 0) = true := by
  decide +kernel
/-- Prepared complete parent law on physical axis 1; omitted coordinates are zero. -/
def row1 (orbit : Fin 231) : ℤ := sparseIntegerLookup [(4,1457182811176798183717941732089951443155187953616119321473462456334642120565293155872743447584634573151963014574555267072), (7,2650274792574135821024504920560054163271555743112856698846436779281591379375281263643498681041625815571954312503428644864), (8,28770995752796462866810718746939279193038744675776777470614296598726595712516224588835438744106539250280181326670767063040), (22,4214451758645208188359896815643337309794881247222147263367674353262910250123824432453431494929571090002275415357306961920), (23,47978366844153386979109256011805700480544045266065059447118492845271032590411852692758042614006171727034005436222001905664), (26,80192720238216157698956508781154437367296755855277344619741835785724675756085360322734147628260278755857423500927779733504)] orbit.val
/-- Independent kernel check of every nonzero value and the complete exact total on axis 1. -/
theorem checked1 : sparseIntegerVectorCheck ((2:ℤ)^406) row1 (source 1) = true := by
  decide +kernel
/-- Prepared complete parent law on physical axis 2; omitted coordinates are zero. -/
def row2 (orbit : Fin 231) : ℤ := sparseIntegerLookup [(110,5978334186521527172165303370041928742818005478538616702365736990165987657984637575053212956306527752290304), (164,86580685832627496197510712385020570517999515380721126055441963152419150813749723712665716454318491643073756245633531904), (174,1437770641587399446074174260190205246440605932250310851462960172149960337998570869390983254607321602630175283602847170560), (185,6449435779599073622973874464844849469684666770541846032804472547545317681389615123183447630010823863173120), (194,56604723931703451806707304837996027470508477504487858572607070619218575118740319377591331814424994255597144209956536320), (201,3579526470735590622065070253434654613393561584157188475920540863274624635417674225866549407290098348660101763536139583488), (203,202753465190177864368932798293638849603846188831196035250466496699303521074846890720556580092660117664888820596736), (206,318801634149558180846152167750945126095437813739338111677312794329710756398086327486951486044166370360693928275656835072), (207,2906967063226624226527389627268913189087405155656747901161526337155637356801353028188917374061331643164947724445467803648), (215,588696592165020672618311823359916230311574253114724534416473326956629134465577837470691901703003460055337348308387495936), (219,59617908709616649583562284147005218151253701246983689046298785567763211489367139621917632639901129113336217444421520588800), (221,3681211831301383179323086014384811779419926172020552906939894755276195404197184132969758957508070767676749785636420976640), (222,39439749194623077233207637910469181805143351947862809356178071278900543916619434604800672439770709708920542128356924063744), (225,53550174447639038027802672297572303785150414151775333318610300358094065182367266978962658005964968381873662716976448929792)] orbit.val
/-- Independent kernel check of every nonzero value and the complete exact total on axis 2. -/
theorem checked2 : sparseIntegerVectorCheck ((2:ℤ)^406) row2 (source 2) = true := by
  decide +kernel

/-- Complete original physical-axis and orbit lookup for this parent. -/
def value (axis : Fin 3) (orbit : Fin 231) : ℤ :=
  if axis = 0 then row0 orbit else if axis = 1 then row1 orbit else row2 orbit

/-- This complete original parent law is independently verified at all axes and orbit coordinates. -/
def table : RootFineParent4CacheTable 2 1 :=
  RootFineParent4CacheTable.single 2 value (by
    intro axis orbit
    have checked : value axis orbit = source axis orbit :=
      finThreeCases (predicate := fun selected => value selected orbit = source selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (source_nonnegative 0) (source_normalized 0) checked0 orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (source_nonnegative 1) (source_normalized 1) checked1 orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (source_nonnegative 2) (source_normalized 2) checked2 orbit)
        axis
    exact checked.trans (source_eq axis orbit))

end MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4Parent002
