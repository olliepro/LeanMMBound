import PairedFine4Children015
import RootFineParent4CacheTable
import RootFineSparseLookup
import SuppliedRootFineParent4IntegerValidity

namespace MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4Parent015
open scoped BigOperators
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000
set_option exponentiation.threshold 1000

/-- The complete original parent law evaluated from the checked literal children. -/
def source (axis : Fin 3) (orbit : Fin 231) : ℤ :=
  SuppliedRootFineParent3Integers.sparseIntegerParent (RootFineCachedParent4.weight 15)
    (RootFineCachedParent4.complement 15) OrbitLevel4.sizes OrbitLevel4.encoding.columns
    SuppliedRootFineParent4Integers.wordScale (fun column => PairedFine4Children015.numerator column axis) orbit

/-- Literal children preserve the complete original parent4 integer law. -/
theorem source_eq (axis : Fin 3) (orbit : Fin 231) :
    source axis orbit = SuppliedRootFineParent4Integers.numerator 15 axis orbit := by
  have childrenEq : (fun column => PairedFine4Children015.numerator column axis) =
      fun column => RootFineCachedParent4.child PairedFine4Children015.parent3 15 column axis := by
    funext column orbit
    rw [PairedFine4Children015.numerator_eq, RootFineCachedParent4.child_eq _ PairedFine4Children015.parent3_eq]
  rw [source, childrenEq]
  exact RootFineCachedParent4.numerator_eq _ PairedFine4Children015.parent3_eq 15 axis orbit

/-- Every parent4 source orbit mass is nonnegative. -/
theorem source_nonnegative (axis : Fin 3) (orbit : Fin 231) : 0 ≤ source axis orbit := by
  rw [source_eq]
  exact SuppliedRootFineParent4Integers.numerator_nonnegative 15 axis orbit

/-- Every complete parent4 source vector has total 2^406. -/
theorem source_normalized (axis : Fin 3) : ∑ orbit, source axis orbit = (2:ℤ)^406 := by
  simp only [source_eq]
  exact SuppliedRootFineParent4Integers.numerator_normalized 15 axis

/-- Prepared complete parent law on physical axis 0; omitted coordinates are zero. -/
def row0 (orbit : Fin 231) : ℤ := sparseIntegerLookup [(2,2949499416710899909423496228298899492209376262561495627123565822838458367923469813470449559538926557532872564366486011904), (3,30329305773251737328167823642119986151715617168096631389370269805432476417204947553895932410428713793259360390925911064576), (6,52149336811739215155198705264861701309353959284151287551226473290609773352312746763044364600979972402559774918569776644096), (21,79835850195860297345188801872912173003822218026260890253441889899720739671636672325886556038981208458545795132393665855488)] orbit.val
/-- Independent kernel check of every nonzero value and the complete exact total on axis 0. -/
theorem checked0 : sparseIntegerVectorCheck ((2:ℤ)^406) row0 (source 0) = true := by
  decide +kernel
/-- Prepared complete parent law on physical axis 1; omitted coordinates are zero. -/
def row1 (orbit : Fin 231) : ℤ := sparseIntegerLookup [(2,2949525158416148471170742493582137043865577210444281306777714844412958634853001582739521707636866115384667627850481795072), (3,30329814979968835091479427516680578797920978535180634563680237118295111155935253204941514728847928749481090768605825466368), (6,52148930282038638397908950769925452137475977188324393132800751528087444938832071397939569815573660591354650555343974694912), (21,79835721777138527777419706228004591977838637807120995817903495327805933079457510270676696357870365755677394054455557619712)] orbit.val
/-- Independent kernel check of every nonzero value and the complete exact total on axis 1. -/
theorem checked1 : sparseIntegerVectorCheck ((2:ℤ)^406) row1 (source 1) = true := by
  decide +kernel
/-- Prepared complete parent law on physical axis 2; omitted coordinates are zero. -/
def row2 (orbit : Fin 231) : ℤ := sparseIntegerLookup [(110,7222726088207436843291290720581377531044047596403326462298686964073008438929373710244445957155817363865600000), (164,84675349399792705256661892293843776924469425726963222741256973109710404733629386110711507674288022963080077352412119040), (174,779962261184056899918281925795633502356967452227116852781863949059303320815617791072805772903834564336545995956470939648), (185,2280338657961077256048863212992099034508886033489706982259476096921567907098645726980514696695896788409556271145943040), (194,40460632441217536787590735123142526798548808458739809583516753463503912888434405959144618854542828972634670053573263360), (201,2489010726359831964901067168587748938219734652056644213564027952145061533974644308890869966985516219165391234957569949696), (203,52616009226440325692757706369430677649194518210042311136367124671358155098490243009982989793019864754658158154625318912), (206,1233568505790970175961999218793027337616950202170725334877420721600846456532831886722157825512056747066880001109594734592), (207,1989733355275167124295676057328535998322807463552066698847719452771392902049268771208590320946500862203227035660122587136), (215,591871028712707298284490989889187618624176295795014738003933636321634872586997019308773477313435817680278355268809523200), (219,60865913922004148229945101140427645401885118834642984954978024580280488574562374812466077339936341531732643061831500300288), (221,7609365208118039898978079117572628055542315194952323981478277087782947421371783884011661119462932659104458671417378996224), (222,31077973371025838222838051503863306140102377267017133091315621352398418273744786814913912965909972747555362512201301622784), (225,58446561489358755551774813252092346593303420362696015857275506432437561725847805478456704816229439003617077858657468678144)] orbit.val
/-- Independent kernel check of every nonzero value and the complete exact total on axis 2. -/
theorem checked2 : sparseIntegerVectorCheck ((2:ℤ)^406) row2 (source 2) = true := by
  decide +kernel

/-- Complete original physical-axis and orbit lookup for this parent. -/
def value (axis : Fin 3) (orbit : Fin 231) : ℤ :=
  if axis = 0 then row0 orbit else if axis = 1 then row1 orbit else row2 orbit

/-- This complete original parent law is independently verified at all axes and orbit coordinates. -/
def table : RootFineParent4CacheTable 15 1 :=
  RootFineParent4CacheTable.single 15 value (by
    intro axis orbit
    have checked : value axis orbit = source axis orbit :=
      finThreeCases (predicate := fun selected => value selected orbit = source selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (source_nonnegative 0) (source_normalized 0) checked0 orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (source_nonnegative 1) (source_normalized 1) checked1 orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (source_nonnegative 2) (source_normalized 2) checked2 orbit)
        axis
    exact checked.trans (source_eq axis orbit))

end MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4Parent015
