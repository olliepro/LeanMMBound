import PairedFine4Children027
import RootFineParent4CacheTable
import RootFineSparseLookup
import SuppliedRootFineParent4IntegerValidity

namespace MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4Parent027
open scoped BigOperators
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000
set_option exponentiation.threshold 1000

/-- The complete original parent law evaluated from the checked literal children. -/
def source (axis : Fin 3) (orbit : Fin 231) : ℤ :=
  SuppliedRootFineParent3Integers.sparseIntegerParent (RootFineCachedParent4.weight 27)
    (RootFineCachedParent4.complement 27) OrbitLevel4.sizes OrbitLevel4.encoding.columns
    SuppliedRootFineParent4Integers.wordScale (fun column => PairedFine4Children027.numerator column axis) orbit

/-- Literal children preserve the complete original parent4 integer law. -/
theorem source_eq (axis : Fin 3) (orbit : Fin 231) :
    source axis orbit = SuppliedRootFineParent4Integers.numerator 27 axis orbit := by
  have childrenEq : (fun column => PairedFine4Children027.numerator column axis) =
      fun column => RootFineCachedParent4.child PairedFine4Children027.parent3 27 column axis := by
    funext column orbit
    rw [PairedFine4Children027.numerator_eq, RootFineCachedParent4.child_eq _ PairedFine4Children027.parent3_eq]
  rw [source, childrenEq]
  exact RootFineCachedParent4.numerator_eq _ PairedFine4Children027.parent3_eq 27 axis orbit

/-- Every parent4 source orbit mass is nonnegative. -/
theorem source_nonnegative (axis : Fin 3) (orbit : Fin 231) : 0 ≤ source axis orbit := by
  rw [source_eq]
  exact SuppliedRootFineParent4Integers.numerator_nonnegative 27 axis orbit

/-- Every complete parent4 source vector has total 2^406. -/
theorem source_normalized (axis : Fin 3) : ∑ orbit, source axis orbit = (2:ℤ)^406 := by
  simp only [source_eq]
  exact SuppliedRootFineParent4Integers.numerator_normalized 27 axis

/-- Prepared complete parent law on physical axis 0; omitted coordinates are zero. -/
def row0 (orbit : Fin 231) : ℤ := sparseIntegerLookup [(4,1457177859172704103495619853823688157505469805460293903277088284742611615008962781332406945278562664114191458116049043456), (7,2650279163777115039365564377917372677336227729307408150135429401562659802409846839600468344255169102094233100422708461568), (8,28771002701341994958352441938270334875360633383068687245583842788958006368608251722163554852933984133322144747877209997312), (22,4214452315047722512702359204918724774601223752762808357287057974963210241093405409034034218097380039432097839437561462784), (23,47978392733835221612122340909566087563671511819653331390411964979437430343701200367827255967542510140276655487884709593088), (26,80192687424387391511940500723696551908626104250817775774466815388937529438256169336339582281821215132658480372517601017856)] orbit.val
/-- Independent kernel check of every nonzero value and the complete exact total on axis 0. -/
theorem checked0 : sparseIntegerVectorCheck ((2:ℤ)^406) row0 (source 0) = true := by
  decide +kernel
/-- Prepared complete parent law on physical axis 1; omitted coordinates are zero. -/
def row1 (orbit : Fin 231) : ℤ := sparseIntegerLookup [(1,165263992197562149737978827008192759957101170741070304821162198818601447809077836456297302609928821211897803006255839576064)] orbit.val
/-- Independent kernel check of every nonzero value and the complete exact total on axis 1. -/
theorem checked1 : sparseIntegerVectorCheck ((2:ℤ)^406) row1 (source 1) = true := by
  decide +kernel
/-- Prepared complete parent law on physical axis 2; omitted coordinates are zero. -/
def row2 (orbit : Fin 231) : ℤ := sparseIntegerLookup [(110,2193333135899123961145608399124699570723260970652682900674831423974644299636766033334075194462308963188736), (164,86589543841753400288807910415656152157147650125986849064094343914747476504043635384704834808721094058573926382893531136), (174,1437770470385069714639151805329332251640953452067153887771723397160225220386336459069274710953750870884960123328518946816), (185,2085199272826112525789342337474430894948521753134389312182110894158748660951753140045964632351039840476725248), (194,56608695208352807724418685444732104510703195961265029420275768368591714013044984108047124395123196283393164141741998080), (201,3579526545207256427427292329281336367497551057794617013290154794815634137985135963070924552878457504781288094251188486144), (203,211081501819377823876541869341362693697000119098486992247700135057204382225957143970666893636226461571641855967232), (206,318801760943221221912285123422603138141734658474203199701419471004828387672696520396831725258163607696542006565318688768), (207,2906967507212199486719586891919707525046169170506189402217922126461860429900959334806530155665364298256067475942536118272), (215,588684511479815792098196409901308410658948881149938727843071714602991812199625422399955546055504726706875602276855054336), (219,59617894435558884494562991072818290103673149653070884321437319876401507315508114602143149880949040796599317972697915326464), (221,3681212436162651583473645213799089861311460026130540169411800715062851710432873784754970403503124793051822382721852768256), (222,39439755491094027170093109120487113926369070037347770749236804961813236717418702205000457477764634750498447179873601454080), (225,53550180589385328427055556557181970286785715705847117128266514359299755044126338595900060837123962638146508004282121322496)] orbit.val
/-- Independent kernel check of every nonzero value and the complete exact total on axis 2. -/
theorem checked2 : sparseIntegerVectorCheck ((2:ℤ)^406) row2 (source 2) = true := by
  decide +kernel

/-- Complete original physical-axis and orbit lookup for this parent. -/
def value (axis : Fin 3) (orbit : Fin 231) : ℤ :=
  if axis = 0 then row0 orbit else if axis = 1 then row1 orbit else row2 orbit

/-- This complete original parent law is independently verified at all axes and orbit coordinates. -/
def table : RootFineParent4CacheTable 27 1 :=
  RootFineParent4CacheTable.single 27 value (by
    intro axis orbit
    have checked : value axis orbit = source axis orbit :=
      finThreeCases (predicate := fun selected => value selected orbit = source selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (source_nonnegative 0) (source_normalized 0) checked0 orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (source_nonnegative 1) (source_normalized 1) checked1 orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (source_nonnegative 2) (source_normalized 2) checked2 orbit)
        axis
    exact checked.trans (source_eq axis orbit))

end MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4Parent027
