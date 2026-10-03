module

public import TabulatedLogBounds
public import FKLLog.GridTrace

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

namespace MatrixBounds.Numeric.LogGridData.Part006
set_option maxRecDepth 100000
set_option maxHeartbeats 16000000

namespace Point048
/-- Exact original rational input. -/
def input : ℚ := (19:ℚ)/16
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(103622213109825357831957:ℚ)/2^80,(103622213109825357831958:ℚ)/2^80⟩,
  ⟨(8881903980842173528453:ℚ)/2^80,(8881903980842173528454:ℚ)/2^80⟩,
  ⟨(761306055500757731010:ℚ)/2^80,(761306055500757731011:ℚ)/2^80⟩,
  ⟨(65254804757207805515:ℚ)/2^80,(65254804757207805516:ℚ)/2^80⟩,
  ⟨(5593268979189240472:ℚ)/2^80,(5593268979189240473:ℚ)/2^80⟩,
  ⟨(479423055359077754:ℚ)/2^80,(479423055359077755:ℚ)/2^80⟩,
  ⟨(41093404745063807:ℚ)/2^80,(41093404745063808:ℚ)/2^80⟩,
  ⟨(3522291835291183:ℚ)/2^80,(3522291835291184:ℚ)/2^80⟩,
  ⟨(301910728739244:ℚ)/2^80,(301910728739245:ℚ)/2^80⟩,
  ⟨(25878062463363:ℚ)/2^80,(25878062463364:ℚ)/2^80⟩,
  ⟨(2218119639716:ℚ)/2^80,(2218119639717:ℚ)/2^80⟩,
  ⟨(190124540547:ℚ)/2^80,(190124540548:ℚ)/2^80⟩,
  ⟨(16296389189:ℚ)/2^80,(16296389190:ℚ)/2^80⟩,
  ⟨(1396833359:ℚ)/2^80,(1396833360:ℚ)/2^80⟩,
  ⟨(119728573:ℚ)/2^80,(119728574:ℚ)/2^80⟩,
  ⟨(10262449:ℚ)/2^80,(10262450:ℚ)/2^80⟩,
  ⟨(879638:ℚ)/2^80,(879639:ℚ)/2^80⟩,
  ⟨(75397:ℚ)/2^80,(75398:ℚ)/2^80⟩,
  ⟨(6462:ℚ)/2^80,(6463:ℚ)/2^80⟩,
  ⟨(553:ℚ)/2^80,(554:ℚ)/2^80⟩,
  ⟨(47:ℚ)/2^80,(48:ℚ)/2^80⟩,
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
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (19:ℚ)/16,
  ⟨⟨(103622213109825357831957:ℚ)/2^80,(103622213109825357831958:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(198129856782957176:ℚ)/2^60,(198129856782957178:ℚ)/2^60⟩
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
end Point048

namespace Point049
/-- Exact original rational input. -/
def input : ℚ := (305:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(105592451267587931480575:ℚ)/2^80,(105592451267587931480576:ℚ)/2^80⟩,
  ⟨(9222870075065612553561:ℚ)/2^80,(9222870075065612553562:ℚ)/2^80⟩,
  ⟨(805562626877388618760:ℚ)/2^80,(805562626877388618761:ℚ)/2^80⟩,
  ⟨(70361085057026813403:ℚ)/2^80,(70361085057026813404:ℚ)/2^80⟩,
  ⟨(6145620619954213648:ℚ)/2^80,(6145620619954213649:ℚ)/2^80⟩,
  ⟨(536783262705448250:ℚ)/2^80,(536783262705448251:ℚ)/2^80⟩,
  ⟨(46884812607071237:ℚ)/2^80,(46884812607071238:ℚ)/2^80⟩,
  ⟨(4095108409530286:ℚ)/2^80,(4095108409530287:ℚ)/2^80⟩,
  ⟨(357683265716549:ℚ)/2^80,(357683265716550:ℚ)/2^80⟩,
  ⟨(31241497362051:ℚ)/2^80,(31241497362052:ℚ)/2^80⟩,
  ⟨(2728758236614:ℚ)/2^80,(2728758236615:ℚ)/2^80⟩,
  ⟨(238340737244:ℚ)/2^80,(238340737245:ℚ)/2^80⟩,
  ⟨(20817640151:ℚ)/2^80,(20817640152:ℚ)/2^80⟩,
  ⟨(1818296555:ℚ)/2^80,(1818296556:ℚ)/2^80⟩,
  ⟨(158817346:ℚ)/2^80,(158817347:ℚ)/2^80⟩,
  ⟨(13871746:ℚ)/2^80,(13871747:ℚ)/2^80⟩,
  ⟨(1211614:ℚ)/2^80,(1211615:ℚ)/2^80⟩,
  ⟨(105827:ℚ)/2^80,(105828:ℚ)/2^80⟩,
  ⟨(9243:ℚ)/2^80,(9244:ℚ)/2^80⟩,
  ⟨(807:ℚ)/2^80,(808:ℚ)/2^80⟩,
  ⟨(70:ℚ)/2^80,(71:ℚ)/2^80⟩,
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
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (305:ℚ)/256,
  ⟨⟨(105592451267587931480575:ℚ)/2^80,(105592451267587931480576:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(201916137705155099:ℚ)/2^60,(201916137705155100:ℚ)/2^60⟩
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
end Point049

namespace Point050
/-- Exact original rational input. -/
def input : ℚ := (153:ℚ)/128
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(107555677901657399884891:ℚ)/2^80,(107555677901657399884892:ℚ)/2^80⟩,
  ⟨(9569010489471298922143:ℚ)/2^80,(9569010489471298922144:ℚ)/2^80⟩,
  ⟨(851335452799937626525:ℚ)/2^80,(851335452799937626526:ℚ)/2^80⟩,
  ⟨(75741588327396585989:ℚ)/2^80,(75741588327396585990:ℚ)/2^80⟩,
  ⟨(6738575473967667792:ℚ)/2^80,(6738575473967667793:ℚ)/2^80⟩,
  ⟨(599517390922390372:ℚ)/2^80,(599517390922390374:ℚ)/2^80⟩,
  ⟨(53337846167472453:ℚ)/2^80,(53337846167472454:ℚ)/2^80⟩,
  ⟨(4745359979312495:ℚ)/2^80,(4745359979312496:ℚ)/2^80⟩,
  ⟨(422185051540257:ℚ)/2^80,(422185051540258:ℚ)/2^80⟩,
  ⟨(37560947645930:ℚ)/2^80,(37560947645931:ℚ)/2^80⟩,
  ⟨(3341721320812:ℚ)/2^80,(3341721320813:ℚ)/2^80⟩,
  ⟨(297306167332:ℚ)/2^80,(297306167333:ℚ)/2^80⟩,
  ⟨(26450726630:ℚ)/2^80,(26450726632:ℚ)/2^80⟩,
  ⟨(2353267493:ℚ)/2^80,(2353267494:ℚ)/2^80⟩,
  ⟨(209365435:ℚ)/2^80,(209365436:ℚ)/2^80⟩,
  ⟨(18626818:ℚ)/2^80,(18626819:ℚ)/2^80⟩,
  ⟨(1657190:ℚ)/2^80,(1657191:ℚ)/2^80⟩,
  ⟨(147436:ℚ)/2^80,(147437:ℚ)/2^80⟩,
  ⟨(13117:ℚ)/2^80,(13118:ℚ)/2^80⟩,
  ⟨(1166:ℚ)/2^80,(1168:ℚ)/2^80⟩,
  ⟨(103:ℚ)/2^80,(104:ℚ)/2^80⟩,
  ⟨(9:ℚ)/2^80,(10:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
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
def trace : ScaledLogTrace := ⟨0, (153:ℚ)/128,
  ⟨⟨(107555677901657399884891:ℚ)/2^80,(107555677901657399884892:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(205690024886944657:ℚ)/2^60,(205690024886944658:ℚ)/2^60⟩
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
end Point050

namespace Point051
/-- Exact original rational input. -/
def input : ℚ := (307:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(109511930373616497175870:ℚ)/2^80,(109511930373616497175871:ℚ)/2^80⟩,
  ⟨(9920263675052293705096:ℚ)/2^80,(9920263675052293705097:ℚ)/2^80⟩,
  ⟨(898638450137952005257:ℚ)/2^80,(898638450137952005258:ℚ)/2^80⟩,
  ⟨(81404193529370430316:ℚ)/2^80,(81404193529370430317:ℚ)/2^80⟩,
  ⟨(7374092131434976813:ℚ)/2^80,(7374092131434976814:ℚ)/2^80⟩,
  ⟨(667990583842244791:ℚ)/2^80,(667990583842244792:ℚ)/2^80⟩,
  ⟨(60510692319634963:ℚ)/2^80,(60510692319634964:ℚ)/2^80⟩,
  ⟨(5481430387746684:ℚ)/2^80,(5481430387746685:ℚ)/2^80⟩,
  ⟨(496541651465507:ℚ)/2^80,(496541651465508:ℚ)/2^80⟩,
  ⟨(44979794360108:ℚ)/2^80,(44979794360109:ℚ)/2^80⟩,
  ⟨(4074546203135:ℚ)/2^80,(4074546203136:ℚ)/2^80⟩,
  ⟨(369097435807:ℚ)/2^80,(369097435809:ℚ)/2^80⟩,
  ⟨(33435114078:ℚ)/2^80,(33435114079:ℚ)/2^80⟩,
  ⟨(3028758113:ℚ)/2^80,(3028758114:ℚ)/2^80⟩,
  ⟨(274363523:ℚ)/2^80,(274363524:ℚ)/2^80⟩,
  ⟨(24853534:ℚ)/2^80,(24853535:ℚ)/2^80⟩,
  ⟨(2251385:ℚ)/2^80,(2251386:ℚ)/2^80⟩,
  ⟨(203944:ℚ)/2^80,(203945:ℚ)/2^80⟩,
  ⟨(18474:ℚ)/2^80,(18475:ℚ)/2^80⟩,
  ⟨(1673:ℚ)/2^80,(1674:ℚ)/2^80⟩,
  ⟨(151:ℚ)/2^80,(152:ℚ)/2^80⟩,
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
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (307:ℚ)/256,
  ⟨⟨(109511930373616497175870:ℚ)/2^80,(109511930373616497175871:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(209451599201236121:ℚ)/2^60,(209451599201236122:ℚ)/2^60⟩
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
end Point051

namespace Point052
/-- Exact original rational input. -/
def input : ℚ := (77:ℚ)/64
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(111461245780072193412626:ℚ)/2^80,(111461245780072193412627:ℚ)/2^80⟩,
  ⟨(10276568759864812158610:ℚ)/2^80,(10276568759864812158612:ℚ)/2^80⟩,
  ⟨(947485062966259277034:ℚ)/2^80,(947485062966259277036:ℚ)/2^80⟩,
  ⟨(87356778855045181570:ℚ)/2^80,(87356778855045181571:ℚ)/2^80⟩,
  ⟨(8054171100110548655:ℚ)/2^80,(8054171100110548656:ℚ)/2^80⟩,
  ⟨(742583151074022216:ℚ)/2^80,(742583151074022217:ℚ)/2^80⟩,
  ⟨(68465113219590700:ℚ)/2^80,(68465113219590701:ℚ)/2^80⟩,
  ⟨(6312386325210490:ℚ)/2^80,(6312386325210491:ℚ)/2^80⟩,
  ⟨(581993065444938:ℚ)/2^80,(581993065444939:ℚ)/2^80⟩,
  ⟨(53658935111944:ℚ)/2^80,(53658935111945:ℚ)/2^80⟩,
  ⟨(4947277705356:ℚ)/2^80,(4947277705357:ℚ)/2^80⟩,
  ⟨(456131987018:ℚ)/2^80,(456131987019:ℚ)/2^80⟩,
  ⟨(42054722207:ℚ)/2^80,(42054722208:ℚ)/2^80⟩,
  ⟨(3877385735:ℚ)/2^80,(3877385736:ℚ)/2^80⟩,
  ⟨(357489464:ℚ)/2^80,(357489466:ℚ)/2^80⟩,
  ⟨(32960021:ℚ)/2^80,(32960022:ℚ)/2^80⟩,
  ⟨(3038867:ℚ)/2^80,(3038868:ℚ)/2^80⟩,
  ⟨(280179:ℚ)/2^80,(280180:ℚ)/2^80⟩,
  ⟨(25832:ℚ)/2^80,(25833:ℚ)/2^80⟩,
  ⟨(2381:ℚ)/2^80,(2382:ℚ)/2^80⟩,
  ⟨(219:ℚ)/2^80,(220:ℚ)/2^80⟩,
  ⟨(20:ℚ)/2^80,(21:ℚ)/2^80⟩,
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
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (77:ℚ)/64,
  ⟨⟨(111461245780072193412626:ℚ)/2^80,(111461245780072193412627:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(213200940731932963:ℚ)/2^60,(213200940731932964:ℚ)/2^60⟩
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
end Point052

namespace Point053
/-- Exact original rational input. -/
def input : ℚ := (309:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(113403660955000612848543:ℚ)/2^80,(113403660955000612848544:ℚ)/2^80⟩,
  ⟨(10637865540911561913226:ℚ)/2^80,(10637865540911561913227:ℚ)/2^80⟩,
  ⟨(997888271979314657346:ℚ)/2^80,(997888271979314657347:ℚ)/2^80⟩,
  ⟨(93607218433457835113:ℚ)/2^80,(93607218433457835114:ℚ)/2^80⟩,
  ⟨(8780854118536752674:ℚ)/2^80,(8780854118536752675:ℚ)/2^80⟩,
  ⟨(823690740322916622:ℚ)/2^80,(823690740322916623:ℚ)/2^80⟩,
  ⟨(77266565021441736:ℚ)/2^80,(77266565021441737:ℚ)/2^80⟩,
  ⟨(7248014063958251:ℚ)/2^80,(7248014063958252:ℚ)/2^80⟩,
  ⟨(679902204229712:ℚ)/2^80,(679902204229713:ℚ)/2^80⟩,
  ⟨(63778436856946:ℚ)/2^80,(63778436856947:ℚ)/2^80⟩,
  ⟨(5982756023748:ℚ)/2^80,(5982756023750:ℚ)/2^80⟩,
  ⟨(561214281873:ℚ)/2^80,(561214281874:ℚ)/2^80⟩,
  ⟨(52644879538:ℚ)/2^80,(52644879539:ℚ)/2^80⟩,
  ⟨(4938369230:ℚ)/2^80,(4938369232:ℚ)/2^80⟩,
  ⟨(463245255:ℚ)/2^80,(463245256:ℚ)/2^80⟩,
  ⟨(43454864:ℚ)/2^80,(43454865:ℚ)/2^80⟩,
  ⟨(4076296:ℚ)/2^80,(4076298:ℚ)/2^80⟩,
  ⟨(382378:ℚ)/2^80,(382379:ℚ)/2^80⟩,
  ⟨(35869:ℚ)/2^80,(35870:ℚ)/2^80⟩,
  ⟨(3364:ℚ)/2^80,(3365:ℚ)/2^80⟩,
  ⟨(315:ℚ)/2^80,(316:ℚ)/2^80⟩,
  ⟨(29:ℚ)/2^80,(30:ℚ)/2^80⟩,
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
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (309:ℚ)/256,
  ⟨⟨(113403660955000612848543:ℚ)/2^80,(113403660955000612848544:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(216938128784162138:ℚ)/2^60,(216938128784162139:ℚ)/2^60⟩
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
end Point053

namespace Point054
/-- Exact original rational input. -/
def input : ℚ := (155:ℚ)/128
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(115339212472067094406596:ℚ)/2^80,(115339212472067094406597:ℚ)/2^80⟩,
  ⟨(11004094476133609713703:ℚ)/2^80,(11004094476133609713704:ℚ)/2^80⟩,
  ⟨(1049860603730061704134:ℚ)/2^80,(1049860603730061704135:ℚ)/2^80⟩,
  ⟨(100163379154458183786:ℚ)/2^80,(100163379154458183787:ℚ)/2^80⟩,
  ⟨(9556223452898837322:ℚ)/2^80,(9556223452898837323:ℚ)/2^80⟩,
  ⟨(911724499039818401:ℚ)/2^80,(911724499039818402:ℚ)/2^80⟩,
  ⟨(86984316162809529:ℚ)/2^80,(86984316162809530:ℚ)/2^80⟩,
  ⟨(8298857019066633:ℚ)/2^80,(8298857019066634:ℚ)/2^80⟩,
  ⟨(791763743868548:ℚ)/2^80,(791763743868549:ℚ)/2^80⟩,
  ⟨(75539297118200:ℚ)/2^80,(75539297118201:ℚ)/2^80⟩,
  ⟨(7206929407036:ℚ)/2^80,(7206929407037:ℚ)/2^80⟩,
  ⟨(687586904558:ℚ)/2^80,(687586904559:ℚ)/2^80⟩,
  ⟨(65600164039:ℚ)/2^80,(65600164040:ℚ)/2^80⟩,
  ⟨(6258672894:ℚ)/2^80,(6258672895:ℚ)/2^80⟩,
  ⟨(597117201:ℚ)/2^80,(597117202:ℚ)/2^80⟩,
  ⟨(56968778:ℚ)/2^80,(56968779:ℚ)/2^80⟩,
  ⟨(5435183:ℚ)/2^80,(5435184:ℚ)/2^80⟩,
  ⟨(518551:ℚ)/2^80,(518552:ℚ)/2^80⟩,
  ⟨(49473:ℚ)/2^80,(49474:ℚ)/2^80⟩,
  ⟨(4720:ℚ)/2^80,(4721:ℚ)/2^80⟩,
  ⟨(450:ℚ)/2^80,(451:ℚ)/2^80⟩,
  ⟨(42:ℚ)/2^80,(44:ℚ)/2^80⟩,
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
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (155:ℚ)/128,
  ⟨⟨(115339212472067094406596:ℚ)/2^80,(115339212472067094406597:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(220663241894339089:ℚ)/2^60,(220663241894339091:ℚ)/2^60⟩
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
end Point054

namespace Point055
/-- Exact original rational input. -/
def input : ℚ := (311:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(117267936646921701250158:ℚ)/2^80,(117267936646921701250159:ℚ)/2^80⟩,
  ⟨(11375196676509159733260:ℚ)/2^80,(11375196676509159733261:ℚ)/2^80⟩,
  ⟨(1103414139696655706048:ℚ)/2^80,(1103414139696655706049:ℚ)/2^80⟩,
  ⟨(107033117607259371838:ℚ)/2^80,(107033117607259371839:ℚ)/2^80⟩,
  ⟨(10382401178834683335:ℚ)/2^80,(10382401178834683336:ℚ)/2^80⟩,
  ⟨(1007111225460154468:ℚ)/2^80,(1007111225460154469:ℚ)/2^80⟩,
  ⟨(97691565079909163:ℚ)/2^80,(97691565079909164:ℚ)/2^80⟩,
  ⟨(9476254108280430:ℚ)/2^80,(9476254108280431:ℚ)/2^80⟩,
  ⟨(919213361473410:ℚ)/2^80,(919213361473411:ℚ)/2^80⟩,
  ⟨(89165317250507:ℚ)/2^80,(89165317250508:ℚ)/2^80⟩,
  ⟨(8649193031354:ℚ)/2^80,(8649193031355:ℚ)/2^80⟩,
  ⟨(838986978350:ℚ)/2^80,(838986978351:ℚ)/2^80⟩,
  ⟨(81383216594:ℚ)/2^80,(81383216595:ℚ)/2^80⟩,
  ⟨(7894315542:ℚ)/2^80,(7894315543:ℚ)/2^80⟩,
  ⟨(765762530:ℚ)/2^80,(765762531:ℚ)/2^80⟩,
  ⟨(74280315:ℚ)/2^80,(74280317:ℚ)/2^80⟩,
  ⟨(7205321:ℚ)/2^80,(7205322:ℚ)/2^80⟩,
  ⟨(698928:ℚ)/2^80,(698929:ℚ)/2^80⟩,
  ⟨(67797:ℚ)/2^80,(67798:ℚ)/2^80⟩,
  ⟨(6576:ℚ)/2^80,(6577:ℚ)/2^80⟩,
  ⟨(637:ℚ)/2^80,(638:ℚ)/2^80⟩,
  ⟨(61:ℚ)/2^80,(62:ℚ)/2^80⟩,
  ⟨(5:ℚ)/2^80,(7:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
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
def trace : ScaledLogTrace := ⟨0, (311:ℚ)/256,
  ⟨⟨(117267936646921701250158:ℚ)/2^80,(117267936646921701250159:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(224376357840070677:ℚ)/2^60,(224376357840070678:ℚ)/2^60⟩
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
end Point055

/-- Reusable proved logarithm bounds for these consecutive exact grid inputs. -/
def entries : Array CertifiedLogBound := #[⟨Point048.input, Point048.bounds, Point048.log_bounds⟩,
  ⟨Point049.input, Point049.bounds, Point049.log_bounds⟩,
  ⟨Point050.input, Point050.bounds, Point050.log_bounds⟩,
  ⟨Point051.input, Point051.bounds, Point051.log_bounds⟩,
  ⟨Point052.input, Point052.bounds, Point052.log_bounds⟩,
  ⟨Point053.input, Point053.bounds, Point053.log_bounds⟩,
  ⟨Point054.input, Point054.bounds, Point054.log_bounds⟩,
  ⟨Point055.input, Point055.bounds, Point055.log_bounds⟩]
end MatrixBounds.Numeric.LogGridData.Part006
