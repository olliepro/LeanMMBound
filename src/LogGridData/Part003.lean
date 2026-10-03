module

public import TabulatedLogBounds
public import FKLLog.GridTrace

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

namespace MatrixBounds.Numeric.LogGridData.Part003
set_option maxRecDepth 100000
set_option maxHeartbeats 16000000

namespace Point024
/-- Exact original rational input. -/
def input : ℚ := (35:ℚ)/32
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(54131006848416231703261:ℚ)/2^80,(54131006848416231703262:ℚ)/2^80⟩,
  ⟨(2423776426048487986713:ℚ)/2^80,(2423776426048487986714:ℚ)/2^80⟩,
  ⟨(108527302658887521793:ℚ)/2^80,(108527302658887521794:ℚ)/2^80⟩,
  ⟨(4859431462338247244:ℚ)/2^80,(4859431462338247245:ℚ)/2^80⟩,
  ⟨(217586483388279727:ℚ)/2^80,(217586483388279728:ℚ)/2^80⟩,
  ⟨(9742678360669241:ℚ)/2^80,(9742678360669242:ℚ)/2^80⟩,
  ⟨(436239329582204:ℚ)/2^80,(436239329582205:ℚ)/2^80⟩,
  ⟨(19533104309650:ℚ)/2^80,(19533104309651:ℚ)/2^80⟩,
  ⟨(874616610879:ℚ)/2^80,(874616610880:ℚ)/2^80⟩,
  ⟨(39161937800:ℚ)/2^80,(39161937801:ℚ)/2^80⟩,
  ⟨(1753519602:ℚ)/2^80,(1753519604:ℚ)/2^80⟩,
  ⟨(78515803:ℚ)/2^80,(78515804:ℚ)/2^80⟩,
  ⟨(3515632:ℚ)/2^80,(3515634:ℚ)/2^80⟩,
  ⟨(157416:ℚ)/2^80,(157417:ℚ)/2^80⟩,
  ⟨(7048:ℚ)/2^80,(7049:ℚ)/2^80⟩,
  ⟨(315:ℚ)/2^80,(316:ℚ)/2^80⟩,
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
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (35:ℚ)/32,
  ⟨⟨(54131006848416231703261:ℚ)/2^80,(54131006848416231703262:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(103315784827581625:ℚ)/2^60,(103315784827581626:ℚ)/2^60⟩
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
end Point024

namespace Point025
/-- Exact original rational input. -/
def input : ℚ := (281:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(56281462738111227872727:ℚ)/2^80,(56281462738111227872728:ℚ)/2^80⟩,
  ⟨(2620179829521006884205:ℚ)/2^80,(2620179829521006884206:ℚ)/2^80⟩,
  ⟨(121982301188128812113:ℚ)/2^80,(121982301188128812114:ℚ)/2^80⟩,
  ⟨(5678878081384022910:ℚ)/2^80,(5678878081384022911:ℚ)/2^80⟩,
  ⟨(264379798947114660:ℚ)/2^80,(264379798947114661:ℚ)/2^80⟩,
  ⟨(12308184308524891:ℚ)/2^80,(12308184308524892:ℚ)/2^80⟩,
  ⟨(573006718273970:ℚ)/2^80,(573006718273971:ℚ)/2^80⟩,
  ⟨(26676290422438:ℚ)/2^80,(26676290422439:ℚ)/2^80⟩,
  ⟨(1241912961938:ℚ)/2^80,(1241912961939:ℚ)/2^80⟩,
  ⟨(57817176998:ℚ)/2^80,(57817177000:ℚ)/2^80⟩,
  ⟨(2691674906:ℚ)/2^80,(2691674907:ℚ)/2^80⟩,
  ⟨(125310749:ℚ)/2^80,(125310750:ℚ)/2^80⟩,
  ⟨(5833833:ℚ)/2^80,(5833834:ℚ)/2^80⟩,
  ⟨(271593:ℚ)/2^80,(271594:ℚ)/2^80⟩,
  ⟨(12643:ℚ)/2^80,(12645:ℚ)/2^80⟩,
  ⟨(588:ℚ)/2^80,(589:ℚ)/2^80⟩,
  ⟨(27:ℚ)/2^80,(28:ℚ)/2^80⟩,
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
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (281:ℚ)/256,
  ⟨⟨(56281462738111227872727:ℚ)/2^80,(56281462738111227872728:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(107426026273975496:ℚ)/2^60,(107426026273975497:ℚ)/2^60⟩
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
end Point025

namespace Point026
/-- Exact original rational input. -/
def input : ℚ := (141:ℚ)/128
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(58423924367993231491376:ℚ)/2^80,(58423924367993231491377:ℚ)/2^80⟩,
  ⟨(2823461028936475871330:ℚ)/2^80,(2823461028936475871331:ℚ)/2^80⟩,
  ⟨(136449789502506268874:ℚ)/2^80,(136449789502506268875:ℚ)/2^80⟩,
  ⟨(6594227745474280651:ℚ)/2^80,(6594227745474280652:ℚ)/2^80⟩,
  ⟨(318680151268273786:ℚ)/2^80,(318680151268273787:ℚ)/2^80⟩,
  ⟨(15400899503671223:ℚ)/2^80,(15400899503671224:ℚ)/2^80⟩,
  ⟨(744281388653256:ℚ)/2^80,(744281388653257:ℚ)/2^80⟩,
  ⟨(35968989042722:ℚ)/2^80,(35968989042723:ℚ)/2^80⟩,
  ⟨(1738278280875:ℚ)/2^80,(1738278280876:ℚ)/2^80⟩,
  ⟨(84006013573:ℚ)/2^80,(84006013574:ℚ)/2^80⟩,
  ⟨(4059770172:ℚ)/2^80,(4059770173:ℚ)/2^80⟩,
  ⟨(196197071:ℚ)/2^80,(196197072:ℚ)/2^80⟩,
  ⟨(9481642:ℚ)/2^80,(9481643:ℚ)/2^80⟩,
  ⟨(458220:ℚ)/2^80,(458221:ℚ)/2^80⟩,
  ⟨(22144:ℚ)/2^80,(22145:ℚ)/2^80⟩,
  ⟨(1070:ℚ)/2^80,(1071:ℚ)/2^80⟩,
  ⟨(51:ℚ)/2^80,(52:ℚ)/2^80⟩,
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
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (141:ℚ)/128,
  ⟨⟨(58423924367993231491376:ℚ)/2^80,(58423924367993231491377:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(111521666476651023:ℚ)/2^60,(111521666476651024:ℚ)/2^60⟩
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
end Point026

namespace Point027
/-- Exact original rational input. -/
def input : ℚ := (283:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(60558436233014819512183:ℚ)/2^80,(60558436233014819512184:ℚ)/2^80⟩,
  ⟨(3033539477349536413411:ℚ)/2^80,(3033539477349536413412:ℚ)/2^80⟩,
  ⟨(151958378271683642230:ℚ)/2^80,(151958378271683642231:ℚ)/2^80⟩,
  ⟨(7612015238099180594:ℚ)/2^80,(7612015238099180595:ℚ)/2^80⟩,
  ⟨(381306885767491421:ℚ)/2^80,(381306885767491422:ℚ)/2^80⟩,
  ⟨(19100715984642427:ℚ)/2^80,(19100715984642428:ℚ)/2^80⟩,
  ⟨(956807665278934:ℚ)/2^80,(956807665278935:ℚ)/2^80⟩,
  ⟨(47929140932339:ℚ)/2^80,(47929140932340:ℚ)/2^80⟩,
  ⟨(2400903163586:ℚ)/2^80,(2400903163587:ℚ)/2^80⟩,
  ⟨(120267876469:ℚ)/2^80,(120267876470:ℚ)/2^80⟩,
  ⟨(6024550398:ℚ)/2^80,(6024550399:ℚ)/2^80⟩,
  ⟨(301786383:ℚ)/2^80,(301786384:ℚ)/2^80⟩,
  ⟨(15117314:ℚ)/2^80,(15117315:ℚ)/2^80⟩,
  ⟨(757268:ℚ)/2^80,(757269:ℚ)/2^80⟩,
  ⟨(37933:ℚ)/2^80,(37934:ℚ)/2^80⟩,
  ⟨(1900:ℚ)/2^80,(1901:ℚ)/2^80⟩,
  ⟨(95:ℚ)/2^80,(96:ℚ)/2^80⟩,
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
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (283:ℚ)/256,
  ⟨⟨(60558436233014819512183:ℚ)/2^80,(60558436233014819512184:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(115602808807570125:ℚ)/2^60,(115602808807570126:ℚ)/2^60⟩
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
end Point027

namespace Point028
/-- Exact original rational input. -/
def input : ℚ := (71:ℚ)/64
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(62685042498536327577357:ℚ)/2^80,(62685042498536327577358:ℚ)/2^80⟩,
  ⟨(3250335536961142911418:ℚ)/2^80,(3250335536961142911419:ℚ)/2^80⟩,
  ⟨(168535916731318521332:ℚ)/2^80,(168535916731318521333:ℚ)/2^80⟩,
  ⟨(8738899386068367772:ℚ)/2^80,(8738899386068367773:ℚ)/2^80⟩,
  ⟨(453128116314656106:ℚ)/2^80,(453128116314656107:ℚ)/2^80⟩,
  ⟨(23495531957056242:ℚ)/2^80,(23495531957056243:ℚ)/2^80⟩,
  ⟨(1218286842217731:ℚ)/2^80,(1218286842217732:ℚ)/2^80⟩,
  ⟨(63170428855734:ℚ)/2^80,(63170428855735:ℚ)/2^80⟩,
  ⟨(3275503718445:ℚ)/2^80,(3275503718446:ℚ)/2^80⟩,
  ⟨(169840933548:ℚ)/2^80,(169840933550:ℚ)/2^80⟩,
  ⟨(8806566924:ℚ)/2^80,(8806566925:ℚ)/2^80⟩,
  ⟨(456636803:ℚ)/2^80,(456636804:ℚ)/2^80⟩,
  ⟨(23677463:ℚ)/2^80,(23677464:ℚ)/2^80⟩,
  ⟨(1227720:ℚ)/2^80,(1227721:ℚ)/2^80⟩,
  ⟨(63659:ℚ)/2^80,(63660:ℚ)/2^80⟩,
  ⟨(3300:ℚ)/2^80,(3301:ℚ)/2^80⟩,
  ⟨(171:ℚ)/2^80,(172:ℚ)/2^80⟩,
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
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (71:ℚ)/64,
  ⟨⟨(62685042498536327577357:ℚ)/2^80,(62685042498536327577358:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(119669555544806966:ℚ)/2^60,(119669555544806967:ℚ)/2^60⟩
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
end Point028

namespace Point029
/-- Exact original rational input. -/
def input : ℚ := (285:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(64803787003371989032308:ℚ)/2^80,(64803787003371989032309:ℚ)/2^80⟩,
  ⟨(3473770467833248949975:ℚ)/2^80,(3473770467833248949976:ℚ)/2^80⟩,
  ⟨(186209507517863622087:ℚ)/2^80,(186209507517863622088:ℚ)/2^80⟩,
  ⟨(9981655671013022256:ℚ)/2^80,(9981655671013022257:ℚ)/2^80⟩,
  ⟨(535061024878701747:ℚ)/2^80,(535061024878701748:ℚ)/2^80⟩,
  ⟨(28681644586843531:ℚ)/2^80,(28681644586843532:ℚ)/2^80⟩,
  ⟨(1537463388204181:ℚ)/2^80,(1537463388204182:ℚ)/2^80⟩,
  ⟨(82414858147728:ℚ)/2^80,(82414858147729:ℚ)/2^80⟩,
  ⟨(4417802007918:ℚ)/2^80,(4417802007919:ℚ)/2^80⟩,
  ⟨(236813786006:ℚ)/2^80,(236813786007:ℚ)/2^80⟩,
  ⟨(12694269490:ℚ)/2^80,(12694269491:ℚ)/2^80⟩,
  ⟨(680469159:ℚ)/2^80,(680469160:ℚ)/2^80⟩,
  ⟨(36476165:ℚ)/2^80,(36476166:ℚ)/2^80⟩,
  ⟨(1955284:ℚ)/2^80,(1955285:ℚ)/2^80⟩,
  ⟨(104811:ℚ)/2^80,(104812:ℚ)/2^80⟩,
  ⟨(5618:ℚ)/2^80,(5619:ℚ)/2^80⟩,
  ⟨(301:ℚ)/2^80,(302:ℚ)/2^80⟩,
  ⟨(16:ℚ)/2^80,(17:ℚ)/2^80⟩,
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
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (285:ℚ)/256,
  ⟨⟨(64803787003371989032308:ℚ)/2^80,(64803787003371989032309:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(123722007887927824:ℚ)/2^60,(123722007887927825:ℚ)/2^60⟩
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
end Point029

namespace Point030
/-- Exact original rational input. -/
def input : ℚ := (143:ℚ)/128
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(66914713262802352843515:ℚ)/2^80,(66914713262802352843516:ℚ)/2^80⟩,
  ⟨(3703766416760277832666:ℚ)/2^80,(3703766416760277832667:ℚ)/2^80⟩,
  ⟨(205005521222893606974:ℚ)/2^80,(205005521222893606975:ℚ)/2^80⟩,
  ⟨(11347169071377874924:ℚ)/2^80,(11347169071377874925:ℚ)/2^80⟩,
  ⟨(628072088821653593:ℚ)/2^80,(628072088821653594:ℚ)/2^80⟩,
  ⟨(34764137757656102:ℚ)/2^80,(34764137757656103:ℚ)/2^80⟩,
  ⟨(1924214267028935:ℚ)/2^80,(1924214267028936:ℚ)/2^80⟩,
  ⟨(106506324743298:ℚ)/2^80,(106506324743300:ℚ)/2^80⟩,
  ⟨(5895184026381:ℚ)/2^80,(5895184026382:ℚ)/2^80⟩,
  ⟨(326301698877:ℚ)/2^80,(326301698878:ℚ)/2^80⟩,
  ⟨(18060979642:ℚ)/2^80,(18060979643:ℚ)/2^80⟩,
  ⟨(999685220:ℚ)/2^80,(999685221:ℚ)/2^80⟩,
  ⟨(55333130:ℚ)/2^80,(55333131:ℚ)/2^80⟩,
  ⟨(3062719:ℚ)/2^80,(3062720:ℚ)/2^80⟩,
  ⟨(169523:ℚ)/2^80,(169524:ℚ)/2^80⟩,
  ⟨(9383:ℚ)/2^80,(9384:ℚ)/2^80⟩,
  ⟨(519:ℚ)/2^80,(520:ℚ)/2^80⟩,
  ⟨(28:ℚ)/2^80,(29:ℚ)/2^80⟩,
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
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (143:ℚ)/128,
  ⟨⟨(66914713262802352843515:ℚ)/2^80,(66914713262802352843516:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(127760265973101617:ℚ)/2^60,(127760265973101618:ℚ)/2^60⟩
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
end Point030

namespace Point031
/-- Exact original rational input. -/
def input : ℚ := (287:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(69017864471553415130555:ℚ)/2^80,(69017864471553415130556:ℚ)/2^80⟩,
  ⟨(3940246406294946351836:ℚ)/2^80,(3940246406294946351837:ℚ)/2^80⟩,
  ⟨(224949610672455500749:ℚ)/2^80,(224949610672455500750:ℚ)/2^80⟩,
  ⟨(12842427128630056212:ℚ)/2^80,(12842427128630056213:ℚ)/2^80⟩,
  ⟨(733177239387719599:ℚ)/2^80,(733177239387719600:ℚ)/2^80⟩,
  ⟨(41857264127107380:ℚ)/2^80,(41857264127107381:ℚ)/2^80⟩,
  ⟨(2389641230092686:ℚ)/2^80,(2389641230092687:ℚ)/2^80⟩,
  ⟨(136425189931626:ℚ)/2^80,(136425189931627:ℚ)/2^80⟩,
  ⟨(7788546754844:ℚ)/2^80,(7788546754845:ℚ)/2^80⟩,
  ⟨(444649998895:ℚ)/2^80,(444649998896:ℚ)/2^80⟩,
  ⟨(25385174890:ℚ)/2^80,(25385174891:ℚ)/2^80⟩,
  ⟨(1449245711:ℚ)/2^80,(1449245713:ℚ)/2^80⟩,
  ⟨(82737784:ℚ)/2^80,(82737785:ℚ)/2^80⟩,
  ⟨(4723519:ℚ)/2^80,(4723520:ℚ)/2^80⟩,
  ⟨(269666:ℚ)/2^80,(269667:ℚ)/2^80⟩,
  ⟨(15395:ℚ)/2^80,(15396:ℚ)/2^80⟩,
  ⟨(878:ℚ)/2^80,(879:ℚ)/2^80⟩,
  ⟨(50:ℚ)/2^80,(51:ℚ)/2^80⟩,
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
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (287:ℚ)/256,
  ⟨⟨(69017864471553415130555:ℚ)/2^80,(69017864471553415130556:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(131784428887946709:ℚ)/2^60,(131784428887946710:ℚ)/2^60⟩
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
end Point031

/-- Reusable proved logarithm bounds for these consecutive exact grid inputs. -/
def entries : Array CertifiedLogBound := #[⟨Point024.input, Point024.bounds, Point024.log_bounds⟩,
  ⟨Point025.input, Point025.bounds, Point025.log_bounds⟩,
  ⟨Point026.input, Point026.bounds, Point026.log_bounds⟩,
  ⟨Point027.input, Point027.bounds, Point027.log_bounds⟩,
  ⟨Point028.input, Point028.bounds, Point028.log_bounds⟩,
  ⟨Point029.input, Point029.bounds, Point029.log_bounds⟩,
  ⟨Point030.input, Point030.bounds, Point030.log_bounds⟩,
  ⟨Point031.input, Point031.bounds, Point031.log_bounds⟩]
end MatrixBounds.Numeric.LogGridData.Part003
