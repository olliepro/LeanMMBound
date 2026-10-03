module

public import TabulatedLogBounds
public import FKLLog.GridTrace

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

namespace MatrixBounds.Numeric.LogGridData.Part008
set_option maxRecDepth 100000
set_option maxHeartbeats 16000000

namespace Point064
/-- Exact original rational input. -/
def input : ℚ := (5:ℚ)/4
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(134325091068292130522908:ℚ)/2^80,(134325091068292130522909:ℚ)/2^80⟩,
  ⟨(14925010118699125613656:ℚ)/2^80,(14925010118699125613657:ℚ)/2^80⟩,
  ⟨(1658334457633236179295:ℚ)/2^80,(1658334457633236179296:ℚ)/2^80⟩,
  ⟨(184259384181470686588:ℚ)/2^80,(184259384181470686589:ℚ)/2^80⟩,
  ⟨(20473264909052298509:ℚ)/2^80,(20473264909052298510:ℚ)/2^80⟩,
  ⟨(2274807212116922056:ℚ)/2^80,(2274807212116922057:ℚ)/2^80⟩,
  ⟨(252756356901880228:ℚ)/2^80,(252756356901880229:ℚ)/2^80⟩,
  ⟨(28084039655764469:ℚ)/2^80,(28084039655764470:ℚ)/2^80⟩,
  ⟨(3120448850640496:ℚ)/2^80,(3120448850640497:ℚ)/2^80⟩,
  ⟨(346716538960055:ℚ)/2^80,(346716538960056:ℚ)/2^80⟩,
  ⟨(38524059884450:ℚ)/2^80,(38524059884451:ℚ)/2^80⟩,
  ⟨(4280451098272:ℚ)/2^80,(4280451098273:ℚ)/2^80⟩,
  ⟨(475605677585:ℚ)/2^80,(475605677586:ℚ)/2^80⟩,
  ⟨(52845075287:ℚ)/2^80,(52845075288:ℚ)/2^80⟩,
  ⟨(5871675031:ℚ)/2^80,(5871675033:ℚ)/2^80⟩,
  ⟨(652408336:ℚ)/2^80,(652408338:ℚ)/2^80⟩,
  ⟨(72489815:ℚ)/2^80,(72489816:ℚ)/2^80⟩,
  ⟨(8054423:ℚ)/2^80,(8054425:ℚ)/2^80⟩,
  ⟨(894935:ℚ)/2^80,(894937:ℚ)/2^80⟩,
  ⟨(99437:ℚ)/2^80,(99438:ℚ)/2^80⟩,
  ⟨(11048:ℚ)/2^80,(11049:ℚ)/2^80⟩,
  ⟨(1227:ℚ)/2^80,(1228:ℚ)/2^80⟩,
  ⟨(136:ℚ)/2^80,(137:ℚ)/2^80⟩,
  ⟨(15:ℚ)/2^80,(16:ℚ)/2^80⟩,
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
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (5:ℚ)/4,
  ⟨⟨(134325091068292130522908:ℚ)/2^80,(134325091068292130522909:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(257266998924493877:ℚ)/2^60,(257266998924493878:ℚ)/2^60⟩
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
end Point064

namespace Point065
/-- Exact original rational input. -/
def input : ℚ := (321:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(136187484012046614135011:ℚ)/2^80,(136187484012046614135012:ℚ)/2^80⟩,
  ⟨(15341744299450658438086:ℚ)/2^80,(15341744299450658438087:ℚ)/2^80⟩,
  ⟨(1728272754704146964429:ℚ)/2^80,(1728272754704146964430:ℚ)/2^80⟩,
  ⟨(194692771327156937067:ℚ)/2^80,(194692771327156937068:ℚ)/2^80⟩,
  ⟨(21932461241360833465:ℚ)/2^80,(21932461241360833466:ℚ)/2^80⟩,
  ⟨(2470727869477390251:ℚ)/2^80,(2470727869477390252:ℚ)/2^80⟩,
  ⟨(278331562419463373:ℚ)/2^80,(278331562419463374:ℚ)/2^80⟩,
  ⟨(31354508764757572:ℚ)/2^80,(31354508764757573:ℚ)/2^80⟩,
  ⟨(3532137035891234:ℚ)/2^80,(3532137035891235:ℚ)/2^80⟩,
  ⟨(397901052570069:ℚ)/2^80,(397901052570070:ℚ)/2^80⟩,
  ⟨(44824208695068:ℚ)/2^80,(44824208695069:ℚ)/2^80⟩,
  ⟨(5049520910189:ℚ)/2^80,(5049520910190:ℚ)/2^80⟩,
  ⟨(568836844302:ℚ)/2^80,(568836844303:ℚ)/2^80⟩,
  ⟨(64080407070:ℚ)/2^80,(64080407071:ℚ)/2^80⟩,
  ⟨(7218763361:ℚ)/2^80,(7218763362:ℚ)/2^80⟩,
  ⟨(813205577:ℚ)/2^80,(813205579:ℚ)/2^80⟩,
  ⟨(91608947:ℚ)/2^80,(91608948:ℚ)/2^80⟩,
  ⟨(10319898:ℚ)/2^80,(10319899:ℚ)/2^80⟩,
  ⟨(1162553:ℚ)/2^80,(1162554:ℚ)/2^80⟩,
  ⟨(130963:ℚ)/2^80,(130964:ℚ)/2^80⟩,
  ⟨(14753:ℚ)/2^80,(14754:ℚ)/2^80⟩,
  ⟨(1661:ℚ)/2^80,(1663:ℚ)/2^80⟩,
  ⟨(187:ℚ)/2^80,(188:ℚ)/2^80⟩,
  ⟨(21:ℚ)/2^80,(22:ℚ)/2^80⟩,
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
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (321:ℚ)/256,
  ⟨⟨(136187484012046614135011:ℚ)/2^80,(136187484012046614135012:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(260864260827560841:ℚ)/2^60,(260864260827560842:ℚ)/2^60⟩
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
end Point065

namespace Point066
/-- Exact original rational input. -/
def input : ℚ := (161:ℚ)/128
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(138043432689559732751916:ℚ)/2^80,(138043432689559732751917:ℚ)/2^80⟩,
  ⟨(15762744909188481594509:ℚ)/2^80,(15762744909188481594510:ℚ)/2^80⟩,
  ⟨(1799898207623598244355:ℚ)/2^80,(1799898207623598244356:ℚ)/2^80⟩,
  ⟨(205524708828992187071:ℚ)/2^80,(205524708828992187072:ℚ)/2^80⟩,
  ⟨(23468219347255163229:ℚ)/2^80,(23468219347255163230:ℚ)/2^80⟩,
  ⟨(2679762070793842168:ℚ)/2^80,(2679762070793842169:ℚ)/2^80⟩,
  ⟨(305993592858812427:ℚ)/2^80,(305993592858812428:ℚ)/2^80⟩,
  ⟨(34940444859310761:ℚ)/2^80,(34940444859310762:ℚ)/2^80⟩,
  ⟨(3989739378398806:ℚ)/2^80,(3989739378398807:ℚ)/2^80⟩,
  ⟨(455575776772181:ℚ)/2^80,(455575776772183:ℚ)/2^80⟩,
  ⟨(52020763437653:ℚ)/2^80,(52020763437655:ℚ)/2^80⟩,
  ⟨(5940087174541:ℚ)/2^80,(5940087174542:ℚ)/2^80⟩,
  ⟨(678279850380:ℚ)/2^80,(678279850381:ℚ)/2^80⟩,
  ⟨(77450640354:ℚ)/2^80,(77450640355:ℚ)/2^80⟩,
  ⟨(8843844746:ℚ)/2^80,(8843844747:ℚ)/2^80⟩,
  ⟨(1009850784:ℚ)/2^80,(1009850785:ℚ)/2^80⟩,
  ⟨(115311681:ℚ)/2^80,(115311682:ℚ)/2^80⟩,
  ⟨(13167077:ℚ)/2^80,(13167078:ℚ)/2^80⟩,
  ⟨(1503507:ℚ)/2^80,(1503508:ℚ)/2^80⟩,
  ⟨(171680:ℚ)/2^80,(171681:ℚ)/2^80⟩,
  ⟨(19603:ℚ)/2^80,(19604:ℚ)/2^80⟩,
  ⟨(2238:ℚ)/2^80,(2239:ℚ)/2^80⟩,
  ⟨(255:ℚ)/2^80,(256:ℚ)/2^80⟩,
  ⟨(29:ℚ)/2^80,(30:ℚ)/2^80⟩,
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
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (161:ℚ)/128,
  ⟨⟨(138043432689559732751916:ℚ)/2^80,(138043432689559732751917:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(264450333717525035:ℚ)/2^60,(264450333717525036:ℚ)/2^60⟩
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
end Point066

namespace Point067
/-- Exact original rational input. -/
def input : ℚ := (323:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(139892970490812011580852:ℚ)/2^80,(139892970490812011580853:ℚ)/2^80⟩,
  ⟨(16187960315862529837507:ℚ)/2^80,(16187960315862529837509:ℚ)/2^80⟩,
  ⟨(1873218205807926596050:ℚ)/2^80,(1873218205807926596051:ℚ)/2^80⟩,
  ⟨(216762728478637447211:ℚ)/2^80,(216762728478637447212:ℚ)/2^80⟩,
  ⟨(25083079115835421352:ℚ)/2^80,(25083079115835421353:ℚ)/2^80⟩,
  ⟨(2902532471089763783:ℚ)/2^80,(2902532471089763784:ℚ)/2^80⟩,
  ⟨(335871633096742959:ℚ)/2^80,(335871633096742960:ℚ)/2^80⟩,
  ⟨(38865974814303589:ℚ)/2^80,(38865974814303590:ℚ)/2^80⟩,
  ⟨(4497444408563627:ℚ)/2^80,(4497444408563628:ℚ)/2^80⟩,
  ⟨(520429663857967:ℚ)/2^80,(520429663857968:ℚ)/2^80⟩,
  ⟨(60222430878210:ℚ)/2^80,(60222430878211:ℚ)/2^80⟩,
  ⟨(6968744160345:ℚ)/2^80,(6968744160346:ℚ)/2^80⟩,
  ⟨(806400446879:ℚ)/2^80,(806400446880:ℚ)/2^80⟩,
  ⟨(93314041348:ℚ)/2^80,(93314041349:ℚ)/2^80⟩,
  ⟨(10797997876:ℚ)/2^80,(10797997877:ℚ)/2^80⟩,
  ⟨(1249509253:ℚ)/2^80,(1249509254:ℚ)/2^80⟩,
  ⟨(144589153:ℚ)/2^80,(144589154:ℚ)/2^80⟩,
  ⟨(16731387:ℚ)/2^80,(16731388:ℚ)/2^80⟩,
  ⟨(1936101:ℚ)/2^80,(1936102:ℚ)/2^80⟩,
  ⟨(224039:ℚ)/2^80,(224040:ℚ)/2^80⟩,
  ⟨(25925:ℚ)/2^80,(25926:ℚ)/2^80⟩,
  ⟨(2999:ℚ)/2^80,(3001:ℚ)/2^80⟩,
  ⟨(347:ℚ)/2^80,(348:ℚ)/2^80⟩,
  ⟨(40:ℚ)/2^80,(41:ℚ)/2^80⟩,
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
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (323:ℚ)/256,
  ⟨⟨(139892970490812011580852:ℚ)/2^80,(139892970490812011580853:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(268025286983782316:ℚ)/2^60,(268025286983782317:ℚ)/2^60⟩
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
end Point067

namespace Point068
/-- Exact original rational input. -/
def input : ℚ := (81:ℚ)/64
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(141736130575508248068999:ℚ)/2^80,(141736130575508248069000:ℚ)/2^80⟩,
  ⟨(16617339446783725635675:ℚ)/2^80,(16617339446783725635676:ℚ)/2^80⟩,
  ⟨(1948239797209126453837:ℚ)/2^80,(1948239797209126453838:ℚ)/2^80⟩,
  ⟨(228414321052104480794:ℚ)/2^80,(228414321052104480795:ℚ)/2^80⟩,
  ⟨(26779610054384663265:ℚ)/2^80,(26779610054384663266:ℚ)/2^80⟩,
  ⟨(3139678420169236382:ℚ)/2^80,(3139678420169236383:ℚ)/2^80⟩,
  ⟨(368100228571565644:ℚ)/2^80,(368100228571565645:ℚ)/2^80⟩,
  ⟨(43156578522183558:ℚ)/2^80,(43156578522183559:ℚ)/2^80⟩,
  ⟨(5059736792256003:ℚ)/2^80,(5059736792256004:ℚ)/2^80⟩,
  ⟨(593210520471393:ℚ)/2^80,(593210520471394:ℚ)/2^80⟩,
  ⟨(69548819641473:ℚ)/2^80,(69548819641474:ℚ)/2^80⟩,
  ⟨(8153999544172:ℚ)/2^80,(8153999544173:ℚ)/2^80⟩,
  ⟨(955986153454:ℚ)/2^80,(955986153455:ℚ)/2^80⟩,
  ⟨(112081135232:ℚ)/2^80,(112081135233:ℚ)/2^80⟩,
  ⟨(13140546889:ℚ)/2^80,(13140546890:ℚ)/2^80⟩,
  ⟨(1540615842:ℚ)/2^80,(1540615843:ℚ)/2^80⟩,
  ⟨(180623926:ℚ)/2^80,(180623927:ℚ)/2^80⟩,
  ⟨(21176598:ℚ)/2^80,(21176599:ℚ)/2^80⟩,
  ⟨(2482773:ℚ)/2^80,(2482774:ℚ)/2^80⟩,
  ⟨(291083:ℚ)/2^80,(291084:ℚ)/2^80⟩,
  ⟨(34126:ℚ)/2^80,(34128:ℚ)/2^80⟩,
  ⟨(4000:ℚ)/2^80,(4002:ℚ)/2^80⟩,
  ⟨(468:ℚ)/2^80,(470:ℚ)/2^80⟩,
  ⟨(54:ℚ)/2^80,(56:ℚ)/2^80⟩,
  ⟨(6:ℚ)/2^80,(7:ℚ)/2^80⟩,
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
def trace : ScaledLogTrace := ⟨0, (81:ℚ)/64,
  ⟨⟨(141736130575508248068999:ℚ)/2^80,(141736130575508248069000:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(271589189372239037:ℚ)/2^60,(271589189372239038:ℚ)/2^60⟩
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
end Point068

namespace Point069
/-- Exact original rational input. -/
def input : ℚ := (325:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(143572945875059230731026:ℚ)/2^80,(143572945875059230731027:ℚ)/2^80⟩,
  ⟨(17050831782063832909536:ℚ)/2^80,(17050831782063832909537:ℚ)/2^80⟩,
  ⟨(2024969695288131619204:ℚ)/2^80,(2024969695288131619205:ℚ)/2^80⟩,
  ⟨(240486934552291018459:ℚ)/2^80,(240486934552291018460:ℚ)/2^80⟩,
  ⟨(28560410471786713035:ℚ)/2^80,(28560410471786713036:ℚ)/2^80⟩,
  ⟨(3391855976855909121:ℚ)/2^80,(3391855976855909122:ℚ)/2^80⟩,
  ⟨(402819384514729310:ℚ)/2^80,(402819384514729311:ℚ)/2^80⟩,
  ⟨(47839135166121036:ℚ)/2^80,(47839135166121037:ℚ)/2^80⟩,
  ⟨(5681411921621947:ℚ)/2^80,(5681411921621948:ℚ)/2^80⟩,
  ⟨(674728782430145:ℚ)/2^80,(674728782430146:ℚ)/2^80⟩,
  ⟨(80131301183614:ℚ)/2^80,(80131301183615:ℚ)/2^80⟩,
  ⟨(9516454013200:ℚ)/2^80,(9516454013201:ℚ)/2^80⟩,
  ⟨(1130181285560:ℚ)/2^80,(1130181285561:ℚ)/2^80⟩,
  ⟨(134221185376:ℚ)/2^80,(134221185377:ℚ)/2^80⟩,
  ⟨(15940209622:ℚ)/2^80,(15940209624:ℚ)/2^80⟩,
  ⟨(1893071366:ℚ)/2^80,(1893071367:ℚ)/2^80⟩,
  ⟨(224822589:ℚ)/2^80,(224822590:ℚ)/2^80⟩,
  ⟨(26700100:ℚ)/2^80,(26700102:ℚ)/2^80⟩,
  ⟨(3170924:ℚ)/2^80,(3170925:ℚ)/2^80⟩,
  ⟨(376581:ℚ)/2^80,(376582:ℚ)/2^80⟩,
  ⟨(44723:ℚ)/2^80,(44724:ℚ)/2^80⟩,
  ⟨(5311:ℚ)/2^80,(5312:ℚ)/2^80⟩,
  ⟨(630:ℚ)/2^80,(631:ℚ)/2^80⟩,
  ⟨(74:ℚ)/2^80,(75:ℚ)/2^80⟩,
  ⟨(8:ℚ)/2^80,(9:ℚ)/2^80⟩,
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
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (325:ℚ)/256,
  ⟨⟨(143572945875059230731026:ℚ)/2^80,(143572945875059230731027:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(275142108993244157:ℚ)/2^60,(275142108993244158:ℚ)/2^60⟩
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
end Point069

namespace Point070
/-- Exact original rational input. -/
def input : ℚ := (163:ℚ)/128
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(145403449094543027885622:ℚ)/2^80,(145403449094543027885623:ℚ)/2^80⟩,
  ⟨(17488387348140914006861:ℚ)/2^80,(17488387348140914006862:ℚ)/2^80⟩,
  ⟨(2103414285858872818694:ℚ)/2^80,(2103414285858872818695:ℚ)/2^80⟩,
  ⟨(252987972525981266853:ℚ)/2^80,(252987972525981266854:ℚ)/2^80⟩,
  ⟨(30428106661200496013:ℚ)/2^80,(30428106661200496014:ℚ)/2^80⟩,
  ⟨(3659737914577379245:ℚ)/2^80,(3659737914577379246:ℚ)/2^80⟩,
  ⟨(440174663265320527:ℚ)/2^80,(440174663265320528:ℚ)/2^80⟩,
  ⟨(52941969808543705:ℚ)/2^80,(52941969808543707:ℚ)/2^80⟩,
  ⟨(6367590870443400:ℚ)/2^80,(6367590870443402:ℚ)/2^80⟩,
  ⟨(765861444898690:ℚ)/2^80,(765861444898691:ℚ)/2^80⟩,
  ⟨(92113919489533:ℚ)/2^80,(92113919489534:ℚ)/2^80⟩,
  ⟨(11078993753036:ℚ)/2^80,(11078993753037:ℚ)/2^80⟩,
  ⟨(1332525021842:ℚ)/2^80,(1332525021843:ℚ)/2^80⟩,
  ⟨(160269332523:ℚ)/2^80,(160269332525:ℚ)/2^80⟩,
  ⟨(19276380200:ℚ)/2^80,(19276380201:ℚ)/2^80⟩,
  ⟨(2318464972:ℚ)/2^80,(2318464973:ℚ)/2^80⟩,
  ⟨(278853175:ℚ)/2^80,(278853176:ℚ)/2^80⟩,
  ⟨(33539041:ℚ)/2^80,(33539042:ℚ)/2^80⟩,
  ⟨(4033905:ℚ)/2^80,(4033906:ℚ)/2^80⟩,
  ⟨(485177:ℚ)/2^80,(485178:ℚ)/2^80⟩,
  ⟨(58354:ℚ)/2^80,(58355:ℚ)/2^80⟩,
  ⟨(7018:ℚ)/2^80,(7019:ℚ)/2^80⟩,
  ⟨(844:ℚ)/2^80,(845:ℚ)/2^80⟩,
  ⟨(101:ℚ)/2^80,(102:ℚ)/2^80⟩,
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
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (163:ℚ)/128,
  ⟨⟨(145403449094543027885622:ℚ)/2^80,(145403449094543027885623:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(278684113329399498:ℚ)/2^60,(278684113329399499:ℚ)/2^60⟩
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
end Point070

namespace Point071
/-- Exact original rational input. -/
def input : ℚ := (327:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(147227672714646091602295:ℚ)/2^80,(147227672714646091602296:ℚ)/2^80⟩,
  ⟨(17929956711389146661685:ℚ)/2^80,(17929956711389146661687:ℚ)/2^80⟩,
  ⟨(2183579633805539301851:ℚ)/2^80,(2183579633805539301853:ℚ)/2^80⟩,
  ⟨(265924792453161733158:ℚ)/2^80,(265924792453161733159:ℚ)/2^80⟩,
  ⟨(32385352082632046405:ℚ)/2^80,(32385352082632046406:ℚ)/2^80⟩,
  ⟨(3944013718468053678:ℚ)/2^80,(3944013718468053679:ℚ)/2^80⟩,
  ⟨(480317279607601734:ℚ)/2^80,(480317279607601735:ℚ)/2^80⟩,
  ⟨(58494900260960073:ℚ)/2^80,(58494900260960075:ℚ)/2^80⟩,
  ⟨(7123735709310746:ℚ)/2^80,(7123735709310747:ℚ)/2^80⟩,
  ⟨(867556149847449:ℚ)/2^80,(867556149847450:ℚ)/2^80⟩,
  ⟨(105654351010581:ℚ)/2^80,(105654351010582:ℚ)/2^80⟩,
  ⟨(12866996435250:ℚ)/2^80,(12866996435251:ℚ)/2^80⟩,
  ⟨(1566992704807:ℚ)/2^80,(1566992704808:ℚ)/2^80⟩,
  ⟨(190834446039:ℚ)/2^80,(190834446041:ℚ)/2^80⟩,
  ⟨(23240558608:ℚ)/2^80,(23240558609:ℚ)/2^80⟩,
  ⟨(2830325319:ℚ)/2^80,(2830325320:ℚ)/2^80⟩,
  ⟨(344687989:ℚ)/2^80,(344687990:ℚ)/2^80⟩,
  ⟨(41977439:ℚ)/2^80,(41977440:ℚ)/2^80⟩,
  ⟨(5112175:ℚ)/2^80,(5112176:ℚ)/2^80⟩,
  ⟨(622580:ℚ)/2^80,(622581:ℚ)/2^80⟩,
  ⟨(75820:ℚ)/2^80,(75821:ℚ)/2^80⟩,
  ⟨(9233:ℚ)/2^80,(9234:ℚ)/2^80⟩,
  ⟨(1124:ℚ)/2^80,(1125:ℚ)/2^80⟩,
  ⟨(136:ℚ)/2^80,(138:ℚ)/2^80⟩,
  ⟨(16:ℚ)/2^80,(17:ℚ)/2^80⟩,
  ⟨(1:ℚ)/2^80,(3:ℚ)/2^80⟩,
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
def trace : ScaledLogTrace := ⟨0, (327:ℚ)/256,
  ⟨⟨(147227672714646091602295:ℚ)/2^80,(147227672714646091602296:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(282215269243250400:ℚ)/2^60,(282215269243250401:ℚ)/2^60⟩
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
end Point071

/-- Reusable proved logarithm bounds for these consecutive exact grid inputs. -/
def entries : Array CertifiedLogBound := #[⟨Point064.input, Point064.bounds, Point064.log_bounds⟩,
  ⟨Point065.input, Point065.bounds, Point065.log_bounds⟩,
  ⟨Point066.input, Point066.bounds, Point066.log_bounds⟩,
  ⟨Point067.input, Point067.bounds, Point067.log_bounds⟩,
  ⟨Point068.input, Point068.bounds, Point068.log_bounds⟩,
  ⟨Point069.input, Point069.bounds, Point069.log_bounds⟩,
  ⟨Point070.input, Point070.bounds, Point070.log_bounds⟩,
  ⟨Point071.input, Point071.bounds, Point071.log_bounds⟩]
end MatrixBounds.Numeric.LogGridData.Part008
