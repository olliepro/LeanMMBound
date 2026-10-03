module

public import TabulatedLogBounds
public import FKLLog.GridTrace

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

namespace MatrixBounds.Numeric.LogGridData.Part004
set_option maxRecDepth 100000
set_option maxHeartbeats 16000000

namespace Point032
/-- Exact original rational input. -/
def input : ℚ := (9:ℚ)/8
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(71113283506742892629775:ℚ)/2^80,(71113283506742892629776:ℚ)/2^80⟩,
  ⟨(4183134323926052507633:ℚ)/2^80,(4183134323926052507634:ℚ)/2^80⟩,
  ⟨(246066724936826618096:ℚ)/2^80,(246066724936826618097:ℚ)/2^80⟩,
  ⟨(14474513231578036358:ℚ)/2^80,(14474513231578036359:ℚ)/2^80⟩,
  ⟨(851441954798708021:ℚ)/2^80,(851441954798708022:ℚ)/2^80⟩,
  ⟨(50084820870512236:ℚ)/2^80,(50084820870512237:ℚ)/2^80⟩,
  ⟨(2946165933559543:ℚ)/2^80,(2946165933559544:ℚ)/2^80⟩,
  ⟨(173303878444678:ℚ)/2^80,(173303878444680:ℚ)/2^80⟩,
  ⟨(10194345790863:ℚ)/2^80,(10194345790864:ℚ)/2^80⟩,
  ⟨(599667399462:ℚ)/2^80,(599667399463:ℚ)/2^80⟩,
  ⟨(35274552909:ℚ)/2^80,(35274552910:ℚ)/2^80⟩,
  ⟨(2074973700:ℚ)/2^80,(2074973701:ℚ)/2^80⟩,
  ⟨(122057276:ℚ)/2^80,(122057277:ℚ)/2^80⟩,
  ⟨(7179839:ℚ)/2^80,(7179840:ℚ)/2^80⟩,
  ⟨(422343:ℚ)/2^80,(422344:ℚ)/2^80⟩,
  ⟨(24843:ℚ)/2^80,(24844:ℚ)/2^80⟩,
  ⟨(1461:ℚ)/2^80,(1462:ℚ)/2^80⟩,
  ⟨(85:ℚ)/2^80,(87:ℚ)/2^80⟩,
  ⟨(4:ℚ)/2^80,(6:ℚ)/2^80⟩,
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
def trace : ScaledLogTrace := ⟨0, (9:ℚ)/8,
  ⟨⟨(71113283506742892629775:ℚ)/2^80,(71113283506742892629776:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(135794594686119518:ℚ)/2^60,(135794594686119519:ℚ)/2^60⟩
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
end Point032

namespace Point033
/-- Exact original rational input. -/
def input : ℚ := (289:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(73201012930794060119823:ℚ)/2^80,(73201012930794060119824:ℚ)/2^80⟩,
  ⟨(4432354911405878869640:ℚ)/2^80,(4432354911405878869641:ℚ)/2^80⟩,
  ⟨(268381123075952298528:ℚ)/2^80,(268381123075952298529:ℚ)/2^80⟩,
  ⟨(16250600112855827250:ℚ)/2^80,(16250600112855827251:ℚ)/2^80⟩,
  ⟨(983981291237141833:ℚ)/2^80,(983981291237141834:ℚ)/2^80⟩,
  ⟨(59580518551973725:ℚ)/2^80,(59580518551973726:ℚ)/2^80⟩,
  ⟨(3607627728835106:ℚ)/2^80,(3607627728835107:ℚ)/2^80⟩,
  ⟨(218443513856070:ℚ)/2^80,(218443513856071:ℚ)/2^80⟩,
  ⟨(13226854967431:ℚ)/2^80,(13226854967432:ℚ)/2^80⟩,
  ⟨(800892135642:ℚ)/2^80,(800892135643:ℚ)/2^80⟩,
  ⟨(48494386194:ℚ)/2^80,(48494386195:ℚ)/2^80⟩,
  ⟨(2936357329:ℚ)/2^80,(2936357330:ℚ)/2^80⟩,
  ⟨(177797783:ℚ)/2^80,(177797784:ℚ)/2^80⟩,
  ⟨(10765737:ℚ)/2^80,(10765738:ℚ)/2^80⟩,
  ⟨(651870:ℚ)/2^80,(651871:ℚ)/2^80⟩,
  ⟨(39471:ℚ)/2^80,(39472:ℚ)/2^80⟩,
  ⟨(2389:ℚ)/2^80,(2391:ℚ)/2^80⟩,
  ⟨(144:ℚ)/2^80,(145:ℚ)/2^80⟩,
  ⟨(8:ℚ)/2^80,(9:ℚ)/2^80⟩,
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
def trace : ScaledLogTrace := ⟨0, (289:ℚ)/256,
  ⟨⟨(73201012930794060119823:ℚ)/2^80,(73201012930794060119824:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(139790860401650277:ℚ)/2^60,(139790860401650279:ℚ)/2^60⟩
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
end Point033

namespace Point034
/-- Exact original rational input. -/
def input : ℚ := (145:ℚ)/128
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(75281094994317567655695:ℚ)/2^80,(75281094994317567655696:ℚ)/2^80⟩,
  ⟨(4687833754224903480391:ℚ)/2^80,(4687833754224903480392:ℚ)/2^80⟩,
  ⟨(291916387625726590354:ℚ)/2^80,(291916387625726590355:ℚ)/2^80⟩,
  ⟨(18177943551785172293:ℚ)/2^80,(18177943551785172294:ℚ)/2^80⟩,
  ⟨(1131959854873069336:ℚ)/2^80,(1131959854873069337:ℚ)/2^80⟩,
  ⟨(70488342611143511:ℚ)/2^80,(70488342611143512:ℚ)/2^80⟩,
  ⟨(4389383972122489:ℚ)/2^80,(4389383972122490:ℚ)/2^80⟩,
  ⟨(273331602659642:ℚ)/2^80,(273331602659643:ℚ)/2^80⟩,
  ⟨(17020649249867:ℚ)/2^80,(17020649249868:ℚ)/2^80⟩,
  ⟨(1059893909332:ℚ)/2^80,(1059893909333:ℚ)/2^80⟩,
  ⟨(66000719628:ℚ)/2^80,(66000719629:ℚ)/2^80⟩,
  ⟨(4109934921:ℚ)/2^80,(4109934922:ℚ)/2^80⟩,
  ⟨(255930013:ℚ)/2^80,(255930014:ℚ)/2^80⟩,
  ⟨(15937033:ℚ)/2^80,(15937034:ℚ)/2^80⟩,
  ⟨(992415:ℚ)/2^80,(992417:ℚ)/2^80⟩,
  ⟨(61798:ℚ)/2^80,(61799:ℚ)/2^80⟩,
  ⟨(3848:ℚ)/2^80,(3849:ℚ)/2^80⟩,
  ⟨(239:ℚ)/2^80,(240:ℚ)/2^80⟩,
  ⟨(14:ℚ)/2^80,(15:ℚ)/2^80⟩,
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
def trace : ScaledLogTrace := ⟨0, (145:ℚ)/128,
  ⟨⟨(75281094994317567655695:ℚ)/2^80,(75281094994317567655696:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(143773322063031210:ℚ)/2^60,(143773322063031211:ℚ)/2^60⟩
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
end Point034

namespace Point035
/-- Exact original rational input. -/
def input : ℚ := (291:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(77353571638961647376080:ℚ)/2^80,(77353571638961647376081:ℚ)/2^80⟩,
  ⟨(4949497271231549649292:ℚ)/2^80,(4949497271231549649293:ℚ)/2^80⟩,
  ⟨(316695437830172281033:ℚ)/2^80,(316695437830172281034:ℚ)/2^80⟩,
  ⟨(20263876277981773009:ℚ)/2^80,(20263876277981773010:ℚ)/2^80⟩,
  ⟨(1296591717969583282:ℚ)/2^80,(1296591717969583283:ℚ)/2^80⟩,
  ⟨(82962906999881928:ℚ)/2^80,(82962906999881929:ℚ)/2^80⟩,
  ⟨(5308412696518953:ℚ)/2^80,(5308412696518954:ℚ)/2^80⟩,
  ⟨(339660775828452:ℚ)/2^80,(339660775828453:ℚ)/2^80⟩,
  ⟨(21733322036555:ℚ)/2^80,(21733322036556:ℚ)/2^80⟩,
  ⟨(1390614755538:ℚ)/2^80,(1390614755539:ℚ)/2^80⟩,
  ⟨(88979006295:ℚ)/2^80,(88979006296:ℚ)/2^80⟩,
  ⟨(5693355064:ℚ)/2^80,(5693355065:ℚ)/2^80⟩,
  ⟨(364291457:ℚ)/2^80,(364291458:ℚ)/2^80⟩,
  ⟨(23309325:ℚ)/2^80,(23309326:ℚ)/2^80⟩,
  ⟨(1491455:ℚ)/2^80,(1491456:ℚ)/2^80⟩,
  ⟨(95431:ℚ)/2^80,(95432:ℚ)/2^80⟩,
  ⟨(6106:ℚ)/2^80,(6107:ℚ)/2^80⟩,
  ⟨(390:ℚ)/2^80,(391:ℚ)/2^80⟩,
  ⟨(24:ℚ)/2^80,(26:ℚ)/2^80⟩,
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
def trace : ScaledLogTrace := ⟨0, (291:ℚ)/256,
  ⟨⟨(77353571638961647376080:ℚ)/2^80,(77353571638961647376081:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(147742074707062213:ℚ)/2^60,(147742074707062214:ℚ)/2^60⟩
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
end Point035

namespace Point036
/-- Exact original rational input. -/
def input : ℚ := (73:ℚ)/64
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(79418484500231113666829:ℚ)/2^80,(79418484500231113666830:ℚ)/2^80⟩,
  ⟨(5217272704394744693441:ℚ)/2^80,(5217272704394744693442:ℚ)/2^80⟩,
  ⟨(342740542624472279131:ℚ)/2^80,(342740542624472279132:ℚ)/2^80⟩,
  ⟨(22515802070220806658:ℚ)/2^80,(22515802070220806659:ℚ)/2^80⟩,
  ⟨(1479140281985308466:ℚ)/2^80,(1479140281985308467:ℚ)/2^80⟩,
  ⟨(97169799546480118:ℚ)/2^80,(97169799546480119:ℚ)/2^80⟩,
  ⟨(6383417488454898:ℚ)/2^80,(6383417488454899:ℚ)/2^80⟩,
  ⟨(419348594132073:ℚ)/2^80,(419348594132074:ℚ)/2^80⟩,
  ⟨(27548447789698:ℚ)/2^80,(27548447789699:ℚ)/2^80⟩,
  ⟨(1809752044578:ℚ)/2^80,(1809752044579:ℚ)/2^80⟩,
  ⟨(118888820446:ℚ)/2^80,(118888820447:ℚ)/2^80⟩,
  ⟨(7810214481:ℚ)/2^80,(7810214482:ℚ)/2^80⟩,
  ⟨(513079783:ℚ)/2^80,(513079784:ℚ)/2^80⟩,
  ⟨(33705971:ℚ)/2^80,(33705972:ℚ)/2^80⟩,
  ⟨(2214260:ℚ)/2^80,(2214261:ℚ)/2^80⟩,
  ⟨(145462:ℚ)/2^80,(145463:ℚ)/2^80⟩,
  ⟨(9555:ℚ)/2^80,(9556:ℚ)/2^80⟩,
  ⟨(627:ℚ)/2^80,(628:ℚ)/2^80⟩,
  ⟨(41:ℚ)/2^80,(42:ℚ)/2^80⟩,
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
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (73:ℚ)/64,
  ⟨⟨(79418484500231113666829:ℚ)/2^80,(79418484500231113666830:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(151697212392459052:ℚ)/2^60,(151697212392459053:ℚ)/2^60⟩
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
end Point036

namespace Point037
/-- Exact original rational input. -/
def input : ℚ := (293:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(81475874910275554579469:ℚ)/2^80,(81475874910275554579470:ℚ)/2^80⟩,
  ⟨(5491088108707095663825:ℚ)/2^80,(5491088108707095663826:ℚ)/2^80⟩,
  ⟨(370073333373702257853:ℚ)/2^80,(370073333373702257854:ℚ)/2^80⟩,
  ⟨(24941190045222192241:ℚ)/2^80,(24941190045222192242:ℚ)/2^80⟩,
  ⟨(1680918090479455579:ℚ)/2^80,(1680918090479455580:ℚ)/2^80⟩,
  ⟨(113285918666192816:ℚ)/2^80,(113285918666192817:ℚ)/2^80⟩,
  ⟨(7634934409196965:ℚ)/2^80,(7634934409196966:ℚ)/2^80⟩,
  ⟨(514558421020560:ℚ)/2^80,(514558421020561:ℚ)/2^80⟩,
  ⟨(34678800688088:ℚ)/2^80,(34678800688089:ℚ)/2^80⟩,
  ⟨(2337186931619:ℚ)/2^80,(2337186931620:ℚ)/2^80⟩,
  ⟨(157515330546:ℚ)/2^80,(157515330547:ℚ)/2^80⟩,
  ⟨(10615787304:ℚ)/2^80,(10615787305:ℚ)/2^80⟩,
  ⟨(715453789:ℚ)/2^80,(715453790:ℚ)/2^80⟩,
  ⟨(48218197:ℚ)/2^80,(48218198:ℚ)/2^80⟩,
  ⟨(3249678:ℚ)/2^80,(3249679:ℚ)/2^80⟩,
  ⟨(219012:ℚ)/2^80,(219013:ℚ)/2^80⟩,
  ⟨(14760:ℚ)/2^80,(14761:ℚ)/2^80⟩,
  ⟨(994:ℚ)/2^80,(995:ℚ)/2^80⟩,
  ⟨(66:ℚ)/2^80,(68:ℚ)/2^80⟩,
  ⟨(4:ℚ)/2^80,(5:ℚ)/2^80⟩,
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
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (293:ℚ)/256,
  ⟨⟨(81475874910275554579469:ℚ)/2^80,(81475874910275554579470:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(155638828213228940:ℚ)/2^60,(155638828213228942:ℚ)/2^60⟩
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
end Point037

namespace Point038
/-- Exact original rational input. -/
def input : ℚ := (147:ℚ)/128
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(83525783900647106616063:ℚ)/2^80,(83525783900647106616064:ℚ)/2^80⟩,
  ⟨(5770872342226527366200:ℚ)/2^80,(5770872342226527366201:ℚ)/2^80⟩,
  ⟨(398714816372014618028:ℚ)/2^80,(398714816372014618029:ℚ)/2^80⟩,
  ⟨(27547569131157373609:ℚ)/2^80,(27547569131157373610:ℚ)/2^80⟩,
  ⟨(1903286594516327631:ℚ)/2^80,(1903286594516327632:ℚ)/2^80⟩,
  ⟨(131499801075673545:ℚ)/2^80,(131499801075673546:ℚ)/2^80⟩,
  ⟨(9085440801591990:ℚ)/2^80,(9085440801591991:ℚ)/2^80⟩,
  ⟨(627721364473628:ℚ)/2^80,(627721364473629:ℚ)/2^80⟩,
  ⟨(43369839727268:ℚ)/2^80,(43369839727269:ℚ)/2^80⟩,
  ⟨(2996461653883:ℚ)/2^80,(2996461653885:ℚ)/2^80⟩,
  ⟨(207028259722:ℚ)/2^80,(207028259723:ℚ)/2^80⟩,
  ⟨(14303770671:ℚ)/2^80,(14303770672:ℚ)/2^80⟩,
  ⟨(988260519:ℚ)/2^80,(988260520:ℚ)/2^80⟩,
  ⟨(68279817:ℚ)/2^80,(68279818:ℚ)/2^80⟩,
  ⟨(4717514:ℚ)/2^80,(4717515:ℚ)/2^80⟩,
  ⟨(325937:ℚ)/2^80,(325938:ℚ)/2^80⟩,
  ⟨(22519:ℚ)/2^80,(22520:ℚ)/2^80⟩,
  ⟨(1555:ℚ)/2^80,(1556:ℚ)/2^80⟩,
  ⟨(107:ℚ)/2^80,(108:ℚ)/2^80⟩,
  ⟨(7:ℚ)/2^80,(8:ℚ)/2^80⟩,
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
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (147:ℚ)/128,
  ⟨⟨(83525783900647106616063:ℚ)/2^80,(83525783900647106616064:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(159567014311818245:ℚ)/2^60,(159567014311818246:ℚ)/2^60⟩
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
end Point038

namespace Point039
/-- Exact original rational input. -/
def input : ℚ := (295:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(85568252205028199298622:ℚ)/2^80,(85568252205028199298623:ℚ)/2^80⟩,
  ⟨(6056555056254264560156:ℚ)/2^80,(6056555056254264560157:ℚ)/2^80⟩,
  ⟨(428685385106926166689:ℚ)/2^80,(428685385106926166690:ℚ)/2^80⟩,
  ⟨(30342522720816915609:ℚ)/2^80,(30342522720816915610:ℚ)/2^80⟩,
  ⟨(2147655873161269888:ℚ)/2^80,(2147655873161269889:ℚ)/2^80⟩,
  ⟨(152011940205607124:ℚ)/2^80,(152011940205607125:ℚ)/2^80⟩,
  ⟨(10759465822175458:ℚ)/2^80,(10759465822175459:ℚ)/2^80⟩,
  ⟨(761559286869043:ℚ)/2^80,(761559286869044:ℚ)/2^80⟩,
  ⟨(53903470395449:ℚ)/2^80,(53903470395450:ℚ)/2^80⟩,
  ⟨(3815309156846:ℚ)/2^80,(3815309156847:ℚ)/2^80⟩,
  ⟨(270049105475:ℚ)/2^80,(270049105476:ℚ)/2^80⟩,
  ⟨(19114183509:ℚ)/2^80,(19114183510:ℚ)/2^80⟩,
  ⟨(1352909540:ℚ)/2^80,(1352909541:ℚ)/2^80⟩,
  ⟨(95759477:ℚ)/2^80,(95759478:ℚ)/2^80⟩,
  ⟨(6777894:ℚ)/2^80,(6777895:ℚ)/2^80⟩,
  ⟨(479742:ℚ)/2^80,(479743:ℚ)/2^80⟩,
  ⟨(33956:ℚ)/2^80,(33957:ℚ)/2^80⟩,
  ⟨(2403:ℚ)/2^80,(2404:ℚ)/2^80⟩,
  ⟨(170:ℚ)/2^80,(171:ℚ)/2^80⟩,
  ⟨(12:ℚ)/2^80,(13:ℚ)/2^80⟩,
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
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (295:ℚ)/256,
  ⟨⟨(85568252205028199298622:ℚ)/2^80,(85568252205028199298623:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(163481861892036975:ℚ)/2^60,(163481861892036976:ℚ)/2^60⟩
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
end Point039

/-- Reusable proved logarithm bounds for these consecutive exact grid inputs. -/
def entries : Array CertifiedLogBound := #[⟨Point032.input, Point032.bounds, Point032.log_bounds⟩,
  ⟨Point033.input, Point033.bounds, Point033.log_bounds⟩,
  ⟨Point034.input, Point034.bounds, Point034.log_bounds⟩,
  ⟨Point035.input, Point035.bounds, Point035.log_bounds⟩,
  ⟨Point036.input, Point036.bounds, Point036.log_bounds⟩,
  ⟨Point037.input, Point037.bounds, Point037.log_bounds⟩,
  ⟨Point038.input, Point038.bounds, Point038.log_bounds⟩,
  ⟨Point039.input, Point039.bounds, Point039.log_bounds⟩]
end MatrixBounds.Numeric.LogGridData.Part004
