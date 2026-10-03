module

public import TabulatedLogBounds
public import FKLLog.GridTrace

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

namespace MatrixBounds.Numeric.LogGridData.Part030
set_option maxRecDepth 100000
set_option maxHeartbeats 16000000

namespace Point240
/-- Exact original rational input. -/
def input : ℚ := (31:ℚ)/16
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(385827389238711438736013:ℚ)/2^80,(385827389238711438736014:ℚ)/2^80⟩,
  ⟨(123136400820865352788089:ℚ)/2^80,(123136400820865352788090:ℚ)/2^80⟩,
  ⟨(39298851325808091315347:ℚ)/2^80,(39298851325808091315348:ℚ)/2^80⟩,
  ⟨(12542186593343007866600:ℚ)/2^80,(12542186593343007866601:ℚ)/2^80⟩,
  ⟨(4002825508513725914872:ℚ)/2^80,(4002825508513725914873:ℚ)/2^80⟩,
  ⟨(1277497502717146568576:ℚ)/2^80,(1277497502717146568577:ℚ)/2^80⟩,
  ⟨(407711968952280819758:ℚ)/2^80,(407711968952280819759:ℚ)/2^80⟩,
  ⟨(130120841154983240348:ℚ)/2^80,(130120841154983240349:ℚ)/2^80⟩,
  ⟨(41527928028186140536:ℚ)/2^80,(41527928028186140537:ℚ)/2^80⟩,
  ⟨(13253594051548768256:ℚ)/2^80,(13253594051548768257:ℚ)/2^80⟩,
  ⟨(4229870441983649443:ℚ)/2^80,(4229870441983649444:ℚ)/2^80⟩,
  ⟨(1349958651696909396:ℚ)/2^80,(1349958651696909398:ℚ)/2^80⟩,
  ⟨(430837867562843424:ℚ)/2^80,(430837867562843425:ℚ)/2^80⟩,
  ⟨(137501447094524497:ℚ)/2^80,(137501447094524498:ℚ)/2^80⟩,
  ⟨(43883440562082286:ℚ)/2^80,(43883440562082287:ℚ)/2^80⟩,
  ⟨(14005353370877325:ℚ)/2^80,(14005353370877326:ℚ)/2^80⟩,
  ⟨(4469793629003401:ℚ)/2^80,(4469793629003402:ℚ)/2^80⟩,
  ⟨(1426529881596830:ℚ)/2^80,(1426529881596831:ℚ)/2^80⟩,
  ⟨(455275494126647:ℚ)/2^80,(455275494126649:ℚ)/2^80⟩,
  ⟨(145300689614887:ℚ)/2^80,(145300689614888:ℚ)/2^80⟩,
  ⟨(46372560515389:ℚ)/2^80,(46372560515390:ℚ)/2^80⟩,
  ⟨(14799753355975:ℚ)/2^80,(14799753355976:ℚ)/2^80⟩,
  ⟨(4723325539140:ℚ)/2^80,(4723325539142:ℚ)/2^80⟩,
  ⟨(1507444321002:ℚ)/2^80,(1507444321003:ℚ)/2^80⟩,
  ⟨(481099251383:ℚ)/2^80,(481099251384:ℚ)/2^80⟩,
  ⟨(153542314271:ℚ)/2^80,(153542314272:ℚ)/2^80⟩,
  ⟨(49002866256:ℚ)/2^80,(49002866258:ℚ)/2^80⟩,
  ⟨(15639212634:ℚ)/2^80,(15639212636:ℚ)/2^80⟩,
  ⟨(4991238074:ℚ)/2^80,(4991238076:ℚ)/2^80⟩,
  ⟨(1592948321:ℚ)/2^80,(1592948323:ℚ)/2^80⟩,
  ⟨(508387762:ℚ)/2^80,(508387763:ℚ)/2^80⟩,
  ⟨(162251413:ℚ)/2^80,(162251414:ℚ)/2^80⟩,
  ⟨(51782365:ℚ)/2^80,(51782367:ℚ)/2^80⟩,
  ⟨(16526286:ℚ)/2^80,(16526288:ℚ)/2^80⟩,
  ⟨(5274346:ℚ)/2^80,(5274348:ℚ)/2^80⟩,
  ⟨(1683301:ℚ)/2^80,(1683303:ℚ)/2^80⟩,
  ⟨(537223:ℚ)/2^80,(537225:ℚ)/2^80⟩,
  ⟨(171454:ℚ)/2^80,(171455:ℚ)/2^80⟩,
  ⟨(54719:ℚ)/2^80,(54720:ℚ)/2^80⟩,
  ⟨(17463:ℚ)/2^80,(17464:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (31:ℚ)/16,
  ⟨⟨(385827389238711438736013:ℚ)/2^80,(385827389238711438736014:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(762540533295011191:ℚ)/2^60,(762540533295011192:ℚ)/2^60⟩
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
end Point240

namespace Point241
/-- Exact original rational input. -/
def input : ℚ := (497:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(386920481443725937721365:ℚ)/2^80,(386920481443725937721366:ℚ)/2^80⟩,
  ⟨(123835107606823308088776:ℚ)/2^80,(123835107606823308088778:ℚ)/2^80⟩,
  ⟨(39633812660351151725624:ℚ)/2^80,(39633812660351151725625:ℚ)/2^80⟩,
  ⟨(12684925433126995439409:ℚ)/2^80,(12684925433126995439410:ℚ)/2^80⟩,
  ⟨(4059849972620990572241:ℚ)/2^80,(4059849972620990572242:ℚ)/2^80⟩,
  ⟨(1299367653919865508512:ℚ)/2^80,(1299367653919865508514:ℚ)/2^80⟩,
  ⟨(415866672768509412418:ℚ)/2^80,(415866672768509412420:ℚ)/2^80⟩,
  ⟨(133099426477039533058:ℚ)/2^80,(133099426477039533059:ℚ)/2^80⟩,
  ⟨(42598886827312785480:ℚ)/2^80,(42598886827312785482:ℚ)/2^80⟩,
  ⟨(13633906673814583400:ℚ)/2^80,(13633906673814583402:ℚ)/2^80⟩,
  ⟨(4363574380331095085:ℚ)/2^80,(4363574380331095087:ℚ)/2^80⟩,
  ⟨(1396575598485782092:ℚ)/2^80,(1396575598485782093:ℚ)/2^80⟩,
  ⟨(446978378798238358:ℚ)/2^80,(446978378798238360:ℚ)/2^80⟩,
  ⟨(143056825086819979:ℚ)/2^80,(143056825086819980:ℚ)/2^80⟩,
  ⟨(45785783327919807:ℚ)/2^80,(45785783327919808:ℚ)/2^80⟩,
  ⟨(14653882844659592:ℚ)/2^80,(14653882844659594:ℚ)/2^80⟩,
  ⟨(4690020937002605:ℚ)/2^80,(4690020937002606:ℚ)/2^80⟩,
  ⟨(1501055837739213:ℚ)/2^80,(1501055837739214:ℚ)/2^80⟩,
  ⟨(480417605438446:ℚ)/2^80,(480417605438447:ℚ)/2^80⟩,
  ⟨(153759153931826:ℚ)/2^80,(153759153931827:ℚ)/2^80⟩,
  ⟨(49211097075126:ℚ)/2^80,(49211097075127:ℚ)/2^80⟩,
  ⟨(15750165199343:ℚ)/2^80,(15750165199344:ℚ)/2^80⟩,
  ⟨(5040889525951:ℚ)/2^80,(5040889525953:ℚ)/2^80⟩,
  ⟨(1613352424640:ℚ)/2^80,(1613352424642:ℚ)/2^80⟩,
  ⟨(516358478536:ℚ)/2^80,(516358478538:ℚ)/2^80⟩,
  ⟨(165262142532:ℚ)/2^80,(165262142534:ℚ)/2^80⟩,
  ⟨(52892664475:ℚ)/2^80,(52892664477:ℚ)/2^80⟩,
  ⟨(16928462335:ℚ)/2^80,(16928462336:ℚ)/2^80⟩,
  ⟨(5418007201:ℚ)/2^80,(5418007202:ℚ)/2^80⟩,
  ⟨(1734050113:ℚ)/2^80,(1734050114:ℚ)/2^80⟩,
  ⟨(554988150:ℚ)/2^80,(554988151:ℚ)/2^80⟩,
  ⟨(177625689:ℚ)/2^80,(177625690:ℚ)/2^80⟩,
  ⟨(56849656:ℚ)/2^80,(56849657:ℚ)/2^80⟩,
  ⟨(18194909:ℚ)/2^80,(18194911:ℚ)/2^80⟩,
  ⟨(5823337:ℚ)/2^80,(5823339:ℚ)/2^80⟩,
  ⟨(1863777:ℚ)/2^80,(1863778:ℚ)/2^80⟩,
  ⟨(596507:ℚ)/2^80,(596508:ℚ)/2^80⟩,
  ⟨(190913:ℚ)/2^80,(190915:ℚ)/2^80⟩,
  ⟨(61102:ℚ)/2^80,(61103:ℚ)/2^80⟩,
  ⟨(19555:ℚ)/2^80,(19557:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (497:ℚ)/256,
  ⟨⟨(386920481443725937721365:ℚ)/2^80,(386920481443725937721366:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(764862631773060693:ℚ)/2^60,(764862631773060694:ℚ)/2^60⟩
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
end Point241

namespace Point242
/-- Exact original rational input. -/
def input : ℚ := (249:ℚ)/128
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(388010674199920769600655:ℚ)/2^80,(388010674199920769600656:ℚ)/2^80⟩,
  ⟨(124533929915624437988538:ℚ)/2^80,(124533929915624437988540:ℚ)/2^80⟩,
  ⟨(39969775914563811662103:ℚ)/2^80,(39969775914563811662105:ℚ)/2^80⟩,
  ⟨(12828495717936926289428:ℚ)/2^80,(12828495717936926289429:ℚ)/2^80⟩,
  ⟨(4117368652176042655227:ℚ)/2^80,(4117368652176042655228:ℚ)/2^80⟩,
  ⟨(1321489673510082655921:ℚ)/2^80,(1321489673510082655922:ℚ)/2^80⟩,
  ⟨(424138595476710878956:ℚ)/2^80,(424138595476710878957:ℚ)/2^80⟩,
  ⟨(136129363534965560619:ℚ)/2^80,(136129363534965560621:ℚ)/2^80⟩,
  ⟨(43691387235360299296:ℚ)/2^80,(43691387235360299298:ℚ)/2^80⟩,
  ⟨(14022965133895480675:ℚ)/2^80,(14022965133895480677:ℚ)/2^80⟩,
  ⟨(4500739472682634381:ℚ)/2^80,(4500739472682634382:ℚ)/2^80⟩,
  ⟨(1444534419614320318:ℚ)/2^80,(1444534419614320319:ℚ)/2^80⟩,
  ⟨(463630410539344186:ℚ)/2^80,(463630410539344188:ℚ)/2^80⟩,
  ⟨(148804455372044155:ℚ)/2^80,(148804455372044156:ℚ)/2^80⟩,
  ⟨(47759520159197195:ℚ)/2^80,(47759520159197196:ℚ)/2^80⟩,
  ⟨(15328652358787428:ℚ)/2^80,(15328652358787429:ℚ)/2^80⟩,
  ⟨(4919806194730182:ℚ)/2^80,(4919806194730183:ℚ)/2^80⟩,
  ⟨(1579035940483692:ℚ)/2^80,(1579035940483693:ℚ)/2^80⟩,
  ⟨(506799333683094:ℚ)/2^80,(506799333683096:ℚ)/2^80⟩,
  ⟨(162659733091921:ℚ)/2^80,(162659733091923:ℚ)/2^80⟩,
  ⟨(52206439533481:ℚ)/2^80,(52206439533482:ℚ)/2^80⟩,
  ⟨(16755912953716:ℚ)/2^80,(16755912953718:ℚ)/2^80⟩,
  ⟨(5377892486471:ℚ)/2^80,(5377892486472:ℚ)/2^80⟩,
  ⟨(1726060983721:ℚ)/2^80,(1726060983722:ℚ)/2^80⟩,
  ⟨(553987742785:ℚ)/2^80,(553987742787:ℚ)/2^80⟩,
  ⟨(177805084554:ℚ)/2^80,(177805084555:ℚ)/2^80⟩,
  ⟨(57067414405:ℚ)/2^80,(57067414407:ℚ)/2^80⟩,
  ⟨(18316066692:ℚ)/2^80,(18316066693:ℚ)/2^80⟩,
  ⟨(5878631484:ℚ)/2^80,(5878631486:ℚ)/2^80⟩,
  ⟨(1886775622:ℚ)/2^80,(1886775623:ℚ)/2^80⟩,
  ⟨(605569894:ℚ)/2^80,(605569895:ℚ)/2^80⟩,
  ⟨(194360629:ℚ)/2^80,(194360630:ℚ)/2^80⟩,
  ⟨(62380997:ℚ)/2^80,(62380998:ℚ)/2^80⟩,
  ⟨(20021487:ℚ)/2^80,(20021488:ℚ)/2^80⟩,
  ⟨(6425994:ℚ)/2^80,(6425995:ℚ)/2^80⟩,
  ⟨(2062454:ℚ)/2^80,(2062455:ℚ)/2^80⟩,
  ⟨(661954:ℚ)/2^80,(661956:ℚ)/2^80⟩,
  ⟨(212457:ℚ)/2^80,(212459:ℚ)/2^80⟩,
  ⟨(68189:ℚ)/2^80,(68190:ℚ)/2^80⟩,
  ⟨(21885:ℚ)/2^80,(21886:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (249:ℚ)/128,
  ⟨⟨(388010674199920769600655:ℚ)/2^80,(388010674199920769600656:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(767180062713334740:ℚ)/2^60,(767180062713334741:ℚ)/2^60⟩
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
end Point242

namespace Point243
/-- Exact original rational input. -/
def input : ℚ := (499:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(389097979028284621792848:ℚ)/2^80,(389097979028284621792849:ℚ)/2^80⟩,
  ⟨(125232859475328692841936:ℚ)/2^80,(125232859475328692841937:ℚ)/2^80⟩,
  ⟨(40306734903979963391510:ℚ)/2^80,(40306734903979963391511:ℚ)/2^80⟩,
  ⟨(12972896134658451793558:ℚ)/2^80,(12972896134658451793560:ℚ)/2^80⟩,
  ⟨(4175382464532455345476:ℚ)/2^80,(4175382464532455345477:ℚ)/2^80⟩,
  ⟨(1343864819710445892649:ℚ)/2^80,(1343864819710445892651:ℚ)/2^80⟩,
  ⟨(432528677072368678031:ℚ)/2^80,(432528677072368678033:ℚ)/2^80⟩,
  ⟨(139211216594153097697:ℚ)/2^80,(139211216594153097699:ℚ)/2^80⟩,
  ⟨(44805729314409540053:ℚ)/2^80,(44805729314409540055:ℚ)/2^80⟩,
  ⟨(14420916852187441368:ℚ)/2^80,(14420916852187441369:ℚ)/2^80⟩,
  ⟨(4641434165670924837:ℚ)/2^80,(4641434165670924838:ℚ)/2^80⟩,
  ⟨(1493865565904681768:ℚ)/2^80,(1493865565904681770:ℚ)/2^80⟩,
  ⟨(480807062933559827:ℚ)/2^80,(480807062933559828:ℚ)/2^80⟩,
  ⟨(154749822904443758:ℚ)/2^80,(154749822904443760:ℚ)/2^80⟩,
  ⟨(49806896643416997:ℚ)/2^80,(49806896643416999:ℚ)/2^80⟩,
  ⟨(16030564085232225:ℚ)/2^80,(16030564085232227:ℚ)/2^80⟩,
  ⟨(5159506056571431:ℚ)/2^80,(5159506056571433:ℚ)/2^80⟩,
  ⟨(1660609234101798:ℚ)/2^80,(1660609234101799:ℚ)/2^80⟩,
  ⟨(534474230313558:ℚ)/2^80,(534474230313560:ℚ)/2^80⟩,
  ⟨(172022831743304:ℚ)/2^80,(172022831743305:ℚ)/2^80⟩,
  ⟨(55366288892215:ℚ)/2^80,(55366288892217:ℚ)/2^80⟩,
  ⟨(17819878411666:ℚ)/2^80,(17819878411668:ℚ)/2^80⟩,
  ⟨(5735404574880:ℚ)/2^80,(5735404574882:ℚ)/2^80⟩,
  ⟨(1845964651252:ℚ)/2^80,(1845964651254:ℚ)/2^80⟩,
  ⟨(594131669210:ℚ)/2^80,(594131669212:ℚ)/2^80⟩,
  ⟨(191223835255:ℚ)/2^80,(191223835257:ℚ)/2^80⟩,
  ⟨(61546214525:ℚ)/2^80,(61546214527:ℚ)/2^80⟩,
  ⟨(19808914078:ℚ)/2^80,(19808914080:ℚ)/2^80⟩,
  ⟨(6375584266:ℚ)/2^80,(6375584267:ℚ)/2^80⟩,
  ⟨(2052009240:ℚ)/2^80,(2052009241:ℚ)/2^80⟩,
  ⟨(660448007:ℚ)/2^80,(660448008:ℚ)/2^80⟩,
  ⟨(212568034:ℚ)/2^80,(212568035:ℚ)/2^80⟩,
  ⟨(68415936:ℚ)/2^80,(68415938:ℚ)/2^80⟩,
  ⟨(22019963:ℚ)/2^80,(22019965:ℚ)/2^80⟩,
  ⟨(7087219:ℚ)/2^80,(7087221:ℚ)/2^80⟩,
  ⟨(2281051:ℚ)/2^80,(2281053:ℚ)/2^80⟩,
  ⟨(734166:ℚ)/2^80,(734167:ℚ)/2^80⟩,
  ⟨(236294:ℚ)/2^80,(236295:ℚ)/2^80⟩,
  ⟨(76052:ℚ)/2^80,(76053:ℚ)/2^80⟩,
  ⟨(24477:ℚ)/2^80,(24478:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (499:ℚ)/256,
  ⟨⟨(389097979028284621792848:ℚ)/2^80,(389097979028284621792849:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(769492844842182302:ℚ)/2^60,(769492844842182303:ℚ)/2^60⟩
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
end Point243

namespace Point244
/-- Exact original rational input. -/
def input : ℚ := (125:ℚ)/64
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(390182407388848569614162:ℚ)/2^80,(390182407388848569614163:ℚ)/2^80⟩,
  ⟨(125931888099046363737903:ℚ)/2^80,(125931888099046363737905:ℚ)/2^80⟩,
  ⟨(40644683460538773481545:ℚ)/2^80,(40644683460538773481547:ℚ)/2^80⟩,
  ⟨(13118125349697699377641:ℚ)/2^80,(13118125349697699377643:ℚ)/2^80⟩,
  ⟨(4233892308632590804423:ℚ)/2^80,(4233892308632590804425:ℚ)/2^80⟩,
  ⟨(1366494342997820312538:ℚ)/2^80,(1366494342997820312540:ℚ)/2^80⟩,
  ⟨(441037856734746238438:ℚ)/2^80,(441037856734746238439:ℚ)/2^80⟩,
  ⟨(142345551644547727749:ℚ)/2^80,(142345551644547727751:ℚ)/2^80⟩,
  ⟨(45942215081044504723:ℚ)/2^80,(45942215081044504724:ℚ)/2^80⟩,
  ⟨(14827910687532882476:ℚ)/2^80,(14827910687532882478:ℚ)/2^80⟩,
  ⟨(4785727788039713391:ℚ)/2^80,(4785727788039713393:ℚ)/2^80⟩,
  ⟨(1544599973917579454:ℚ)/2^80,(1544599973917579455:ℚ)/2^80⟩,
  ⟨(498521684703557389:ℚ)/2^80,(498521684703557391:ℚ)/2^80⟩,
  ⟨(160898533158291009:ℚ)/2^80,(160898533158291010:ℚ)/2^80⟩,
  ⟨(51930214405585987:ℚ)/2^80,(51930214405585988:ℚ)/2^80⟩,
  ⟨(16760545390162673:ℚ)/2^80,(16760545390162674:ℚ)/2^80⟩,
  ⟨(5409488194708587:ℚ)/2^80,(5409488194708588:ℚ)/2^80⟩,
  ⟨(1745919470249861:ℚ)/2^80,(1745919470249862:ℚ)/2^80⟩,
  ⟨(563497818440431:ℚ)/2^80,(563497818440432:ℚ)/2^80⟩,
  ⟨(181869666269133:ℚ)/2^80,(181869666269135:ℚ)/2^80⟩,
  ⟨(58698675356704:ℚ)/2^80,(58698675356705:ℚ)/2^80⟩,
  ⟨(18945075115126:ℚ)/2^80,(18945075115128:ℚ)/2^80⟩,
  ⟨(6114548053030:ℚ)/2^80,(6114548053031:ℚ)/2^80⟩,
  ⟨(1973478472141:ℚ)/2^80,(1973478472143:ℚ)/2^80⟩,
  ⟨(636942787304:ℚ)/2^80,(636942787306:ℚ)/2^80⟩,
  ⟨(205574127119:ℚ)/2^80,(205574127120:ℚ)/2^80⟩,
  ⟨(66349321451:ℚ)/2^80,(66349321452:ℚ)/2^80⟩,
  ⟨(21414331261:ℚ)/2^80,(21414331263:ℚ)/2^80⟩,
  ⟨(6911503740:ℚ)/2^80,(6911503741:ℚ)/2^80⟩,
  ⟨(2230696974:ℚ)/2^80,(2230696975:ℚ)/2^80⟩,
  ⟨(719960399:ℚ)/2^80,(719960400:ℚ)/2^80⟩,
  ⟨(232368171:ℚ)/2^80,(232368172:ℚ)/2^80⟩,
  ⟨(74997134:ℚ)/2^80,(74997135:ℚ)/2^80⟩,
  ⟨(24205424:ℚ)/2^80,(24205425:ℚ)/2^80⟩,
  ⟨(7812332:ℚ)/2^80,(7812333:ℚ)/2^80⟩,
  ⟨(2521440:ℚ)/2^80,(2521441:ℚ)/2^80⟩,
  ⟨(813798:ℚ)/2^80,(813799:ℚ)/2^80⟩,
  ⟨(262654:ℚ)/2^80,(262655:ℚ)/2^80⟩,
  ⟨(84771:ℚ)/2^80,(84773:ℚ)/2^80⟩,
  ⟨(27359:ℚ)/2^80,(27361:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (125:ℚ)/64,
  ⟨⟨(390182407388848569614162:ℚ)/2^80,(390182407388848569614163:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(771800996773481632:ℚ)/2^60,(771800996773481633:ℚ)/2^60⟩
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
end Point244

namespace Point245
/-- Exact original rational input. -/
def input : ℚ := (501:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(391263970681088702513887:ℚ)/2^80,(391263970681088702513888:ℚ)/2^80⟩,
  ⟨(126631007684104005437122:ℚ)/2^80,(126631007684104005437124:ℚ)/2^80⟩,
  ⟨(40983615432768139144114:ℚ)/2^80,(40983615432768139144116:ℚ)/2^80⟩,
  ⟨(13264182009284272246113:ℚ)/2^80,(13264182009284272246115:ℚ)/2^80⟩,
  ⟨(4292899065092003567103:ℚ)/2^80,(4292899065092003567105:ℚ)/2^80⟩,
  ⟨(1389379486060159674954:ℚ)/2^80,(1389379486060159674955:ℚ)/2^80⟩,
  ⟨(449667072767158679476:ℚ)/2^80,(449667072767158679477:ℚ)/2^80⟩,
  ⟨(145532936364536164427:ℚ)/2^80,(145532936364536164428:ℚ)/2^80⟩,
  ⟨(47101148493145786373:ℚ)/2^80,(47101148493145786374:ℚ)/2^80⟩,
  ⟨(15244096936354977095:ℚ)/2^80,(15244096936354977096:ℚ)/2^80⟩,
  ⟨(4933690554038268676:ℚ)/2^80,(4933690554038268678:ℚ)/2^80⟩,
  ⟨(1596769069668924472:ℚ)/2^80,(1596769069668924474:ℚ)/2^80⟩,
  ⟨(516787875916626810:ℚ)/2^80,(516787875916626812:ℚ)/2^80⟩,
  ⟨(167256313869978293:ℚ)/2^80,(167256313869978295:ℚ)/2^80⟩,
  ⟨(54131832097945418:ℚ)/2^80,(54131832097945420:ℚ)/2^80⟩,
  ⟨(17519549357987618:ℚ)/2^80,(17519549357987620:ℚ)/2^80⟩,
  ⟨(5670131562360589:ℚ)/2^80,(5670131562360591:ℚ)/2^80⟩,
  ⟨(1835115234845897:ℚ)/2^80,(1835115234845899:ℚ)/2^80⟩,
  ⟨(593927651964656:ℚ)/2^80,(593927651964657:ℚ)/2^80⟩,
  ⟨(192222291586975:ℚ)/2^80,(192222291586977:ℚ)/2^80⟩,
  ⟨(62211970196577:ℚ)/2^80,(62211970196578:ℚ)/2^80⟩,
  ⟨(20134653498231:ℚ)/2^80,(20134653498232:ℚ)/2^80⟩,
  ⟨(6516499480933:ℚ)/2^80,(6516499480934:ℚ)/2^80⟩,
  ⟨(2109038801622:ℚ)/2^80,(2109038801624:ℚ)/2^80⟩,
  ⟨(682581910696:ℚ)/2^80,(682581910698:ℚ)/2^80⟩,
  ⟨(220914885231:ℚ)/2^80,(220914885233:ℚ)/2^80⟩,
  ⟨(71498212525:ℚ)/2^80,(71498212526:ℚ)/2^80⟩,
  ⟨(23140108412:ℚ)/2^80,(23140108414:ℚ)/2^80⟩,
  ⟨(7489202854:ℚ)/2^80,(7489202856:ℚ)/2^80⟩,
  ⟨(2423850329:ℚ)/2^80,(2423850330:ℚ)/2^80⟩,
  ⟨(784469393:ℚ)/2^80,(784469394:ℚ)/2^80⟩,
  ⟨(253890358:ℚ)/2^80,(253890359:ℚ)/2^80⟩,
  ⟨(82170591:ℚ)/2^80,(82170592:ℚ)/2^80⟩,
  ⟨(26594180:ℚ)/2^80,(26594182:ℚ)/2^80⟩,
  ⟨(8607099:ℚ)/2^80,(8607100:ℚ)/2^80⟩,
  ⟨(2785652:ℚ)/2^80,(2785654:ℚ)/2^80⟩,
  ⟨(901565:ℚ)/2^80,(901566:ℚ)/2^80⟩,
  ⟨(291787:ℚ)/2^80,(291789:ℚ)/2^80⟩,
  ⟨(94435:ℚ)/2^80,(94437:ℚ)/2^80⟩,
  ⟨(30563:ℚ)/2^80,(30565:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (501:ℚ)/256,
  ⟨⟨(391263970681088702513887:ℚ)/2^80,(391263970681088702513888:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(774104537009539138:ℚ)/2^60,(774104537009539139:ℚ)/2^60⟩
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
end Point245

namespace Point246
/-- Exact original rational input. -/
def input : ℚ := (251:ℚ)/128
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(392342680244325563295144:ℚ)/2^80,(392342680244325563295145:ℚ)/2^80⟩,
  ⟨(127330210211219114209241:ℚ)/2^80,(127330210211219114209243:ℚ)/2^80⟩,
  ⟨(41323524685962931524371:ℚ)/2^80,(41323524685962931524372:ℚ)/2^80⟩,
  ⟨(13411064739771611022421:ℚ)/2^80,(13411064739771611022422:ℚ)/2^80⟩,
  ⟨(4352403596284718089070:ℚ)/2^80,(4352403596284718089072:ℚ)/2^80⟩,
  ⟨(1412521483754671042099:ℚ)/2^80,(1412521483754671042100:ℚ)/2^80⟩,
  ⟨(458417262537795615245:ℚ)/2^80,(458417262537795615247:ℚ)/2^80⟩,
  ⟨(148773940084825489908:ℚ)/2^80,(148773940084825489909:ℚ)/2^80⟩,
  ⟨(48282835436500093030:ℚ)/2^80,(48282835436500093032:ℚ)/2^80⟩,
  ⟨(15669627331634594835:ℚ)/2^80,(15669627331634594837:ℚ)/2^80⟩,
  ⟨(5085393566731016265:ℚ)/2^80,(5085393566731016267:ℚ)/2^80⟩,
  ⟨(1650404772316398418:ℚ)/2^80,(1650404772316398420:ℚ)/2^80⟩,
  ⟨(535619490751759908:ℚ)/2^80,(535619490751759910:ℚ)/2^80⟩,
  ⟨(173829016787510471:ℚ)/2^80,(173829016787510473:ℚ)/2^80⟩,
  ⟨(56414166398057487:ℚ)/2^80,(56414166398057489:ℚ)/2^80⟩,
  ⟨(18308555321797020:ℚ)/2^80,(18308555321797022:ℚ)/2^80⟩,
  ⟨(5941826661163676:ℚ)/2^80,(5941826661163678:ℚ)/2^80⟩,
  ⟨(1928350077369741:ℚ)/2^80,(1928350077369743:ℚ)/2^80⟩,
  ⟨(625823376032923:ℚ)/2^80,(625823376032925:ℚ)/2^80⟩,
  ⟨(203103628633376:ℚ)/2^80,(203103628633377:ℚ)/2^80⟩,
  ⟨(65914897946979:ℚ)/2^80,(65914897946980:ℚ)/2^80⟩,
  ⟨(21391906193874:ℚ)/2^80,(21391906193875:ℚ)/2^80⟩,
  ⟨(6942491983763:ℚ)/2^80,(6942491983765:ℚ)/2^80⟩,
  ⟨(2253104258582:ℚ)/2^80,(2253104258584:ℚ)/2^80⟩,
  ⟨(731218532468:ℚ)/2^80,(731218532470:ℚ)/2^80⟩,
  ⟨(237308389165:ℚ)/2^80,(237308389166:ℚ)/2^80⟩,
  ⟨(77015651364:ℚ)/2^80,(77015651366:ℚ)/2^80⟩,
  ⟨(24994525376:ℚ)/2^80,(24994525378:ℚ)/2^80⟩,
  ⟨(8111679739:ℚ)/2^80,(8111679741:ℚ)/2^80⟩,
  ⟨(2632550416:ℚ)/2^80,(2632550418:ℚ)/2^80⟩,
  ⟨(854363327:ℚ)/2^80,(854363329:ℚ)/2^80⟩,
  ⟨(277273586:ℚ)/2^80,(277273587:ℚ)/2^80⟩,
  ⟨(89985886:ℚ)/2^80,(89985888:ℚ)/2^80⟩,
  ⟨(29203862:ℚ)/2^80,(29203864:ℚ)/2^80⟩,
  ⟨(9477770:ℚ)/2^80,(9477772:ℚ)/2^80⟩,
  ⟨(3075898:ℚ)/2^80,(3075900:ℚ)/2^80⟩,
  ⟨(998246:ℚ)/2^80,(998248:ℚ)/2^80⟩,
  ⟨(323969:ℚ)/2^80,(323970:ℚ)/2^80⟩,
  ⟨(105140:ℚ)/2^80,(105141:ℚ)/2^80⟩,
  ⟨(34121:ℚ)/2^80,(34123:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (251:ℚ)/128,
  ⟨⟨(392342680244325563295144:ℚ)/2^80,(392342680244325563295145:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(776403483941979288:ℚ)/2^60,(776403483941979289:ℚ)/2^60⟩
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
end Point246

namespace Point247
/-- Exact original rational input. -/
def input : ℚ := (503:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(393418547358120429713340:ℚ)/2^80,(393418547358120429713341:ℚ)/2^80⟩,
  ⟨(128029487743683459998939:ℚ)/2^80,(128029487743683459998940:ℚ)/2^80⟩,
  ⟨(41664405102358122028640:ℚ)/2^80,(41664405102358122028641:ℚ)/2^80⟩,
  ⟨(13558772147934724823549:ℚ)/2^80,(13558772147934724823550:ℚ)/2^80⟩,
  ⟨(4412406746429350502525:ℚ)/2^80,(4412406746429350502526:ℚ)/2^80⟩,
  ⟨(1435921563067258990940:ℚ)/2^80,(1435921563067258990941:ℚ)/2^80⟩,
  ⟨(467289362421097458184:ℚ)/2^80,(467289362421097458186:ℚ)/2^80⟩,
  ⟨(152069133752320253190:ℚ)/2^80,(152069133752320253191:ℚ)/2^80⟩,
  ⟨(49487583711229384107:ℚ)/2^80,(49487583711229384109:ℚ)/2^80⟩,
  ⟨(16104655041730774538:ℚ)/2^80,(16104655041730774539:ℚ)/2^80⟩,
  ⟨(5240908821222004362:ℚ)/2^80,(5240908821222004363:ℚ)/2^80⟩,
  ⟨(1705539497815329482:ℚ)/2^80,(1705539497815329484:ℚ)/2^80⟩,
  ⟨(555030640264013678:ℚ)/2^80,(555030640264013680:ℚ)/2^80⟩,
  ⟨(180622619427155966:ℚ)/2^80,(180622619427155968:ℚ)/2^80⟩,
  ⟨(58779693015161427:ℚ)/2^80,(58779693015161429:ℚ)/2^80⟩,
  ⟨(19128569400190872:ℚ)/2^80,(19128569400190874:ℚ)/2^80⟩,
  ⟨(6224975812710336:ℚ)/2^80,(6224975812710338:ℚ)/2^80⟩,
  ⟨(2025782642607974:ℚ)/2^80,(2025782642607976:ℚ)/2^80⟩,
  ⟨(659246788832897:ℚ)/2^80,(659246788832899:ℚ)/2^80⟩,
  ⟨(214537492545092:ℚ)/2^80,(214537492545094:ℚ)/2^80⟩,
  ⟨(69816548957361:ℚ)/2^80,(69816548957363:ℚ)/2^80⟩,
  ⟨(22720273507863:ℚ)/2^80,(22720273507864:ℚ)/2^80⟩,
  ⟨(7393817597420:ℚ)/2^80,(7393817597421:ℚ)/2^80⟩,
  ⟨(2406156714838:ℚ)/2^80,(2406156714840:ℚ)/2^80⟩,
  ⟨(783031236581:ℚ)/2^80,(783031236582:ℚ)/2^80⟩,
  ⟨(254820441944:ℚ)/2^80,(254820441945:ℚ)/2^80⟩,
  ⟨(82925756469:ℚ)/2^80,(82925756470:ℚ)/2^80⟩,
  ⟨(26986379246:ℚ)/2^80,(26986379247:ℚ)/2^80⟩,
  ⟨(8782128687:ℚ)/2^80,(8782128688:ℚ)/2^80⟩,
  ⟨(2857952286:ℚ)/2^80,(2857952288:ℚ)/2^80⟩,
  ⟨(930058253:ℚ)/2^80,(930058255:ℚ)/2^80⟩,
  ⟨(302667178:ℚ)/2^80,(302667180:ℚ)/2^80⟩,
  ⟨(98496433:ℚ)/2^80,(98496435:ℚ)/2^80⟩,
  ⟨(32053516:ℚ)/2^80,(32053518:ℚ)/2^80⟩,
  ⟨(10431117:ℚ)/2^80,(10431119:ℚ)/2^80⟩,
  ⟨(3394579:ℚ)/2^80,(3394581:ℚ)/2^80⟩,
  ⟨(1104691:ℚ)/2^80,(1104693:ℚ)/2^80⟩,
  ⟨(359497:ℚ)/2^80,(359499:ℚ)/2^80⟩,
  ⟨(116990:ℚ)/2^80,(116992:ℚ)/2^80⟩,
  ⟨(38071:ℚ)/2^80,(38073:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (503:ℚ)/256,
  ⟨⟨(393418547358120429713340:ℚ)/2^80,(393418547358120429713341:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(778697855852625659:ℚ)/2^60,(778697855852625660:ℚ)/2^60⟩
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
end Point247

/-- Reusable proved logarithm bounds for these consecutive exact grid inputs. -/
def entries : Array CertifiedLogBound := #[⟨Point240.input, Point240.bounds, Point240.log_bounds⟩,
  ⟨Point241.input, Point241.bounds, Point241.log_bounds⟩,
  ⟨Point242.input, Point242.bounds, Point242.log_bounds⟩,
  ⟨Point243.input, Point243.bounds, Point243.log_bounds⟩,
  ⟨Point244.input, Point244.bounds, Point244.log_bounds⟩,
  ⟨Point245.input, Point245.bounds, Point245.log_bounds⟩,
  ⟨Point246.input, Point246.bounds, Point246.log_bounds⟩,
  ⟨Point247.input, Point247.bounds, Point247.log_bounds⟩]
end MatrixBounds.Numeric.LogGridData.Part030
