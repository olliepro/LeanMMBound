module

public import TabulatedLogBounds
public import FKLLog.GridTrace

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

namespace MatrixBounds.Numeric.LogGridData.Part005
set_option maxRecDepth 100000
set_option maxHeartbeats 16000000

namespace Point040
/-- Exact original rational input. -/
def input : ℚ := (37:ℚ)/32
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(87603320261929650341027:ℚ)/2^80,(87603320261929650341028:ℚ)/2^80⟩,
  ⟨(6348066685647076111668:ℚ)/2^80,(6348066685647076111669:ℚ)/2^80⟩,
  ⟨(460004832293266384903:ℚ)/2^80,(460004832293266384904:ℚ)/2^80⟩,
  ⟨(33333683499512056877:ℚ)/2^80,(33333683499512056878:ℚ)/2^80⟩,
  ⟨(2415484311558844701:ℚ)/2^80,(2415484311558844702:ℚ)/2^80⟩,
  ⟨(175035095040495992:ℚ)/2^80,(175035095040495993:ℚ)/2^80⟩,
  ⟨(12683702539166376:ℚ)/2^80,(12683702539166377:ℚ)/2^80⟩,
  ⟨(919108879649737:ℚ)/2^80,(919108879649738:ℚ)/2^80⟩,
  ⟨(66602092728241:ℚ)/2^80,(66602092728242:ℚ)/2^80⟩,
  ⟨(4826238603495:ℚ)/2^80,(4826238603496:ℚ)/2^80⟩,
  ⟨(349727435035:ℚ)/2^80,(349727435036:ℚ)/2^80⟩,
  ⟨(25342567756:ℚ)/2^80,(25342567757:ℚ)/2^80⟩,
  ⟨(1836417953:ℚ)/2^80,(1836417954:ℚ)/2^80⟩,
  ⟨(133073764:ℚ)/2^80,(133073765:ℚ)/2^80⟩,
  ⟨(9643026:ℚ)/2^80,(9643027:ℚ)/2^80⟩,
  ⟨(698769:ℚ)/2^80,(698771:ℚ)/2^80⟩,
  ⟨(50635:ℚ)/2^80,(50636:ℚ)/2^80⟩,
  ⟨(3669:ℚ)/2^80,(3670:ℚ)/2^80⟩,
  ⟨(265:ℚ)/2^80,(266:ℚ)/2^80⟩,
  ⟨(19:ℚ)/2^80,(20:ℚ)/2^80⟩,
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
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (37:ℚ)/32,
  ⟨⟨(87603320261929650341027:ℚ)/2^80,(87603320261929650341028:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(167383461231764585:ℚ)/2^60,(167383461231764586:ℚ)/2^60⟩
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
end Point040

namespace Point041
/-- Exact original rational input. -/
def input : ℚ := (297:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(89631028217359486732284:ℚ)/2^80,(89631028217359486732285:ℚ)/2^80⟩,
  ⟨(6645338439261734097691:ℚ)/2^80,(6645338439261734097693:ℚ)/2^80⟩,
  ⟨(492692361681249725145:ℚ)/2^80,(492692361681249725146:ℚ)/2^80⟩,
  ⟨(36528728442913632424:ℚ)/2^80,(36528728442913632425:ℚ)/2^80⟩,
  ⟨(2708278238986363344:ℚ)/2^80,(2708278238986363345:ℚ)/2^80⟩,
  ⟨(200794589147271061:ℚ)/2^80,(200794589147271062:ℚ)/2^80⟩,
  ⟨(14887121437681941:ℚ)/2^80,(14887121437681942:ℚ)/2^80⟩,
  ⟨(1103746797368823:ℚ)/2^80,(1103746797368824:ℚ)/2^80⟩,
  ⟨(81832945193710:ℚ)/2^80,(81832945193711:ℚ)/2^80⟩,
  ⟨(6067180385067:ℚ)/2^80,(6067180385068:ℚ)/2^80⟩,
  ⟨(449827117156:ℚ)/2^80,(449827117157:ℚ)/2^80⟩,
  ⟨(33350654255:ℚ)/2^80,(33350654256:ℚ)/2^80⟩,
  ⟨(2472652485:ℚ)/2^80,(2472652486:ℚ)/2^80⟩,
  ⟨(183325048:ℚ)/2^80,(183325049:ℚ)/2^80⟩,
  ⟨(13591911:ℚ)/2^80,(13591912:ℚ)/2^80⟩,
  ⟨(1007718:ℚ)/2^80,(1007719:ℚ)/2^80⟩,
  ⟨(74713:ℚ)/2^80,(74714:ℚ)/2^80⟩,
  ⟨(5539:ℚ)/2^80,(5540:ℚ)/2^80⟩,
  ⟨(410:ℚ)/2^80,(411:ℚ)/2^80⟩,
  ⟨(30:ℚ)/2^80,(31:ℚ)/2^80⟩,
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
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (297:ℚ)/256,
  ⟨⟨(89631028217359486732284:ℚ)/2^80,(89631028217359486732285:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(171271901695441503:ℚ)/2^60,(171271901695441504:ℚ)/2^60⟩
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
end Point041

namespace Point042
/-- Exact original rational input. -/
def input : ℚ := (149:ℚ)/128
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(91651415927462861620323:ℚ)/2^80,(91651415927462861620324:ℚ)/2^80⟩,
  ⟨(6948302290529675429699:ℚ)/2^80,(6948302290529675429700:ℚ)/2^80⟩,
  ⟨(526766599643043985645:ℚ)/2^80,(526766599643043985646:ℚ)/2^80⟩,
  ⟨(39935373980158569308:ℚ)/2^80,(39935373980158569309:ℚ)/2^80⟩,
  ⟨(3027591529181696590:ℚ)/2^80,(3027591529181696591:ℚ)/2^80⟩,
  ⟨(229528599685254976:ℚ)/2^80,(229528599685254977:ℚ)/2^80⟩,
  ⟨(17401085174694420:ℚ)/2^80,(17401085174694421:ℚ)/2^80⟩,
  ⟨(1319215843568891:ℚ)/2^80,(1319215843568892:ℚ)/2^80⟩,
  ⟨(100012753483562:ℚ)/2^80,(100012753483563:ℚ)/2^80⟩,
  ⟨(7582194307418:ℚ)/2^80,(7582194307419:ℚ)/2^80⟩,
  ⟨(574823395147:ℚ)/2^80,(574823395148:ℚ)/2^80⟩,
  ⟨(43578668946:ℚ)/2^80,(43578668947:ℚ)/2^80⟩,
  ⟨(3303798006:ℚ)/2^80,(3303798007:ℚ)/2^80⟩,
  ⟨(250468440:ℚ)/2^80,(250468441:ℚ)/2^80⟩,
  ⟨(18988582:ℚ)/2^80,(18988583:ℚ)/2^80⟩,
  ⟨(1439567:ℚ)/2^80,(1439568:ℚ)/2^80⟩,
  ⟨(109136:ℚ)/2^80,(109137:ℚ)/2^80⟩,
  ⟨(8273:ℚ)/2^80,(8274:ℚ)/2^80⟩,
  ⟨(627:ℚ)/2^80,(628:ℚ)/2^80⟩,
  ⟨(47:ℚ)/2^80,(48:ℚ)/2^80⟩,
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
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (149:ℚ)/128,
  ⟨⟨(91651415927462861620323:ℚ)/2^80,(91651415927462861620324:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(175147271746350727:ℚ)/2^60,(175147271746350728:ℚ)/2^60⟩
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
end Point042

namespace Point043
/-- Exact original rational input. -/
def input : ℚ := (299:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(93664522961133431553811:ℚ)/2^80,(93664522961133431553812:ℚ)/2^80⟩,
  ⟨(7256890968159887489754:ℚ)/2^80,(7256890968159887489755:ℚ)/2^80⟩,
  ⟨(562245606542117409116:ℚ)/2^80,(562245606542117409117:ℚ)/2^80⟩,
  ⟨(43561371317677565030:ℚ)/2^80,(43561371317677565031:ℚ)/2^80⟩,
  ⟨(3375025165153396930:ℚ)/2^80,(3375025165153396931:ℚ)/2^80⟩,
  ⟨(261488436219092014:ℚ)/2^80,(261488436219092015:ℚ)/2^80⟩,
  ⟨(20259464427785507:ℚ)/2^80,(20259464427785508:ℚ)/2^80⟩,
  ⟨(1569652198909507:ℚ)/2^80,(1569652198909508:ℚ)/2^80⟩,
  ⟨(121612692888484:ℚ)/2^80,(121612692888485:ℚ)/2^80⟩,
  ⟨(9422244674242:ℚ)/2^80,(9422244674243:ℚ)/2^80⟩,
  ⟨(730011749535:ℚ)/2^80,(730011749536:ℚ)/2^80⟩,
  ⟨(56559468882:ℚ)/2^80,(56559468883:ℚ)/2^80⟩,
  ⟨(4382084976:ℚ)/2^80,(4382084977:ℚ)/2^80⟩,
  ⟨(339512890:ℚ)/2^80,(339512891:ℚ)/2^80⟩,
  ⟨(26304602:ℚ)/2^80,(26304603:ℚ)/2^80⟩,
  ⟨(2038014:ℚ)/2^80,(2038015:ℚ)/2^80⟩,
  ⟨(157900:ℚ)/2^80,(157901:ℚ)/2^80⟩,
  ⟨(12233:ℚ)/2^80,(12234:ℚ)/2^80⟩,
  ⟨(947:ℚ)/2^80,(948:ℚ)/2^80⟩,
  ⟨(73:ℚ)/2^80,(74:ℚ)/2^80⟩,
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
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (299:ℚ)/256,
  ⟨⟨(93664522961133431553811:ℚ)/2^80,(93664522961133431553812:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(179009658958693689:ℚ)/2^60,(179009658958693690:ℚ)/2^60⟩
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
end Point043

namespace Point044
/-- Exact original rational input. -/
def input : ℚ := (75:ℚ)/64
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(95670388602596553394013:ℚ)/2^80,(95670388602596553394014:ℚ)/2^80⟩,
  ⟨(7571037946968072570749:ℚ)/2^80,(7571037946968072570750:ℚ)/2^80⟩,
  ⟨(599146887889559699843:ℚ)/2^80,(599146887889559699844:ℚ)/2^80⟩,
  ⟨(47414501919317674088:ℚ)/2^80,(47414501919317674089:ℚ)/2^80⟩,
  ⟨(3752226770593484999:ℚ)/2^80,(3752226770593485000:ℚ)/2^80⟩,
  ⟨(296938809183657086:ℚ)/2^80,(296938809183657087:ℚ)/2^80⟩,
  ⟨(23498754683598762:ℚ)/2^80,(23498754683598763:ℚ)/2^80⟩,
  ⟨(1859613679997024:ℚ)/2^80,(1859613679997025:ℚ)/2^80⟩,
  ⟨(147163672517750:ℚ)/2^80,(147163672517751:ℚ)/2^80⟩,
  ⟨(11646046026584:ℚ)/2^80,(11646046026585:ℚ)/2^80⟩,
  ⟨(921629541672:ℚ)/2^80,(921629541673:ℚ)/2^80⟩,
  ⟨(72934711930:ℚ)/2^80,(72934711931:ℚ)/2^80⟩,
  ⟨(5771811735:ℚ)/2^80,(5771811736:ℚ)/2^80⟩,
  ⟨(456762079:ℚ)/2^80,(456762080:ℚ)/2^80⟩,
  ⟨(36146639:ℚ)/2^80,(36146640:ℚ)/2^80⟩,
  ⟨(2860525:ℚ)/2^80,(2860526:ℚ)/2^80⟩,
  ⟨(226372:ℚ)/2^80,(226373:ℚ)/2^80⟩,
  ⟨(17914:ℚ)/2^80,(17915:ℚ)/2^80⟩,
  ⟨(1417:ℚ)/2^80,(1418:ℚ)/2^80⟩,
  ⟨(112:ℚ)/2^80,(113:ℚ)/2^80⟩,
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
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (75:ℚ)/64,
  ⟨⟨(95670388602596553394013:ℚ)/2^80,(95670388602596553394014:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(182859150029464524:ℚ)/2^60,(182859150029464526:ℚ)/2^60⟩
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
end Point044

namespace Point045
/-- Exact original rational input. -/
def input : ℚ := (301:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(97669051853964655048075:ℚ)/2^80,(97669051853964655048076:ℚ)/2^80⟩,
  ⟨(7890677438830178594548:ℚ)/2^80,(7890677438830178594549:ℚ)/2^80⟩,
  ⟨(637487405291486600995:ℚ)/2^80,(637487405291486600996:ℚ)/2^80⟩,
  ⟨(51502573138450443527:ℚ)/2^80,(51502573138450443528:ℚ)/2^80⟩,
  ⟨(4160890109928671380:ℚ)/2^80,(4160890109928671381:ℚ)/2^80⟩,
  ⟨(336158087875745443:ℚ)/2^80,(336158087875745444:ℚ)/2^80⟩,
  ⟨(27158193814018931:ℚ)/2^80,(27158193814018932:ℚ)/2^80⟩,
  ⟨(2194109015495245:ℚ)/2^80,(2194109015495246:ℚ)/2^80⟩,
  ⟨(177261949187228:ℚ)/2^80,(177261949187229:ℚ)/2^80⟩,
  ⟨(14320983327513:ℚ)/2^80,(14320983327515:ℚ)/2^80⟩,
  ⟨(1156991471702:ℚ)/2^80,(1156991471703:ℚ)/2^80⟩,
  ⟨(93473278683:ℚ)/2^80,(93473278684:ℚ)/2^80⟩,
  ⟨(7551701150:ℚ)/2^80,(7551701151:ℚ)/2^80⟩,
  ⟨(610101529:ℚ)/2^80,(610101530:ℚ)/2^80⟩,
  ⟨(49290069:ℚ)/2^80,(49290070:ℚ)/2^80⟩,
  ⟨(3982142:ℚ)/2^80,(3982143:ℚ)/2^80⟩,
  ⟨(321717:ℚ)/2^80,(321718:ℚ)/2^80⟩,
  ⟨(25991:ℚ)/2^80,(25992:ℚ)/2^80⟩,
  ⟨(2099:ℚ)/2^80,(2100:ℚ)/2^80⟩,
  ⟨(169:ℚ)/2^80,(170:ℚ)/2^80⟩,
  ⟨(13:ℚ)/2^80,(14:ℚ)/2^80⟩,
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
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (301:ℚ)/256,
  ⟨⟨(97669051853964655048075:ℚ)/2^80,(97669051853964655048076:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(186695830790126763:ℚ)/2^60,(186695830790126764:ℚ)/2^60⟩
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
end Point045

namespace Point046
/-- Exact original rational input. -/
def input : ℚ := (151:ℚ)/128
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(99660551437765129097641:ℚ)/2^80,(99660551437765129097642:ℚ)/2^80⟩,
  ⟨(8215744383758415660378:ℚ)/2^80,(8215744383758415660380:ℚ)/2^80⟩,
  ⟨(677283587191553979170:ℚ)/2^80,(677283587191553979172:ℚ)/2^80⟩,
  ⟨(55833413997870041293:ℚ)/2^80,(55833413997870041294:ℚ)/2^80⟩,
  ⟨(4602754558964196952:ℚ)/2^80,(4602754558964196953:ℚ)/2^80⟩,
  ⟨(379438547871600465:ℚ)/2^80,(379438547871600466:ℚ)/2^80⟩,
  ⟨(31279880290490360:ℚ)/2^80,(31279880290490361:ℚ)/2^80⟩,
  ⟨(2578628124305656:ℚ)/2^80,(2578628124305658:ℚ)/2^80⟩,
  ⟨(212575078347778:ℚ)/2^80,(212575078347779:ℚ)/2^80⟩,
  ⟨(17524110401429:ℚ)/2^80,(17524110401430:ℚ)/2^80⟩,
  ⟨(1444639925565:ℚ)/2^80,(1444639925566:ℚ)/2^80⟩,
  ⟨(119092180243:ℚ)/2^80,(119092180244:ℚ)/2^80⟩,
  ⟨(9817634930:ℚ)/2^80,(9817634931:ℚ)/2^80⟩,
  ⟨(809339080:ℚ)/2^80,(809339081:ℚ)/2^80⟩,
  ⟨(66719709:ℚ)/2^80,(66719710:ℚ)/2^80⟩,
  ⟨(5500191:ℚ)/2^80,(5500192:ℚ)/2^80⟩,
  ⟨(453420:ℚ)/2^80,(453421:ℚ)/2^80⟩,
  ⟨(37378:ℚ)/2^80,(37379:ℚ)/2^80⟩,
  ⟨(3081:ℚ)/2^80,(3082:ℚ)/2^80⟩,
  ⟨(253:ℚ)/2^80,(255:ℚ)/2^80⟩,
  ⟨(20:ℚ)/2^80,(22:ℚ)/2^80⟩,
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
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (151:ℚ)/128,
  ⟨⟨(99660551437765129097641:ℚ)/2^80,(99660551437765129097642:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(190519786218096372:ℚ)/2^60,(190519786218096373:ℚ)/2^60⟩
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
end Point046

namespace Point047
/-- Exact original rational input. -/
def input : ℚ := (303:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(101644925799441093401055:ℚ)/2^80,(101644925799441093401056:ℚ)/2^80⟩,
  ⟨(8546174441097909463058:ℚ)/2^80,(8546174441097909463059:ℚ)/2^80⟩,
  ⟨(718551339412525482582:ℚ)/2^80,(718551339412525482583:ℚ)/2^80⟩,
  ⟨(60414871113396596925:ℚ)/2^80,(60414871113396596926:ℚ)/2^80⟩,
  ⟨(5079604547995778274:ℚ)/2^80,(5079604547995778275:ℚ)/2^80⟩,
  ⟨(427086607792131625:ℚ)/2^80,(427086607792131626:ℚ)/2^80⟩,
  ⟨(35908891889499438:ℚ)/2^80,(35908891889499440:ℚ)/2^80⟩,
  ⟨(3019173378902457:ℚ)/2^80,(3019173378902458:ℚ)/2^80⟩,
  ⟨(253848208959598:ℚ)/2^80,(253848208959599:ℚ)/2^80⟩,
  ⟨(21343230449196:ℚ)/2^80,(21343230449198:ℚ)/2^80⟩,
  ⟨(1794511325782:ℚ)/2^80,(1794511325783:ℚ)/2^80⟩,
  ⟨(150880200915:ℚ)/2^80,(150880200916:ℚ)/2^80⟩,
  ⟨(12685812957:ℚ)/2^80,(12685812958:ℚ)/2^80⟩,
  ⟨(1066606813:ℚ)/2^80,(1066606815:ℚ)/2^80⟩,
  ⟨(89678927:ℚ)/2^80,(89678928:ℚ)/2^80⟩,
  ⟨(7540088:ℚ)/2^80,(7540089:ℚ)/2^80⟩,
  ⟨(633960:ℚ)/2^80,(633961:ℚ)/2^80⟩,
  ⟨(53302:ℚ)/2^80,(53303:ℚ)/2^80⟩,
  ⟨(4481:ℚ)/2^80,(4482:ℚ)/2^80⟩,
  ⟨(376:ℚ)/2^80,(377:ℚ)/2^80⟩,
  ⟨(31:ℚ)/2^80,(32:ℚ)/2^80⟩,
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
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (303:ℚ)/256,
  ⟨⟨(101644925799441093401055:ℚ)/2^80,(101644925799441093401056:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(194331100448035002:ℚ)/2^60,(194331100448035003:ℚ)/2^60⟩
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
end Point047

/-- Reusable proved logarithm bounds for these consecutive exact grid inputs. -/
def entries : Array CertifiedLogBound := #[⟨Point040.input, Point040.bounds, Point040.log_bounds⟩,
  ⟨Point041.input, Point041.bounds, Point041.log_bounds⟩,
  ⟨Point042.input, Point042.bounds, Point042.log_bounds⟩,
  ⟨Point043.input, Point043.bounds, Point043.log_bounds⟩,
  ⟨Point044.input, Point044.bounds, Point044.log_bounds⟩,
  ⟨Point045.input, Point045.bounds, Point045.log_bounds⟩,
  ⟨Point046.input, Point046.bounds, Point046.log_bounds⟩,
  ⟨Point047.input, Point047.bounds, Point047.log_bounds⟩]
end MatrixBounds.Numeric.LogGridData.Part005
