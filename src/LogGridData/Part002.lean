module

public import TabulatedLogBounds
public import FKLLog.GridTrace

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

namespace MatrixBounds.Numeric.LogGridData.Part002
set_option maxRecDepth 100000
set_option maxHeartbeats 16000000

namespace Point016
/-- Exact original rational input. -/
def input : ℚ := (17:ℚ)/16
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(36634115745897853778975:ℚ)/2^80,(36634115745897853778976:ℚ)/2^80⟩,
  ⟨(1110124719572662235726:ℚ)/2^80,(1110124719572662235727:ℚ)/2^80⟩,
  ⟨(33640143017353401082:ℚ)/2^80,(33640143017353401083:ℚ)/2^80⟩,
  ⟨(1019398273253133366:ℚ)/2^80,(1019398273253133367:ℚ)/2^80⟩,
  ⟨(30890856765246465:ℚ)/2^80,(30890856765246466:ℚ)/2^80⟩,
  ⟨(936086568643832:ℚ)/2^80,(936086568643833:ℚ)/2^80⟩,
  ⟨(28366259655873:ℚ)/2^80,(28366259655874:ℚ)/2^80⟩,
  ⟨(859583625935:ℚ)/2^80,(859583625936:ℚ)/2^80⟩,
  ⟨(26047988664:ℚ)/2^80,(26047988665:ℚ)/2^80⟩,
  ⟨(789332989:ℚ)/2^80,(789332990:ℚ)/2^80⟩,
  ⟨(23919181:ℚ)/2^80,(23919182:ℚ)/2^80⟩,
  ⟨(724823:ℚ)/2^80,(724824:ℚ)/2^80⟩,
  ⟨(21964:ℚ)/2^80,(21965:ℚ)/2^80⟩,
  ⟨(665:ℚ)/2^80,(666:ℚ)/2^80⟩,
  ⟨(20:ℚ)/2^80,(21:ℚ)/2^80⟩,
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
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (17:ℚ)/16,
  ⟨⟨(36634115745897853778975:ℚ)/2^80,(36634115745897853778976:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(69895430200825138:ℚ)/2^60,(69895430200825140:ℚ)/2^60⟩
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
end Point016

namespace Point017
/-- Exact original rational input. -/
def input : ℚ := (273:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(38850168116160105803412:ℚ)/2^80,(38850168116160105803413:ℚ)/2^80⟩,
  ⟨(1248493115264124383096:ℚ)/2^80,(1248493115264124383097:ℚ)/2^80⟩,
  ⟨(40121706917750689059:ℚ)/2^80,(40121706917750689060:ℚ)/2^80⟩,
  ⟨(1289355420797281122:ℚ)/2^80,(1289355420797281123:ℚ)/2^80⟩,
  ⟨(41434862294052512:ℚ)/2^80,(41434862294052513:ℚ)/2^80⟩,
  ⟨(1331555120980893:ℚ)/2^80,(1331555120980894:ℚ)/2^80⟩,
  ⟨(42790996326418:ℚ)/2^80,(42790996326419:ℚ)/2^80⟩,
  ⟨(1375135987805:ℚ)/2^80,(1375135987806:ℚ)/2^80⟩,
  ⟨(44191515676:ℚ)/2^80,(44191515677:ℚ)/2^80⟩,
  ⟨(1420143225:ℚ)/2^80,(1420143226:ℚ)/2^80⟩,
  ⟨(45637873:ℚ)/2^80,(45637874:ℚ)/2^80⟩,
  ⟨(1466623:ℚ)/2^80,(1466624:ℚ)/2^80⟩,
  ⟨(47131:ℚ)/2^80,(47132:ℚ)/2^80⟩,
  ⟨(1514:ℚ)/2^80,(1515:ℚ)/2^80⟩,
  ⟨(48:ℚ)/2^80,(49:ℚ)/2^80⟩,
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
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (273:ℚ)/256,
  ⟨⟨(38850168116160105803412:ℚ)/2^80,(38850168116160105803413:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(74126339552986898:ℚ)/2^60,(74126339552986900:ℚ)/2^60⟩
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
end Point017

namespace Point018
/-- Exact original rational input. -/
def input : ℚ := (137:ℚ)/128
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(41057858024647783291907:ℚ)/2^80,(41057858024647783291908:ℚ)/2^80⟩,
  ⟨(1394417819705019055196:ℚ)/2^80,(1394417819705019055197:ℚ)/2^80⟩,
  ⟨(47357586329604420742:ℚ)/2^80,(47357586329604420743:ℚ)/2^80⟩,
  ⟨(1608370856477131270:ℚ)/2^80,(1608370856477131271:ℚ)/2^80⟩,
  ⟨(54623915880355401:ℚ)/2^80,(54623915880355402:ℚ)/2^80⟩,
  ⟨(1855151860087541:ℚ)/2^80,(1855151860087542:ℚ)/2^80⟩,
  ⟨(63005157512407:ℚ)/2^80,(63005157512408:ℚ)/2^80⟩,
  ⟨(2139797802308:ℚ)/2^80,(2139797802309:ℚ)/2^80⟩,
  ⟨(72672378191:ℚ)/2^80,(72672378192:ℚ)/2^80⟩,
  ⟨(2468118504:ℚ)/2^80,(2468118505:ℚ)/2^80⟩,
  ⟨(83822892:ℚ)/2^80,(83822893:ℚ)/2^80⟩,
  ⟨(2846815:ℚ)/2^80,(2846816:ℚ)/2^80⟩,
  ⟨(96684:ℚ)/2^80,(96685:ℚ)/2^80⟩,
  ⟨(3283:ℚ)/2^80,(3284:ℚ)/2^80⟩,
  ⟨(111:ℚ)/2^80,(112:ℚ)/2^80⟩,
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
def trace : ScaledLogTrace := ⟨0, (137:ℚ)/128,
  ⟨⟨(41057858024647783291907:ℚ)/2^80,(41057858024647783291908:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(78341779366587918:ℚ)/2^60,(78341779366587919:ℚ)/2^60⟩
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
end Point018

namespace Point019
/-- Exact original rational input. -/
def input : ℚ := (275:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(43257232716907635253140:ℚ)/2^80,(43257232716907635253141:ℚ)/2^80⟩,
  ⟨(1547810586857335348040:ℚ)/2^80,(1547810586857335348041:ℚ)/2^80⟩,
  ⟨(55383053013727630155:ℚ)/2^80,(55383053013727630156:ℚ)/2^80⟩,
  ⟨(1981691162449764544:ℚ)/2^80,(1981691162449764545:ℚ)/2^80⟩,
  ⟨(70907970031159183:ℚ)/2^80,(70907970031159184:ℚ)/2^80⟩,
  ⟨(2537196667781590:ℚ)/2^80,(2537196667781591:ℚ)/2^80⟩,
  ⟨(90784814854708:ℚ)/2^80,(90784814854709:ℚ)/2^80⟩,
  ⟨(3248420870507:ℚ)/2^80,(3248420870508:ℚ)/2^80⟩,
  ⟨(116233515140:ℚ)/2^80,(116233515141:ℚ)/2^80⟩,
  ⟨(4159014666:ℚ)/2^80,(4159014667:ℚ)/2^80⟩,
  ⟨(148815967:ℚ)/2^80,(148815968:ℚ)/2^80⟩,
  ⟨(5324865:ℚ)/2^80,(5324866:ℚ)/2^80⟩,
  ⟨(190531:ℚ)/2^80,(190532:ℚ)/2^80⟩,
  ⟨(6817:ℚ)/2^80,(6818:ℚ)/2^80⟩,
  ⟨(243:ℚ)/2^80,(244:ℚ)/2^80⟩,
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
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (275:ℚ)/256,
  ⟨⟨(43257232716907635253140:ℚ)/2^80,(43257232716907635253141:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(82541862352666991:ℚ)/2^60,(82541862352666992:ℚ)/2^60⟩
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
end Point019

namespace Point020
/-- Exact original rational input. -/
def input : ℚ := (69:ℚ)/64
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(45448339083256735891209:ℚ)/2^80,(45448339083256735891210:ℚ)/2^80⟩,
  ⟨(1708584176062283304180:ℚ)/2^80,(1708584176062283304181:ℚ)/2^80⟩,
  ⟨(64232487821890349781:ℚ)/2^80,(64232487821890349782:ℚ)/2^80⟩,
  ⟨(2414755181274073300:ℚ)/2^80,(2414755181274073301:ℚ)/2^80⟩,
  ⟨(90780269972709522:ℚ)/2^80,(90780269972709523:ℚ)/2^80⟩,
  ⟨(3412792104237200:ℚ)/2^80,(3412792104237201:ℚ)/2^80⟩,
  ⟨(128300455046511:ℚ)/2^80,(128300455046512:ℚ)/2^80⟩,
  ⟨(4823325377688:ℚ)/2^80,(4823325377689:ℚ)/2^80⟩,
  ⟨(181328021717:ℚ)/2^80,(181328021718:ℚ)/2^80⟩,
  ⟨(6816842921:ℚ)/2^80,(6816842922:ℚ)/2^80⟩,
  ⟨(256272290:ℚ)/2^80,(256272291:ℚ)/2^80⟩,
  ⟨(9634296:ℚ)/2^80,(9634297:ℚ)/2^80⟩,
  ⟨(362191:ℚ)/2^80,(362192:ℚ)/2^80⟩,
  ⟨(13616:ℚ)/2^80,(13617:ℚ)/2^80⟩,
  ⟨(511:ℚ)/2^80,(512:ℚ)/2^80⟩,
  ⟨(19:ℚ)/2^80,(20:ℚ)/2^80⟩,
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
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (69:ℚ)/64,
  ⟨⟨(45448339083256735891209:ℚ)/2^80,(45448339083256735891210:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(86726699994914057:ℚ)/2^60,(86726699994914058:ℚ)/2^60⟩
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
end Point020

namespace Point021
/-- Exact original rational input. -/
def input : ℚ := (277:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(47631223662114845532513:ℚ)/2^80,(47631223662114845532514:ℚ)/2^80⟩,
  ⟨(1876652339407901981581:ℚ)/2^80,(1876652339407901981582:ℚ)/2^80⟩,
  ⟨(73939397987928595897:ℚ)/2^80,(73939397987928595898:ℚ)/2^80⟩,
  ⟨(2913184536109757061:ℚ)/2^80,(2913184536109757062:ℚ)/2^80⟩,
  ⟨(114778377595318758:ℚ)/2^80,(114778377595318759:ℚ)/2^80⟩,
  ⟨(4522225008445954:ℚ)/2^80,(4522225008445955:ℚ)/2^80⟩,
  ⟨(178173968437833:ℚ)/2^80,(178173968437834:ℚ)/2^80⟩,
  ⟨(7019987499426:ℚ)/2^80,(7019987499427:ℚ)/2^80⟩,
  ⟨(276584873335:ℚ)/2^80,(276584873336:ℚ)/2^80⟩,
  ⟨(10897340225:ℚ)/2^80,(10897340226:ℚ)/2^80⟩,
  ⟨(429351115:ℚ)/2^80,(429351116:ℚ)/2^80⟩,
  ⟨(16916272:ℚ)/2^80,(16916273:ℚ)/2^80⟩,
  ⟨(666494:ℚ)/2^80,(666495:ℚ)/2^80⟩,
  ⟨(26259:ℚ)/2^80,(26260:ℚ)/2^80⟩,
  ⟨(1034:ℚ)/2^80,(1035:ℚ)/2^80⟩,
  ⟨(40:ℚ)/2^80,(41:ℚ)/2^80⟩,
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
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (277:ℚ)/256,
  ⟨⟨(47631223662114845532513:ℚ)/2^80,(47631223662114845532514:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(90896402567425795:ℚ)/2^60,(90896402567425796:ℚ)/2^60⟩
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
end Point021

namespace Point022
/-- Exact original rational input. -/
def input : ℚ := (139:ℚ)/128
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(49805932643299329295010:ℚ)/2^80,(49805932643299329295011:ℚ)/2^80⟩,
  ⟨(2051929809274504203165:ℚ)/2^80,(2051929809274504203166:ℚ)/2^80⟩,
  ⟨(84536434089960847321:ℚ)/2^80,(84536434089960847322:ℚ)/2^80⟩,
  ⟨(3482774438163180975:ℚ)/2^80,(3482774438163180976:ℚ)/2^80⟩,
  ⟨(143485089212715321:ℚ)/2^80,(143485089212715322:ℚ)/2^80⟩,
  ⟨(5911370716628721:ℚ)/2^80,(5911370716628722:ℚ)/2^80⟩,
  ⟨(243539617539010:ℚ)/2^80,(243539617539012:ℚ)/2^80⟩,
  ⟨(10033467389247:ℚ)/2^80,(10033467389248:ℚ)/2^80⟩,
  ⟨(413363825025:ℚ)/2^80,(413363825026:ℚ)/2^80⟩,
  ⟨(17029970319:ℚ)/2^80,(17029970320:ℚ)/2^80⟩,
  ⟨(701609264:ℚ)/2^80,(701609265:ℚ)/2^80⟩,
  ⟨(28905250:ℚ)/2^80,(28905251:ℚ)/2^80⟩,
  ⟨(1190852:ℚ)/2^80,(1190854:ℚ)/2^80⟩,
  ⟨(49061:ℚ)/2^80,(49062:ℚ)/2^80⟩,
  ⟨(2021:ℚ)/2^80,(2022:ℚ)/2^80⟩,
  ⟨(83:ℚ)/2^80,(84:ℚ)/2^80⟩,
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
def trace : ScaledLogTrace := ⟨0, (139:ℚ)/128,
  ⟨⟨(49805932643299329295010:ℚ)/2^80,(49805932643299329295011:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(95051079152141302:ℚ)/2^60,(95051079152141303:ℚ)/2^60⟩
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
end Point022

namespace Point023
/-- Exact original rational input. -/
def input : ℚ := (279:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(51972511871283123398583:ℚ)/2^80,(51972511871283123398584:ℚ)/2^80⟩,
  ⟨(2234332286055162314331:ℚ)/2^80,(2234332286055162314332:ℚ)/2^80⟩,
  ⟨(96055406690221931270:ℚ)/2^80,(96055406690221931271:ℚ)/2^80⟩,
  ⟨(4129484773598326017:ℚ)/2^80,(4129484773598326018:ℚ)/2^80⟩,
  ⟨(177529251949086912:ℚ)/2^80,(177529251949086913:ℚ)/2^80⟩,
  ⟨(7632098681923362:ℚ)/2^80,(7632098681923363:ℚ)/2^80⟩,
  ⟨(328108915297639:ℚ)/2^80,(328108915297640:ℚ)/2^80⟩,
  ⟨(14105616919337:ℚ)/2^80,(14105616919338:ℚ)/2^80⟩,
  ⟨(606409699335:ℚ)/2^80,(606409699337:ℚ)/2^80⟩,
  ⟨(26069949691:ℚ)/2^80,(26069949692:ℚ)/2^80⟩,
  ⟨(1120764192:ℚ)/2^80,(1120764193:ℚ)/2^80⟩,
  ⟨(48182385:ℚ)/2^80,(48182386:ℚ)/2^80⟩,
  ⟨(2071392:ℚ)/2^80,(2071393:ℚ)/2^80⟩,
  ⟨(89050:ℚ)/2^80,(89051:ℚ)/2^80⟩,
  ⟨(3828:ℚ)/2^80,(3829:ℚ)/2^80⟩,
  ⟨(164:ℚ)/2^80,(165:ℚ)/2^80⟩,
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
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (279:ℚ)/256,
  ⟨⟨(51972511871283123398583:ℚ)/2^80,(51972511871283123398584:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(99190837655964731:ℚ)/2^60,(99190837655964732:ℚ)/2^60⟩
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
end Point023

/-- Reusable proved logarithm bounds for these consecutive exact grid inputs. -/
def entries : Array CertifiedLogBound := #[⟨Point016.input, Point016.bounds, Point016.log_bounds⟩,
  ⟨Point017.input, Point017.bounds, Point017.log_bounds⟩,
  ⟨Point018.input, Point018.bounds, Point018.log_bounds⟩,
  ⟨Point019.input, Point019.bounds, Point019.log_bounds⟩,
  ⟨Point020.input, Point020.bounds, Point020.log_bounds⟩,
  ⟨Point021.input, Point021.bounds, Point021.log_bounds⟩,
  ⟨Point022.input, Point022.bounds, Point022.log_bounds⟩,
  ⟨Point023.input, Point023.bounds, Point023.log_bounds⟩]
end MatrixBounds.Numeric.LogGridData.Part002
