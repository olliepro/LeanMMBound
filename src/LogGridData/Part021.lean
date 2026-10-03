module

public import TabulatedLogBounds
public import FKLLog.GridTrace

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

namespace MatrixBounds.Numeric.LogGridData.Part021
set_option maxRecDepth 100000
set_option maxHeartbeats 16000000

namespace Point168
/-- Exact original rational input. -/
def input : ℚ := (53:ℚ)/32
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(298675790728320149045055:ℚ)/2^80,(298675790728320149045056:ℚ)/2^80⟩,
  ⟨(73790489474055566234660:ℚ)/2^80,(73790489474055566234662:ℚ)/2^80⟩,
  ⟨(18230591517119610481504:ℚ)/2^80,(18230591517119610481505:ℚ)/2^80⟩,
  ⟨(4504028492464844942489:ℚ)/2^80,(4504028492464844942490:ℚ)/2^80⟩,
  ⟨(1112759980491314632850:ℚ)/2^80,(1112759980491314632851:ℚ)/2^80⟩,
  ⟨(274917171650795379880:ℚ)/2^80,(274917171650795379881:ℚ)/2^80⟩,
  ⟨(67920712996078858558:ℚ)/2^80,(67920712996078858559:ℚ)/2^80⟩,
  ⟨(16780411446090070937:ℚ)/2^80,(16780411446090070939:ℚ)/2^80⟩,
  ⟨(4145748710210488113:ℚ)/2^80,(4145748710210488115:ℚ)/2^80⟩,
  ⟨(1024243798993179416:ℚ)/2^80,(1024243798993179417:ℚ)/2^80⟩,
  ⟨(253048467986550208:ℚ)/2^80,(253048467986550209:ℚ)/2^80⟩,
  ⟨(62517856796677110:ℚ)/2^80,(62517856796677111:ℚ)/2^80⟩,
  ⟨(15445588149767285:ℚ)/2^80,(15445588149767287:ℚ)/2^80⟩,
  ⟨(3815968837001329:ℚ)/2^80,(3815968837001330:ℚ)/2^80⟩,
  ⟨(942768771494445:ℚ)/2^80,(942768771494447:ℚ)/2^80⟩,
  ⟨(232919343545686:ℚ)/2^80,(232919343545687:ℚ)/2^80⟩,
  ⟨(57544778993640:ℚ)/2^80,(57544778993641:ℚ)/2^80⟩,
  ⟨(14216945398428:ℚ)/2^80,(14216945398429:ℚ)/2^80⟩,
  ⟨(3512421804317:ℚ)/2^80,(3512421804318:ℚ)/2^80⟩,
  ⟨(867774798713:ℚ)/2^80,(867774798714:ℚ)/2^80⟩,
  ⟨(214391420858:ℚ)/2^80,(214391420859:ℚ)/2^80⟩,
  ⟨(52967292211:ℚ)/2^80,(52967292213:ℚ)/2^80⟩,
  ⟨(13086036899:ℚ)/2^80,(13086036900:ℚ)/2^80⟩,
  ⟨(3233020880:ℚ)/2^80,(3233020882:ℚ)/2^80⟩,
  ⟨(798746335:ℚ)/2^80,(798746336:ℚ)/2^80⟩,
  ⟨(197337329:ℚ)/2^80,(197337331:ℚ)/2^80⟩,
  ⟨(48753928:ℚ)/2^80,(48753929:ℚ)/2^80⟩,
  ⟨(12045088:ℚ)/2^80,(12045089:ℚ)/2^80⟩,
  ⟨(2975845:ℚ)/2^80,(2975846:ℚ)/2^80⟩,
  ⟨(735208:ℚ)/2^80,(735210:ℚ)/2^80⟩,
  ⟨(181639:ℚ)/2^80,(181641:ℚ)/2^80⟩,
  ⟨(44875:ℚ)/2^80,(44877:ℚ)/2^80⟩,
  ⟨(11086:ℚ)/2^80,(11088:ℚ)/2^80⟩,
  ⟨(2738:ℚ)/2^80,(2740:ℚ)/2^80⟩,
  ⟨(676:ℚ)/2^80,(677:ℚ)/2^80⟩,
  ⟨(167:ℚ)/2^80,(168:ℚ)/2^80⟩,
  ⟨(41:ℚ)/2^80,(42:ℚ)/2^80⟩,
  ⟨(10:ℚ)/2^80,(11:ℚ)/2^80⟩,
  ⟨(2:ℚ)/2^80,(3:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (53:ℚ)/32,
  ⟨⟨(298675790728320149045055:ℚ)/2^80,(298675790728320149045056:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(581713475075080035:ℚ)/2^60,(581713475075080036:ℚ)/2^60⟩
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
end Point168

namespace Point169
/-- Exact original rational input. -/
def input : ℚ := (425:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(300012428068828679185526:ℚ)/2^80,(300012428068828679185527:ℚ)/2^80⟩,
  ⟨(74452423412088174423426:ℚ)/2^80,(74452423412088174423428:ℚ)/2^80⟩,
  ⟨(18476445751311162228427:ℚ)/2^80,(18476445751311162228428:ℚ)/2^80⟩,
  ⟨(4585197256933313387083:ℚ)/2^80,(4585197256933313387085:ℚ)/2^80⟩,
  ⟨(1137883019708854570362:ℚ)/2^80,(1137883019708854570364:ℚ)/2^80⟩,
  ⟨(282382129707483733320:ℚ)/2^80,(282382129707483733321:ℚ)/2^80⟩,
  ⟨(70077209868670706213:ℚ)/2^80,(70077209868670706214:ℚ)/2^80⟩,
  ⟨(17390673227320630469:ℚ)/2^80,(17390673227320630471:ℚ)/2^80⟩,
  ⟨(4315747100465765857:ℚ)/2^80,(4315747100465765859:ℚ)/2^80⟩,
  ⟨(1071015066048038810:ℚ)/2^80,(1071015066048038811:ℚ)/2^80⟩,
  ⟨(265787879826899499:ℚ)/2^80,(265787879826899500:ℚ)/2^80⟩,
  ⟨(65959106741183576:ℚ)/2^80,(65959106741183577:ℚ)/2^80⟩,
  ⟨(16368706371894308:ℚ)/2^80,(16368706371894310:ℚ)/2^80⟩,
  ⟨(4062131243539116:ℚ)/2^80,(4062131243539117:ℚ)/2^80⟩,
  ⟨(1008076622845977:ℚ)/2^80,(1008076622845978:ℚ)/2^80⟩,
  ⟨(250168794803186:ℚ)/2^80,(250168794803187:ℚ)/2^80⟩,
  ⟨(62083004877736:ℚ)/2^80,(62083004877737:ℚ)/2^80⟩,
  ⟨(15406795630451:ℚ)/2^80,(15406795630452:ℚ)/2^80⟩,
  ⟨(3823419179950:ℚ)/2^80,(3823419179951:ℚ)/2^80⟩,
  ⟨(948836771529:ℚ)/2^80,(948836771530:ℚ)/2^80⟩,
  ⟨(235467568852:ℚ)/2^80,(235467568853:ℚ)/2^80⟩,
  ⟨(58434683019:ℚ)/2^80,(58434683020:ℚ)/2^80⟩,
  ⟨(14501411791:ℚ)/2^80,(14501411793:ℚ)/2^80⟩,
  ⟨(3598735084:ℚ)/2^80,(3598735086:ℚ)/2^80⟩,
  ⟨(893078163:ℚ)/2^80,(893078164:ℚ)/2^80⟩,
  ⟨(221630263:ℚ)/2^80,(221630264:ℚ)/2^80⟩,
  ⟨(55000755:ℚ)/2^80,(55000756:ℚ)/2^80⟩,
  ⟨(13649232:ℚ)/2^80,(13649234:ℚ)/2^80⟩,
  ⟨(3387254:ℚ)/2^80,(3387255:ℚ)/2^80⟩,
  ⟨(840596:ℚ)/2^80,(840597:ℚ)/2^80⟩,
  ⟨(208606:ℚ)/2^80,(208607:ℚ)/2^80⟩,
  ⟨(51768:ℚ)/2^80,(51769:ℚ)/2^80⟩,
  ⟨(12846:ℚ)/2^80,(12848:ℚ)/2^80⟩,
  ⟨(3187:ℚ)/2^80,(3189:ℚ)/2^80⟩,
  ⟨(790:ℚ)/2^80,(792:ℚ)/2^80⟩,
  ⟨(196:ℚ)/2^80,(197:ℚ)/2^80⟩,
  ⟨(48:ℚ)/2^80,(49:ℚ)/2^80⟩,
  ⟨(11:ℚ)/2^80,(13:ℚ)/2^80⟩,
  ⟨(2:ℚ)/2^80,(4:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (425:ℚ)/256,
  ⟨⟨(300012428068828679185526:ℚ)/2^80,(300012428068828679185527:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(584429428049812893:ℚ)/2^60,(584429428049812895:ℚ)/2^60⟩
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
end Point169

namespace Point170
/-- Exact original rational input. -/
def input : ℚ := (213:ℚ)/128
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(301345145651740410117375:ℚ)/2^80,(301345145651740410117376:ℚ)/2^80⟩,
  ⟨(75115358886797462932483:ℚ)/2^80,(75115358886797462932484:ℚ)/2^80⟩,
  ⟨(18723769810492036214841:ℚ)/2^80,(18723769810492036214843:ℚ)/2^80⟩,
  ⟨(4667215348656372663523:ℚ)/2^80,(4667215348656372663524:ℚ)/2^80⟩,
  ⟨(1163382125031647144866:ℚ)/2^80,(1163382125031647144867:ℚ)/2^80⟩,
  ⟨(289992611811407646080:ℚ)/2^80,(289992611811407646082:ℚ)/2^80⟩,
  ⟨(72285548398737976295:ℚ)/2^80,(72285548398737976297:ℚ)/2^80⟩,
  ⟨(18018391829597442771:ℚ)/2^80,(18018391829597442772:ℚ)/2^80⟩,
  ⟨(4491387992714905089:ℚ)/2^80,(4491387992714905090:ℚ)/2^80⟩,
  ⟨(1119554191732454347:ℚ)/2^80,(1119554191732454348:ℚ)/2^80⟩,
  ⟨(279067760402517945:ℚ)/2^80,(279067760402517946:ℚ)/2^80⟩,
  ⟨(69562344968369575:ℚ)/2^80,(69562344968369576:ℚ)/2^80⟩,
  ⟨(17339587455458691:ℚ)/2^80,(17339587455458692:ℚ)/2^80⟩,
  ⟨(4322184556346008:ℚ)/2^80,(4322184556346009:ℚ)/2^80⟩,
  ⟨(1077377382080383:ℚ)/2^80,(1077377382080384:ℚ)/2^80⟩,
  ⟨(268554479404201:ℚ)/2^80,(268554479404202:ℚ)/2^80⟩,
  ⟨(66941732402806:ℚ)/2^80,(66941732402807:ℚ)/2^80⟩,
  ⟨(16686355584277:ℚ)/2^80,(16686355584278:ℚ)/2^80⟩,
  ⟨(4159355497547:ℚ)/2^80,(4159355497548:ℚ)/2^80⟩,
  ⟨(1036789493523:ℚ)/2^80,(1036789493524:ℚ)/2^80⟩,
  ⟨(258437263781:ℚ)/2^80,(258437263782:ℚ)/2^80⟩,
  ⟨(64419845810:ℚ)/2^80,(64419845811:ℚ)/2^80⟩,
  ⟨(16057732826:ℚ)/2^80,(16057732827:ℚ)/2^80⟩,
  ⟨(4002660675:ℚ)/2^80,(4002660676:ℚ)/2^80⟩,
  ⟨(997730666:ℚ)/2^80,(997730668:ℚ)/2^80⟩,
  ⟨(248701192:ℚ)/2^80,(248701193:ℚ)/2^80⟩,
  ⟨(61992965:ℚ)/2^80,(61992966:ℚ)/2^80⟩,
  ⟨(15452791:ℚ)/2^80,(15452793:ℚ)/2^80⟩,
  ⟨(3851868:ℚ)/2^80,(3851870:ℚ)/2^80⟩,
  ⟨(960143:ℚ)/2^80,(960144:ℚ)/2^80⟩,
  ⟨(239331:ℚ)/2^80,(239333:ℚ)/2^80⟩,
  ⟨(59657:ℚ)/2^80,(59658:ℚ)/2^80⟩,
  ⟨(14870:ℚ)/2^80,(14871:ℚ)/2^80⟩,
  ⟨(3706:ℚ)/2^80,(3707:ℚ)/2^80⟩,
  ⟨(923:ℚ)/2^80,(925:ℚ)/2^80⟩,
  ⟨(230:ℚ)/2^80,(231:ℚ)/2^80⟩,
  ⟨(57:ℚ)/2^80,(58:ℚ)/2^80⟩,
  ⟨(14:ℚ)/2^80,(15:ℚ)/2^80⟩,
  ⟨(3:ℚ)/2^80,(4:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (213:ℚ)/128,
  ⟨⟨(301345145651740410117375:ℚ)/2^80,(301345145651740410117376:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(587138998050449714:ℚ)/2^60,(587138998050449716:ℚ)/2^60⟩
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
end Point170

namespace Point171
/-- Exact original rational input. -/
def input : ℚ := (427:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(302673960694145810944005:ℚ)/2^80,(302673960694145810944006:ℚ)/2^80⟩,
  ⟨(75779278592531381656551:ℚ)/2^80,(75779278592531381656553:ℚ)/2^80⟩,
  ⟨(18972557305011517222943:ℚ)/2^80,(18972557305011517222944:ℚ)/2^80⟩,
  ⟨(4750083893348417928438:ℚ)/2^80,(4750083893348417928439:ℚ)/2^80⟩,
  ⟨(1189259657046236406680:ℚ)/2^80,(1189259657046236406681:ℚ)/2^80⟩,
  ⟨(297750221603084078392:ℚ)/2^80,(297750221603084078394:ℚ)/2^80⟩,
  ⟨(74546541572660874677:ℚ)/2^80,(74546541572660874679:ℚ)/2^80⟩,
  ⟨(18663921828587129677:ℚ)/2^80,(18663921828587129679:ℚ)/2^80⟩,
  ⟨(4672812053716543447:ℚ)/2^80,(4672812053716543449:ℚ)/2^80⟩,
  ⟨(1169913413155972078:ℚ)/2^80,(1169913413155972079:ℚ)/2^80⟩,
  ⟨(292906579282095498:ℚ)/2^80,(292906579282095499:ℚ)/2^80⟩,
  ⟨(73333858063306486:ℚ)/2^80,(73333858063306487:ℚ)/2^80⟩,
  ⟨(18360307070022560:ℚ)/2^80,(18360307070022562:ℚ)/2^80⟩,
  ⟨(4596797231294081:ℚ)/2^80,(4596797231294083:ℚ)/2^80⟩,
  ⟨(1150881883676848:ℚ)/2^80,(1150881883676850:ℚ)/2^80⟩,
  ⟨(288141730759503:ℚ)/2^80,(288141730759505:ℚ)/2^80⟩,
  ⟨(72140901844619:ℚ)/2^80,(72140901844620:ℚ)/2^80⟩,
  ⟨(18061631354948:ℚ)/2^80,(18061631354949:ℚ)/2^80⟩,
  ⟨(4522018977593:ℚ)/2^80,(4522018977594:ℚ)/2^80⟩,
  ⟨(1132159949002:ℚ)/2^80,(1132159949003:ℚ)/2^80⟩,
  ⟨(283454394259:ℚ)/2^80,(283454394260:ℚ)/2^80⟩,
  ⟨(70967352003:ℚ)/2^80,(70967352004:ℚ)/2^80⟩,
  ⟨(17767814337:ℚ)/2^80,(17767814338:ℚ)/2^80⟩,
  ⟨(4448457176:ℚ)/2^80,(4448457177:ℚ)/2^80⟩,
  ⟨(1113742572:ℚ)/2^80,(1113742573:ℚ)/2^80⟩,
  ⟨(278843308:ℚ)/2^80,(278843309:ℚ)/2^80⟩,
  ⟨(69812892:ℚ)/2^80,(69812893:ℚ)/2^80⟩,
  ⟨(17478776:ℚ)/2^80,(17478778:ℚ)/2^80⟩,
  ⟨(4376091:ℚ)/2^80,(4376093:ℚ)/2^80⟩,
  ⟨(1095624:ℚ)/2^80,(1095626:ℚ)/2^80⟩,
  ⟨(274307:ℚ)/2^80,(274308:ℚ)/2^80⟩,
  ⟨(68677:ℚ)/2^80,(68678:ℚ)/2^80⟩,
  ⟨(17194:ℚ)/2^80,(17195:ℚ)/2^80⟩,
  ⟨(4304:ℚ)/2^80,(4306:ℚ)/2^80⟩,
  ⟨(1077:ℚ)/2^80,(1079:ℚ)/2^80⟩,
  ⟨(269:ℚ)/2^80,(271:ℚ)/2^80⟩,
  ⟨(67:ℚ)/2^80,(68:ℚ)/2^80⟩,
  ⟨(16:ℚ)/2^80,(18:ℚ)/2^80⟩,
  ⟨(4:ℚ)/2^80,(5:ℚ)/2^80⟩,
  ⟨(1:ℚ)/2^80,(2:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (427:ℚ)/256,
  ⟨⟨(302673960694145810944005:ℚ)/2^80,(302673960694145810944006:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(589842215008914949:ℚ)/2^60,(589842215008914950:ℚ)/2^60⟩
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
end Point171

namespace Point172
/-- Exact original rational input. -/
def input : ℚ := (107:ℚ)/64
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(303998890312450611183424:ℚ)/2^80,(303998890312450611183425:ℚ)/2^80⟩,
  ⟨(76444165400206878835597:ℚ)/2^80,(76444165400206878835599:ℚ)/2^80⟩,
  ⟨(19222801825783016315384:ℚ)/2^80,(19222801825783016315385:ℚ)/2^80⟩,
  ⟨(4833803967886957319073:ℚ)/2^80,(4833803967886957319074:ℚ)/2^80⟩,
  ⟨(1215517956837071138714:ℚ)/2^80,(1215517956837071138715:ℚ)/2^80⟩,
  ⟨(305656562245579292191:ℚ)/2^80,(305656562245579292192:ℚ)/2^80⟩,
  ⟨(76861006880467307393:ℚ)/2^80,(76861006880467307394:ℚ)/2^80⟩,
  ⟨(19327621613216925250:ℚ)/2^80,(19327621613216925252:ℚ)/2^80⟩,
  ⟨(4860162160048700501:ℚ)/2^80,(4860162160048700502:ℚ)/2^80⟩,
  ⟨(1222146040246164453:ℚ)/2^80,(1222146040246164454:ℚ)/2^80⟩,
  ⟨(307323273278275271:ℚ)/2^80,(307323273278275273:ℚ)/2^80⟩,
  ⟨(77280121350677407:ℚ)/2^80,(77280121350677408:ℚ)/2^80⟩,
  ⟨(19433012971222973:ℚ)/2^80,(19433012971222974:ℚ)/2^80⟩,
  ⟨(4886664080482969:ℚ)/2^80,(4886664080482971:ℚ)/2^80⟩,
  ⟨(1228810265852442:ℚ)/2^80,(1228810265852444:ℚ)/2^80⟩,
  ⟨(308999072699736:ℚ)/2^80,(308999072699738:ℚ)/2^80⟩,
  ⟨(77701521205196:ℚ)/2^80,(77701521205198:ℚ)/2^80⟩,
  ⟨(19538979016511:ℚ)/2^80,(19538979016512:ℚ)/2^80⟩,
  ⟨(4913310512923:ℚ)/2^80,(4913310512925:ℚ)/2^80⟩,
  ⟨(1235510830735:ℚ)/2^80,(1235510830736:ℚ)/2^80⟩,
  ⟨(310684010067:ℚ)/2^80,(310684010069:ℚ)/2^80⟩,
  ⟨(78125218905:ℚ)/2^80,(78125218907:ℚ)/2^80⟩,
  ⟨(19645522882:ℚ)/2^80,(19645522884:ℚ)/2^80⟩,
  ⟨(4940102245:ℚ)/2^80,(4940102246:ℚ)/2^80⟩,
  ⟨(1242247932:ℚ)/2^80,(1242247934:ℚ)/2^80⟩,
  ⟨(312378134:ℚ)/2^80,(312378136:ℚ)/2^80⟩,
  ⟨(78551226:ℚ)/2^80,(78551228:ℚ)/2^80⟩,
  ⟨(19752647:ℚ)/2^80,(19752648:ℚ)/2^80⟩,
  ⟨(4967039:ℚ)/2^80,(4967041:ℚ)/2^80⟩,
  ⟨(1249021:ℚ)/2^80,(1249023:ℚ)/2^80⟩,
  ⟨(314081:ℚ)/2^80,(314082:ℚ)/2^80⟩,
  ⟨(78979:ℚ)/2^80,(78980:ℚ)/2^80⟩,
  ⟨(19860:ℚ)/2^80,(19861:ℚ)/2^80⟩,
  ⟨(4994:ℚ)/2^80,(4995:ℚ)/2^80⟩,
  ⟨(1255:ℚ)/2^80,(1257:ℚ)/2^80⟩,
  ⟨(315:ℚ)/2^80,(317:ℚ)/2^80⟩,
  ⟨(79:ℚ)/2^80,(80:ℚ)/2^80⟩,
  ⟨(19:ℚ)/2^80,(21:ℚ)/2^80⟩,
  ⟨(4:ℚ)/2^80,(6:ℚ)/2^80⟩,
  ⟨(1:ℚ)/2^80,(2:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (107:ℚ)/64,
  ⟨⟨(303998890312450611183424:ℚ)/2^80,(303998890312450611183425:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(592539108647084071:ℚ)/2^60,(592539108647084072:ℚ)/2^60⟩
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
end Point172

namespace Point173
/-- Exact original rational input. -/
def input : ℚ := (429:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(305319951523110725874698:ℚ)/2^80,(305319951523110725874699:ℚ)/2^80⟩,
  ⟨(77110002355471759965434:ℚ)/2^80,(77110002355471759965436:ℚ)/2^80⟩,
  ⟨(19474496945250532078861:ℚ)/2^80,(19474496945250532078862:ℚ)/2^80⟩,
  ⟨(4918376600771302262252:ℚ)/2^80,(4918376600771302262253:ℚ)/2^80⟩,
  ⟨(1242159345888226702729:ℚ)/2^80,(1242159345888226702730:ℚ)/2^80⟩,
  ⟨(313713236260822218353:ℚ)/2^80,(313713236260822218354:ℚ)/2^80⟩,
  ⟨(79229766238134662445:ℚ)/2^80,(79229766238134662446:ℚ)/2^80⟩,
  ⟨(20009853371090943945:ℚ)/2^80,(20009853371090943947:ℚ)/2^80⟩,
  ⟨(5053583406129537667:ℚ)/2^80,(5053583406129537669:ℚ)/2^80⟩,
  ⟨(1276306466073591264:ℚ)/2^80,(1276306466073591266:ℚ)/2^80⟩,
  ⟨(322337253475520129:ℚ)/2^80,(322337253475520130:ℚ)/2^80⟩,
  ⟨(81407802702576616:ℚ)/2^80,(81407802702576617:ℚ)/2^80⟩,
  ⟨(20559926813935408:ℚ)/2^80,(20559926813935409:ℚ)/2^80⟩,
  ⟨(5192507063957409:ℚ)/2^80,(5192507063957410:ℚ)/2^80⟩,
  ⟨(1311392294984863:ℚ)/2^80,(1311392294984865:ℚ)/2^80⟩,
  ⟨(331198346032673:ℚ)/2^80,(331198346032674:ℚ)/2^80⟩,
  ⟨(83645713669565:ℚ)/2^80,(83645713669566:ℚ)/2^80⟩,
  ⟨(21125121846474:ℚ)/2^80,(21125121846475:ℚ)/2^80⟩,
  ⟨(5335249751007:ℚ)/2^80,(5335249751008:ℚ)/2^80⟩,
  ⟨(1347442637845:ℚ)/2^80,(1347442637846:ℚ)/2^80⟩,
  ⟨(340303031163:ℚ)/2^80,(340303031165:ℚ)/2^80⟩,
  ⟨(85945145096:ℚ)/2^80,(85945145098:ℚ)/2^80⟩,
  ⟨(21705854162:ℚ)/2^80,(21705854164:ℚ)/2^80⟩,
  ⟨(5481916452:ℚ)/2^80,(5481916454:ℚ)/2^80⟩,
  ⟨(1384484009:ℚ)/2^80,(1384484010:ℚ)/2^80⟩,
  ⟨(349658005:ℚ)/2^80,(349658006:ℚ)/2^80⟩,
  ⟨(88307788:ℚ)/2^80,(88307789:ℚ)/2^80⟩,
  ⟨(22302550:ℚ)/2^80,(22302552:ℚ)/2^80⟩,
  ⟨(5632614:ℚ)/2^80,(5632616:ℚ)/2^80⟩,
  ⟨(1422543:ℚ)/2^80,(1422544:ℚ)/2^80⟩,
  ⟨(359269:ℚ)/2^80,(359271:ℚ)/2^80⟩,
  ⟨(90735:ℚ)/2^80,(90736:ℚ)/2^80⟩,
  ⟨(22915:ℚ)/2^80,(22916:ℚ)/2^80⟩,
  ⟨(5787:ℚ)/2^80,(5788:ℚ)/2^80⟩,
  ⟨(1461:ℚ)/2^80,(1462:ℚ)/2^80⟩,
  ⟨(368:ℚ)/2^80,(370:ℚ)/2^80⟩,
  ⟨(92:ℚ)/2^80,(94:ℚ)/2^80⟩,
  ⟨(23:ℚ)/2^80,(24:ℚ)/2^80⟩,
  ⟨(5:ℚ)/2^80,(7:ℚ)/2^80⟩,
  ⟨(1:ℚ)/2^80,(2:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (429:ℚ)/256,
  ⟨⟨(305319951523110725874698:ℚ)/2^80,(305319951523110725874699:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(595229708478744365:ℚ)/2^60,(595229708478744367:ℚ)/2^60⟩
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
end Point173

namespace Point174
/-- Exact original rational input. -/
def input : ℚ := (215:ℚ)/128
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(306637161243360752768038:ℚ)/2^80,(306637161243360752768039:ℚ)/2^80⟩,
  ⟨(77776772676887421256032:ℚ)/2^80,(77776772676887421256034:ℚ)/2^80⟩,
  ⟨(19727636218335876528497:ℚ)/2^80,(19727636218335876528499:ℚ)/2^80⟩,
  ⟨(5003802772580819994108:ℚ)/2^80,(5003802772580819994110:ℚ)/2^80⟩,
  ⟨(1269186125989887287135:ℚ)/2^80,(1269186125989887287136:ℚ)/2^80⟩,
  ⟨(321921845367697358544:ℚ)/2^80,(321921845367697358545:ℚ)/2^80⟩,
  ⟨(81653645909590875199:ℚ)/2^80,(81653645909590875200:ℚ)/2^80⟩,
  ⟨(20710983073278152018:ℚ)/2^80,(20710983073278152019:ℚ)/2^80⟩,
  ⟨(5253223111881047304:ℚ)/2^80,(5253223111881047306:ℚ)/2^80⟩,
  ⟨(1332450177066038237:ℚ)/2^80,(1332450177066038238:ℚ)/2^80⟩,
  ⟨(337968412258732730:ℚ)/2^80,(337968412258732731:ℚ)/2^80⟩,
  ⟨(85723766374663986:ℚ)/2^80,(85723766374663988:ℚ)/2^80⟩,
  ⟨(21743345990075121:ℚ)/2^80,(21743345990075123:ℚ)/2^80⟩,
  ⟨(5515076096607975:ℚ)/2^80,(5515076096607976:ℚ)/2^80⟩,
  ⟨(1398867697973451:ℚ)/2^80,(1398867697973452:ℚ)/2^80⟩,
  ⟨(354814838844577:ℚ)/2^80,(354814838844579:ℚ)/2^80⟩,
  ⟨(89996766704018:ℚ)/2^80,(89996766704019:ℚ)/2^80⟩,
  ⟨(22827168231048:ℚ)/2^80,(22827168231049:ℚ)/2^80⟩,
  ⟨(5789981446359:ℚ)/2^80,(5789981446360:ℚ)/2^80⟩,
  ⟨(1468595877064:ℚ)/2^80,(1468595877066:ℚ)/2^80⟩,
  ⟨(372500995057:ℚ)/2^80,(372500995058:ℚ)/2^80⟩,
  ⟨(94482759679:ℚ)/2^80,(94482759680:ℚ)/2^80⟩,
  ⟨(23965014845:ℚ)/2^80,(23965014846:ℚ)/2^80⟩,
  ⟨(6078589771:ℚ)/2^80,(6078589772:ℚ)/2^80⟩,
  ⟨(1541799737:ℚ)/2^80,(1541799739:ℚ)/2^80⟩,
  ⟨(391068737:ℚ)/2^80,(391068739:ℚ)/2^80⟩,
  ⟨(99192361:ℚ)/2^80,(99192363:ℚ)/2^80⟩,
  ⟨(25159578:ℚ)/2^80,(25159579:ℚ)/2^80⟩,
  ⟨(6381583:ℚ)/2^80,(6381585:ℚ)/2^80⟩,
  ⟨(1618652:ℚ)/2^80,(1618653:ℚ)/2^80⟩,
  ⟨(410561:ℚ)/2^80,(410563:ℚ)/2^80⟩,
  ⟨(104136:ℚ)/2^80,(104137:ℚ)/2^80⟩,
  ⟨(26413:ℚ)/2^80,(26414:ℚ)/2^80⟩,
  ⟨(6699:ℚ)/2^80,(6700:ℚ)/2^80⟩,
  ⟨(1699:ℚ)/2^80,(1700:ℚ)/2^80⟩,
  ⟨(430:ℚ)/2^80,(432:ℚ)/2^80⟩,
  ⟨(109:ℚ)/2^80,(110:ℚ)/2^80⟩,
  ⟨(27:ℚ)/2^80,(28:ℚ)/2^80⟩,
  ⟨(6:ℚ)/2^80,(8:ℚ)/2^80⟩,
  ⟨(1:ℚ)/2^80,(3:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (215:ℚ)/128,
  ⟨⟨(306637161243360752768038:ℚ)/2^80,(306637161243360752768039:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(597914043811532892:ℚ)/2^60,(597914043811532893:ℚ)/2^60⟩
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
end Point174

namespace Point175
/-- Exact original rational input. -/
def input : ℚ := (431:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(307950536291936107094004:ℚ)/2^80,(307950536291936107094005:ℚ)/2^80⟩,
  ⟨(78444459754132196130204:ℚ)/2^80,(78444459754132196130206:ℚ)/2^80⟩,
  ⟨(19982213183367007747868:ℚ)/2^80,(19982213183367007747870:ℚ)/2^80⟩,
  ⟨(5090083416432643895017:ℚ)/2^80,(5090083416432643895018:ℚ)/2^80⟩,
  ⟨(1296600579149508998002:ℚ)/2^80,(1296600579149508998004:ℚ)/2^80⟩,
  ⟨(330283990321927328457:ℚ)/2^80,(330283990321927328459:ℚ)/2^80⟩,
  ⟨(84133476428438548005:ℚ)/2^80,(84133476428438548007:ℚ)/2^80⟩,
  ⟨(21431380458481435081:ℚ)/2^80,(21431380458481435082:ℚ)/2^80⟩,
  ⟨(5459230830035300057:ℚ)/2^80,(5459230830035300058:ℚ)/2^80⟩,
  ⟨(1390633763109428689:ℚ)/2^80,(1390633763109428691:ℚ)/2^80⟩,
  ⟨(354237130340829724:ℚ)/2^80,(354237130340829725:ℚ)/2^80⟩,
  ⟨(90235076869934791:ℚ)/2^80,(90235076869934792:ℚ)/2^80⟩,
  ⟨(22985645490885863:ℚ)/2^80,(22985645490885865:ℚ)/2^80⟩,
  ⟨(5855149870312992:ℚ)/2^80,(5855149870312994:ℚ)/2^80⟩,
  ⟨(1491486502627035:ℚ)/2^80,(1491486502627037:ℚ)/2^80⟩,
  ⟨(379927420610962:ℚ)/2^80,(379927420610963:ℚ)/2^80⟩,
  ⟨(96779182833942:ℚ)/2^80,(96779182833943:ℚ)/2^80⟩,
  ⟨(24652630270654:ℚ)/2^80,(24652630270656:ℚ)/2^80⟩,
  ⟨(6279782092233:ℚ)/2^80,(6279782092235:ℚ)/2^80⟩,
  ⟨(1599653371383:ℚ)/2^80,(1599653371385:ℚ)/2^80⟩,
  ⟨(407480844238:ℚ)/2^80,(407480844240:ℚ)/2^80⟩,
  ⟨(103797886086:ℚ)/2^80,(103797886088:ℚ)/2^80⟩,
  ⟨(26440509556:ℚ)/2^80,(26440509557:ℚ)/2^80⟩,
  ⟨(6735209857:ℚ)/2^80,(6735209859:ℚ)/2^80⟩,
  ⟨(1715664810:ℚ)/2^80,(1715664812:ℚ)/2^80⟩,
  ⟨(437032520:ℚ)/2^80,(437032522:ℚ)/2^80⟩,
  ⟨(111325605:ℚ)/2^80,(111325607:ℚ)/2^80⟩,
  ⟨(28358050:ℚ)/2^80,(28358052:ℚ)/2^80⟩,
  ⟨(7223666:ℚ)/2^80,(7223667:ℚ)/2^80⟩,
  ⟨(1840089:ℚ)/2^80,(1840090:ℚ)/2^80⟩,
  ⟨(468727:ℚ)/2^80,(468728:ℚ)/2^80⟩,
  ⟨(119399:ℚ)/2^80,(119400:ℚ)/2^80⟩,
  ⟨(30414:ℚ)/2^80,(30415:ℚ)/2^80⟩,
  ⟨(7747:ℚ)/2^80,(7748:ℚ)/2^80⟩,
  ⟨(1973:ℚ)/2^80,(1974:ℚ)/2^80⟩,
  ⟨(502:ℚ)/2^80,(503:ℚ)/2^80⟩,
  ⟨(127:ℚ)/2^80,(129:ℚ)/2^80⟩,
  ⟨(32:ℚ)/2^80,(33:ℚ)/2^80⟩,
  ⟨(8:ℚ)/2^80,(9:ℚ)/2^80⟩,
  ⟨(2:ℚ)/2^80,(3:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (431:ℚ)/256,
  ⟨⟨(307950536291936107094004:ℚ)/2^80,(307950536291936107094005:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(600592143748851936:ℚ)/2^60,(600592143748851937:ℚ)/2^60⟩
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
end Point175

/-- Reusable proved logarithm bounds for these consecutive exact grid inputs. -/
def entries : Array CertifiedLogBound := #[⟨Point168.input, Point168.bounds, Point168.log_bounds⟩,
  ⟨Point169.input, Point169.bounds, Point169.log_bounds⟩,
  ⟨Point170.input, Point170.bounds, Point170.log_bounds⟩,
  ⟨Point171.input, Point171.bounds, Point171.log_bounds⟩,
  ⟨Point172.input, Point172.bounds, Point172.log_bounds⟩,
  ⟨Point173.input, Point173.bounds, Point173.log_bounds⟩,
  ⟨Point174.input, Point174.bounds, Point174.log_bounds⟩,
  ⟨Point175.input, Point175.bounds, Point175.log_bounds⟩]
end MatrixBounds.Numeric.LogGridData.Part021
