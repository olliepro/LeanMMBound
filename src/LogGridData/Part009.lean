module

public import TabulatedLogBounds
public import FKLLog.GridTrace

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

namespace MatrixBounds.Numeric.LogGridData.Part009
set_option maxRecDepth 100000
set_option maxHeartbeats 16000000

namespace Point072
/-- Exact original rational input. -/
def input : ℚ := (41:ℚ)/32
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(149045648993584418799391:ℚ)/2^80,(149045648993584418799392:ℚ)/2^80⟩,
  ⟨(18375490971811777660198:ℚ)/2^80,(18375490971811777660200:ℚ)/2^80⟩,
  ⟨(2265471489675424643038:ℚ)/2^80,(2265471489675424643039:ℚ)/2^80⟩,
  ⟨(279304704206559202566:ℚ)/2^80,(279304704206559202567:ℚ)/2^80⟩,
  ⟨(34434826546014148261:ℚ)/2^80,(34434826546014148262:ℚ)/2^80⟩,
  ⟨(4245389574166127867:ℚ)/2^80,(4245389574166127868:ℚ)/2^80⟩,
  ⟨(523404194075276038:ℚ)/2^80,(523404194075276039:ℚ)/2^80⟩,
  ⟨(64529284201061429:ℚ)/2^80,(64529284201061430:ℚ)/2^80⟩,
  ⟨(7955665175473326:ℚ)/2^80,(7955665175473327:ℚ)/2^80⟩,
  ⟨(980835432592601:ℚ)/2^80,(980835432592602:ℚ)/2^80⟩,
  ⟨(120924916347032:ℚ)/2^80,(120924916347034:ℚ)/2^80⟩,
  ⟨(14908551330455:ℚ)/2^80,(14908551330457:ℚ)/2^80⟩,
  ⟨(1838040574987:ℚ)/2^80,(1838040574988:ℚ)/2^80⟩,
  ⟨(226607742121:ℚ)/2^80,(226607742122:ℚ)/2^80⟩,
  ⟨(27937940809:ℚ)/2^80,(27937940810:ℚ)/2^80⟩,
  ⟨(3444403661:ℚ)/2^80,(3444403662:ℚ)/2^80⟩,
  ⟨(424652506:ℚ)/2^80,(424652507:ℚ)/2^80⟩,
  ⟨(52354418:ℚ)/2^80,(52354419:ℚ)/2^80⟩,
  ⟨(6454654:ℚ)/2^80,(6454655:ℚ)/2^80⟩,
  ⟨(795779:ℚ)/2^80,(795780:ℚ)/2^80⟩,
  ⟨(98109:ℚ)/2^80,(98110:ℚ)/2^80⟩,
  ⟨(12095:ℚ)/2^80,(12096:ℚ)/2^80⟩,
  ⟨(1491:ℚ)/2^80,(1492:ℚ)/2^80⟩,
  ⟨(183:ℚ)/2^80,(184:ℚ)/2^80⟩,
  ⟨(22:ℚ)/2^80,(23:ℚ)/2^80⟩,
  ⟨(2:ℚ)/2^80,(3:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (41:ℚ)/32,
  ⟨⟨(149045648993584418799391:ℚ)/2^80,(149045648993584418799392:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(285735642984858961:ℚ)/2^60,(285735642984858962:ℚ)/2^60⟩
/-- Nat-only kernel evaluation of the whole certificate (`FKLLog.gridCheck2`). -/
theorem fast_checked : FKLLog.gridCheck2 input trace bounds = true := by decide +kernel
/-- Every rational identity and every rounded series multiplication is checked by Lean's kernel. -/
theorem trace_checked : trace.check input 40 = true := (FKLLog.gridCheck2_sound input trace bounds rfl fast_checked).1
/-- The reported endpoints enclose the entire exact certificate interval. -/
theorem bounds_checked : bounds.encloses (trace.bounds 40) = true := (FKLLog.gridCheck2_sound input trace bounds rfl fast_checked).2.1
/-- The reported interval contains the actual real natural logarithm. -/
theorem log_bounds : bounds.Contains (Real.log (input : ℝ)) :=
  Interval.encloses_sound bounds_checked (ScaledLogTrace.sound trace_checked)
/-- The complete enclosure has width at most one trillionth. -/
theorem tight : bounds.upper-bounds.lower ≤ (1:ℚ)/10^12 := (FKLLog.gridCheck2_sound input trace bounds rfl fast_checked).2.2
end Point072

namespace Point073
/-- Exact original rational input. -/
def input : ℚ := (329:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(150857409969005008125727:ℚ)/2^80,(150857409969005008125728:ℚ)/2^80⟩,
  ⟨(18824941756816009560988:ℚ)/2^80,(18824941756816009560989:ℚ)/2^80⟩,
  ⟨(2349095296149690081969:ℚ)/2^80,(2349095296149690081970:ℚ)/2^80⟩,
  ⟨(293134968579363035869:ℚ)/2^80,(293134968579363035870:ℚ)/2^80⟩,
  ⟨(36579235395373507040:ℚ)/2^80,(36579235395373507041:ℚ)/2^80⟩,
  ⟨(4564588348482506006:ℚ)/2^80,(4564588348482506007:ℚ)/2^80⟩,
  ⟨(569598204169611860:ℚ)/2^80,(569598204169611861:ℚ)/2^80⟩,
  ⟨(71078066503216522:ℚ)/2^80,(71078066503216523:ℚ)/2^80⟩,
  ⟨(8869570691854369:ℚ)/2^80,(8869570691854370:ℚ)/2^80⟩,
  ⟨(1106801129069006:ℚ)/2^80,(1106801129069007:ℚ)/2^80⟩,
  ⟨(138113645165875:ℚ)/2^80,(138113645165877:ℚ)/2^80⟩,
  ⟨(17234694183092:ℚ)/2^80,(17234694183093:ℚ)/2^80⟩,
  ⟨(2150654145924:ℚ)/2^80,(2150654145925:ℚ)/2^80⟩,
  ⟨(268372226756:ℚ)/2^80,(268372226757:ℚ)/2^80⟩,
  ⟨(33489183851:ℚ)/2^80,(33489183852:ℚ)/2^80⟩,
  ⟨(4178992172:ℚ)/2^80,(4178992173:ℚ)/2^80⟩,
  ⟨(521481074:ℚ)/2^80,(521481075:ℚ)/2^80⟩,
  ⟨(65073706:ℚ)/2^80,(65073707:ℚ)/2^80⟩,
  ⟨(8120308:ℚ)/2^80,(8120309:ℚ)/2^80⟩,
  ⟨(1013303:ℚ)/2^80,(1013304:ℚ)/2^80⟩,
  ⟨(126446:ℚ)/2^80,(126447:ℚ)/2^80⟩,
  ⟨(15778:ℚ)/2^80,(15779:ℚ)/2^80⟩,
  ⟨(1968:ℚ)/2^80,(1970:ℚ)/2^80⟩,
  ⟨(245:ℚ)/2^80,(246:ℚ)/2^80⟩,
  ⟨(30:ℚ)/2^80,(31:ℚ)/2^80⟩,
  ⟨(3:ℚ)/2^80,(4:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (329:ℚ)/256,
  ⟨⟨(150857409969005008125727:ℚ)/2^80,(150857409969005008125728:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(289245300199262001:ℚ)/2^60,(289245300199262002:ℚ)/2^60⟩
/-- Nat-only kernel evaluation of the whole certificate (`FKLLog.gridCheck2`). -/
theorem fast_checked : FKLLog.gridCheck2 input trace bounds = true := by decide +kernel
/-- Every rational identity and every rounded series multiplication is checked by Lean's kernel. -/
theorem trace_checked : trace.check input 40 = true := (FKLLog.gridCheck2_sound input trace bounds rfl fast_checked).1
/-- The reported endpoints enclose the entire exact certificate interval. -/
theorem bounds_checked : bounds.encloses (trace.bounds 40) = true := (FKLLog.gridCheck2_sound input trace bounds rfl fast_checked).2.1
/-- The reported interval contains the actual real natural logarithm. -/
theorem log_bounds : bounds.Contains (Real.log (input : ℝ)) :=
  Interval.encloses_sound bounds_checked (ScaledLogTrace.sound trace_checked)
/-- The complete enclosure has width at most one trillionth. -/
theorem tight : bounds.upper-bounds.lower ≤ (1:ℚ)/10^12 := (FKLLog.gridCheck2_sound input trace bounds rfl fast_checked).2.2
end Point073

namespace Point074
/-- Exact original rational input. -/
def input : ℚ := (165:ℚ)/128
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(152662987459867848000438:ℚ)/2^80,(152662987459867848000439:ℚ)/2^80⟩,
  ⟨(19278261215068636095618:ℚ)/2^80,(19278261215068636095619:ℚ)/2^80⟩,
  ⟨(2434456194394332885794:ℚ)/2^80,(2434456194394332885795:ℚ)/2^80⟩,
  ⟨(307422795879147838820:ℚ)/2^80,(307422795879147838821:ℚ)/2^80⟩,
  ⟨(38821308694636416506:ℚ)/2^80,(38821308694636416507:ℚ)/2^80⟩,
  ⟨(4902349562121322220:ℚ)/2^80,(4902349562121322222:ℚ)/2^80⟩,
  ⟨(619068033441941713:ℚ)/2^80,(619068033441941715:ℚ)/2^80⟩,
  ⟨(78175826748641103:ℚ)/2^80,(78175826748641104:ℚ)/2^80⟩,
  ⟨(9872032729350582:ℚ)/2^80,(9872032729350584:ℚ)/2^80⟩,
  ⟨(1246638945344612:ℚ)/2^80,(1246638945344613:ℚ)/2^80⟩,
  ⟨(157425395828500:ℚ)/2^80,(157425395828501:ℚ)/2^80⟩,
  ⟨(19879657493701:ℚ)/2^80,(19879657493702:ℚ)/2^80⟩,
  ⟨(2510400434358:ℚ)/2^80,(2510400434359:ℚ)/2^80⟩,
  ⟨(317013024133:ℚ)/2^80,(317013024135:ℚ)/2^80⟩,
  ⟨(40032361409:ℚ)/2^80,(40032361410:ℚ)/2^80⟩,
  ⟨(5055281133:ℚ)/2^80,(5055281134:ℚ)/2^80⟩,
  ⟨(638380211:ℚ)/2^80,(638380212:ℚ)/2^80⟩,
  ⟨(80614565:ℚ)/2^80,(80614567:ℚ)/2^80⟩,
  ⟨(10179996:ℚ)/2^80,(10179997:ℚ)/2^80⟩,
  ⟨(1285528:ℚ)/2^80,(1285529:ℚ)/2^80⟩,
  ⟨(162336:ℚ)/2^80,(162337:ℚ)/2^80⟩,
  ⟨(20499:ℚ)/2^80,(20500:ℚ)/2^80⟩,
  ⟨(2588:ℚ)/2^80,(2589:ℚ)/2^80⟩,
  ⟨(326:ℚ)/2^80,(327:ℚ)/2^80⟩,
  ⟨(41:ℚ)/2^80,(42:ℚ)/2^80⟩,
  ⟨(5:ℚ)/2^80,(6:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (165:ℚ)/128,
  ⟨⟨(152662987459867848000438:ℚ)/2^80,(152662987459867848000439:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(292744305933815862:ℚ)/2^60,(292744305933815863:ℚ)/2^60⟩
/-- Nat-only kernel evaluation of the whole certificate (`FKLLog.gridCheck2`). -/
theorem fast_checked : FKLLog.gridCheck2 input trace bounds = true := by decide +kernel
/-- Every rational identity and every rounded series multiplication is checked by Lean's kernel. -/
theorem trace_checked : trace.check input 40 = true := (FKLLog.gridCheck2_sound input trace bounds rfl fast_checked).1
/-- The reported endpoints enclose the entire exact certificate interval. -/
theorem bounds_checked : bounds.encloses (trace.bounds 40) = true := (FKLLog.gridCheck2_sound input trace bounds rfl fast_checked).2.1
/-- The reported interval contains the actual real natural logarithm. -/
theorem log_bounds : bounds.Contains (Real.log (input : ℝ)) :=
  Interval.encloses_sound bounds_checked (ScaledLogTrace.sound trace_checked)
/-- The complete enclosure has width at most one trillionth. -/
theorem tight : bounds.upper-bounds.lower ≤ (1:ℚ)/10^12 := (FKLLog.gridCheck2_sound input trace bounds rfl fast_checked).2.2
end Point074

namespace Point075
/-- Exact original rational input. -/
def input : ℚ := (331:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(154462413068308667977790:ℚ)/2^80,(154462413068308667977791:ℚ)/2^80⟩,
  ⟨(19735402010431260814879:ℚ)/2^80,(19735402010431260814880:ℚ)/2^80⟩,
  ⟨(2521559030293602318766:ℚ)/2^80,(2521559030293602318767:ℚ)/2^80⟩,
  ⟨(322175344586065032210:ℚ)/2^80,(322175344586065032211:ℚ)/2^80⟩,
  ⟨(41163800415596043297:ℚ)/2^80,(41163800415596043298:ℚ)/2^80⟩,
  ⟨(5259429354633225293:ℚ)/2^80,(5259429354633225294:ℚ)/2^80⟩,
  ⟨(671988418394364390:ℚ)/2^80,(671988418394364391:ℚ)/2^80⟩,
  ⟨(85858826881733099:ℚ)/2^80,(85858826881733100:ℚ)/2^80⟩,
  ⟨(10970037506183956:ℚ)/2^80,(10970037506183957:ℚ)/2^80⟩,
  ⟨(1401623190739006:ℚ)/2^80,(1401623190739007:ℚ)/2^80⟩,
  ⟨(179083031184711:ℚ)/2^80,(179083031184712:ℚ)/2^80⟩,
  ⟨(22881136863463:ℚ)/2^80,(22881136863465:ℚ)/2^80⟩,
  ⟨(2923484267052:ℚ)/2^80,(2923484267053:ℚ)/2^80⟩,
  ⟨(373528654222:ℚ)/2^80,(373528654224:ℚ)/2^80⟩,
  ⟨(47725126178:ℚ)/2^80,(47725126179:ℚ)/2^80⟩,
  ⟨(6097758881:ℚ)/2^80,(6097758882:ℚ)/2^80⟩,
  ⟨(779100368:ℚ)/2^80,(779100369:ℚ)/2^80⟩,
  ⟨(99544340:ℚ)/2^80,(99544341:ℚ)/2^80⟩,
  ⟨(12718612:ℚ)/2^80,(12718613:ℚ)/2^80⟩,
  ⟨(1625035:ℚ)/2^80,(1625036:ℚ)/2^80⟩,
  ⟨(207627:ℚ)/2^80,(207629:ℚ)/2^80⟩,
  ⟨(26528:ℚ)/2^80,(26529:ℚ)/2^80⟩,
  ⟨(3389:ℚ)/2^80,(3390:ℚ)/2^80⟩,
  ⟨(433:ℚ)/2^80,(434:ℚ)/2^80⟩,
  ⟨(55:ℚ)/2^80,(56:ℚ)/2^80⟩,
  ⟨(7:ℚ)/2^80,(8:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(2:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (331:ℚ)/256,
  ⟨⟨(154462413068308667977790:ℚ)/2^80,(154462413068308667977791:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(296232724645430087:ℚ)/2^60,(296232724645430088:ℚ)/2^60⟩
/-- Nat-only kernel evaluation of the whole certificate (`FKLLog.gridCheck2`). -/
theorem fast_checked : FKLLog.gridCheck2 input trace bounds = true := by decide +kernel
/-- Every rational identity and every rounded series multiplication is checked by Lean's kernel. -/
theorem trace_checked : trace.check input 40 = true := (FKLLog.gridCheck2_sound input trace bounds rfl fast_checked).1
/-- The reported endpoints enclose the entire exact certificate interval. -/
theorem bounds_checked : bounds.encloses (trace.bounds 40) = true := (FKLLog.gridCheck2_sound input trace bounds rfl fast_checked).2.1
/-- The reported interval contains the actual real natural logarithm. -/
theorem log_bounds : bounds.Contains (Real.log (input : ℝ)) :=
  Interval.encloses_sound bounds_checked (ScaledLogTrace.sound trace_checked)
/-- The complete enclosure has width at most one trillionth. -/
theorem tight : bounds.upper-bounds.lower ≤ (1:ℚ)/10^12 := (FKLLog.gridCheck2_sound input trace bounds rfl fast_checked).2.2
end Point075

namespace Point076
/-- Exact original rational input. -/
def input : ℚ := (83:ℚ)/64
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(156255718181482682445015:ℚ)/2^80,(156255718181482682445016:ℚ)/2^80⟩,
  ⟨(20196317315973952152756:ℚ)/2^80,(20196317315973952152758:ℚ)/2^80⟩,
  ⟨(2610408360568061842873:ℚ)/2^80,(2610408360568061842874:ℚ)/2^80⟩,
  ⟨(337399720073422959282:ℚ)/2^80,(337399720073422959284:ℚ)/2^80⟩,
  ⟨(43609487628537661403:ℚ)/2^80,(43609487628537661405:ℚ)/2^80⟩,
  ⟨(5636600441783779365:ℚ)/2^80,(5636600441783779366:ℚ)/2^80⟩,
  ⟨(728540193155726584:ℚ)/2^80,(728540193155726585:ℚ)/2^80⟩,
  ⟨(94165058979311599:ℚ)/2^80,(94165058979311600:ℚ)/2^80⟩,
  ⟨(12170994017734152:ℚ)/2^80,(12170994017734153:ℚ)/2^80⟩,
  ⟨(1573121675761557:ℚ)/2^80,(1573121675761558:ℚ)/2^80⟩,
  ⟨(203328651969180:ℚ)/2^80,(203328651969181:ℚ)/2^80⟩,
  ⟨(26280574064043:ℚ)/2^80,(26280574064044:ℚ)/2^80⟩,
  ⟨(3396808892631:ℚ)/2^80,(3396808892632:ℚ)/2^80⟩,
  ⟨(439043326258:ℚ)/2^80,(439043326259:ℚ)/2^80⟩,
  ⟨(56747096591:ℚ)/2^80,(56747096592:ℚ)/2^80⟩,
  ⟨(7334658743:ℚ)/2^80,(7334658744:ℚ)/2^80⟩,
  ⟨(948017116:ℚ)/2^80,(948017117:ℚ)/2^80⟩,
  ⟨(122532824:ℚ)/2^80,(122532825:ℚ)/2^80⟩,
  ⟨(15837575:ℚ)/2^80,(15837577:ℚ)/2^80⟩,
  ⟨(2047033:ℚ)/2^80,(2047034:ℚ)/2^80⟩,
  ⟨(264582:ℚ)/2^80,(264583:ℚ)/2^80⟩,
  ⟨(34197:ℚ)/2^80,(34198:ℚ)/2^80⟩,
  ⟨(4420:ℚ)/2^80,(4421:ℚ)/2^80⟩,
  ⟨(571:ℚ)/2^80,(572:ℚ)/2^80⟩,
  ⟨(73:ℚ)/2^80,(74:ℚ)/2^80⟩,
  ⟨(9:ℚ)/2^80,(10:ℚ)/2^80⟩,
  ⟨(1:ℚ)/2^80,(2:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (83:ℚ)/64,
  ⟨⟨(156255718181482682445015:ℚ)/2^80,(156255718181482682445016:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(299710620207691991:ℚ)/2^60,(299710620207691992:ℚ)/2^60⟩
/-- Nat-only kernel evaluation of the whole certificate (`FKLLog.gridCheck2`). -/
theorem fast_checked : FKLLog.gridCheck2 input trace bounds = true := by decide +kernel
/-- Every rational identity and every rounded series multiplication is checked by Lean's kernel. -/
theorem trace_checked : trace.check input 40 = true := (FKLLog.gridCheck2_sound input trace bounds rfl fast_checked).1
/-- The reported endpoints enclose the entire exact certificate interval. -/
theorem bounds_checked : bounds.encloses (trace.bounds 40) = true := (FKLLog.gridCheck2_sound input trace bounds rfl fast_checked).2.1
/-- The reported interval contains the actual real natural logarithm. -/
theorem log_bounds : bounds.Contains (Real.log (input : ℝ)) :=
  Interval.encloses_sound bounds_checked (ScaledLogTrace.sound trace_checked)
/-- The complete enclosure has width at most one trillionth. -/
theorem tight : bounds.upper-bounds.lower ≤ (1:ℚ)/10^12 := (FKLLog.gridCheck2_sound input trace bounds rfl fast_checked).2.2
end Point076

namespace Point077
/-- Exact original rational input. -/
def input : ℚ := (333:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(158042933973389552550722:ℚ)/2^80,(158042933973389552550723:ℚ)/2^80⟩,
  ⟨(20660960808066206360620:ℚ)/2^80,(20660960808066206360621:ℚ)/2^80⟩,
  ⟨(2701008458779453123544:ℚ)/2^80,(2701008458779453123545:ℚ)/2^80⟩,
  ⟨(353102973388824941448:ℚ)/2^80,(353102973388824941449:ℚ)/2^80⟩,
  ⟨(46161169695992394722:ℚ)/2^80,(46161169695992394723:ℚ)/2^80⟩,
  ⟨(6034652065520228172:ℚ)/2^80,(6034652065520228173:ℚ)/2^80⟩,
  ⟨(788910371893136789:ℚ)/2^80,(788910371893136791:ℚ)/2^80⟩,
  ⟨(103134293099781889:ℚ)/2^80,(103134293099781890:ℚ)/2^80⟩,
  ⟨(13482751389954508:ℚ)/2^80,(13482751389954509:ℚ)/2^80⟩,
  ⟨(1762600775936327:ℚ)/2^80,(1762600775936329:ℚ)/2^80⟩,
  ⟨(230424889214086:ℚ)/2^80,(230424889214088:ℚ)/2^80⟩,
  ⟨(30123457503369:ℚ)/2^80,(30123457503370:ℚ)/2^80⟩,
  ⟨(3938041133717:ℚ)/2^80,(3938041133718:ℚ)/2^80⟩,
  ⟨(514820317990:ℚ)/2^80,(514820317991:ℚ)/2^80⟩,
  ⟨(67302486392:ℚ)/2^80,(67302486393:ℚ)/2^80⟩,
  ⟨(8798457473:ℚ)/2^80,(8798457475:ℚ)/2^80⟩,
  ⟨(1150222793:ℚ)/2^80,(1150222794:ℚ)/2^80⟩,
  ⟨(150368684:ℚ)/2^80,(150368685:ℚ)/2^80⟩,
  ⟨(19657705:ℚ)/2^80,(19657706:ℚ)/2^80⟩,
  ⟨(2569852:ℚ)/2^80,(2569853:ℚ)/2^80⟩,
  ⟨(335956:ℚ)/2^80,(335958:ℚ)/2^80⟩,
  ⟨(43919:ℚ)/2^80,(43920:ℚ)/2^80⟩,
  ⟨(5741:ℚ)/2^80,(5742:ℚ)/2^80⟩,
  ⟨(750:ℚ)/2^80,(751:ℚ)/2^80⟩,
  ⟨(98:ℚ)/2^80,(99:ℚ)/2^80⟩,
  ⟨(12:ℚ)/2^80,(13:ℚ)/2^80⟩,
  ⟨(1:ℚ)/2^80,(2:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (333:ℚ)/256,
  ⟨⟨(158042933973389552550722:ℚ)/2^80,(158042933973389552550723:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(303178055917884104:ℚ)/2^60,(303178055917884105:ℚ)/2^60⟩
/-- Nat-only kernel evaluation of the whole certificate (`FKLLog.gridCheck2`). -/
theorem fast_checked : FKLLog.gridCheck2 input trace bounds = true := by decide +kernel
/-- Every rational identity and every rounded series multiplication is checked by Lean's kernel. -/
theorem trace_checked : trace.check input 40 = true := (FKLLog.gridCheck2_sound input trace bounds rfl fast_checked).1
/-- The reported endpoints enclose the entire exact certificate interval. -/
theorem bounds_checked : bounds.encloses (trace.bounds 40) = true := (FKLLog.gridCheck2_sound input trace bounds rfl fast_checked).2.1
/-- The reported interval contains the actual real natural logarithm. -/
theorem log_bounds : bounds.Contains (Real.log (input : ℝ)) :=
  Interval.encloses_sound bounds_checked (ScaledLogTrace.sound trace_checked)
/-- The complete enclosure has width at most one trillionth. -/
theorem tight : bounds.upper-bounds.lower ≤ (1:ℚ)/10^12 := (FKLLog.gridCheck2_sound input trace bounds rfl fast_checked).2.2
end Point077

namespace Point078
/-- Exact original rational input. -/
def input : ℚ := (167:ℚ)/128
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(159824091406679789198443:ℚ)/2^80,(159824091406679789198444:ℚ)/2^80⟩,
  ⟨(21129286660544107724539:ℚ)/2^80,(21129286660544107724541:ℚ)/2^80⟩,
  ⟨(2793363321224475258498:ℚ)/2^80,(2793363321224475258499:ℚ)/2^80⟩,
  ⟨(369292100094083169767:ℚ)/2^80,(369292100094083169768:ℚ)/2^80⟩,
  ⟨(48821667470065232613:ℚ)/2^80,(48821667470065232614:ℚ)/2^80⟩,
  ⟨(6454389936720488379:ℚ)/2^80,(6454389936720488380:ℚ)/2^80⟩,
  ⟨(853292228922369650:ℚ)/2^80,(853292228922369651:ℚ)/2^80⟩,
  ⟨(112808125179567513:ℚ)/2^80,(112808125179567514:ℚ)/2^80⟩,
  ⟨(14913616549163162:ℚ)/2^80,(14913616549163163:ℚ)/2^80⟩,
  ⟨(1971630662431740:ℚ)/2^80,(1971630662431741:ℚ)/2^80⟩,
  ⟨(260656257067246:ℚ)/2^80,(260656257067248:ℚ)/2^80⟩,
  ⟨(34459640764822:ℚ)/2^80,(34459640764823:ℚ)/2^80⟩,
  ⟨(4555681321451:ℚ)/2^80,(4555681321452:ℚ)/2^80⟩,
  ⟨(602276513683:ℚ)/2^80,(602276513684:ℚ)/2^80⟩,
  ⟨(79622996724:ℚ)/2^80,(79622996725:ℚ)/2^80⟩,
  ⟨(10526430075:ℚ)/2^80,(10526430076:ℚ)/2^80⟩,
  ⟨(1391629738:ℚ)/2^80,(1391629739:ℚ)/2^80⟩,
  ⟨(183978168:ℚ)/2^80,(183978169:ℚ)/2^80⟩,
  ⟨(24322537:ℚ)/2^80,(24322538:ℚ)/2^80⟩,
  ⟨(3215521:ℚ)/2^80,(3215522:ℚ)/2^80⟩,
  ⟨(425102:ℚ)/2^80,(425103:ℚ)/2^80⟩,
  ⟨(56199:ℚ)/2^80,(56201:ℚ)/2^80⟩,
  ⟨(7429:ℚ)/2^80,(7430:ℚ)/2^80⟩,
  ⟨(982:ℚ)/2^80,(983:ℚ)/2^80⟩,
  ⟨(129:ℚ)/2^80,(130:ℚ)/2^80⟩,
  ⟨(17:ℚ)/2^80,(18:ℚ)/2^80⟩,
  ⟨(2:ℚ)/2^80,(3:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (167:ℚ)/128,
  ⟨⟨(159824091406679789198443:ℚ)/2^80,(159824091406679789198444:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(306635094503896390:ℚ)/2^60,(306635094503896391:ℚ)/2^60⟩
/-- Nat-only kernel evaluation of the whole certificate (`FKLLog.gridCheck2`). -/
theorem fast_checked : FKLLog.gridCheck2 input trace bounds = true := by decide +kernel
/-- Every rational identity and every rounded series multiplication is checked by Lean's kernel. -/
theorem trace_checked : trace.check input 40 = true := (FKLLog.gridCheck2_sound input trace bounds rfl fast_checked).1
/-- The reported endpoints enclose the entire exact certificate interval. -/
theorem bounds_checked : bounds.encloses (trace.bounds 40) = true := (FKLLog.gridCheck2_sound input trace bounds rfl fast_checked).2.1
/-- The reported interval contains the actual real natural logarithm. -/
theorem log_bounds : bounds.Contains (Real.log (input : ℝ)) :=
  Interval.encloses_sound bounds_checked (ScaledLogTrace.sound trace_checked)
/-- The complete enclosure has width at most one trillionth. -/
theorem tight : bounds.upper-bounds.lower ≤ (1:ℚ)/10^12 := (FKLLog.gridCheck2_sound input trace bounds rfl fast_checked).2.2
end Point078

namespace Point079
/-- Exact original rational input. -/
def input : ℚ := (335:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(161599221234442816923498:ℚ)/2^80,(161599221234442816923499:ℚ)/2^80⟩,
  ⟨(21601249538952593125137:ℚ)/2^80,(21601249538952593125138:ℚ)/2^80⟩,
  ⟨(2887476672719551365289:ℚ)/2^80,(2887476672719551365290:ℚ)/2^80⟩,
  ⟨(385974039162173532754:ℚ)/2^80,(385974039162173532755:ℚ)/2^80⟩,
  ⟨(51593822493759237034:ℚ)/2^80,(51593822493759237035:ℚ)/2^80⟩,
  ⟨(6896636170908595136:ℚ)/2^80,(6896636170908595137:ℚ)/2^80⟩,
  ⟨(921885376483551634:ℚ)/2^80,(921885376483551635:ℚ)/2^80⟩,
  ⟨(123230024944501825:ℚ)/2^80,(123230024944501826:ℚ)/2^80⟩,
  ⟨(16472372200703289:ℚ)/2^80,(16472372200703290:ℚ)/2^80⟩,
  ⟨(2201890700263214:ℚ)/2^80,(2201890700263215:ℚ)/2^80⟩,
  ⟨(294330567378669:ℚ)/2^80,(294330567378671:ℚ)/2^80⟩,
  ⟨(39343679903409:ℚ)/2^80,(39343679903410:ℚ)/2^80⟩,
  ⟨(5259138261200:ℚ)/2^80,(5259138261201:ℚ)/2^80⟩,
  ⟨(702998177047:ℚ)/2^80,(702998177048:ℚ)/2^80⟩,
  ⟨(93970991517:ℚ)/2^80,(93970991518:ℚ)/2^80⟩,
  ⟨(12561266209:ℚ)/2^80,(12561266210:ℚ)/2^80⟩,
  ⟨(1679086346:ℚ)/2^80,(1679086347:ℚ)/2^80⟩,
  ⟨(224446398:ℚ)/2^80,(224446399:ℚ)/2^80⟩,
  ⟨(30002141:ℚ)/2^80,(30002142:ℚ)/2^80⟩,
  ⟨(4010438:ℚ)/2^80,(4010439:ℚ)/2^80⟩,
  ⟨(536082:ℚ)/2^80,(536083:ℚ)/2^80⟩,
  ⟨(71659:ℚ)/2^80,(71660:ℚ)/2^80⟩,
  ⟨(9578:ℚ)/2^80,(9579:ℚ)/2^80⟩,
  ⟨(1280:ℚ)/2^80,(1281:ℚ)/2^80⟩,
  ⟨(171:ℚ)/2^80,(172:ℚ)/2^80⟩,
  ⟨(22:ℚ)/2^80,(23:ℚ)/2^80⟩,
  ⟨(2:ℚ)/2^80,(4:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (335:ℚ)/256,
  ⟨⟨(161599221234442816923498:ℚ)/2^80,(161599221234442816923499:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(310081798131035159:ℚ)/2^60,(310081798131035160:ℚ)/2^60⟩
/-- Nat-only kernel evaluation of the whole certificate (`FKLLog.gridCheck2`). -/
theorem fast_checked : FKLLog.gridCheck2 input trace bounds = true := by decide +kernel
/-- Every rational identity and every rounded series multiplication is checked by Lean's kernel. -/
theorem trace_checked : trace.check input 40 = true := (FKLLog.gridCheck2_sound input trace bounds rfl fast_checked).1
/-- The reported endpoints enclose the entire exact certificate interval. -/
theorem bounds_checked : bounds.encloses (trace.bounds 40) = true := (FKLLog.gridCheck2_sound input trace bounds rfl fast_checked).2.1
/-- The reported interval contains the actual real natural logarithm. -/
theorem log_bounds : bounds.Contains (Real.log (input : ℝ)) :=
  Interval.encloses_sound bounds_checked (ScaledLogTrace.sound trace_checked)
/-- The complete enclosure has width at most one trillionth. -/
theorem tight : bounds.upper-bounds.lower ≤ (1:ℚ)/10^12 := (FKLLog.gridCheck2_sound input trace bounds rfl fast_checked).2.2
end Point079

/-- Reusable proved logarithm bounds for these consecutive exact grid inputs. -/
def entries : Array CertifiedLogBound := #[⟨Point072.input, Point072.bounds, Point072.log_bounds⟩,
  ⟨Point073.input, Point073.bounds, Point073.log_bounds⟩,
  ⟨Point074.input, Point074.bounds, Point074.log_bounds⟩,
  ⟨Point075.input, Point075.bounds, Point075.log_bounds⟩,
  ⟨Point076.input, Point076.bounds, Point076.log_bounds⟩,
  ⟨Point077.input, Point077.bounds, Point077.log_bounds⟩,
  ⟨Point078.input, Point078.bounds, Point078.log_bounds⟩,
  ⟨Point079.input, Point079.bounds, Point079.log_bounds⟩]
end MatrixBounds.Numeric.LogGridData.Part009
