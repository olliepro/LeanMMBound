import PairedFine4Children025
import RootFineParent4CacheTable
import RootFineSparseLookup
import SuppliedRootFineParent4IntegerValidity

namespace MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4Parent025
open scoped BigOperators
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000
set_option exponentiation.threshold 1000

/-- The complete original parent law evaluated from the checked literal children. -/
def source (axis : Fin 3) (orbit : Fin 231) : ℤ :=
  SuppliedRootFineParent3Integers.sparseIntegerParent (RootFineCachedParent4.weight 25)
    (RootFineCachedParent4.complement 25) OrbitLevel4.sizes OrbitLevel4.encoding.columns
    SuppliedRootFineParent4Integers.wordScale (fun column => PairedFine4Children025.numerator column axis) orbit

/-- Literal children preserve the complete original parent4 integer law. -/
theorem source_eq (axis : Fin 3) (orbit : Fin 231) :
    source axis orbit = SuppliedRootFineParent4Integers.numerator 25 axis orbit := by
  have childrenEq : (fun column => PairedFine4Children025.numerator column axis) =
      fun column => RootFineCachedParent4.child PairedFine4Children025.parent3 25 column axis := by
    funext column orbit
    rw [PairedFine4Children025.numerator_eq, RootFineCachedParent4.child_eq _ PairedFine4Children025.parent3_eq]
  rw [source, childrenEq]
  exact RootFineCachedParent4.numerator_eq _ PairedFine4Children025.parent3_eq 25 axis orbit

/-- Every parent4 source orbit mass is nonnegative. -/
theorem source_nonnegative (axis : Fin 3) (orbit : Fin 231) : 0 ≤ source axis orbit := by
  rw [source_eq]
  exact SuppliedRootFineParent4Integers.numerator_nonnegative 25 axis orbit

/-- Every complete parent4 source vector has total 2^406. -/
theorem source_normalized (axis : Fin 3) : ∑ orbit, source axis orbit = (2:ℤ)^406 := by
  simp only [source_eq]
  exact SuppliedRootFineParent4Integers.numerator_normalized 25 axis

/-- Prepared complete parent law on physical axis 0; omitted coordinates are zero. -/
def row0 (orbit : Fin 231) : ℤ := sparseIntegerLookup [(2,2759651201031421679123689980989227663407448381049099547513046789430480496475555080953269535278588756479198951083696193536), (3,29787176342063482037675855042215857160354535935826246538934097903895830727307296920076916811192937042822589003555577790464), (6,52420746261910136702858003184246632240734579077556341919095290411665419993902251265805558593441920988203385772186863140864), (21,80296418392557109318321278800741042892604607346638616815619763713609716591392733189461557670015374424392629279429702451200)] orbit.val
/-- Independent kernel check of every nonzero value and the complete exact total on axis 0. -/
theorem checked0 : sparseIntegerVectorCheck ((2:ℤ)^406) row0 (source 0) = true := by
  decide +kernel
/-- Prepared complete parent law on physical axis 1; omitted coordinates are zero. -/
def row1 (orbit : Fin 231) : ℤ := sparseIntegerLookup [(110,371941932128167240634619734250099913451622145345662764995371926092757761312539693883708161498003323414032416768), (164,5091756326570535561572045354130790743392260220116157016593942642230381340465171365889684331104602872063596344972935168), (174,524564541291815081431791290717267320945399642067896207382814949746951910084298503883629761341006606809710788714803757056), (185,1955339720657090062747659477499195704322318308947547146284269364503142133252213973095290123477504712658060308515913728), (194,65399032969736602413849250913702378287690438642942390848254648156599838857369148178135041090540663502652557603188506624), (201,2196051844866309027547045035079825498618455205849995664117539069279389634590413539659479423636132814454142867165604216832), (203,48998877276379965906813260013752933643283492728089530499646304413754943179498546387828361850097239344815015999110643712), (206,1172532222095162041117839757591435110601107069589254729946396623367329669449722915559609546181395714119492408656034529280), (207,1961295449188934325413989866319044176341830186220362763612219019999584252291356694718109140654753171925573353413086806016), (215,1681739433316096272362039072408651756663515254640244825496055429470756632992301358834843610600694767903860713412523720704), (219,57125353497670609292539436813837649568818644860602409438200182516304075711627227204055203729741022640438305494690514862080), (221,7321943278474211927057293191871181620319390188019814904163815624191565041090811032790517120809627940292200909005809254400), (222,30721312673231079741950675723932973161438545438737188909316191718895901595020327842094110248600463832890490507223615143936), (225,62437754250762645902485566800041026710725494471991419608070541937773433130328034523484311957084795551133833410304026869760)] orbit.val
/-- Independent kernel check of every nonzero value and the complete exact total on axis 1. -/
theorem checked1 : sparseIntegerVectorCheck ((2:ℤ)^406) row1 (source 1) = true := by
  decide +kernel
/-- Prepared complete parent law on physical axis 2; omitted coordinates are zero. -/
def row2 (orbit : Fin 231) : ℤ := sparseIntegerLookup [(2,2759871820072153093181708780300616527717076533887489084895085170771410492445309096715121847242252405862988744728808259584), (3,29792105962119287749950931015260914831111708533963469850328961052879258826356104961798747976724728702502537451700280623104), (6,52415754288204848243168773347227763243845589956100859101739425764968250977522210162843682532274689662692509810359736991744), (21,80296260127165860651677413865403465354426795717118486784198726829982527512754212234939750253687150440839766999467013701632)] orbit.val
/-- Independent kernel check of every nonzero value and the complete exact total on axis 2. -/
theorem checked2 : sparseIntegerVectorCheck ((2:ℤ)^406) row2 (source 2) = true := by
  decide +kernel

/-- Complete original physical-axis and orbit lookup for this parent. -/
def value (axis : Fin 3) (orbit : Fin 231) : ℤ :=
  if axis = 0 then row0 orbit else if axis = 1 then row1 orbit else row2 orbit

/-- This complete original parent law is independently verified at all axes and orbit coordinates. -/
def table : RootFineParent4CacheTable 25 1 :=
  RootFineParent4CacheTable.single 25 value (by
    intro axis orbit
    have checked : value axis orbit = source axis orbit :=
      finThreeCases (predicate := fun selected => value selected orbit = source selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (source_nonnegative 0) (source_normalized 0) checked0 orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (source_nonnegative 1) (source_normalized 1) checked1 orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (source_nonnegative 2) (source_normalized 2) checked2 orbit)
        axis
    exact checked.trans (source_eq axis orbit))

end MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4Parent025
