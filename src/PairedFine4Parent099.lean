import PairedFine4Children099
import RootFineParent4CacheTable
import RootFineSparseLookup
import SuppliedRootFineParent4IntegerValidity

namespace MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4Parent099
open scoped BigOperators
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000
set_option exponentiation.threshold 1000

/-- The complete original parent law evaluated from the checked literal children. -/
def source (axis : Fin 3) (orbit : Fin 231) : ℤ :=
  SuppliedRootFineParent3Integers.sparseIntegerParent (RootFineCachedParent4.weight 99)
    (RootFineCachedParent4.complement 99) OrbitLevel4.sizes OrbitLevel4.encoding.columns
    SuppliedRootFineParent4Integers.wordScale (fun column => PairedFine4Children099.numerator column axis) orbit

/-- Literal children preserve the complete original parent4 integer law. -/
theorem source_eq (axis : Fin 3) (orbit : Fin 231) :
    source axis orbit = SuppliedRootFineParent4Integers.numerator 99 axis orbit := by
  have childrenEq : (fun column => PairedFine4Children099.numerator column axis) =
      fun column => RootFineCachedParent4.child PairedFine4Children099.parent3 99 column axis := by
    funext column orbit
    rw [PairedFine4Children099.numerator_eq, RootFineCachedParent4.child_eq _ PairedFine4Children099.parent3_eq]
  rw [source, childrenEq]
  exact RootFineCachedParent4.numerator_eq _ PairedFine4Children099.parent3_eq 99 axis orbit

/-- Every parent4 source orbit mass is nonnegative. -/
theorem source_nonnegative (axis : Fin 3) (orbit : Fin 231) : 0 ≤ source axis orbit := by
  rw [source_eq]
  exact SuppliedRootFineParent4Integers.numerator_nonnegative 99 axis orbit

/-- Every complete parent4 source vector has total 2^406. -/
theorem source_normalized (axis : Fin 3) : ∑ orbit, source axis orbit = (2:ℤ)^406 := by
  simp only [source_eq]
  exact SuppliedRootFineParent4Integers.numerator_normalized 99 axis

/-- Prepared complete parent law on physical axis 0; omitted coordinates are zero. -/
def row0 (orbit : Fin 231) : ℤ := sparseIntegerLookup [(110,1171665130167168570298010101989098494670538453465443408258494450129834275683843751016609971197957172694181507424583680), (164,275321748771199557826561701304390866755251823700026533484994906140278061164106602540058309287052662914492103568601907200), (174,1533652758865134739551857725621664105632280030513255334159328448752969218815096535650955184783780087183174679655157334016), (185,418390431007544068889318569653319964812137824773734821880725575423716870428333096983127264131262890074636386146713600), (194,145091926789096286237160930107965351801768871204912440371620000459657111087847146666280842153076496527218356215160504320), (201,3768575166600525953371650181725542378890846541373711951853498604157426859615287311189485266836163411613283750176037535744), (203,828655126872709101958788920423575988008185082064204270049496927866039277075647092216652735468031025428360845066240), (206,374292130067744886443325627681869865118178113105077201544886614859746556241392643436572957512826631935375479704035262464), (207,2856971530474406415542091617974248769347752610162449412093972854101869447565274226878490109525669390563571770025016557568), (215,1328812242564586940115668997628162698122563284992548696388633568357689221830630707489550599655375858157092155644465643520), (219,61346444981007023496310779330202458912741498586831089478031852663582968359820285662286835386533641346282797523238964428800), (221,4217814339212719731111846108834133378561342659060584406505252826095031797381178890216881892822198176996031966665183854592), (222,38823175690680230546042642727608043189781117636718508447015277443323675432628336012118390844253530322455647254732032966656), (225,50592248798313179600076952772043717598313099898944819677278471619247654325743011465328709262677442139175323720376767217664)] orbit.val
/-- Independent kernel check of every nonzero value and the complete exact total on axis 0. -/
theorem checked0 : sparseIntegerVectorCheck ((2:ℤ)^406) row0 (source 0) = true := by
  decide +kernel
/-- Prepared complete parent law on physical axis 1; omitted coordinates are zero. -/
def row1 (orbit : Fin 231) : ℤ := sparseIntegerLookup [(1,165263992197562149737978827008192759957101170741070304821162198818601447809077836456297302609928821211897803006255839576064)] orbit.val
/-- Independent kernel check of every nonzero value and the complete exact total on axis 1. -/
theorem checked1 : sparseIntegerVectorCheck ((2:ℤ)^406) row1 (source 1) = true := by
  decide +kernel
/-- Prepared complete parent law on physical axis 2; omitted coordinates are zero. -/
def row2 (orbit : Fin 231) : ℤ := sparseIntegerLookup [(4,1580130468193988140611704744221332029072962954681180239608672225380265777417608993503666586134660981460461258605881982976), (7,2790858628486997548114456784566690195361953232857706989715211534169422679393381762922677779007919182833840983621926649856), (8,28766582183570897790286460336978214584091639532751897780728852909107569475618810305054786506078592694755093190303327191040), (22,4360228790600162859080913781347095787194423669028313242901781105885193822695514972604515915972966312016555695990162587648), (23,48052665090969537483855248175909553077794995854565369437991630791299812411643589992385975298976234613755158557398212280320), (26,79713527035740565916030043185169874283585195497185837130216050252759183642308930429825680523758447427076693320336328884224)] orbit.val
/-- Independent kernel check of every nonzero value and the complete exact total on axis 2. -/
theorem checked2 : sparseIntegerVectorCheck ((2:ℤ)^406) row2 (source 2) = true := by
  decide +kernel

/-- Complete original physical-axis and orbit lookup for this parent. -/
def value (axis : Fin 3) (orbit : Fin 231) : ℤ :=
  if axis = 0 then row0 orbit else if axis = 1 then row1 orbit else row2 orbit

/-- This complete original parent law is independently verified at all axes and orbit coordinates. -/
def table : RootFineParent4CacheTable 99 1 :=
  RootFineParent4CacheTable.single 99 value (by
    intro axis orbit
    have checked : value axis orbit = source axis orbit :=
      finThreeCases (predicate := fun selected => value selected orbit = source selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (source_nonnegative 0) (source_normalized 0) checked0 orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (source_nonnegative 1) (source_normalized 1) checked1 orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (source_nonnegative 2) (source_normalized 2) checked2 orbit)
        axis
    exact checked.trans (source_eq axis orbit))

end MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4Parent099
