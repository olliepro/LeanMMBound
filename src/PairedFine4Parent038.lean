import PairedFine4Children038
import RootFineParent4CacheTable
import RootFineSparseLookup
import SuppliedRootFineParent4IntegerValidity

namespace MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4Parent038
open scoped BigOperators
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000
set_option exponentiation.threshold 1000

/-- The complete original parent law evaluated from the checked literal children. -/
def source (axis : Fin 3) (orbit : Fin 231) : ℤ :=
  SuppliedRootFineParent3Integers.sparseIntegerParent (RootFineCachedParent4.weight 38)
    (RootFineCachedParent4.complement 38) OrbitLevel4.sizes OrbitLevel4.encoding.columns
    SuppliedRootFineParent4Integers.wordScale (fun column => PairedFine4Children038.numerator column axis) orbit

/-- Literal children preserve the complete original parent4 integer law. -/
theorem source_eq (axis : Fin 3) (orbit : Fin 231) :
    source axis orbit = SuppliedRootFineParent4Integers.numerator 38 axis orbit := by
  have childrenEq : (fun column => PairedFine4Children038.numerator column axis) =
      fun column => RootFineCachedParent4.child PairedFine4Children038.parent3 38 column axis := by
    funext column orbit
    rw [PairedFine4Children038.numerator_eq, RootFineCachedParent4.child_eq _ PairedFine4Children038.parent3_eq]
  rw [source, childrenEq]
  exact RootFineCachedParent4.numerator_eq _ PairedFine4Children038.parent3_eq 38 axis orbit

/-- Every parent4 source orbit mass is nonnegative. -/
theorem source_nonnegative (axis : Fin 3) (orbit : Fin 231) : 0 ≤ source axis orbit := by
  rw [source_eq]
  exact SuppliedRootFineParent4Integers.numerator_nonnegative 38 axis orbit

/-- Every complete parent4 source vector has total 2^406. -/
theorem source_normalized (axis : Fin 3) : ∑ orbit, source axis orbit = (2:ℤ)^406 := by
  simp only [source_eq]
  exact SuppliedRootFineParent4Integers.numerator_normalized 38 axis

/-- Prepared complete parent law on physical axis 0; omitted coordinates are zero. -/
def row0 (orbit : Fin 231) : ℤ := sparseIntegerLookup [(4,1203920942909507615746276197210262456274098940651422129501679094940737310716900245293018328674940007229198606255028961280), (7,2421232726180240261613192885528509244930823402495337065988967029292255724738831844885837747674444557335042072098499461120), (8,28889318257854256283633316345790476458804729711711452211921450167188980530130852933359511346224006354293707890214567936000), (22,4043611666437253778031090411318573582622188329600350022686691643121317030254075029162631962718574536638402014223993405440), (23,47802397968450196513668773789413867819459405515388182945918976050609101913688262448071208685546927828935323043240100233216), (26,80903510635730695285286177378931070395009924841223560445144434833449055299548913955525094539089927927466129380223649579008)] orbit.val
/-- Independent kernel check of every nonzero value and the complete exact total on axis 0. -/
theorem checked0 : sparseIntegerVectorCheck ((2:ℤ)^406) row0 (source 0) = true := by
  decide +kernel
/-- Prepared complete parent law on physical axis 1; omitted coordinates are zero. -/
def row1 (orbit : Fin 231) : ℤ := sparseIntegerLookup [(110,671294068890004103078049846896020823812473553869709269956156901277285600304620927406946167188314195146582261760), (164,15352543800845931295848893192413598791299350518467518795093741923001867559429412159182216753446550931014096508095037440), (174,1188568404707260505282106541835084073586126981051006952167803064691471581098042427731360782354817949674019575807606784000), (185,1662318066128108056568992808210972983187397522901415806207518663631444954705930544376733559993146718882491269120), (194,82518284135663837490075341366270563549714464941044237064613991061974703177827534432778584303464082277001687381678489600), (201,3172436988789621833632201438477032081653008134172817783501867649164155122269694912856525628034106300439952959821370621952), (203,43335457101424145284097454436828805709082217306910279466436016857374797696160993952092523011532957033493468020736), (206,253026525069820029962158818268088473187246571288811682043895646186294142035500014467077117516037682595425061238344777728), (207,2956864037493649870576800229385437257956845698529712004431753784572312981356182132338663643645713328587187464375667523584), (215,1632716820924327704902305068991014914486880728938077283974017293151065155469091211546847125164118568110110683592308817920), (219,55821774055843688947756138440849602980825766385183975546658180859871006236321235072683969366472075233795989841545405661184), (221,3002192468313333576043363021935960609874919442264751007453258540088656653407128040359119864534874861921044159872054067200), (222,39975239376362397459341256976431561476546716902872014561669051416016749008358158388820007940663293511680986856168368373760), (225,57163302646452470805254314793715796834706846565227537859721258289275067935742019057730224916610670403170652672422397870080)] orbit.val
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
def table : RootFineParent4CacheTable 38 1 :=
  RootFineParent4CacheTable.single 38 value (by
    intro axis orbit
    have checked : value axis orbit = source axis orbit :=
      finThreeCases (predicate := fun selected => value selected orbit = source selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (source_nonnegative 0) (source_normalized 0) checked0 orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (source_nonnegative 1) (source_normalized 1) checked1 orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (source_nonnegative 2) (source_normalized 2) checked2 orbit)
        axis
    exact checked.trans (source_eq axis orbit))

end MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4Parent038
