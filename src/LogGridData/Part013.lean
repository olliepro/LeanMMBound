module

public import TabulatedLogBounds
public import FKLLog.GridTrace

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

namespace MatrixBounds.Numeric.LogGridData.Part013
set_option maxRecDepth 100000
set_option maxHeartbeats 16000000

namespace Point104
/-- Exact original rational input. -/
def input : ℚ := (45:ℚ)/32
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(204104359155716613911432:ℚ)/2^80,(204104359155716613911433:ℚ)/2^80⟩,
  ⟨(34459177519796311439592:ℚ)/2^80,(34459177519796311439593:ℚ)/2^80⟩,
  ⟨(5817783217627948684606:ℚ)/2^80,(5817783217627948684607:ℚ)/2^80⟩,
  ⟨(982223140638484842855:ℚ)/2^80,(982223140638484842856:ℚ)/2^80⟩,
  ⟨(165829880887016921520:ℚ)/2^80,(165829880887016921522:ℚ)/2^80⟩,
  ⟨(27997252617288571165:ℚ)/2^80,(27997252617288571167:ℚ)/2^80⟩,
  ⟨(4726808883438330196:ℚ)/2^80,(4726808883438330198:ℚ)/2^80⟩,
  ⟨(798032668632445357:ℚ)/2^80,(798032668632445359:ℚ)/2^80⟩,
  ⟨(134732788210672592:ℚ)/2^80,(134732788210672594:ℚ)/2^80⟩,
  ⟨(22747094113490177:ℚ)/2^80,(22747094113490179:ℚ)/2^80⟩,
  ⟨(3840418486693146:ℚ)/2^80,(3840418486693148:ℚ)/2^80⟩,
  ⟨(648382341909232:ℚ)/2^80,(648382341909233:ℚ)/2^80⟩,
  ⟨(109467148634026:ℚ)/2^80,(109467148634027:ℚ)/2^80⟩,
  ⟨(18481466652497:ℚ)/2^80,(18481466652499:ℚ)/2^80⟩,
  ⟨(3120247616655:ℚ)/2^80,(3120247616656:ℚ)/2^80⟩,
  ⟨(526795052162:ℚ)/2^80,(526795052163:ℚ)/2^80⟩,
  ⟨(88939424390:ℚ)/2^80,(88939424392:ℚ)/2^80⟩,
  ⟨(15015746974:ℚ)/2^80,(15015746976:ℚ)/2^80⟩,
  ⟨(2535126112:ℚ)/2^80,(2535126113:ℚ)/2^80⟩,
  ⟨(428008304:ℚ)/2^80,(428008305:ℚ)/2^80⟩,
  ⟨(72261142:ℚ)/2^80,(72261143:ℚ)/2^80⟩,
  ⟨(12199933:ℚ)/2^80,(12199934:ℚ)/2^80⟩,
  ⟨(2059728:ℚ)/2^80,(2059730:ℚ)/2^80⟩,
  ⟨(347746:ℚ)/2^80,(347747:ℚ)/2^80⟩,
  ⟨(58710:ℚ)/2^80,(58711:ℚ)/2^80⟩,
  ⟨(9912:ℚ)/2^80,(9913:ℚ)/2^80⟩,
  ⟨(1673:ℚ)/2^80,(1674:ℚ)/2^80⟩,
  ⟨(282:ℚ)/2^80,(283:ℚ)/2^80⟩,
  ⟨(47:ℚ)/2^80,(48:ℚ)/2^80⟩,
  ⟨(7:ℚ)/2^80,(9:ℚ)/2^80⟩,
  ⟨(1:ℚ)/2^80,(2:ℚ)/2^80⟩,
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
def trace : ScaledLogTrace := ⟨0, (45:ℚ)/32,
  ⟨⟨(204104359155716613911432:ℚ)/2^80,(204104359155716613911433:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(393061593610613396:ℚ)/2^60,(393061593610613397:ℚ)/2^60⟩
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
end Point104

namespace Point105
/-- Exact original rational input. -/
def input : ℚ := (361:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(205732919059215661821958:ℚ)/2^80,(205732919059215661821959:ℚ)/2^80⟩,
  ⟨(35011274718343021865973:ℚ)/2^80,(35011274718343021865974:ℚ)/2^80⟩,
  ⟨(5958158582538115552556:ℚ)/2^80,(5958158582538115552557:ℚ)/2^80⟩,
  ⟨(1013949191517831658052:ℚ)/2^80,(1013949191517831658053:ℚ)/2^80⟩,
  ⟨(172552131457653685730:ℚ)/2^80,(172552131457653685731:ℚ)/2^80⟩,
  ⟨(29364625288579638576:ℚ)/2^80,(29364625288579638577:ℚ)/2^80⟩,
  ⟨(4997221483469792626:ℚ)/2^80,(4997221483469792627:ℚ)/2^80⟩,
  ⟨(850418566878976054:ℚ)/2^80,(850418566878976055:ℚ)/2^80⟩,
  ⟨(144722770700636119:ℚ)/2^80,(144722770700636120:ℚ)/2^80⟩,
  ⟨(24628672485521543:ℚ)/2^80,(24628672485521544:ℚ)/2^80⟩,
  ⟨(4191265171766226:ℚ)/2^80,(4191265171766228:ℚ)/2^80⟩,
  ⟨(713262306378369:ℚ)/2^80,(713262306378370:ℚ)/2^80⟩,
  ⟨(121381753921764:ℚ)/2^80,(121381753921765:ℚ)/2^80⟩,
  ⟨(20656538349732:ℚ)/2^80,(20656538349734:ℚ)/2^80⟩,
  ⟨(3515294208625:ℚ)/2^80,(3515294208626:ℚ)/2^80⟩,
  ⟨(598226729182:ℚ)/2^80,(598226729183:ℚ)/2^80⟩,
  ⟨(101805197024:ℚ)/2^80,(101805197025:ℚ)/2^80⟩,
  ⟨(17325033529:ℚ)/2^80,(17325033530:ℚ)/2^80⟩,
  ⟨(2948344441:ℚ)/2^80,(2948344442:ℚ)/2^80⟩,
  ⟨(501744191:ℚ)/2^80,(501744192:ℚ)/2^80⟩,
  ⟨(85385964:ℚ)/2^80,(85385965:ℚ)/2^80⟩,
  ⟨(14530836:ℚ)/2^80,(14530837:ℚ)/2^80⟩,
  ⟨(2472832:ℚ)/2^80,(2472833:ℚ)/2^80⟩,
  ⟨(420822:ℚ)/2^80,(420823:ℚ)/2^80⟩,
  ⟨(71614:ℚ)/2^80,(71615:ℚ)/2^80⟩,
  ⟨(12187:ℚ)/2^80,(12188:ℚ)/2^80⟩,
  ⟨(2073:ℚ)/2^80,(2075:ℚ)/2^80⟩,
  ⟨(352:ℚ)/2^80,(354:ℚ)/2^80⟩,
  ⟨(59:ℚ)/2^80,(61:ℚ)/2^80⟩,
  ⟨(10:ℚ)/2^80,(11:ℚ)/2^80⟩,
  ⟨(1:ℚ)/2^80,(2:ℚ)/2^80⟩,
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
def trace : ScaledLogTrace := ⟨0, (361:ℚ)/256,
  ⟨⟨(205732919059215661821958:ℚ)/2^80,(205732919059215661821959:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(396259713565914354:ℚ)/2^60,(396259713565914355:ℚ)/2^60⟩
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
end Point105

namespace Point106
/-- Exact original rational input. -/
def input : ℚ := (181:ℚ)/128
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(207356208542315036438276:ℚ)/2^80,(207356208542315036438277:ℚ)/2^80⟩,
  ⟨(35565951626999019194914:ℚ)/2^80,(35565951626999019194915:ℚ)/2^80⟩,
  ⟨(6100308855116336625664:ℚ)/2^80,(6100308855116336625666:ℚ)/2^80⟩,
  ⟨(1046331292301507576570:ℚ)/2^80,(1046331292301507576571:ℚ)/2^80⟩,
  ⟨(179467826834886412809:ℚ)/2^80,(179467826834886412810:ℚ)/2^80⟩,
  ⟨(30782507515368866921:ℚ)/2^80,(30782507515368866923:ℚ)/2^80⟩,
  ⟨(5279847567361003064:ℚ)/2^80,(5279847567361003065:ℚ)/2^80⟩,
  ⟨(905604922557065250:ℚ)/2^80,(905604922557065251:ℚ)/2^80⟩,
  ⟨(155330294160273327:ℚ)/2^80,(155330294160273328:ℚ)/2^80⟩,
  ⟨(26642412914221638:ℚ)/2^80,(26642412914221639:ℚ)/2^80⟩,
  ⟨(4569734253895620:ℚ)/2^80,(4569734253895621:ℚ)/2^80⟩,
  ⟨(783805551639054:ℚ)/2^80,(783805551639055:ℚ)/2^80⟩,
  ⟨(134439139925145:ℚ)/2^80,(134439139925146:ℚ)/2^80⟩,
  ⟨(23059140504960:ℚ)/2^80,(23059140504961:ℚ)/2^80⟩,
  ⟨(3955127659426:ℚ)/2^80,(3955127659427:ℚ)/2^80⟩,
  ⟨(678387592069:ℚ)/2^80,(678387592071:ℚ)/2^80⟩,
  ⟨(116357742328:ℚ)/2^80,(116357742330:ℚ)/2^80⟩,
  ⟨(19957800464:ℚ)/2^80,(19957800465:ℚ)/2^80⟩,
  ⟨(3423182603:ℚ)/2^80,(3423182605:ℚ)/2^80⟩,
  ⟨(587147825:ℚ)/2^80,(587147826:ℚ)/2^80⟩,
  ⟨(100708202:ℚ)/2^80,(100708204:ℚ)/2^80⟩,
  ⟨(17273575:ℚ)/2^80,(17273576:ℚ)/2^80⟩,
  ⟨(2962781:ℚ)/2^80,(2962782:ℚ)/2^80⟩,
  ⟨(508179:ℚ)/2^80,(508180:ℚ)/2^80⟩,
  ⟨(87163:ℚ)/2^80,(87164:ℚ)/2^80⟩,
  ⟨(14950:ℚ)/2^80,(14951:ℚ)/2^80⟩,
  ⟨(2564:ℚ)/2^80,(2565:ℚ)/2^80⟩,
  ⟨(439:ℚ)/2^80,(440:ℚ)/2^80⟩,
  ⟨(75:ℚ)/2^80,(76:ℚ)/2^80⟩,
  ⟨(12:ℚ)/2^80,(14:ℚ)/2^80⟩,
  ⟨(2:ℚ)/2^80,(3:ℚ)/2^80⟩,
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
def trace : ScaledLogTrace := ⟨0, (181:ℚ)/128,
  ⟨⟨(207356208542315036438276:ℚ)/2^80,(207356208542315036438277:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(399448986705061195:ℚ)/2^60,(399448986705061196:ℚ)/2^60⟩
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
end Point106

namespace Point107
/-- Exact original rational input. -/
def input : ℚ := (363:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(208974253148247692558256:ℚ)/2^80,(208974253148247692558257:ℚ)/2^80⟩,
  ⟨(36123174615286757841249:ℚ)/2^80,(36123174615286757841250:ℚ)/2^80⟩,
  ⟨(6244232122513219853010:ℚ)/2^80,(6244232122513219853011:ℚ)/2^80⟩,
  ⟨(1079374534909393415625:ℚ)/2^80,(1079374534909393415626:ℚ)/2^80⟩,
  ⟨(186580089233126163928:ℚ)/2^80,(186580089233126163929:ℚ)/2^80⟩,
  ⟨(32252131741428916866:ℚ)/2^80,(32252131741428916867:ℚ)/2^80⟩,
  ⟨(5575085777597567212:ℚ)/2^80,(5575085777597567213:ℚ)/2^80⟩,
  ⟨(963706265271308064:ℚ)/2^80,(963706265271308065:ℚ)/2^80⟩,
  ⟨(166585735676946628:ℚ)/2^80,(166585735676946629:ℚ)/2^80⟩,
  ⟨(28795918768066703:ℚ)/2^80,(28795918768066704:ℚ)/2^80⟩,
  ⟨(4977646701426716:ℚ)/2^80,(4977646701426717:ℚ)/2^80⟩,
  ⟨(860433274721580:ℚ)/2^80,(860433274721582:ℚ)/2^80⟩,
  ⟨(148734023255588:ℚ)/2^80,(148734023255589:ℚ)/2^80⟩,
  ⟨(25710081564374:ℚ)/2^80,(25710081564375:ℚ)/2^80⟩,
  ⟨(4444230577363:ℚ)/2^80,(4444230577364:ℚ)/2^80⟩,
  ⟨(768227256507:ℚ)/2^80,(768227256508:ℚ)/2^80⟩,
  ⟨(132795341593:ℚ)/2^80,(132795341594:ℚ)/2^80⟩,
  ⟨(22954929806:ℚ)/2^80,(22954929808:ℚ)/2^80⟩,
  ⟨(3967976557:ℚ)/2^80,(3967976559:ℚ)/2^80⟩,
  ⟨(685902248:ℚ)/2^80,(685902249:ℚ)/2^80⟩,
  ⟨(118564685:ℚ)/2^80,(118564687:ℚ)/2^80⟩,
  ⟨(20495026:ℚ)/2^80,(20495027:ℚ)/2^80⟩,
  ⟨(3542758:ℚ)/2^80,(3542760:ℚ)/2^80⟩,
  ⟨(612399:ℚ)/2^80,(612400:ℚ)/2^80⟩,
  ⟨(105858:ℚ)/2^80,(105860:ℚ)/2^80⟩,
  ⟨(18298:ℚ)/2^80,(18299:ℚ)/2^80⟩,
  ⟨(3162:ℚ)/2^80,(3164:ℚ)/2^80⟩,
  ⟨(546:ℚ)/2^80,(547:ℚ)/2^80⟩,
  ⟨(94:ℚ)/2^80,(95:ℚ)/2^80⟩,
  ⟨(16:ℚ)/2^80,(17:ℚ)/2^80⟩,
  ⟨(2:ℚ)/2^80,(3:ℚ)/2^80⟩,
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
def trace : ScaledLogTrace := ⟨0, (363:ℚ)/256,
  ⟨⟨(208974253148247692558256:ℚ)/2^80,(208974253148247692558257:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(402629461838167200:ℚ)/2^60,(402629461838167201:ℚ)/2^60⟩
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
end Point107

namespace Point108
/-- Exact original rational input. -/
def input : ℚ := (91:ℚ)/64
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(210587078255451533658495:ℚ)/2^80,(210587078255451533658496:ℚ)/2^80⟩,
  ⟨(36682910405788331669544:ℚ)/2^80,(36682910405788331669545:ℚ)/2^80⟩,
  ⟨(6389926328750225516630:ℚ)/2^80,(6389926328750225516631:ℚ)/2^80⟩,
  ⟨(1113083941137136057735:ℚ)/2^80,(1113083941137136057736:ℚ)/2^80⟩,
  ⟨(193892041359372087476:ℚ)/2^80,(193892041359372087477:ℚ)/2^80⟩,
  ⟨(33774742688406750721:ℚ)/2^80,(33774742688406750722:ℚ)/2^80⟩,
  ⟨(5883342274754724319:ℚ)/2^80,(5883342274754724320:ℚ)/2^80⟩,
  ⟨(1024840267215339074:ℚ)/2^80,(1024840267215339076:ℚ)/2^80⟩,
  ⟨(178520562676220354:ℚ)/2^80,(178520562676220356:ℚ)/2^80⟩,
  ⟨(31097130272631932:ℚ)/2^80,(31097130272631933:ℚ)/2^80⟩,
  ⟨(5416919466845562:ℚ)/2^80,(5416919466845563:ℚ)/2^80⟩,
  ⟨(943592423256968:ℚ)/2^80,(943592423256970:ℚ)/2^80⟩,
  ⟨(164367712438310:ℚ)/2^80,(164367712438311:ℚ)/2^80⟩,
  ⟨(28631795069899:ℚ)/2^80,(28631795069900:ℚ)/2^80⟩,
  ⟨(4987473979917:ℚ)/2^80,(4987473979919:ℚ)/2^80⟩,
  ⟨(868785790050:ℚ)/2^80,(868785790051:ℚ)/2^80⟩,
  ⟨(151336879557:ℚ)/2^80,(151336879558:ℚ)/2^80⟩,
  ⟨(26361908051:ℚ)/2^80,(26361908053:ℚ)/2^80⟩,
  ⟨(4592074305:ℚ)/2^80,(4592074307:ℚ)/2^80⟩,
  ⟨(799909717:ℚ)/2^80,(799909718:ℚ)/2^80⟩,
  ⟨(139339111:ℚ)/2^80,(139339113:ℚ)/2^80⟩,
  ⟨(24271974:ℚ)/2^80,(24271975:ℚ)/2^80⟩,
  ⟨(4228021:ℚ)/2^80,(4228022:ℚ)/2^80⟩,
  ⟨(736493:ℚ)/2^80,(736495:ℚ)/2^80⟩,
  ⟨(128292:ℚ)/2^80,(128293:ℚ)/2^80⟩,
  ⟨(22347:ℚ)/2^80,(22348:ℚ)/2^80⟩,
  ⟨(3892:ℚ)/2^80,(3893:ℚ)/2^80⟩,
  ⟨(677:ℚ)/2^80,(679:ℚ)/2^80⟩,
  ⟨(117:ℚ)/2^80,(119:ℚ)/2^80⟩,
  ⟨(20:ℚ)/2^80,(21:ℚ)/2^80⟩,
  ⟨(3:ℚ)/2^80,(4:ℚ)/2^80⟩,
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
def trace : ScaledLogTrace := ⟨0, (91:ℚ)/64,
  ⟨⟨(210587078255451533658495:ℚ)/2^80,(210587078255451533658496:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(405801187372510128:ℚ)/2^60,(405801187372510130:ℚ)/2^60⟩
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
end Point108

namespace Point109
/-- Exact original rational input. -/
def input : ℚ := (365:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(212194709078896264159377:ℚ)/2^80,(212194709078896264159378:ℚ)/2^80⟩,
  ⟨(37245126070208845077893:ℚ)/2^80,(37245126070208845077895:ℚ)/2^80⟩,
  ⟨(6537389278023774739920:ℚ)/2^80,(6537389278023774739921:ℚ)/2^80⟩,
  ⟨(1147464462648295405235:ℚ)/2^80,(1147464462648295405236:ℚ)/2^80⟩,
  ⟨(201406805843259579984:ℚ)/2^80,(201406805843259579986:ℚ)/2^80⟩,
  ⟨(35351597160894193588:ℚ)/2^80,(35351597160894193589:ℚ)/2^80⟩,
  ⟨(6205030741606227215:ℚ)/2^80,(6205030741606227217:ℚ)/2^80⟩,
  ⟨(1089127779122510090:ℚ)/2^80,(1089127779122510092:ℚ)/2^80⟩,
  ⟨(191167355755802898:ℚ)/2^80,(191167355755802899:ℚ)/2^80⟩,
  ⟨(33554334585157030:ℚ)/2^80,(33554334585157031:ℚ)/2^80⟩,
  ⟨(5889569194496161:ℚ)/2^80,(5889569194496162:ℚ)/2^80⟩,
  ⟨(1033756911755364:ℚ)/2^80,(1033756911755365:ℚ)/2^80⟩,
  ⟨(181448475654323:ℚ)/2^80,(181448475654324:ℚ)/2^80⟩,
  ⟨(31848444196974:ℚ)/2^80,(31848444196975:ℚ)/2^80⟩,
  ⟨(5590145599790:ℚ)/2^80,(5590145599792:ℚ)/2^80⟩,
  ⟨(981201079512:ℚ)/2^80,(981201079513:ℚ)/2^80⟩,
  ⟨(172223699946:ℚ)/2^80,(172223699947:ℚ)/2^80⟩,
  ⟨(30229280666:ℚ)/2^80,(30229280668:ℚ)/2^80⟩,
  ⟨(5305944593:ℚ)/2^80,(5305944594:ℚ)/2^80⟩,
  ⟨(931317166:ℚ)/2^80,(931317168:ℚ)/2^80⟩,
  ⟨(163467908:ℚ)/2^80,(163467909:ℚ)/2^80⟩,
  ⟨(28692434:ℚ)/2^80,(28692435:ℚ)/2^80⟩,
  ⟨(5036192:ℚ)/2^80,(5036193:ℚ)/2^80⟩,
  ⟨(883969:ℚ)/2^80,(883970:ℚ)/2^80⟩,
  ⟨(155157:ℚ)/2^80,(155158:ℚ)/2^80⟩,
  ⟨(27233:ℚ)/2^80,(27234:ℚ)/2^80⟩,
  ⟨(4780:ℚ)/2^80,(4781:ℚ)/2^80⟩,
  ⟨(839:ℚ)/2^80,(840:ℚ)/2^80⟩,
  ⟨(147:ℚ)/2^80,(148:ℚ)/2^80⟩,
  ⟨(25:ℚ)/2^80,(26:ℚ)/2^80⟩,
  ⟨(4:ℚ)/2^80,(5:ℚ)/2^80⟩,
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
def trace : ScaledLogTrace := ⟨0, (365:ℚ)/256,
  ⟨⟨(212194709078896264159377:ℚ)/2^80,(212194709078896264159378:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(408964211316952930:ℚ)/2^60,(408964211316952931:ℚ)/2^60⟩
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
end Point109

namespace Point110
/-- Exact original rational input. -/
def input : ℚ := (183:ℚ)/128
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(213797170671397442472153:ℚ)/2^80,(213797170671397442472154:ℚ)/2^80⟩,
  ⟨(37809789025488293684785:ℚ)/2^80,(37809789025488293684787:ℚ)/2^80⟩,
  ⟨(6686618637948090523032:ℚ)/2^80,(6686618637948090523034:ℚ)/2^80⟩,
  ⟨(1182520980987604433333:ℚ)/2^80,(1182520980987604433334:ℚ)/2^80⟩,
  ⟨(209127504676264449624:ℚ)/2^80,(209127504676264449625:ℚ)/2^80⟩,
  ⟨(36983963849500143824:ℚ)/2^80,(36983963849500143825:ℚ)/2^80⟩,
  ⟨(6540572384959832509:ℚ)/2^80,(6540572384959832510:ℚ)/2^80⟩,
  ⟨(1156692865507365877:ℚ)/2^80,(1156692865507365878:ℚ)/2^80⟩,
  ⟨(204559831520595251:ℚ)/2^80,(204559831520595252:ℚ)/2^80⟩,
  ⟨(36176175992388227:ℚ)/2^80,(36176175992388228:ℚ)/2^80⟩,
  ⟨(6397716011515602:ℚ)/2^80,(6397716011515604:ℚ)/2^80⟩,
  ⟨(1131428876634591:ℚ)/2^80,(1131428876634593:ℚ)/2^80⟩,
  ⟨(200091923520586:ℚ)/2^80,(200091923520588:ℚ)/2^80⟩,
  ⟨(35386031490778:ℚ)/2^80,(35386031490780:ℚ)/2^80⟩,
  ⟨(6257979845635:ℚ)/2^80,(6257979845637:ℚ)/2^80⟩,
  ⟨(1106716692957:ℚ)/2^80,(1106716692959:ℚ)/2^80⟩,
  ⟨(195721601648:ℚ)/2^80,(195721601649:ℚ)/2^80⟩,
  ⟨(34613144985:ℚ)/2^80,(34613144987:ℚ)/2^80⟩,
  ⟨(6121295736:ℚ)/2^80,(6121295738:ℚ)/2^80⟩,
  ⟨(1082544261:ℚ)/2^80,(1082544263:ℚ)/2^80⟩,
  ⟨(191446734:ℚ)/2^80,(191446735:ℚ)/2^80⟩,
  ⟨(33857139:ℚ)/2^80,(33857140:ℚ)/2^80⟩,
  ⟨(5987596:ℚ)/2^80,(5987598:ℚ)/2^80⟩,
  ⟨(1058899:ℚ)/2^80,(1058900:ℚ)/2^80⟩,
  ⟨(187265:ℚ)/2^80,(187266:ℚ)/2^80⟩,
  ⟨(33117:ℚ)/2^80,(33118:ℚ)/2^80⟩,
  ⟨(5856:ℚ)/2^80,(5857:ℚ)/2^80⟩,
  ⟨(1035:ℚ)/2^80,(1036:ℚ)/2^80⟩,
  ⟨(183:ℚ)/2^80,(184:ℚ)/2^80⟩,
  ⟨(32:ℚ)/2^80,(33:ℚ)/2^80⟩,
  ⟨(5:ℚ)/2^80,(6:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(2:ℚ)/2^80⟩,
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
def trace : ScaledLogTrace := ⟨0, (183:ℚ)/128,
  ⟨⟨(213797170671397442472153:ℚ)/2^80,(213797170671397442472154:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(412118581286303970:ℚ)/2^60,(412118581286303972:ℚ)/2^60⟩
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
end Point110

namespace Point111
/-- Exact original rational input. -/
def input : ℚ := (367:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(215394487924917878639463:ℚ)/2^80,(215394487924917878639464:ℚ)/2^80⟩,
  ⟨(38376867029961291378780:ℚ)/2^80,(38376867029961291378782:ℚ)/2^80⟩,
  ⟨(6837611942737886585946:ℚ)/2^80,(6837611942737886585947:ℚ)/2^80⟩,
  ⟨(1218258307614615427030:ℚ)/2^80,(1218258307614615427031:ℚ)/2^80⟩,
  ⟨(217057258660067917175:ℚ)/2^80,(217057258660067917176:ℚ)/2^80⟩,
  ⟨(38673123132050624087:ℚ)/2^80,(38673123132050624088:ℚ)/2^80⟩,
  ⟨(6890395935244974757:ℚ)/2^80,(6890395935244974758:ℚ)/2^80⟩,
  ⟨(1227662839184899194:ℚ)/2^80,(1227662839184899195:ℚ)/2^80⟩,
  ⟨(218732865408545442:ℚ)/2^80,(218732865408545443:ℚ)/2^80⟩,
  ⟨(38971666228488834:ℚ)/2^80,(38971666228488835:ℚ)/2^80⟩,
  ⟨(6943587401865586:ℚ)/2^80,(6943587401865587:ℚ)/2^80⟩,
  ⟨(1237139970476854:ℚ)/2^80,(1237139970476855:ℚ)/2^80⟩,
  ⟨(220421407259921:ℚ)/2^80,(220421407259922:ℚ)/2^80⟩,
  ⟨(39272513974079:ℚ)/2^80,(39272513974080:ℚ)/2^80⟩,
  ⟨(6997189488158:ℚ)/2^80,(6997189488159:ℚ)/2^80⟩,
  ⟨(1246690261935:ℚ)/2^80,(1246690261936:ℚ)/2^80⟩,
  ⟨(222122984068:ℚ)/2^80,(222122984069:ℚ)/2^80⟩,
  ⟨(39575684159:ℚ)/2^80,(39575684160:ℚ)/2^80⟩,
  ⟨(7051205363:ℚ)/2^80,(7051205364:ℚ)/2^80⟩,
  ⟨(1256314278:ℚ)/2^80,(1256314279:ℚ)/2^80⟩,
  ⟨(223837696:ℚ)/2^80,(223837697:ℚ)/2^80⟩,
  ⟨(39881194:ℚ)/2^80,(39881195:ℚ)/2^80⟩,
  ⟨(7105638:ℚ)/2^80,(7105639:ℚ)/2^80⟩,
  ⟨(1266012:ℚ)/2^80,(1266013:ℚ)/2^80⟩,
  ⟨(225565:ℚ)/2^80,(225566:ℚ)/2^80⟩,
  ⟨(40188:ℚ)/2^80,(40190:ℚ)/2^80⟩,
  ⟨(7160:ℚ)/2^80,(7161:ℚ)/2^80⟩,
  ⟨(1275:ℚ)/2^80,(1276:ℚ)/2^80⟩,
  ⟨(227:ℚ)/2^80,(228:ℚ)/2^80⟩,
  ⟨(40:ℚ)/2^80,(41:ℚ)/2^80⟩,
  ⟨(7:ℚ)/2^80,(8:ℚ)/2^80⟩,
  ⟨(1:ℚ)/2^80,(2:ℚ)/2^80⟩,
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
def trace : ScaledLogTrace := ⟨0, (367:ℚ)/256,
  ⟨⟨(215394487924917878639463:ℚ)/2^80,(215394487924917878639464:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(415264344505617781:ℚ)/2^60,(415264344505617782:ℚ)/2^60⟩
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
end Point111

/-- Reusable proved logarithm bounds for these consecutive exact grid inputs. -/
def entries : Array CertifiedLogBound := #[⟨Point104.input, Point104.bounds, Point104.log_bounds⟩,
  ⟨Point105.input, Point105.bounds, Point105.log_bounds⟩,
  ⟨Point106.input, Point106.bounds, Point106.log_bounds⟩,
  ⟨Point107.input, Point107.bounds, Point107.log_bounds⟩,
  ⟨Point108.input, Point108.bounds, Point108.log_bounds⟩,
  ⟨Point109.input, Point109.bounds, Point109.log_bounds⟩,
  ⟨Point110.input, Point110.bounds, Point110.log_bounds⟩,
  ⟨Point111.input, Point111.bounds, Point111.log_bounds⟩]
end MatrixBounds.Numeric.LogGridData.Part013
