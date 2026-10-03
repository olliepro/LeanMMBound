module

public import TabulatedLogBounds
public import FKLLog.GridTrace

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

namespace MatrixBounds.Numeric.LogGridData.Part027
set_option maxRecDepth 100000
set_option maxHeartbeats 16000000

namespace Point216
/-- Exact original rational input. -/
def input : ℚ := (59:ℚ)/32
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(358692276149395469418315:ℚ)/2^80,(358692276149395469418316:ℚ)/2^80⟩,
  ⟨(106425180835534919497741:ℚ)/2^80,(106425180835534919497743:ℚ)/2^80⟩,
  ⟨(31576702006147723367461:ℚ)/2^80,(31576702006147723367463:ℚ)/2^80⟩,
  ⟨(9368911584241632207927:ℚ)/2^80,(9368911584241632207929:ℚ)/2^80⟩,
  ⟨(2779786953566198567187:ℚ)/2^80,(2779786953566198567188:ℚ)/2^80⟩,
  ⟨(824771953255905069385:ℚ)/2^80,(824771953255905069386:ℚ)/2^80⟩,
  ⟨(244712557559444361246:ℚ)/2^80,(244712557559444361247:ℚ)/2^80⟩,
  ⟨(72607022572582392897:ℚ)/2^80,(72607022572582392898:ℚ)/2^80⟩,
  ⟨(21542742961095874815:ℚ)/2^80,(21542742961095874816:ℚ)/2^80⟩,
  ⟨(6391802856588885934:ℚ)/2^80,(6391802856588885935:ℚ)/2^80⟩,
  ⟨(1896468979427471650:ℚ)/2^80,(1896468979427471652:ℚ)/2^80⟩,
  ⟨(562688598291667412:ℚ)/2^80,(562688598291667414:ℚ)/2^80⟩,
  ⟨(166951562130494726:ℚ)/2^80,(166951562130494728:ℚ)/2^80⟩,
  ⟨(49535078873883050:ℚ)/2^80,(49535078873883052:ℚ)/2^80⟩,
  ⟨(14697221204338926:ℚ)/2^80,(14697221204338928:ℚ)/2^80⟩,
  ⟨(4360713983704956:ℚ)/2^80,(4360713983704957:ℚ)/2^80⟩,
  ⟨(1293838214945426:ℚ)/2^80,(1293838214945427:ℚ)/2^80⟩,
  ⟨(383886063775016:ℚ)/2^80,(383886063775017:ℚ)/2^80⟩,
  ⟨(113900260680499:ℚ)/2^80,(113900260680500:ℚ)/2^80⟩,
  ⟨(33794582839268:ℚ)/2^80,(33794582839270:ℚ)/2^80⟩,
  ⟨(10026964139123:ℚ)/2^80,(10026964139125:ℚ)/2^80⟩,
  ⟨(2975033316003:ℚ)/2^80,(2975033316005:ℚ)/2^80⟩,
  ⟨(882702192660:ℚ)/2^80,(882702192661:ℚ)/2^80⟩,
  ⟨(261900650569:ℚ)/2^80,(261900650570:ℚ)/2^80⟩,
  ⟨(77706786432:ℚ)/2^80,(77706786433:ℚ)/2^80⟩,
  ⟨(23055859710:ℚ)/2^80,(23055859711:ℚ)/2^80⟩,
  ⟨(6840749584:ℚ)/2^80,(6840749585:ℚ)/2^80⟩,
  ⟨(2029672953:ℚ)/2^80,(2029672954:ℚ)/2^80⟩,
  ⟨(602210656:ℚ)/2^80,(602210657:ℚ)/2^80⟩,
  ⟨(178677886:ℚ)/2^80,(178677888:ℚ)/2^80⟩,
  ⟨(53014317:ℚ)/2^80,(53014319:ℚ)/2^80⟩,
  ⟨(15729522:ℚ)/2^80,(15729524:ℚ)/2^80⟩,
  ⟨(4667001:ℚ)/2^80,(4667002:ℚ)/2^80⟩,
  ⟨(1384714:ℚ)/2^80,(1384715:ℚ)/2^80⟩,
  ⟨(410849:ℚ)/2^80,(410850:ℚ)/2^80⟩,
  ⟨(121900:ℚ)/2^80,(121901:ℚ)/2^80⟩,
  ⟨(36168:ℚ)/2^80,(36169:ℚ)/2^80⟩,
  ⟨(10731:ℚ)/2^80,(10732:ℚ)/2^80⟩,
  ⟨(3183:ℚ)/2^80,(3185:ℚ)/2^80⟩,
  ⟨(944:ℚ)/2^80,(946:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (59:ℚ)/32,
  ⟨⟨(358692276149395469418315:ℚ)/2^80,(358692276149395469418316:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(705359153292709076:ℚ)/2^60,(705359153292709077:ℚ)/2^60⟩
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
end Point216

namespace Point217
/-- Exact original rational input. -/
def input : ℚ := (473:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(359858577306412250907051:ℚ)/2^80,(359858577306412250907052:ℚ)/2^80⟩,
  ⟨(107118396811373742725418:ℚ)/2^80,(107118396811373742725420:ℚ)/2^80⟩,
  ⟨(31885723056334845228279:ℚ)/2^80,(31885723056334845228281:ℚ)/2^80⟩,
  ⟨(9491360635424775602930:ℚ)/2^80,(9491360635424775602932:ℚ)/2^80⟩,
  ⟨(2825274702177196578649:ℚ)/2^80,(2825274702177196578651:ℚ)/2^80⟩,
  ⟨(840993978563033823822:ℚ)/2^80,(840993978563033823824:ℚ)/2^80⟩,
  ⟨(250337027912453140973:ℚ)/2^80,(250337027912453140974:ℚ)/2^80⟩,
  ⟨(74517332039783719603:ℚ)/2^80,(74517332039783719605:ℚ)/2^80⟩,
  ⟨(22181428055738089374:ℚ)/2^80,(22181428055738089375:ℚ)/2^80⟩,
  ⟨(6602702178457017001:ℚ)/2^80,(6602702178457017002:ℚ)/2^80⟩,
  ⟨(1965413405658673099:ℚ)/2^80,(1965413405658673100:ℚ)/2^80⟩,
  ⟨(585040753124735339:ℚ)/2^80,(585040753124735340:ℚ)/2^80⟩,
  ⟨(174147933371834799:ℚ)/2^80,(174147933371834800:ℚ)/2^80⟩,
  ⟨(51838273719736833:ℚ)/2^80,(51838273719736834:ℚ)/2^80⟩,
  ⟨(15430597252651430:ℚ)/2^80,(15430597252651431:ℚ)/2^80⟩,
  ⟨(4593195615672647:ℚ)/2^80,(4593195615672649:ℚ)/2^80⟩,
  ⟨(1367247528945081:ℚ)/2^80,(1367247528945083:ℚ)/2^80⟩,
  ⟨(406985889960332:ℚ)/2^80,(406985889960334:ℚ)/2^80⟩,
  ⟨(121146691524543:ℚ)/2^80,(121146691524544:ℚ)/2^80⟩,
  ⟨(36061498025824:ℚ)/2^80,(36061498025825:ℚ)/2^80⟩,
  ⟨(10734355379429:ℚ)/2^80,(10734355379430:ℚ)/2^80⟩,
  ⟨(3195274509377:ℚ)/2^80,(3195274509378:ℚ)/2^80⟩,
  ⟨(951131095383:ℚ)/2^80,(951131095385:ℚ)/2^80⟩,
  ⟨(283121327432:ℚ)/2^80,(283121327433:ℚ)/2^80⟩,
  ⟨(84276170168:ℚ)/2^80,(84276170169:ℚ)/2^80⟩,
  ⟨(25086322258:ℚ)/2^80,(25086322259:ℚ)/2^80⟩,
  ⟨(7467396337:ℚ)/2^80,(7467396338:ℚ)/2^80⟩,
  ⟨(2222805219:ℚ)/2^80,(2222805220:ℚ)/2^80⟩,
  ⟨(661658069:ℚ)/2^80,(661658070:ℚ)/2^80⟩,
  ⟨(196954459:ℚ)/2^80,(196954460:ℚ)/2^80⟩,
  ⟨(58627047:ℚ)/2^80,(58627048:ℚ)/2^80⟩,
  ⟨(17451398:ℚ)/2^80,(17451399:ℚ)/2^80⟩,
  ⟨(5194723:ℚ)/2^80,(5194724:ℚ)/2^80⟩,
  ⟨(1546303:ℚ)/2^80,(1546304:ℚ)/2^80⟩,
  ⟨(460284:ℚ)/2^80,(460286:ℚ)/2^80⟩,
  ⟨(137011:ℚ)/2^80,(137013:ℚ)/2^80⟩,
  ⟨(40783:ℚ)/2^80,(40785:ℚ)/2^80⟩,
  ⟨(12139:ℚ)/2^80,(12141:ℚ)/2^80⟩,
  ⟨(3613:ℚ)/2^80,(3614:ℚ)/2^80⟩,
  ⟨(1075:ℚ)/2^80,(1076:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (473:ℚ)/256,
  ⟨⟨(359858577306412250907051:ℚ)/2^80,(359858577306412250907052:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(707799199715884230:ℚ)/2^60,(707799199715884231:ℚ)/2^60⟩
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
end Point217

namespace Point218
/-- Exact original rational input. -/
def input : ℚ := (237:ℚ)/128
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(361021683117793369980748:ℚ)/2^80,(361021683117793369980749:ℚ)/2^80⟩,
  ⟨(107811954684491718706579:ℚ)/2^80,(107811954684491718706581:ℚ)/2^80⟩,
  ⟨(32195898796190677641142:ℚ)/2^80,(32195898796190677641144:ℚ)/2^80⟩,
  ⟨(9614665667903517432560:ℚ)/2^80,(9614665667903517432561:ℚ)/2^80⟩,
  ⟨(2871228925483516164791:ℚ)/2^80,(2871228925483516164793:ℚ)/2^80⟩,
  ⟨(857435487336173320444:ℚ)/2^80,(857435487336173320446:ℚ)/2^80⟩,
  ⟨(256056077040117512132:ℚ)/2^80,(256056077040117512134:ℚ)/2^80⟩,
  ⟨(76466061362665229650:ℚ)/2^80,(76466061362665229651:ℚ)/2^80⟩,
  ⟨(22835070379535643922:ℚ)/2^80,(22835070379535643924:ℚ)/2^80⟩,
  ⟨(6819240195532562157:ℚ)/2^80,(6819240195532562159:ℚ)/2^80⟩,
  ⟨(2036430633734381575:ℚ)/2^80,(2036430633734381577:ℚ)/2^80⟩,
  ⟨(608139559115198881:ℚ)/2^80,(608139559115198882:ℚ)/2^80⟩,
  ⟨(181608799845360761:ℚ)/2^80,(181608799845360763:ℚ)/2^80⟩,
  ⟨(54233860775737871:ℚ)/2^80,(54233860775737872:ℚ)/2^80⟩,
  ⟨(16195865272754597:ℚ)/2^80,(16195865272754598:ℚ)/2^80⟩,
  ⟨(4836573465014386:ℚ)/2^80,(4836573465014387:ℚ)/2^80⟩,
  ⟨(1444346596401556:ℚ)/2^80,(1444346596401557:ℚ)/2^80⟩,
  ⟨(431325421939094:ℚ)/2^80,(431325421939096:ℚ)/2^80⟩,
  ⟨(128806769839345:ℚ)/2^80,(128806769839347:ℚ)/2^80⟩,
  ⟨(38465583321886:ℚ)/2^80,(38465583321888:ℚ)/2^80⟩,
  ⟨(11486982416672:ℚ)/2^80,(11486982416674:ℚ)/2^80⟩,
  ⟨(3430359132649:ℚ)/2^80,(3430359132651:ℚ)/2^80⟩,
  ⟨(1024408617695:ℚ)/2^80,(1024408617696:ℚ)/2^80⟩,
  ⟨(305919285832:ℚ)/2^80,(305919285833:ℚ)/2^80⟩,
  ⟨(91356718234:ℚ)/2^80,(91356718236:ℚ)/2^80⟩,
  ⟨(27281869280:ℚ)/2^80,(27281869282:ℚ)/2^80⟩,
  ⟨(8147188360:ℚ)/2^80,(8147188361:ℚ)/2^80⟩,
  ⟨(2432995975:ℚ)/2^80,(2432995977:ℚ)/2^80⟩,
  ⟨(726565921:ℚ)/2^80,(726565922:ℚ)/2^80⟩,
  ⟨(216974480:ℚ)/2^80,(216974481:ℚ)/2^80⟩,
  ⟨(64795118:ℚ)/2^80,(64795119:ℚ)/2^80⟩,
  ⟨(19349774:ℚ)/2^80,(19349776:ℚ)/2^80⟩,
  ⟨(5778425:ℚ)/2^80,(5778427:ℚ)/2^80⟩,
  ⟨(1725611:ℚ)/2^80,(1725613:ℚ)/2^80⟩,
  ⟨(515319:ℚ)/2^80,(515321:ℚ)/2^80⟩,
  ⟨(153889:ℚ)/2^80,(153891:ℚ)/2^80⟩,
  ⟨(45955:ℚ)/2^80,(45957:ℚ)/2^80⟩,
  ⟨(13723:ℚ)/2^80,(13725:ℚ)/2^80⟩,
  ⟨(4098:ℚ)/2^80,(4099:ℚ)/2^80⟩,
  ⟨(1223:ℚ)/2^80,(1225:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (237:ℚ)/128,
  ⟨⟨(361021683117793369980748:ℚ)/2^80,(361021683117793369980749:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(710234092922081623:ℚ)/2^60,(710234092922081624:ℚ)/2^60⟩
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
end Point218

namespace Point219
/-- Exact original rational input. -/
def input : ℚ := (475:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(362181606697132406649319:ℚ)/2^80,(362181606697132406649320:ℚ)/2^80⟩,
  ⟨(108505843866856357122025:ℚ)/2^80,(108505843866856357122027:ℚ)/2^80⟩,
  ⟨(32507222717977485923014:ℚ)/2^80,(32507222717977485923015:ℚ)/2^80⟩,
  ⟨(9738825957916647629466:ℚ)/2^80,(9738825957916647629467:ℚ)/2^80⟩,
  ⟨(2917651005176122887623:ℚ)/2^80,(2917651005176122887625:ℚ)/2^80⟩,
  ⟨(874097907159467732406:ℚ)/2^80,(874097907159467732408:ℚ)/2^80⟩,
  ⟨(261870645236557364428:ℚ)/2^80,(261870645236557364429:ℚ)/2^80⟩,
  ⟨(78453722717928950492:ℚ)/2^80,(78453722717928950493:ℚ)/2^80⟩,
  ⟨(23503919665152448916:ℚ)/2^80,(23503919665152448917:ℚ)/2^80⟩,
  ⟨(7041529968082607814:ℚ)/2^80,(7041529968082607816:ℚ)/2^80⟩,
  ⟨(2109569169644447484:ℚ)/2^80,(2109569169644447486:ℚ)/2^80⟩,
  ⟨(632004990632194253:ℚ)/2^80,(632004990632194254:ℚ)/2^80⟩,
  ⟨(189342124416485008:ℚ)/2^80,(189342124416485010:ℚ)/2^80⟩,
  ⟨(56724931938728066:ℚ)/2^80,(56724931938728068:ℚ)/2^80⟩,
  ⟨(16994199855788572:ℚ)/2^80,(16994199855788574:ℚ)/2^80⟩,
  ⟨(5091285592910666:ℚ)/2^80,(5091285592910668:ℚ)/2^80⟩,
  ⟨(1525296230981444:ℚ)/2^80,(1525296230981445:ℚ)/2^80⟩,
  ⟨(456962892729050:ℚ)/2^80,(456962892729052:ℚ)/2^80⟩,
  ⟨(136901331747827:ℚ)/2^80,(136901331747829:ℚ)/2^80⟩,
  ⟨(41014215667269:ℚ)/2^80,(41014215667271:ℚ)/2^80⟩,
  ⟨(12287432600727:ℚ)/2^80,(12287432600729:ℚ)/2^80⟩,
  ⟨(3681187058220:ℚ)/2^80,(3681187058222:ℚ)/2^80⟩,
  ⟨(1102845370383:ℚ)/2^80,(1102845370384:ℚ)/2^80⟩,
  ⟨(330401006995:ℚ)/2^80,(330401006997:ℚ)/2^80⟩,
  ⟨(98984706609:ℚ)/2^80,(98984706611:ℚ)/2^80⟩,
  ⟨(29654788984:ℚ)/2^80,(29654788985:ℚ)/2^80⟩,
  ⟨(8884266467:ℚ)/2^80,(8884266468:ℚ)/2^80⟩,
  ⟨(2661633866:ℚ)/2^80,(2661633867:ℚ)/2^80⟩,
  ⟨(797397833:ℚ)/2^80,(797397835:ℚ)/2^80⟩,
  ⟨(238892100:ℚ)/2^80,(238892102:ℚ)/2^80⟩,
  ⟨(71569589:ℚ)/2^80,(71569591:ℚ)/2^80⟩,
  ⟨(21441504:ℚ)/2^80,(21441506:ℚ)/2^80⟩,
  ⟨(6423651:ℚ)/2^80,(6423653:ℚ)/2^80⟩,
  ⟨(1924459:ℚ)/2^80,(1924460:ℚ)/2^80⟩,
  ⟨(576547:ℚ)/2^80,(576549:ℚ)/2^80⟩,
  ⟨(172727:ℚ)/2^80,(172729:ℚ)/2^80⟩,
  ⟨(51747:ℚ)/2^80,(51748:ℚ)/2^80⟩,
  ⟨(15502:ℚ)/2^80,(15504:ℚ)/2^80⟩,
  ⟨(4644:ℚ)/2^80,(4645:ℚ)/2^80⟩,
  ⟨(1391:ℚ)/2^80,(1392:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (475:ℚ)/256,
  ⟨⟨(362181606697132406649319:ℚ)/2^80,(362181606697132406649320:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(712663854631944931:ℚ)/2^60,(712663854631944933:ℚ)/2^60⟩
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
end Point219

namespace Point220
/-- Exact original rational input. -/
def input : ℚ := (119:ℚ)/64
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(363338361086363959611145:ℚ)/2^80,(363338361086363959611146:ℚ)/2^80⟩,
  ⟨(109200053878415397697338:ℚ)/2^80,(109200053878415397697340:ℚ)/2^80⟩,
  ⟨(32819688324113917340729:ℚ)/2^80,(32819688324113917340731:ℚ)/2^80⟩,
  ⟨(9863840753148991550492:ℚ)/2^80,(9863840753148991550493:ℚ)/2^80⟩,
  ⟨(2964542302858986531568:ℚ)/2^80,(2964542302858986531569:ℚ)/2^80⟩,
  ⟨(890982659329203602383:ℚ)/2^80,(890982659329203602385:ℚ)/2^80⟩,
  ⟨(267781673568886328585:ℚ)/2^80,(267781673568886328586:ℚ)/2^80⟩,
  ⟨(80480830854036874711:ℚ)/2^80,(80480830854036874712:ℚ)/2^80⟩,
  ⟨(24188227852306164530:ℚ)/2^80,(24188227852306164531:ℚ)/2^80⟩,
  ⟨(7269685966540104093:ℚ)/2^80,(7269685966540104095:ℚ)/2^80⟩,
  ⟨(2184878295954676093:ℚ)/2^80,(2184878295954676095:ℚ)/2^80⟩,
  ⟨(656657411352498279:ℚ)/2^80,(656657411352498280:ℚ)/2^80⟩,
  ⟨(197356052592280903:ℚ)/2^80,(197356052592280904:ℚ)/2^80⟩,
  ⟨(59314660615166391:ℚ)/2^80,(59314660615166392:ℚ)/2^80⟩,
  ⟨(17826810567399734:ℚ)/2^80,(17826810567399736:ℚ)/2^80⟩,
  ⟨(5357784596759482:ℚ)/2^80,(5357784596759484:ℚ)/2^80⟩,
  ⟨(1610263130173614:ℚ)/2^80,(1610263130173616:ℚ)/2^80⟩,
  ⟨(483958864259829:ℚ)/2^80,(483958864259830:ℚ)/2^80⟩,
  ⟨(145452117673719:ℚ)/2^80,(145452117673720:ℚ)/2^80⟩,
  ⟨(43715117333631:ℚ)/2^80,(43715117333632:ℚ)/2^80⟩,
  ⟨(13138423242348:ℚ)/2^80,(13138423242349:ℚ)/2^80⟩,
  ⟨(3948706438957:ℚ)/2^80,(3948706438958:ℚ)/2^80⟩,
  ⟨(1186769694768:ℚ)/2^80,(1186769694769:ℚ)/2^80⟩,
  ⟨(356679416460:ℚ)/2^80,(356679416461:ℚ)/2^80⟩,
  ⟨(107198731722:ℚ)/2^80,(107198731724:ℚ)/2^80⟩,
  ⟨(32218198058:ℚ)/2^80,(32218198060:ℚ)/2^80⟩,
  ⟨(9683064990:ℚ)/2^80,(9683064991:ℚ)/2^80⟩,
  ⟨(2910210789:ℚ)/2^80,(2910210790:ℚ)/2^80⟩,
  ⟨(874653515:ℚ)/2^80,(874653517:ℚ)/2^80⟩,
  ⟨(262874007:ℚ)/2^80,(262874008:ℚ)/2^80⟩,
  ⟨(79005849:ℚ)/2^80,(79005850:ℚ)/2^80⟩,
  ⟨(23744927:ℚ)/2^80,(23744928:ℚ)/2^80⟩,
  ⟨(7136453:ℚ)/2^80,(7136454:ℚ)/2^80⟩,
  ⟨(2144835:ℚ)/2^80,(2144836:ℚ)/2^80⟩,
  ⟨(644622:ℚ)/2^80,(644623:ℚ)/2^80⟩,
  ⟨(193738:ℚ)/2^80,(193740:ℚ)/2^80⟩,
  ⟨(58227:ℚ)/2^80,(58228:ℚ)/2^80⟩,
  ⟨(17499:ℚ)/2^80,(17501:ℚ)/2^80⟩,
  ⟨(5259:ℚ)/2^80,(5260:ℚ)/2^80⟩,
  ⟨(1580:ℚ)/2^80,(1581:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (119:ℚ)/64,
  ⟨⟨(363338361086363959611145:ℚ)/2^80,(363338361086363959611146:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(715088506429078865:ℚ)/2^60,(715088506429078867:ℚ)/2^60⟩
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
end Point220

namespace Point221
/-- Exact original rational input. -/
def input : ℚ := (477:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(364491959256252452401179:ℚ)/2^80,(364491959256252452401180:ℚ)/2^80⟩,
  ⟨(109894574346018815798990:ℚ)/2^80,(109894574346018815798992:ℚ)/2^80⟩,
  ⟨(33133289127517269156312:ℚ)/2^80,(33133289127517269156313:ℚ)/2^80⟩,
  ⟨(9989709273098658231302:ℚ)/2^80,(9989709273098658231304:ℚ)/2^80⟩,
  ⟨(3011904160102051117486:ℚ)/2^80,(3011904160102051117488:ℚ)/2^80⟩,
  ⟨(908091158775652519733:ℚ)/2^80,(908091158775652519734:ℚ)/2^80⟩,
  ⟨(273790103805483229005:ℚ)/2^80,(273790103805483229006:ℚ)/2^80⟩,
  ⟨(82547903057314861678:ℚ)/2^80,(82547903057314861679:ℚ)/2^80⟩,
  ⟨(24888249080036267982:ℚ)/2^80,(24888249080036267983:ℚ)/2^80⟩,
  ⟨(7503824074608479159:ℚ)/2^80,(7503824074608479160:ℚ)/2^80⟩,
  ⟨(2262408077064766567:ℚ)/2^80,(2262408077064766569:ℚ)/2^80⟩,
  ⟨(682117578487467136:ℚ)/2^80,(682117578487467138:ℚ)/2^80⟩,
  ⟨(205658915205634702:ℚ)/2^80,(205658915205634704:ℚ)/2^80⟩,
  ⟨(62006303220252754:ℚ)/2^80,(62006303220252756:ℚ)/2^80⟩,
  ⟨(18694942717156696:ℚ)/2^80,(18694942717156698:ℚ)/2^80⟩,
  ⟨(5636537981571118:ℚ)/2^80,(5636537981571120:ℚ)/2^80⟩,
  ⟨(1699420046285425:ℚ)/2^80,(1699420046285427:ℚ)/2^80⟩,
  ⟨(512376303177461:ℚ)/2^80,(512376303177462:ℚ)/2^80⟩,
  ⟨(154481804914350:ℚ)/2^80,(154481804914351:ℚ)/2^80⟩,
  ⟨(46576369558078:ℚ)/2^80,(46576369558079:ℚ)/2^80⟩,
  ⟨(14042807192817:ℚ)/2^80,(14042807192818:ℚ)/2^80⟩,
  ⟨(4233915947629:ℚ)/2^80,(4233915947630:ℚ)/2^80⟩,
  ⟨(1276528546283:ℚ)/2^80,(1276528546285:ℚ)/2^80⟩,
  ⟨(384874227460:ℚ)/2^80,(384874227462:ℚ)/2^80⟩,
  ⟨(116039842112:ℚ)/2^80,(116039842114:ℚ)/2^80⟩,
  ⟨(34986091550:ℚ)/2^80,(34986091552:ℚ)/2^80⟩,
  ⟨(10548330467:ℚ)/2^80,(10548330468:ℚ)/2^80⟩,
  ⟨(3180328831:ℚ)/2^80,(3180328832:ℚ)/2^80⟩,
  ⟨(958871311:ℚ)/2^80,(958871313:ℚ)/2^80⟩,
  ⟨(289100354:ℚ)/2^80,(289100355:ℚ)/2^80⟩,
  ⟨(87163953:ℚ)/2^80,(87163955:ℚ)/2^80⟩,
  ⟨(26279991:ℚ)/2^80,(26279992:ℚ)/2^80⟩,
  ⟨(7923435:ℚ)/2^80,(7923436:ℚ)/2^80⟩,
  ⟨(2388921:ℚ)/2^80,(2388922:ℚ)/2^80⟩,
  ⟨(720261:ℚ)/2^80,(720262:ℚ)/2^80⟩,
  ⟨(217159:ℚ)/2^80,(217160:ℚ)/2^80⟩,
  ⟨(65473:ℚ)/2^80,(65474:ℚ)/2^80⟩,
  ⟨(19740:ℚ)/2^80,(19741:ℚ)/2^80⟩,
  ⟨(5951:ℚ)/2^80,(5952:ℚ)/2^80⟩,
  ⟨(1794:ℚ)/2^80,(1795:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (477:ℚ)/256,
  ⟨⟨(364491959256252452401179:ℚ)/2^80,(364491959256252452401180:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(717508069761199553:ℚ)/2^60,(717508069761199555:ℚ)/2^60⟩
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
end Point221

namespace Point222
/-- Exact original rational input. -/
def input : ℚ := (239:ℚ)/128
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(365642414106876943848461:ℚ)/2^80,(365642414106876943848462:ℚ)/2^80⟩,
  ⟨(110589395002352427158526:ℚ)/2^80,(110589395002352427158527:ℚ)/2^80⟩,
  ⟨(33448018651937655080644:ℚ)/2^80,(33448018651937655080645:ℚ)/2^80⟩,
  ⟨(10116430709441634097960:ℚ)/2^80,(10116430709441634097961:ℚ)/2^80⟩,
  ⟨(3059737898495971075949:ℚ)/2^80,(3059737898495971075951:ℚ)/2^80⟩,
  ⟨(925424813986519862208:ℚ)/2^80,(925424813986519862209:ℚ)/2^80⟩,
  ⟨(279896878344696743065:ℚ)/2^80,(279896878344696743066:ℚ)/2^80⟩,
  ⟨(84655459117878306485:ℚ)/2^80,(84655459117878306486:ℚ)/2^80⟩,
  ⟨(25604239678704337928:ℚ)/2^80,(25604239678704337930:ℚ)/2^80⟩,
  ⟨(7744061592196679863:ℚ)/2^80,(7744061592196679865:ℚ)/2^80⟩,
  ⟨(2342209364397360939:ℚ)/2^80,(2342209364397360941:ℚ)/2^80⟩,
  ⟨(708406646997566932:ℚ)/2^80,(708406646997566934:ℚ)/2^80⟩,
  ⟨(214259231108255938:ℚ)/2^80,(214259231108255940:ℚ)/2^80⟩,
  ⟨(64803200689418008:ℚ)/2^80,(64803200689418010:ℚ)/2^80⟩,
  ⟨(19599878137671386:ℚ)/2^80,(19599878137671388:ℚ)/2^80⟩,
  ⟨(5928028537551836:ℚ)/2^80,(5928028537551837:ℚ)/2^80⟩,
  ⟨(1792945960948920:ℚ)/2^80,(1792945960948921:ℚ)/2^80⟩,
  ⟨(542280658488637:ℚ)/2^80,(542280658488639:ℚ)/2^80⟩,
  ⟨(164014041123266:ℚ)/2^80,(164014041123267:ℚ)/2^80⟩,
  ⟨(49606426606764:ℚ)/2^80,(49606426606765:ℚ)/2^80⟩,
  ⟨(15003578619484:ℚ)/2^80,(15003578619485:ℚ)/2^80⟩,
  ⟨(4537867102895:ℚ)/2^80,(4537867102897:ℚ)/2^80⟩,
  ⟨(1372488415317:ℚ)/2^80,(1372488415318:ℚ)/2^80⟩,
  ⟨(415112300000:ℚ)/2^80,(415112300001:ℚ)/2^80⟩,
  ⟨(125551676566:ℚ)/2^80,(125551676568:ℚ)/2^80⟩,
  ⟨(37973395364:ℚ)/2^80,(37973395366:ℚ)/2^80⟩,
  ⟨(11485141377:ℚ)/2^80,(11485141378:ℚ)/2^80⟩,
  ⟨(3473707609:ℚ)/2^80,(3473707611:ℚ)/2^80⟩,
  ⟨(1050630911:ℚ)/2^80,(1050630913:ℚ)/2^80⟩,
  ⟨(317765752:ℚ)/2^80,(317765753:ℚ)/2^80⟩,
  ⟨(96108987:ℚ)/2^80,(96108988:ℚ)/2^80⟩,
  ⟨(29068385:ℚ)/2^80,(29068387:ℚ)/2^80⟩,
  ⟨(8791800:ℚ)/2^80,(8791801:ℚ)/2^80⟩,
  ⟨(2659100:ℚ)/2^80,(2659101:ℚ)/2^80⟩,
  ⟨(804250:ℚ)/2^80,(804252:ℚ)/2^80⟩,
  ⟨(243247:ℚ)/2^80,(243248:ℚ)/2^80⟩,
  ⟨(73570:ℚ)/2^80,(73571:ℚ)/2^80⟩,
  ⟨(22251:ℚ)/2^80,(22252:ℚ)/2^80⟩,
  ⟨(6729:ℚ)/2^80,(6731:ℚ)/2^80⟩,
  ⟨(2035:ℚ)/2^80,(2036:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (239:ℚ)/128,
  ⟨⟨(365642414106876943848461:ℚ)/2^80,(365642414106876943848462:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(719922565941272877:ℚ)/2^60,(719922565941272878:ℚ)/2^60⟩
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
end Point222

namespace Point223
/-- Exact original rational input. -/
def input : ℚ := (479:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(366789738468111980897247:ℚ)/2^80,(366789738468111980897248:ℚ)/2^80⟩,
  ⟨(111284505684882954748416:ℚ)/2^80,(111284505684882954748417:ℚ)/2^80⟩,
  ⟨(33763870432284216202580:ℚ)/2^80,(33763870432284216202581:ℚ)/2^80⟩,
  ⟨(10244004226393714575748:ℚ)/2^80,(10244004226393714575750:ℚ)/2^80⟩,
  ⟨(3108044819708569184206:ℚ)/2^80,(3108044819708569184208:ℚ)/2^80⟩,
  ⟨(942985026931987657248:ℚ)/2^80,(942985026931987657250:ℚ)/2^80⟩,
  ⟨(286102940143990813015:ℚ)/2^80,(286102940143990813016:ℚ)/2^80⟩,
  ⟨(86804021295387688846:ℚ)/2^80,(86804021295387688848:ℚ)/2^80⟩,
  ⟨(26336458161729870221:ℚ)/2^80,(26336458161729870222:ℚ)/2^80⟩,
  ⟨(7990517238184708924:ℚ)/2^80,(7990517238184708925:ℚ)/2^80⟩,
  ⟨(2424333801517265428:ℚ)/2^80,(2424333801517265429:ℚ)/2^80⟩,
  ⟨(735546173793673728:ℚ)/2^80,(735546173793673729:ℚ)/2^80⟩,
  ⟨(223165709872094205:ℚ)/2^80,(223165709872094207:ℚ)/2^80⟩,
  ⟨(67708780002009534:ℚ)/2^80,(67708780002009535:ℚ)/2^80⟩,
  ⟨(20542935973398810:ℚ)/2^80,(20542935973398812:ℚ)/2^80⟩,
  ⟨(6232754723901951:ℚ)/2^80,(6232754723901953:ℚ)/2^80⟩,
  ⟨(1891026263170251:ℚ)/2^80,(1891026263170253:ℚ)/2^80⟩,
  ⟨(573739941070702:ℚ)/2^80,(573739941070703:ℚ)/2^80⟩,
  ⟨(174073478719410:ℚ)/2^80,(174073478719411:ℚ)/2^80⟩,
  ⟨(52814130278133:ℚ)/2^80,(52814130278135:ℚ)/2^80⟩,
  ⟨(16023878982345:ℚ)/2^80,(16023878982346:ℚ)/2^80⟩,
  ⟨(4861666684439:ℚ)/2^80,(4861666684440:ℚ)/2^80⟩,
  ⟨(1475036286571:ℚ)/2^80,(1475036286572:ℚ)/2^80⟩,
  ⟨(447528016197:ℚ)/2^80,(447528016199:ℚ)/2^80⟩,
  ⟨(135780608995:ℚ)/2^80,(135780608997:ℚ)/2^80⟩,
  ⟨(41196021504:ℚ)/2^80,(41196021506:ℚ)/2^80⟩,
  ⟨(12498928973:ℚ)/2^80,(12498928974:ℚ)/2^80⟩,
  ⟨(3792192055:ℚ)/2^80,(3792192057:ℚ)/2^80⟩,
  ⟨(1150556228:ℚ)/2^80,(1150556230:ℚ)/2^80⟩,
  ⟨(349080324:ℚ)/2^80,(349080326:ℚ)/2^80⟩,
  ⟨(105911445:ℚ)/2^80,(105911446:ℚ)/2^80⟩,
  ⟨(32133676:ℚ)/2^80,(32133677:ℚ)/2^80⟩,
  ⟨(9749401:ℚ)/2^80,(9749402:ℚ)/2^80⟩,
  ⟨(2957981:ℚ)/2^80,(2957982:ℚ)/2^80⟩,
  ⟨(897455:ℚ)/2^80,(897456:ℚ)/2^80⟩,
  ⟨(272289:ℚ)/2^80,(272290:ℚ)/2^80⟩,
  ⟨(82612:ℚ)/2^80,(82614:ℚ)/2^80⟩,
  ⟨(25064:ℚ)/2^80,(25066:ℚ)/2^80⟩,
  ⟨(7604:ℚ)/2^80,(7606:ℚ)/2^80⟩,
  ⟨(2307:ℚ)/2^80,(2308:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (479:ℚ)/256,
  ⟨⟨(366789738468111980897247:ℚ)/2^80,(366789738468111980897248:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(722332016148640913:ℚ)/2^60,(722332016148640914:ℚ)/2^60⟩
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
end Point223

/-- Reusable proved logarithm bounds for these consecutive exact grid inputs. -/
def entries : Array CertifiedLogBound := #[⟨Point216.input, Point216.bounds, Point216.log_bounds⟩,
  ⟨Point217.input, Point217.bounds, Point217.log_bounds⟩,
  ⟨Point218.input, Point218.bounds, Point218.log_bounds⟩,
  ⟨Point219.input, Point219.bounds, Point219.log_bounds⟩,
  ⟨Point220.input, Point220.bounds, Point220.log_bounds⟩,
  ⟨Point221.input, Point221.bounds, Point221.log_bounds⟩,
  ⟨Point222.input, Point222.bounds, Point222.log_bounds⟩,
  ⟨Point223.input, Point223.bounds, Point223.log_bounds⟩]
end MatrixBounds.Numeric.LogGridData.Part027
