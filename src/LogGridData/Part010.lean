module

public import TabulatedLogBounds
public import FKLLog.GridTrace

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

namespace MatrixBounds.Numeric.LogGridData.Part010
set_option maxRecDepth 100000
set_option maxHeartbeats 16000000

namespace Point080
/-- Exact original rational input. -/
def input : ℚ := (21:ℚ)/16
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(163368354001976915500834:ℚ)/2^80,(163368354001976915500835:ℚ)/2^80⟩,
  ⟨(22076804594861745337950:ℚ)/2^80,(22076804594861745337951:ℚ)/2^80⟩,
  ⟨(2983351972278614234858:ℚ)/2^80,(2983351972278614234859:ℚ)/2^80⟩,
  ⟨(403155671929542464169:ℚ)/2^80,(403155671929542464171:ℚ)/2^80⟩,
  ⟨(54480496206694927590:ℚ)/2^80,(54480496206694927591:ℚ)/2^80⟩,
  ⟨(7362229217120936160:ℚ)/2^80,(7362229217120936161:ℚ)/2^80⟩,
  ⟨(994895840151477859:ℚ)/2^80,(994895840151477860:ℚ)/2^80⟩,
  ⟨(134445383804253764:ℚ)/2^80,(134445383804253765:ℚ)/2^80⟩,
  ⟨(18168295108682941:ℚ)/2^80,(18168295108682942:ℚ)/2^80⟩,
  ⟨(2455175014686883:ℚ)/2^80,(2455175014686885:ℚ)/2^80⟩,
  ⟨(331780407390119:ℚ)/2^80,(331780407390120:ℚ)/2^80⟩,
  ⟨(44835190187853:ℚ)/2^80,(44835190187855:ℚ)/2^80⟩,
  ⟨(6058809484844:ℚ)/2^80,(6058809484846:ℚ)/2^80⟩,
  ⟨(818758038492:ℚ)/2^80,(818758038493:ℚ)/2^80⟩,
  ⟨(110642978174:ℚ)/2^80,(110642978175:ℚ)/2^80⟩,
  ⟨(14951753807:ℚ)/2^80,(14951753808:ℚ)/2^80⟩,
  ⟨(2020507271:ℚ)/2^80,(2020507272:ℚ)/2^80⟩,
  ⟨(273041523:ℚ)/2^80,(273041524:ℚ)/2^80⟩,
  ⟨(36897503:ℚ)/2^80,(36897504:ℚ)/2^80⟩,
  ⟨(4986149:ℚ)/2^80,(4986150:ℚ)/2^80⟩,
  ⟨(673803:ℚ)/2^80,(673805:ℚ)/2^80⟩,
  ⟨(91054:ℚ)/2^80,(91055:ℚ)/2^80⟩,
  ⟨(12304:ℚ)/2^80,(12305:ℚ)/2^80⟩,
  ⟨(1662:ℚ)/2^80,(1663:ℚ)/2^80⟩,
  ⟨(224:ℚ)/2^80,(225:ℚ)/2^80⟩,
  ⟨(30:ℚ)/2^80,(31:ℚ)/2^80⟩,
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
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (21:ℚ)/16,
  ⟨⟨(163368354001976915500834:ℚ)/2^80,(163368354001976915500835:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(313518228408730496:ℚ)/2^60,(313518228408730497:ℚ)/2^60⟩
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
end Point080

namespace Point081
/-- Exact original rational input. -/
def input : ℚ := (337:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(165131520048541253206071:ℚ)/2^80,(165131520048541253206072:ℚ)/2^80⟩,
  ⟨(22555907460256056508755:ℚ)/2^80,(22555907460256056508756:ℚ)/2^80⟩,
  ⟨(3080992418685903165614:ℚ)/2^80,(3080992418685903165615:ℚ)/2^80⟩,
  ⟨(420843821102121680294:ℚ)/2^80,(420843821102121680295:ℚ)/2^80⟩,
  ⟨(57484569155601780950:ℚ)/2^80,(57484569155601780951:ℚ)/2^80⟩,
  ⟨(7852023780107494531:ℚ)/2^80,(7852023780107494532:ℚ)/2^80⟩,
  ⟨(1072536131852794362:ℚ)/2^80,(1072536131852794363:ℚ)/2^80⟩,
  ⟨(146501562698273766:ℚ)/2^80,(146501562698273767:ℚ)/2^80⟩,
  ⟨(20011174668735539:ℚ)/2^80,(20011174668735540:ℚ)/2^80⟩,
  ⟨(2733398226252240:ℚ)/2^80,(2733398226252241:ℚ)/2^80⟩,
  ⟨(373364681832093:ℚ)/2^80,(373364681832094:ℚ)/2^80⟩,
  ⟨(50999222982124:ℚ)/2^80,(50999222982125:ℚ)/2^80⟩,
  ⟨(6966167051521:ℚ)/2^80,(6966167051522:ℚ)/2^80⟩,
  ⟨(951533779381:ℚ)/2^80,(951533779382:ℚ)/2^80⟩,
  ⟨(129973416745:ℚ)/2^80,(129973416746:ℚ)/2^80⟩,
  ⟨(17753535845:ℚ)/2^80,(17753535846:ℚ)/2^80⟩,
  ⟨(2425019230:ℚ)/2^80,(2425019231:ℚ)/2^80⟩,
  ⟨(331242087:ℚ)/2^80,(331242088:ℚ)/2^80⟩,
  ⟨(45245546:ℚ)/2^80,(45245547:ℚ)/2^80⟩,
  ⟨(6180251:ℚ)/2^80,(6180252:ℚ)/2^80⟩,
  ⟨(844182:ℚ)/2^80,(844183:ℚ)/2^80⟩,
  ⟨(115309:ℚ)/2^80,(115310:ℚ)/2^80⟩,
  ⟨(15750:ℚ)/2^80,(15751:ℚ)/2^80⟩,
  ⟨(2151:ℚ)/2^80,(2152:ℚ)/2^80⟩,
  ⟨(293:ℚ)/2^80,(294:ℚ)/2^80⟩,
  ⟨(40:ℚ)/2^80,(41:ℚ)/2^80⟩,
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
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (337:ℚ)/256,
  ⟨⟨(165131520048541253206071:ℚ)/2^80,(165131520048541253206072:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(316944446397144025:ℚ)/2^60,(316944446397144026:ℚ)/2^60⟩
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
end Point081

namespace Point082
/-- Exact original rational input. -/
def input : ℚ := (169:ℚ)/128
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(166888749509090222770886:ℚ)/2^80,(166888749509090222770887:ℚ)/2^80⟩,
  ⟨(23038514241995619978472:ℚ)/2^80,(23038514241995619978473:ℚ)/2^80⟩,
  ⟨(3180400955965725316893:ℚ)/2^80,(3180400955965725316894:ℚ)/2^80⟩,
  ⟨(439045249813450296271:ℚ)/2^80,(439045249813450296272:ℚ)/2^80⟩,
  ⟨(60608940209937582986:ℚ)/2^80,(60608940209937582988:ℚ)/2^80⟩,
  ⟨(8366890736051989570:ℚ)/2^80,(8366890736051989571:ℚ)/2^80⟩,
  ⟨(1155025320465089469:ℚ)/2^80,(1155025320465089470:ℚ)/2^80⟩,
  ⟨(159447939862184068:ℚ)/2^80,(159447939862184069:ℚ)/2^80⟩,
  ⟨(22011331765486689:ℚ)/2^80,(22011331765486690:ℚ)/2^80⟩,
  ⟨(3038601354831495:ℚ)/2^80,(3038601354831496:ℚ)/2^80⟩,
  ⟨(419470220700644:ℚ)/2^80,(419470220700645:ℚ)/2^80⟩,
  ⟨(57906663463725:ℚ)/2^80,(57906663463726:ℚ)/2^80⟩,
  ⟨(7993849165026:ℚ)/2^80,(7993849165027:ℚ)/2^80⟩,
  ⟨(1103527999212:ℚ)/2^80,(1103527999213:ℚ)/2^80⟩,
  ⟨(152338882046:ℚ)/2^80,(152338882047:ℚ)/2^80⟩,
  ⟨(21029946679:ℚ)/2^80,(21029946680:ℚ)/2^80⟩,
  ⟨(2903123952:ℚ)/2^80,(2903123953:ℚ)/2^80⟩,
  ⟨(400767952:ℚ)/2^80,(400767954:ℚ)/2^80⟩,
  ⟨(55324868:ℚ)/2^80,(55324870:ℚ)/2^80⟩,
  ⟨(7637439:ℚ)/2^80,(7637440:ℚ)/2^80⟩,
  ⟨(1054326:ℚ)/2^80,(1054327:ℚ)/2^80⟩,
  ⟨(145546:ℚ)/2^80,(145547:ℚ)/2^80⟩,
  ⟨(20092:ℚ)/2^80,(20093:ℚ)/2^80⟩,
  ⟨(2773:ℚ)/2^80,(2774:ℚ)/2^80⟩,
  ⟨(382:ℚ)/2^80,(383:ℚ)/2^80⟩,
  ⟨(52:ℚ)/2^80,(53:ℚ)/2^80⟩,
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
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (169:ℚ)/128,
  ⟨⟨(166888749509090222770886:ℚ)/2^80,(166888749509090222770887:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(320360512613678782:ℚ)/2^60,(320360512613678784:ℚ)/2^60⟩
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
end Point082

namespace Point083
/-- Exact original rational input. -/
def input : ℚ := (339:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(168640072315990288236323:ℚ)/2^80,(168640072315990288236324:ℚ)/2^80⟩,
  ⟨(23524581516348225081705:ℚ)/2^80,(23524581516348225081706:ℚ)/2^80⟩,
  ⟨(3281580278751096944170:ℚ)/2^80,(3281580278751096944171:ℚ)/2^80⟩,
  ⟨(457766660733346296413:ℚ)/2^80,(457766660733346296414:ℚ)/2^80⟩,
  ⟨(63856525782970995970:ℚ)/2^80,(63856525782970995971:ℚ)/2^80⟩,
  ⟨(8907717041994273387:ℚ)/2^80,(8907717041994273388:ℚ)/2^80⟩,
  ⟨(1242589099975671749:ℚ)/2^80,(1242589099975671750:ℚ)/2^80⟩,
  ⟨(173335958484001269:ℚ)/2^80,(173335958484001270:ℚ)/2^80⟩,
  ⟨(24179637906171605:ℚ)/2^80,(24179637906171606:ℚ)/2^80⟩,
  ⟨(3372957892793686:ℚ)/2^80,(3372957892793687:ℚ)/2^80⟩,
  ⟨(470513453952732:ℚ)/2^80,(470513453952733:ℚ)/2^80⟩,
  ⟨(65634649879120:ℚ)/2^80,(65634649879121:ℚ)/2^80⟩,
  ⟨(9155757882297:ℚ)/2^80,(9155757882298:ℚ)/2^80⟩,
  ⟨(1277189755009:ℚ)/2^80,(1277189755010:ℚ)/2^80⟩,
  ⟨(178162604480:ℚ)/2^80,(178162604481:ℚ)/2^80⟩,
  ⟨(24852934742:ℚ)/2^80,(24852934743:ℚ)/2^80⟩,
  ⟨(3466879972:ℚ)/2^80,(3466879973:ℚ)/2^80⟩,
  ⟨(483615189:ℚ)/2^80,(483615190:ℚ)/2^80⟩,
  ⟨(67462286:ℚ)/2^80,(67462288:ℚ)/2^80⟩,
  ⟨(9410705:ℚ)/2^80,(9410706:ℚ)/2^80⟩,
  ⟨(1312753:ℚ)/2^80,(1312754:ℚ)/2^80⟩,
  ⟨(183123:ℚ)/2^80,(183124:ℚ)/2^80⟩,
  ⟨(25544:ℚ)/2^80,(25546:ℚ)/2^80⟩,
  ⟨(3563:ℚ)/2^80,(3564:ℚ)/2^80⟩,
  ⟨(497:ℚ)/2^80,(498:ℚ)/2^80⟩,
  ⟨(69:ℚ)/2^80,(70:ℚ)/2^80⟩,
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
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (339:ℚ)/256,
  ⟨⟨(168640072315990288236323:ℚ)/2^80,(168640072315990288236324:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(323766487039392931:ℚ)/2^60,(323766487039392932:ℚ)/2^60⟩
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
end Point083

namespace Point084
/-- Exact original rational input. -/
def input : ℚ := (85:ℚ)/64
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(170385518200719548112950:ℚ)/2^80,(170385518200719548112951:ℚ)/2^80⟩,
  ⟨(24014066323591345707194:ℚ)/2^80,(24014066323591345707195:ℚ)/2^80⟩,
  ⟨(3384532837553142683564:ℚ)/2^80,(3384532837553142683565:ℚ)/2^80⟩,
  ⟨(477014695225610713790:ℚ)/2^80,(477014695225610713792:ℚ)/2^80⟩,
  ⟨(67230259058643120735:ℚ)/2^80,(67230259058643120736:ℚ)/2^80⟩,
  ⟨(9475405639137621043:ℚ)/2^80,(9475405639137621044:ℚ)/2^80⟩,
  ⟨(1335459855180470079:ℚ)/2^80,(1335459855180470081:ℚ)/2^80⟩,
  ⟨(188219174220066252:ℚ)/2^80,(188219174220066254:ℚ)/2^80⟩,
  ⟨(26527534621620075:ℚ)/2^80,(26527534621620077:ℚ)/2^80⟩,
  ⟨(3738780047342426:ℚ)/2^80,(3738780047342427:ℚ)/2^80⟩,
  ⟨(526942154323429:ℚ)/2^80,(526942154323430:ℚ)/2^80⟩,
  ⟨(74267015038872:ℚ)/2^80,(74267015038873:ℚ)/2^80⟩,
  ⟨(10467163193398:ℚ)/2^80,(10467163193399:ℚ)/2^80⟩,
  ⟨(1475237765512:ℚ)/2^80,(1475237765513:ℚ)/2^80⟩,
  ⟨(207919416615:ℚ)/2^80,(207919416616:ℚ)/2^80⟩,
  ⟨(29304078851:ℚ)/2^80,(29304078852:ℚ)/2^80⟩,
  ⟨(4130105072:ℚ)/2^80,(4130105074:ℚ)/2^80⟩,
  ⟨(582095345:ℚ)/2^80,(582095347:ℚ)/2^80⟩,
  ⟨(82040283:ℚ)/2^80,(82040284:ℚ)/2^80⟩,
  ⟨(11562724:ℚ)/2^80,(11562725:ℚ)/2^80⟩,
  ⟨(1629645:ℚ)/2^80,(1629646:ℚ)/2^80⟩,
  ⟨(229681:ℚ)/2^80,(229682:ℚ)/2^80⟩,
  ⟨(32371:ℚ)/2^80,(32372:ℚ)/2^80⟩,
  ⟨(4562:ℚ)/2^80,(4563:ℚ)/2^80⟩,
  ⟨(642:ℚ)/2^80,(644:ℚ)/2^80⟩,
  ⟨(90:ℚ)/2^80,(91:ℚ)/2^80⟩,
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
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (85:ℚ)/64,
  ⟨⟨(170385518200719548112950:ℚ)/2^80,(170385518200719548112951:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(327162429125319016:ℚ)/2^60,(327162429125319017:ℚ)/2^60⟩
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
end Point084

namespace Point085
/-- Exact original rational input. -/
def input : ℚ := (341:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(172125116695550217504229:ℚ)/2^80,(172125116695550217504230:ℚ)/2^80⟩,
  ⟨(24506926162683029292896:ℚ)/2^80,(24506926162683029292898:ℚ)/2^80⟩,
  ⟨(3489260843933094622941:ℚ)/2^80,(3489260843933094622942:ℚ)/2^80⟩,
  ⟨(496795932553288179145:ℚ)/2^80,(496795932553288179146:ℚ)/2^80⟩,
  ⟨(70733089224505017131:ℚ)/2^80,(70733089224505017132:ℚ)/2^80⟩,
  ⟨(10070875350222657380:ℚ)/2^80,(10070875350222657381:ℚ)/2^80⟩,
  ⟨(1433876724906073496:ℚ)/2^80,(1433876724906073497:ℚ)/2^80⟩,
  ⟨(204153302541065740:ℚ)/2^80,(204153302541065741:ℚ)/2^80⟩,
  ⟨(29067053125612375:ℚ)/2^80,(29067053125612376:ℚ)/2^80⟩,
  ⟨(4138525151887859:ℚ)/2^80,(4138525151887860:ℚ)/2^80⟩,
  ⟨(589237249431269:ℚ)/2^80,(589237249431270:ℚ)/2^80⟩,
  ⟨(83894750756545:ℚ)/2^80,(83894750756546:ℚ)/2^80⟩,
  ⟨(11944813759307:ℚ)/2^80,(11944813759308:ℚ)/2^80⟩,
  ⟨(1700685376115:ℚ)/2^80,(1700685376116:ℚ)/2^80⟩,
  ⟨(242141133952:ℚ)/2^80,(242141133953:ℚ)/2^80⟩,
  ⟨(34475705839:ℚ)/2^80,(34475705840:ℚ)/2^80⟩,
  ⟨(4908601333:ℚ)/2^80,(4908601335:ℚ)/2^80⟩,
  ⟨(698879586:ℚ)/2^80,(698879588:ℚ)/2^80⟩,
  ⟨(99505468:ℚ)/2^80,(99505469:ℚ)/2^80⟩,
  ⟨(14167445:ℚ)/2^80,(14167446:ℚ)/2^80⟩,
  ⟨(2017140:ℚ)/2^80,(2017141:ℚ)/2^80⟩,
  ⟨(287197:ℚ)/2^80,(287198:ℚ)/2^80⟩,
  ⟨(40890:ℚ)/2^80,(40891:ℚ)/2^80⟩,
  ⟨(5821:ℚ)/2^80,(5823:ℚ)/2^80⟩,
  ⟨(828:ℚ)/2^80,(830:ℚ)/2^80⟩,
  ⟨(117:ℚ)/2^80,(119:ℚ)/2^80⟩,
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
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (341:ℚ)/256,
  ⟨⟨(172125116695550217504229:ℚ)/2^80,(172125116695550217504230:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(330548397798690427:ℚ)/2^60,(330548397798690428:ℚ)/2^60⟩
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
end Point085

namespace Point086
/-- Exact original rational input. -/
def input : ℚ := (171:ℚ)/128
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(173858897135214229138346:ℚ)/2^80,(173858897135214229138347:ℚ)/2^80⟩,
  ⟨(25003118986000708538290:ℚ)/2^80,(25003118986000708538291:ℚ)/2^80⟩,
  ⟨(3595766275578697214536:ℚ)/2^80,(3595766275578697214537:ℚ)/2^80⟩,
  ⟨(517116889130046756605:ℚ)/2^80,(517116889130046756606:ℚ)/2^80⟩,
  ⟨(74367980711010068675:ℚ)/2^80,(74367980711010068676:ℚ)/2^80⟩,
  ⟨(10695060771148605194:ℚ)/2^80,(10695060771148605195:ℚ)/2^80⟩,
  ⟨(1538085662740434860:ℚ)/2^80,(1538085662740434861:ℚ)/2^80⟩,
  ⟨(221196265879059193:ℚ)/2^80,(221196265879059195:ℚ)/2^80⟩,
  ⟨(31810834223409850:ℚ)/2^80,(31810834223409851:ℚ)/2^80⟩,
  ⟨(4574802246175998:ℚ)/2^80,(4574802246175999:ℚ)/2^80⟩,
  ⟨(657914704299558:ℚ)/2^80,(657914704299559:ℚ)/2^80⟩,
  ⟨(94616495936056:ℚ)/2^80,(94616495936057:ℚ)/2^80⟩,
  ⟨(13607054599499:ℚ)/2^80,(13607054599500:ℚ)/2^80⟩,
  ⟨(1956867383874:ℚ)/2^80,(1956867383875:ℚ)/2^80⟩,
  ⟨(281422399687:ℚ)/2^80,(281422399688:ℚ)/2^80⟩,
  ⟨(40472117680:ℚ)/2^80,(40472117681:ℚ)/2^80⟩,
  ⟨(5820404883:ℚ)/2^80,(5820404884:ℚ)/2^80⟩,
  ⟨(837048193:ℚ)/2^80,(837048195:ℚ)/2^80⟩,
  ⟨(120378168:ℚ)/2^80,(120378169:ℚ)/2^80⟩,
  ⟨(17311910:ℚ)/2^80,(17311911:ℚ)/2^80⟩,
  ⟨(2489672:ℚ)/2^80,(2489673:ℚ)/2^80⟩,
  ⟨(358046:ℚ)/2^80,(358047:ℚ)/2^80⟩,
  ⟨(51491:ℚ)/2^80,(51492:ℚ)/2^80⟩,
  ⟨(7405:ℚ)/2^80,(7406:ℚ)/2^80⟩,
  ⟨(1064:ℚ)/2^80,(1066:ℚ)/2^80⟩,
  ⟨(153:ℚ)/2^80,(154:ℚ)/2^80⟩,
  ⟨(22:ℚ)/2^80,(23:ℚ)/2^80⟩,
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
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (171:ℚ)/128,
  ⟨⟨(173858897135214229138346:ℚ)/2^80,(173858897135214229138347:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(333924451469076695:ℚ)/2^60,(333924451469076696:ℚ)/2^60⟩
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
end Point086

namespace Point087
/-- Exact original rational input. -/
def input : ℚ := (343:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(175586888658552150583367:ℚ)/2^80,(175586888658552150583368:ℚ)/2^80⟩,
  ⟨(25502603194146973457016:ℚ)/2^80,(25502603194146973457017:ℚ)/2^80⟩,
  ⟨(3704050881286789133155:ℚ)/2^80,(3704050881286789133157:ℚ)/2^80⟩,
  ⟨(537984017816278221343:ℚ)/2^80,(537984017816278221344:ℚ)/2^80⟩,
  ⟨(78137912437422713283:ℚ)/2^80,(78137912437422713284:ℚ)/2^80⟩,
  ⟨(11348912157021328974:ℚ)/2^80,(11348912157021328975:ℚ)/2^80⟩,
  ⟨(1648339495260193022:ℚ)/2^80,(1648339495260193024:ℚ)/2^80⟩,
  ⟨(239408240546972943:ℚ)/2^80,(239408240546972944:ℚ)/2^80⟩,
  ⟨(34772148460077873:ℚ)/2^80,(34772148460077874:ℚ)/2^80⟩,
  ⟨(5050378824752545:ℚ)/2^80,(5050378824752546:ℚ)/2^80⟩,
  ⟨(733527475381421:ℚ)/2^80,(733527475381422:ℚ)/2^80⟩,
  ⟨(106539049011992:ℚ)/2^80,(106539049011993:ℚ)/2^80⟩,
  ⟨(15473952026783:ℚ)/2^80,(15473952026784:ℚ)/2^80⟩,
  ⟨(2247468825258:ℚ)/2^80,(2247468825260:ℚ)/2^80⟩,
  ⟨(326427024703:ℚ)/2^80,(326427024704:ℚ)/2^80⟩,
  ⟨(47410936809:ℚ)/2^80,(47410936811:ℚ)/2^80⟩,
  ⟨(6886062608:ℚ)/2^80,(6886062609:ℚ)/2^80⟩,
  ⟨(1000145988:ℚ)/2^80,(1000145989:ℚ)/2^80⟩,
  ⟨(145263273:ℚ)/2^80,(145263274:ℚ)/2^80⟩,
  ⟨(21098338:ℚ)/2^80,(21098339:ℚ)/2^80⟩,
  ⟨(3064366:ℚ)/2^80,(3064367:ℚ)/2^80⟩,
  ⟨(445074:ℚ)/2^80,(445076:ℚ)/2^80⟩,
  ⟨(64643:ℚ)/2^80,(64644:ℚ)/2^80⟩,
  ⟨(9388:ℚ)/2^80,(9390:ℚ)/2^80⟩,
  ⟨(1363:ℚ)/2^80,(1364:ℚ)/2^80⟩,
  ⟨(197:ℚ)/2^80,(199:ℚ)/2^80⟩,
  ⟨(28:ℚ)/2^80,(29:ℚ)/2^80⟩,
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
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (343:ℚ)/256,
  ⟨⟨(175586888658552150583367:ℚ)/2^80,(175586888658552150583368:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(337290648034429223:ℚ)/2^60,(337290648034429224:ℚ)/2^60⟩
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
end Point087

/-- Reusable proved logarithm bounds for these consecutive exact grid inputs. -/
def entries : Array CertifiedLogBound := #[⟨Point080.input, Point080.bounds, Point080.log_bounds⟩,
  ⟨Point081.input, Point081.bounds, Point081.log_bounds⟩,
  ⟨Point082.input, Point082.bounds, Point082.log_bounds⟩,
  ⟨Point083.input, Point083.bounds, Point083.log_bounds⟩,
  ⟨Point084.input, Point084.bounds, Point084.log_bounds⟩,
  ⟨Point085.input, Point085.bounds, Point085.log_bounds⟩,
  ⟨Point086.input, Point086.bounds, Point086.log_bounds⟩,
  ⟨Point087.input, Point087.bounds, Point087.log_bounds⟩]
end MatrixBounds.Numeric.LogGridData.Part010
