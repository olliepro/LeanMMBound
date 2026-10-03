module

public import TabulatedLogBounds
public import FKLLog.GridTrace

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

namespace MatrixBounds.Numeric.LogGridData.Part024
set_option maxRecDepth 100000
set_option maxHeartbeats 16000000

namespace Point192
/-- Exact original rational input. -/
def input : ℚ := (7:ℚ)/4
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(329707041713080684010775:ℚ)/2^80,(329707041713080684010776:ℚ)/2^80⟩,
  ⟨(89920102285385641093847:ℚ)/2^80,(89920102285385641093849:ℚ)/2^80⟩,
  ⟨(24523664259650629389230:ℚ)/2^80,(24523664259650629389232:ℚ)/2^80⟩,
  ⟨(6688272070813808015244:ℚ)/2^80,(6688272070813808015246:ℚ)/2^80⟩,
  ⟨(1824074201131038549611:ℚ)/2^80,(1824074201131038549613:ℚ)/2^80⟩,
  ⟨(497474782126646877166:ℚ)/2^80,(497474782126646877168:ℚ)/2^80⟩,
  ⟨(135674940579994602863:ℚ)/2^80,(135674940579994602865:ℚ)/2^80⟩,
  ⟨(37002256521816709871:ℚ)/2^80,(37002256521816709873:ℚ)/2^80⟩,
  ⟨(10091524505950011782:ℚ)/2^80,(10091524505950011784:ℚ)/2^80⟩,
  ⟨(2752233956168185031:ℚ)/2^80,(2752233956168185033:ℚ)/2^80⟩,
  ⟨(750609260773141372:ℚ)/2^80,(750609260773141373:ℚ)/2^80⟩,
  ⟨(204711616574493101:ℚ)/2^80,(204711616574493102:ℚ)/2^80⟩,
  ⟨(55830440883952663:ℚ)/2^80,(55830440883952665:ℚ)/2^80⟩,
  ⟨(15226483877441635:ℚ)/2^80,(15226483877441636:ℚ)/2^80⟩,
  ⟨(4152677421120445:ℚ)/2^80,(4152677421120447:ℚ)/2^80⟩,
  ⟨(1132548387578303:ℚ)/2^80,(1132548387578304:ℚ)/2^80⟩,
  ⟨(308876832975900:ℚ)/2^80,(308876832975902:ℚ)/2^80⟩,
  ⟨(84239136266154:ℚ)/2^80,(84239136266156:ℚ)/2^80⟩,
  ⟨(22974309890769:ℚ)/2^80,(22974309890770:ℚ)/2^80⟩,
  ⟨(6265720879300:ℚ)/2^80,(6265720879301:ℚ)/2^80⟩,
  ⟨(1708832967081:ℚ)/2^80,(1708832967083:ℚ)/2^80⟩,
  ⟨(466045354658:ℚ)/2^80,(466045354660:ℚ)/2^80⟩,
  ⟨(127103278543:ℚ)/2^80,(127103278544:ℚ)/2^80⟩,
  ⟨(34664530511:ℚ)/2^80,(34664530513:ℚ)/2^80⟩,
  ⟨(9453962866:ℚ)/2^80,(9453962868:ℚ)/2^80⟩,
  ⟨(2578353508:ℚ)/2^80,(2578353510:ℚ)/2^80⟩,
  ⟨(703187320:ℚ)/2^80,(703187321:ℚ)/2^80⟩,
  ⟨(191778359:ℚ)/2^80,(191778361:ℚ)/2^80⟩,
  ⟨(52303188:ℚ)/2^80,(52303190:ℚ)/2^80⟩,
  ⟨(14264505:ℚ)/2^80,(14264507:ℚ)/2^80⟩,
  ⟨(3890319:ℚ)/2^80,(3890321:ℚ)/2^80⟩,
  ⟨(1060996:ℚ)/2^80,(1060997:ℚ)/2^80⟩,
  ⟨(289362:ℚ)/2^80,(289363:ℚ)/2^80⟩,
  ⟨(78916:ℚ)/2^80,(78918:ℚ)/2^80⟩,
  ⟨(21522:ℚ)/2^80,(21524:ℚ)/2^80⟩,
  ⟨(5869:ℚ)/2^80,(5871:ℚ)/2^80⟩,
  ⟨(1600:ℚ)/2^80,(1602:ℚ)/2^80⟩,
  ⟨(436:ℚ)/2^80,(437:ℚ)/2^80⟩,
  ⟨(118:ℚ)/2^80,(120:ℚ)/2^80⟩,
  ⟨(32:ℚ)/2^80,(33:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (7:ℚ)/4,
  ⟨⟨(329707041713080684010775:ℚ)/2^80,(329707041713080684010776:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(645193076228253726:ℚ)/2^60,(645193076228253728:ℚ)/2^60⟩
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
end Point192

namespace Point193
/-- Exact original rational input. -/
def input : ℚ := (449:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(330954160546983589671336:ℚ)/2^80,(330954160546983589671337:ℚ)/2^80⟩,
  ⟨(90601635440521748661798:ℚ)/2^80,(90601635440521748661799:ℚ)/2^80⟩,
  ⟨(24803000907830776584009:ℚ)/2^80,(24803000907830776584011:ℚ)/2^80⟩,
  ⟨(6790041383278496284700:ℚ)/2^80,(6790041383278496284701:ℚ)/2^80⟩,
  ⟨(1858834024074822387159:ℚ)/2^80,(1858834024074822387160:ℚ)/2^80⟩,
  ⟨(508872293115518752796:ℚ)/2^80,(508872293115518752797:ℚ)/2^80⟩,
  ⟨(139308301519567545091:ℚ)/2^80,(139308301519567545092:ℚ)/2^80⟩,
  ⟨(38136882543654661280:ℚ)/2^80,(38136882543654661281:ℚ)/2^80⟩,
  ⟨(10440309689255815073:ℚ)/2^80,(10440309689255815075:ℚ)/2^80⟩,
  ⟨(2858127333370740863:ℚ)/2^80,(2858127333370740865:ℚ)/2^80⟩,
  ⟨(782437695518514874:ℚ)/2^80,(782437695518514876:ℚ)/2^80⟩,
  ⟨(214199255652586341:ℚ)/2^80,(214199255652586342:ℚ)/2^80⟩,
  ⟨(58638945164466899:ℚ)/2^80,(58638945164466900:ℚ)/2^80⟩,
  ⟨(16052931087577463:ℚ)/2^80,(16052931087577464:ℚ)/2^80⟩,
  ⟨(4394632198443191:ℚ)/2^80,(4394632198443193:ℚ)/2^80⟩,
  ⟨(1203069523829128:ℚ)/2^80,(1203069523829130:ℚ)/2^80⟩,
  ⟨(329350947658186:ℚ)/2^80,(329350947658188:ℚ)/2^80⟩,
  ⟨(90162741699333:ℚ)/2^80,(90162741699334:ℚ)/2^80⟩,
  ⟨(24682849855278:ℚ)/2^80,(24682849855279:ℚ)/2^80⟩,
  ⟨(6757148967473:ℚ)/2^80,(6757148967474:ℚ)/2^80⟩,
  ⟨(1849829433648:ℚ)/2^80,(1849829433649:ℚ)/2^80⟩,
  ⟨(506407206658:ℚ)/2^80,(506407206659:ℚ)/2^80⟩,
  ⟨(138633462248:ℚ)/2^80,(138633462249:ℚ)/2^80⟩,
  ⟨(37952139310:ℚ)/2^80,(37952139311:ℚ)/2^80⟩,
  ⟨(10389734591:ℚ)/2^80,(10389734592:ℚ)/2^80⟩,
  ⟨(2844281951:ℚ)/2^80,(2844281953:ℚ)/2^80⟩,
  ⟨(778647399:ℚ)/2^80,(778647400:ℚ)/2^80⟩,
  ⟨(213161628:ℚ)/2^80,(213161629:ℚ)/2^80⟩,
  ⟨(58354885:ℚ)/2^80,(58354886:ℚ)/2^80⟩,
  ⟨(15975167:ℚ)/2^80,(15975168:ℚ)/2^80⟩,
  ⟨(4373343:ℚ)/2^80,(4373344:ℚ)/2^80⟩,
  ⟨(1197241:ℚ)/2^80,(1197242:ℚ)/2^80⟩,
  ⟨(327755:ℚ)/2^80,(327756:ℚ)/2^80⟩,
  ⟨(89725:ℚ)/2^80,(89727:ℚ)/2^80⟩,
  ⟨(24563:ℚ)/2^80,(24564:ℚ)/2^80⟩,
  ⟨(6724:ℚ)/2^80,(6725:ℚ)/2^80⟩,
  ⟨(1840:ℚ)/2^80,(1842:ℚ)/2^80⟩,
  ⟨(503:ℚ)/2^80,(505:ℚ)/2^80⟩,
  ⟨(137:ℚ)/2^80,(139:ℚ)/2^80⟩,
  ⟨(37:ℚ)/2^80,(39:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (449:ℚ)/256,
  ⟨⟨(330954160546983589671336:ℚ)/2^80,(330954160546983589671337:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(647763693802923525:ℚ)/2^60,(647763693802923527:ℚ)/2^60⟩
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
end Point193

namespace Point194
/-- Exact original rational input. -/
def input : ℚ := (225:ℚ)/128
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(332197746466342861038240:ℚ)/2^80,(332197746466342861038241:ℚ)/2^80⟩,
  ⟨(91283800020496480228637:ℚ)/2^80,(91283800020496480228639:ℚ)/2^80⟩,
  ⟨(25083650430561355756877:ℚ)/2^80,(25083650430561355756879:ℚ)/2^80⟩,
  ⟨(6892674480919126086167:ℚ)/2^80,(6892674480919126086168:ℚ)/2^80⟩,
  ⟨(1894021033000439746057:ℚ)/2^80,(1894021033000439746058:ℚ)/2^80⟩,
  ⟨(520453371674341799908:ℚ)/2^80,(520453371674341799909:ℚ)/2^80⟩,
  ⟨(143014099298615168813:ℚ)/2^80,(143014099298615168814:ℚ)/2^80⟩,
  ⟨(39298491875256859418:ℚ)/2^80,(39298491875256859420:ℚ)/2^80⟩,
  ⟨(10798735727761799896:ℚ)/2^80,(10798735727761799898:ℚ)/2^80⟩,
  ⟨(2967357976183837365:ℚ)/2^80,(2967357976183837366:ℚ)/2^80⟩,
  ⟨(815392984957031797:ℚ)/2^80,(815392984957031798:ℚ)/2^80⟩,
  ⟨(224059828727569643:ℚ)/2^80,(224059828727569645:ℚ)/2^80⟩,
  ⟨(61568848120606955:ℚ)/2^80,(61568848120606957:ℚ)/2^80⟩,
  ⟨(16918352033141287:ℚ)/2^80,(16918352033141289:ℚ)/2^80⟩,
  ⟨(4648952258398597:ℚ)/2^80,(4648952258398598:ℚ)/2^80⟩,
  ⟨(1277474133327659:ℚ)/2^80,(1277474133327661:ℚ)/2^80⟩,
  ⟨(351033968648110:ℚ)/2^80,(351033968648111:ℚ)/2^80⟩,
  ⟨(96459759090273:ℚ)/2^80,(96459759090275:ℚ)/2^80⟩,
  ⟨(26505939466732:ℚ)/2^80,(26505939466733:ℚ)/2^80⟩,
  ⟨(7283501779810:ℚ)/2^80,(7283501779811:ℚ)/2^80⟩,
  ⟨(2001415503233:ℚ)/2^80,(2001415503235:ℚ)/2^80⟩,
  ⟨(549964033466:ℚ)/2^80,(549964033467:ℚ)/2^80⟩,
  ⟨(151123261320:ℚ)/2^80,(151123261321:ℚ)/2^80⟩,
  ⟨(41526788521:ℚ)/2^80,(41526788522:ℚ)/2^80⟩,
  ⟨(11411043871:ℚ)/2^80,(11411043872:ℚ)/2^80⟩,
  ⟨(3135612621:ℚ)/2^80,(3135612623:ℚ)/2^80⟩,
  ⟨(861627264:ℚ)/2^80,(861627265:ℚ)/2^80⟩,
  ⟨(236764432:ℚ)/2^80,(236764433:ℚ)/2^80⟩,
  ⟨(65059914:ℚ)/2^80,(65059916:ℚ)/2^80⟩,
  ⟨(17877653:ℚ)/2^80,(17877654:ℚ)/2^80⟩,
  ⟨(4912556:ℚ)/2^80,(4912557:ℚ)/2^80⟩,
  ⟨(1349909:ℚ)/2^80,(1349910:ℚ)/2^80⟩,
  ⟨(370938:ℚ)/2^80,(370939:ℚ)/2^80⟩,
  ⟨(101929:ℚ)/2^80,(101930:ℚ)/2^80⟩,
  ⟨(28008:ℚ)/2^80,(28010:ℚ)/2^80⟩,
  ⟨(7696:ℚ)/2^80,(7697:ℚ)/2^80⟩,
  ⟨(2114:ℚ)/2^80,(2116:ℚ)/2^80⟩,
  ⟨(580:ℚ)/2^80,(582:ℚ)/2^80⟩,
  ⟨(159:ℚ)/2^80,(160:ℚ)/2^80⟩,
  ⟨(43:ℚ)/2^80,(44:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (225:ℚ)/128,
  ⟨⟨(332197746466342861038240:ℚ)/2^80,(332197746466342861038241:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(650328592535107273:ℚ)/2^60,(650328592535107274:ℚ)/2^60⟩
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
end Point194

namespace Point195
/-- Exact original rational input. -/
def input : ℚ := (451:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(333437814462309319756300:ℚ)/2^80,(333437814462309319756301:ℚ)/2^80⟩,
  ⟨(91966582489604409268003:ℚ)/2^80,(91966582489604409268005:ℚ)/2^80⟩,
  ⟨(25365606202931909204046:ℚ)/2^80,(25365606202931909204047:ℚ)/2^80⟩,
  ⟨(6996171442109932524453:ℚ)/2^80,(6996171442109932524455:ℚ)/2^80⟩,
  ⟨(1929637102137817315796:ℚ)/2^80,(1929637102137817315798:ℚ)/2^80⟩,
  ⟨(532219568482141975360:ℚ)/2^80,(532219568482141975362:ℚ)/2^80⟩,
  ⟨(146793233173999554731:ℚ)/2^80,(146793233173999554733:ℚ)/2^80⟩,
  ⟨(40487525415742451446:ℚ)/2^80,(40487525415742451447:ℚ)/2^80⟩,
  ⟨(11166997816223165533:ℚ)/2^80,(11166997816223165534:ℚ)/2^80⟩,
  ⟨(3080006469821099404:ℚ)/2^80,(3080006469821099405:ℚ)/2^80⟩,
  ⟨(849506734957728972:ℚ)/2^80,(849506734957728974:ℚ)/2^80⟩,
  ⟨(234305252216063860:ℚ)/2^80,(234305252216063862:ℚ)/2^80⟩,
  ⟨(64624503793680979:ℚ)/2^80,(64624503793680981:ℚ)/2^80⟩,
  ⟨(17824297368837045:ℚ)/2^80,(17824297368837046:ℚ)/2^80⟩,
  ⟨(4916178199325634:ℚ)/2^80,(4916178199325636:ℚ)/2^80⟩,
  ⟨(1355947310987975:ℚ)/2^80,(1355947310987976:ℚ)/2^80⟩,
  ⟨(373988296524264:ℚ)/2^80,(373988296524265:ℚ)/2^80⟩,
  ⟨(103150944585900:ℚ)/2^80,(103150944585901:ℚ)/2^80⟩,
  ⟨(28450401972065:ℚ)/2^80,(28450401972067:ℚ)/2^80⟩,
  ⟨(7846999129494:ℚ)/2^80,(7846999129496:ℚ)/2^80⟩,
  ⟨(2164306690595:ℚ)/2^80,(2164306690597:ℚ)/2^80⟩,
  ⟨(596944561055:ℚ)/2^80,(596944561056:ℚ)/2^80⟩,
  ⟨(164645246684:ℚ)/2^80,(164645246685:ℚ)/2^80⟩,
  ⟨(45411348095:ℚ)/2^80,(45411348096:ℚ)/2^80⟩,
  ⟨(12525053576:ℚ)/2^80,(12525053577:ℚ)/2^80⟩,
  ⟨(3454576304:ℚ)/2^80,(3454576305:ℚ)/2^80⟩,
  ⟨(952818075:ℚ)/2^80,(952818076:ℚ)/2^80⟩,
  ⟨(262799893:ℚ)/2^80,(262799894:ℚ)/2^80⟩,
  ⟨(72483704:ℚ)/2^80,(72483705:ℚ)/2^80⟩,
  ⟨(19991969:ℚ)/2^80,(19991970:ℚ)/2^80⟩,
  ⟨(5514050:ℚ)/2^80,(5514052:ℚ)/2^80⟩,
  ⟨(1520848:ℚ)/2^80,(1520849:ℚ)/2^80⟩,
  ⟨(419470:ℚ)/2^80,(419471:ℚ)/2^80⟩,
  ⟨(115695:ℚ)/2^80,(115696:ℚ)/2^80⟩,
  ⟨(31910:ℚ)/2^80,(31911:ℚ)/2^80⟩,
  ⟨(8801:ℚ)/2^80,(8802:ℚ)/2^80⟩,
  ⟨(2427:ℚ)/2^80,(2428:ℚ)/2^80⟩,
  ⟨(669:ℚ)/2^80,(670:ℚ)/2^80⟩,
  ⟨(184:ℚ)/2^80,(185:ℚ)/2^80⟩,
  ⟨(50:ℚ)/2^80,(52:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (451:ℚ)/256,
  ⟨⟨(333437814462309319756300:ℚ)/2^80,(333437814462309319756301:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(652887797813704176:ℚ)/2^60,(652887797813704178:ℚ)/2^60⟩
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
end Point195

namespace Point196
/-- Exact original rational input. -/
def input : ℚ := (113:ℚ)/64
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(334674379441338020116399:ℚ)/2^80,(334674379441338020116400:ℚ)/2^80⟩,
  ⟨(92649969449861937772336:ℚ)/2^80,(92649969449861937772337:ℚ)/2^80⟩,
  ⟨(25648861599114321756183:ℚ)/2^80,(25648861599114321756184:ℚ)/2^80⟩,
  ⟨(7100532307099445005948:ℚ)/2^80,(7100532307099445005950:ℚ)/2^80⟩,
  ⟨(1965684085016230538369:ℚ)/2^80,(1965684085016230538371:ℚ)/2^80⟩,
  ⟨(544172430315227663164:ℚ)/2^80,(544172430315227663165:ℚ)/2^80⟩,
  ⟨(150646605002520652514:ℚ)/2^80,(150646605002520652515:ℚ)/2^80⟩,
  ⟨(41704427373579163690:ℚ)/2^80,(41704427373579163691:ℚ)/2^80⟩,
  ⟨(11545293453702706332:ℚ)/2^80,(11545293453702706333:ℚ)/2^80⟩,
  ⟨(3196154684923348080:ℚ)/2^80,(3196154684923348081:ℚ)/2^80⟩,
  ⟨(884811183961830824:ℚ)/2^80,(884811183961830825:ℚ)/2^80⟩,
  ⟨(244947728893388194:ℚ)/2^80,(244947728893388195:ℚ)/2^80⟩,
  ⟨(67810388224723285:ℚ)/2^80,(67810388224723286:ℚ)/2^80⟩,
  ⟨(18772367361646559:ℚ)/2^80,(18772367361646560:ℚ)/2^80⟩,
  ⟨(5196870060568821:ℚ)/2^80,(5196870060568822:ℚ)/2^80⟩,
  ⟨(1438681542191368:ℚ)/2^80,(1438681542191369:ℚ)/2^80⟩,
  ⟨(398279071002130:ℚ)/2^80,(398279071002131:ℚ)/2^80⟩,
  ⟨(110258047904544:ℚ)/2^80,(110258047904545:ℚ)/2^80⟩,
  ⟨(30523414391653:ℚ)/2^80,(30523414391654:ℚ)/2^80⟩,
  ⟨(8449984775090:ℚ)/2^80,(8449984775091:ℚ)/2^80⟩,
  ⟨(2339261321917:ℚ)/2^80,(2339261321918:ℚ)/2^80⟩,
  ⟨(647592117366:ℚ)/2^80,(647592117368:ℚ)/2^80⟩,
  ⟨(179276913847:ℚ)/2^80,(179276913848:ℚ)/2^80⟩,
  ⟨(49630332081:ℚ)/2^80,(49630332083:ℚ)/2^80⟩,
  ⟨(13739470463:ℚ)/2^80,(13739470464:ℚ)/2^80⟩,
  ⟨(3803582218:ℚ)/2^80,(3803582219:ℚ)/2^80⟩,
  ⟨(1052969088:ℚ)/2^80,(1052969089:ℚ)/2^80⟩,
  ⟨(291499917:ℚ)/2^80,(291499918:ℚ)/2^80⟩,
  ⟨(80697717:ℚ)/2^80,(80697718:ℚ)/2^80⟩,
  ⟨(22340045:ℚ)/2^80,(22340047:ℚ)/2^80⟩,
  ⟨(6184532:ℚ)/2^80,(6184533:ℚ)/2^80⟩,
  ⟨(1712102:ℚ)/2^80,(1712103:ℚ)/2^80⟩,
  ⟨(473971:ℚ)/2^80,(473973:ℚ)/2^80⟩,
  ⟨(131212:ℚ)/2^80,(131213:ℚ)/2^80⟩,
  ⟨(36324:ℚ)/2^80,(36325:ℚ)/2^80⟩,
  ⟨(10055:ℚ)/2^80,(10057:ℚ)/2^80⟩,
  ⟨(2783:ℚ)/2^80,(2785:ℚ)/2^80⟩,
  ⟨(770:ℚ)/2^80,(771:ℚ)/2^80⟩,
  ⟨(213:ℚ)/2^80,(214:ℚ)/2^80⟩,
  ⟨(58:ℚ)/2^80,(60:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (113:ℚ)/64,
  ⟨⟨(334674379441338020116399:ℚ)/2^80,(334674379441338020116400:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(655441334858916161:ℚ)/2^60,(655441334858916162:ℚ)/2^60⟩
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
end Point196

namespace Point197
/-- Exact original rational input. -/
def input : ℚ := (453:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(335907456225785539375340:ℚ)/2^80,(335907456225785539375341:ℚ)/2^80⟩,
  ⟨(93333947639604726737576:ℚ)/2^80,(93333947639604726737578:ℚ)/2^80⟩,
  ⟨(25933409992950819700003:ℚ)/2^80,(25933409992950819700005:ℚ)/2^80⟩,
  ⟨(7205757078436264430043:ℚ)/2^80,(7205757078436264430044:ℚ)/2^80⟩,
  ⟨(2002163814459723685075:ℚ)/2^80,(2002163814459723685076:ℚ)/2^80⟩,
  ⟨(556313499927454959040:ℚ)/2^80,(556313499927454959041:ℚ)/2^80⟩,
  ⟨(154575119161789318661:ℚ)/2^80,(154575119161789318662:ℚ)/2^80⟩,
  ⟨(42949645239594493337:ℚ)/2^80,(42949645239594493338:ℚ)/2^80⟩,
  ⟨(11933822443159541872:ℚ)/2^80,(11933822443159541873:ℚ)/2^80⟩,
  ⟨(3315885784629661140:ℚ)/2^80,(3315885784629661142:ℚ)/2^80⟩,
  ⟨(921339209551541952:ℚ)/2^80,(921339209551541954:ℚ)/2^80⟩,
  ⟨(255999752160301501:ℚ)/2^80,(255999752160301503:ℚ)/2^80⟩,
  ⟨(71131101799124676:ℚ)/2^80,(71131101799124678:ℚ)/2^80⟩,
  ⟨(19764213052789225:ℚ)/2^80,(19764213052789227:ℚ)/2^80⟩,
  ⟨(5491607858109276:ℚ)/2^80,(5491607858109278:ℚ)/2^80⟩,
  ⟨(1525876936597358:ℚ)/2^80,(1525876936597360:ℚ)/2^80⟩,
  ⟨(423974268701945:ℚ)/2^80,(423974268701947:ℚ)/2^80⟩,
  ⟨(117803851811400:ℚ)/2^80,(117803851811402:ℚ)/2^80⟩,
  ⟨(32732522999782:ℚ)/2^80,(32732522999784:ℚ)/2^80⟩,
  ⟨(9094932342675:ℚ)/2^80,(9094932342677:ℚ)/2^80⟩,
  ⟨(2527082752478:ℚ)/2^80,(2527082752479:ℚ)/2^80⟩,
  ⟨(702165447444:ℚ)/2^80,(702165447445:ℚ)/2^80⟩,
  ⟨(195100977639:ℚ)/2^80,(195100977640:ℚ)/2^80⟩,
  ⟨(54210003659:ℚ)/2^80,(54210003661:ℚ)/2^80⟩,
  ⟨(15062582116:ℚ)/2^80,(15062582118:ℚ)/2^80⟩,
  ⟨(4185230855:ℚ)/2^80,(4185230857:ℚ)/2^80⟩,
  ⟨(1162892071:ℚ)/2^80,(1162892072:ℚ)/2^80⟩,
  ⟨(323116696:ℚ)/2^80,(323116698:ℚ)/2^80⟩,
  ⟨(89779956:ℚ)/2^80,(89779957:ℚ)/2^80⟩,
  ⟨(24945911:ℚ)/2^80,(24945912:ℚ)/2^80⟩,
  ⟨(6931374:ℚ)/2^80,(6931375:ℚ)/2^80⟩,
  ⟨(1925924:ℚ)/2^80,(1925926:ℚ)/2^80⟩,
  ⟨(535129:ℚ)/2^80,(535131:ℚ)/2^80⟩,
  ⟨(148688:ℚ)/2^80,(148690:ℚ)/2^80⟩,
  ⟨(41313:ℚ)/2^80,(41315:ℚ)/2^80⟩,
  ⟨(11479:ℚ)/2^80,(11480:ℚ)/2^80⟩,
  ⟨(3189:ℚ)/2^80,(3190:ℚ)/2^80⟩,
  ⟨(886:ℚ)/2^80,(887:ℚ)/2^80⟩,
  ⟨(246:ℚ)/2^80,(247:ℚ)/2^80⟩,
  ⟨(68:ℚ)/2^80,(69:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (453:ℚ)/256,
  ⟨⟨(335907456225785539375340:ℚ)/2^80,(335907456225785539375341:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(657989228723739120:ℚ)/2^60,(657989228723739122:ℚ)/2^60⟩
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
end Point197

namespace Point198
/-- Exact original rational input. -/
def input : ℚ := (227:ℚ)/128
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(337137059554502220551863:ℚ)/2^80,(337137059554502220551864:ℚ)/2^80⟩,
  ⟨(94018503932100619252491:ℚ)/2^80,(94018503932100619252492:ℚ)/2^80⟩,
  ⟨(26219244758529468467596:ℚ)/2^80,(26219244758529468467597:ℚ)/2^80⟩,
  ⟨(7311845721392725009273:ℚ)/2^80,(7311845721392725009274:ℚ)/2^80⟩,
  ⟨(2039078102585576833571:ℚ)/2^80,(2039078102585576833573:ℚ)/2^80⟩,
  ⟨(568644315932315793024:ℚ)/2^80,(568644315932315793025:ℚ)/2^80⟩,
  ⟨(158579682471265531012:ℚ)/2^80,(158579682471265531013:ℚ)/2^80⟩,
  ⟨(44223629759592359352:ℚ)/2^80,(44223629759592359353:ℚ)/2^80⟩,
  ⟨(12332786890703221340:ℚ)/2^80,(12332786890703221341:ℚ)/2^80⟩,
  ⟨(3439284231491884261:ℚ)/2^80,(3439284231491884262:ℚ)/2^80⟩,
  ⟨(959124334979426878:ℚ)/2^80,(959124334979426879:ℚ)/2^80⟩,
  ⟨(267474110318206368:ℚ)/2^80,(267474110318206370:ℚ)/2^80⟩,
  ⟨(74591371609866001:ℚ)/2^80,(74591371609866002:ℚ)/2^80⟩,
  ⟨(20801537434864039:ℚ)/2^80,(20801537434864040:ℚ)/2^80⟩,
  ⟨(5800992129722647:ℚ)/2^80,(5800992129722648:ℚ)/2^80⟩,
  ⟨(1617741467162090:ℚ)/2^80,(1617741467162091:ℚ)/2^80⟩,
  ⟨(451144803518441:ℚ)/2^80,(451144803518443:ℚ)/2^80⟩,
  ⟨(125812212812184:ℚ)/2^80,(125812212812186:ℚ)/2^80⟩,
  ⟨(35085659347623:ℚ)/2^80,(35085659347624:ℚ)/2^80⟩,
  ⟨(9784451480041:ℚ)/2^80,(9784451480042:ℚ)/2^80⟩,
  ⟨(2728621680349:ℚ)/2^80,(2728621680350:ℚ)/2^80⟩,
  ⟨(760939567195:ℚ)/2^80,(760939567197:ℚ)/2^80⟩,
  ⟨(212205682119:ℚ)/2^80,(212205682120:ℚ)/2^80⟩,
  ⟨(59178485999:ℚ)/2^80,(59178486000:ℚ)/2^80⟩,
  ⟨(16503296095:ℚ)/2^80,(16503296096:ℚ)/2^80⟩,
  ⟨(4602327643:ℚ)/2^80,(4602327644:ℚ)/2^80⟩,
  ⟨(1283466018:ℚ)/2^80,(1283466020:ℚ)/2^80⟩,
  ⟨(357924326:ℚ)/2^80,(357924327:ℚ)/2^80⟩,
  ⟨(99815516:ℚ)/2^80,(99815517:ℚ)/2^80⟩,
  ⟨(27835876:ℚ)/2^80,(27835877:ℚ)/2^80⟩,
  ⟨(7762680:ℚ)/2^80,(7762682:ℚ)/2^80⟩,
  ⟨(2164803:ℚ)/2^80,(2164805:ℚ)/2^80⟩,
  ⟨(603705:ℚ)/2^80,(603707:ℚ)/2^80⟩,
  ⟨(168357:ℚ)/2^80,(168358:ℚ)/2^80⟩,
  ⟨(46950:ℚ)/2^80,(46951:ℚ)/2^80⟩,
  ⟨(13093:ℚ)/2^80,(13094:ℚ)/2^80⟩,
  ⟨(3651:ℚ)/2^80,(3652:ℚ)/2^80⟩,
  ⟨(1018:ℚ)/2^80,(1019:ℚ)/2^80⟩,
  ⟨(283:ℚ)/2^80,(285:ℚ)/2^80⟩,
  ⟨(78:ℚ)/2^80,(80:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (227:ℚ)/128,
  ⟨⟨(337137059554502220551863:ℚ)/2^80,(337137059554502220551864:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(660531504295437725:ℚ)/2^60,(660531504295437727:ℚ)/2^60⟩
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
end Point198

namespace Point199
/-- Exact original rational input. -/
def input : ℚ := (455:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(338363204083419417393149:ℚ)/2^80,(338363204083419417393150:ℚ)/2^80⟩,
  ⟨(94703625334177867877969:ℚ)/2^80,(94703625334177867877971:ℚ)/2^80⟩,
  ⟨(26506359270747391993974:ℚ)/2^80,(26506359270747391993976:ℚ)/2^80⟩,
  ⟨(7418798164386400853447:ℚ)/2^80,(7418798164386400853448:ℚ)/2^80⟩,
  ⟨(2076428740805757763482:ℚ)/2^80,(2076428740805757763483:ℚ)/2^80⟩,
  ⟨(581166412686843593435:ℚ)/2^80,(581166412686843593437:ℚ)/2^80⟩,
  ⟨(162661204113476617571:ℚ)/2^80,(162661204113476617573:ℚ)/2^80⟩,
  ⟨(45526834906584876085:ℚ)/2^80,(45526834906584876086:ℚ)/2^80⟩,
  ⟨(12742391204515316935:ℚ)/2^80,(12742391204515316936:ℚ)/2^80⟩,
  ⟨(3566435794231431884:ℚ)/2^80,(3566435794231431886:ℚ)/2^80⟩,
  ⟨(998200735656898656:ℚ)/2^80,(998200735656898658:ℚ)/2^80⟩,
  ⟨(279383890851930847:ℚ)/2^80,(279383890851930849:ℚ)/2^80⟩,
  ⟨(78196053839007367:ℚ)/2^80,(78196053839007369:ℚ)/2^80⟩,
  ⟨(21886096644110360:ℚ)/2^80,(21886096644110361:ℚ)/2^80⟩,
  ⟨(6125644489701774:ℚ)/2^80,(6125644489701775:ℚ)/2^80⟩,
  ⟨(1714491214417233:ℚ)/2^80,(1714491214417234:ℚ)/2^80⟩,
  ⟨(479864629632952:ℚ)/2^80,(479864629632953:ℚ)/2^80⟩,
  ⟨(134308103089954:ℚ)/2^80,(134308103089955:ℚ)/2^80⟩,
  ⟨(37591156842335:ℚ)/2^80,(37591156842337:ℚ)/2^80⟩,
  ⟨(10521294249823:ℚ)/2^80,(10521294249825:ℚ)/2^80⟩,
  ⟨(2944778559373:ℚ)/2^80,(2944778559375:ℚ)/2^80⟩,
  ⟨(824206657264:ℚ)/2^80,(824206657266:ℚ)/2^80⟩,
  ⟨(230685126294:ℚ)/2^80,(230685126296:ℚ)/2^80⟩,
  ⟨(64565879229:ℚ)/2^80,(64565879231:ℚ)/2^80⟩,
  ⟨(18071181387:ℚ)/2^80,(18071181389:ℚ)/2^80⟩,
  ⟨(5057897462:ℚ)/2^80,(5057897464:ℚ)/2^80⟩,
  ⟨(1415642186:ℚ)/2^80,(1415642188:ℚ)/2^80⟩,
  ⟨(396220527:ℚ)/2^80,(396220529:ℚ)/2^80⟩,
  ⟨(110897165:ℚ)/2^80,(110897167:ℚ)/2^80⟩,
  ⟨(31038728:ℚ)/2^80,(31038729:ℚ)/2^80⟩,
  ⟨(8687351:ℚ)/2^80,(8687352:ℚ)/2^80⟩,
  ⟨(2431480:ℚ)/2^80,(2431482:ℚ)/2^80⟩,
  ⟨(680540:ℚ)/2^80,(680542:ℚ)/2^80⟩,
  ⟨(190474:ℚ)/2^80,(190476:ℚ)/2^80⟩,
  ⟨(53311:ℚ)/2^80,(53312:ℚ)/2^80⟩,
  ⟨(14921:ℚ)/2^80,(14922:ℚ)/2^80⟩,
  ⟨(4176:ℚ)/2^80,(4177:ℚ)/2^80⟩,
  ⟨(1168:ℚ)/2^80,(1170:ℚ)/2^80⟩,
  ⟨(326:ℚ)/2^80,(328:ℚ)/2^80⟩,
  ⟨(91:ℚ)/2^80,(92:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (455:ℚ)/256,
  ⟨⟨(338363204083419417393149:ℚ)/2^80,(338363204083419417393150:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(663068186297004006:ℚ)/2^60,(663068186297004007:ℚ)/2^60⟩
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
end Point199

/-- Reusable proved logarithm bounds for these consecutive exact grid inputs. -/
def entries : Array CertifiedLogBound := #[⟨Point192.input, Point192.bounds, Point192.log_bounds⟩,
  ⟨Point193.input, Point193.bounds, Point193.log_bounds⟩,
  ⟨Point194.input, Point194.bounds, Point194.log_bounds⟩,
  ⟨Point195.input, Point195.bounds, Point195.log_bounds⟩,
  ⟨Point196.input, Point196.bounds, Point196.log_bounds⟩,
  ⟨Point197.input, Point197.bounds, Point197.log_bounds⟩,
  ⟨Point198.input, Point198.bounds, Point198.log_bounds⟩,
  ⟨Point199.input, Point199.bounds, Point199.log_bounds⟩]
end MatrixBounds.Numeric.LogGridData.Part024
