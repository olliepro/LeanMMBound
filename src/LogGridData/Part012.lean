import TabulatedLogBounds

namespace MatrixBounds.Numeric.LogGridData.Part012
set_option maxRecDepth 100000
set_option maxHeartbeats 16000000

namespace Point096
/-- Exact original rational input. -/
def input : ℚ := (11:ℚ)/8
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(190883024149678290743080:ℚ)/2^80,(190883024149678290743081:ℚ)/2^80⟩,
  ⟨(30139424865738677485749:ℚ)/2^80,(30139424865738677485750:ℚ)/2^80⟩,
  ⟨(4758856557748212234591:ℚ)/2^80,(4758856557748212234593:ℚ)/2^80⟩,
  ⟨(751398403854980879145:ℚ)/2^80,(751398403854980879147:ℚ)/2^80⟩,
  ⟨(118641853240260138812:ℚ)/2^80,(118641853240260138813:ℚ)/2^80⟩,
  ⟨(18732924195830548233:ℚ)/2^80,(18732924195830548234:ℚ)/2^80⟩,
  ⟨(2957830136183770773:ℚ)/2^80,(2957830136183770774:ℚ)/2^80⟩,
  ⟨(467025810976384858:ℚ)/2^80,(467025810976384860:ℚ)/2^80⟩,
  ⟨(73740917522587082:ℚ)/2^80,(73740917522587084:ℚ)/2^80⟩,
  ⟨(11643302766724276:ℚ)/2^80,(11643302766724277:ℚ)/2^80⟩,
  ⟨(1838416226324885:ℚ)/2^80,(1838416226324886:ℚ)/2^80⟩,
  ⟨(290276246261823:ℚ)/2^80,(290276246261825:ℚ)/2^80⟩,
  ⟨(45833091515024:ℚ)/2^80,(45833091515026:ℚ)/2^80⟩,
  ⟨(7236803923424:ℚ)/2^80,(7236803923426:ℚ)/2^80⟩,
  ⟨(1142653251066:ℚ)/2^80,(1142653251068:ℚ)/2^80⟩,
  ⟨(180418934378:ℚ)/2^80,(180418934380:ℚ)/2^80⟩,
  ⟨(28487200164:ℚ)/2^80,(28487200166:ℚ)/2^80⟩,
  ⟨(4497978973:ℚ)/2^80,(4497978974:ℚ)/2^80⟩,
  ⟨(710207206:ℚ)/2^80,(710207207:ℚ)/2^80⟩,
  ⟨(112137979:ℚ)/2^80,(112137981:ℚ)/2^80⟩,
  ⟨(17705996:ℚ)/2^80,(17705998:ℚ)/2^80⟩,
  ⟨(2795683:ℚ)/2^80,(2795684:ℚ)/2^80⟩,
  ⟨(441423:ℚ)/2^80,(441424:ℚ)/2^80⟩,
  ⟨(69698:ℚ)/2^80,(69699:ℚ)/2^80⟩,
  ⟨(11004:ℚ)/2^80,(11006:ℚ)/2^80⟩,
  ⟨(1737:ℚ)/2^80,(1738:ℚ)/2^80⟩,
  ⟨(274:ℚ)/2^80,(275:ℚ)/2^80⟩,
  ⟨(43:ℚ)/2^80,(44:ℚ)/2^80⟩,
  ⟨(6:ℚ)/2^80,(7:ℚ)/2^80⟩,
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
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (11:ℚ)/8,
  ⟨⟨(190883024149678290743080:ℚ)/2^80,(190883024149678290743081:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(367152154828845215:ℚ)/2^60,(367152154828845216:ℚ)/2^60⟩
/-- Every rational identity and every rounded series multiplication is checked by Lean's kernel. -/
theorem trace_checked : trace.check input 40 = true := by decide +kernel
/-- The reported endpoints enclose the entire exact certificate interval. -/
theorem bounds_checked : bounds.encloses (trace.bounds 40) = true := by decide +kernel
/-- The reported interval contains the actual real natural logarithm. -/
theorem log_bounds : bounds.Contains (Real.log (input : ℝ)) :=
  Interval.encloses_sound bounds_checked (ScaledLogTrace.sound trace_checked)
/-- The complete enclosure has width at most one trillionth. -/
theorem tight : bounds.upper-bounds.lower ≤ (1:ℚ)/10^12 := by decide +kernel
end Point096

namespace Point097
/-- Exact original rational input. -/
def input : ℚ := (353:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(192554687196418768385055:ℚ)/2^80,(192554687196418768385056:ℚ)/2^80⟩,
  ⟨(30669629980381971319130:ℚ)/2^80,(30669629980381971319131:ℚ)/2^80⟩,
  ⟨(4884982115101890341470:ℚ)/2^80,(4884982115101890341471:ℚ)/2^80⟩,
  ⟨(778067758891434093797:ℚ)/2^80,(778067758891434093798:ℚ)/2^80⟩,
  ⟨(123928690660868812969:ℚ)/2^80,(123928690660868812970:ℚ)/2^80⟩,
  ⟨(19739052535474999766:ℚ)/2^80,(19739052535474999767:ℚ)/2^80⟩,
  ⟨(3143987021249712606:ℚ)/2^80,(3143987021249712607:ℚ)/2^80⟩,
  ⟨(500766405683451761:ℚ)/2^80,(500766405683451762:ℚ)/2^80⟩,
  ⟨(79760823236937308:ℚ)/2^80,(79760823236937309:ℚ)/2^80⟩,
  ⟨(12704104850546664:ℚ)/2^80,(12704104850546665:ℚ)/2^80⟩,
  ⟨(2023478112484444:ℚ)/2^80,(2023478112484445:ℚ)/2^80⟩,
  ⟨(322294543367801:ℚ)/2^80,(322294543367802:ℚ)/2^80⟩,
  ⟨(51334270454313:ℚ)/2^80,(51334270454314:ℚ)/2^80⟩,
  ⟨(8176394473018:ℚ)/2^80,(8176394473019:ℚ)/2^80⟩,
  ⟨(1302315704240:ℚ)/2^80,(1302315704242:ℚ)/2^80⟩,
  ⟨(207429594928:ℚ)/2^80,(207429594929:ℚ)/2^80⟩,
  ⟨(33038868157:ℚ)/2^80,(33038868158:ℚ)/2^80⟩,
  ⟨(5262348458:ℚ)/2^80,(5262348459:ℚ)/2^80⟩,
  ⟨(838173728:ℚ)/2^80,(838173729:ℚ)/2^80⟩,
  ⟨(133502219:ℚ)/2^80,(133502220:ℚ)/2^80⟩,
  ⟨(21263900:ℚ)/2^80,(21263901:ℚ)/2^80⟩,
  ⟨(3386860:ℚ)/2^80,(3386862:ℚ)/2^80⟩,
  ⟨(539450:ℚ)/2^80,(539451:ℚ)/2^80⟩,
  ⟨(85922:ℚ)/2^80,(85923:ℚ)/2^80⟩,
  ⟨(13685:ℚ)/2^80,(13686:ℚ)/2^80⟩,
  ⟨(2179:ℚ)/2^80,(2180:ℚ)/2^80⟩,
  ⟨(347:ℚ)/2^80,(348:ℚ)/2^80⟩,
  ⟨(55:ℚ)/2^80,(56:ℚ)/2^80⟩,
  ⟨(8:ℚ)/2^80,(9:ℚ)/2^80⟩,
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
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (353:ℚ)/256,
  ⟨⟨(192554687196418768385055:ℚ)/2^80,(192554687196418768385056:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(370422856326214706:ℚ)/2^60,(370422856326214708:ℚ)/2^60⟩
/-- Every rational identity and every rounded series multiplication is checked by Lean's kernel. -/
theorem trace_checked : trace.check input 40 = true := by decide +kernel
/-- The reported endpoints enclose the entire exact certificate interval. -/
theorem bounds_checked : bounds.encloses (trace.bounds 40) = true := by decide +kernel
/-- The reported interval contains the actual real natural logarithm. -/
theorem log_bounds : bounds.Contains (Real.log (input : ℝ)) :=
  Interval.encloses_sound bounds_checked (ScaledLogTrace.sound trace_checked)
/-- The complete enclosure has width at most one trillionth. -/
theorem tight : bounds.upper-bounds.lower ≤ (1:ℚ)/10^12 := by decide +kernel
end Point097

namespace Point098
/-- Exact original rational input. -/
def input : ℚ := (177:ℚ)/128
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(194220869380710916592139:ℚ)/2^80,(194220869380710916592140:ℚ)/2^80⟩,
  ⟨(31202697048048639059064:ℚ)/2^80,(31202697048048639059066:ℚ)/2^80⟩,
  ⟨(5012892312637322340636:ℚ)/2^80,(5012892312637322340637:ℚ)/2^80⟩,
  ⟨(805349912522061621938:ℚ)/2^80,(805349912522061621939:ℚ)/2^80⟩,
  ⟨(129384084306823014672:ℚ)/2^80,(129384084306823014673:ℚ)/2^80⟩,
  ⟨(20786295511587959734:ℚ)/2^80,(20786295511587959735:ℚ)/2^80⟩,
  ⟨(3339437639566590252:ℚ)/2^80,(3339437639566590253:ℚ)/2^80⟩,
  ⟨(536499817504140729:ℚ)/2^80,(536499817504140730:ℚ)/2^80⟩,
  ⟨(86191773959681625:ℚ)/2^80,(86191773959681626:ℚ)/2^80⟩,
  ⟨(13847203029588195:ℚ)/2^80,(13847203029588196:ℚ)/2^80⟩,
  ⟨(2224632617868267:ℚ)/2^80,(2224632617868268:ℚ)/2^80⟩,
  ⟨(357399994346049:ℚ)/2^80,(357399994346050:ℚ)/2^80⟩,
  ⟨(57418359747398:ℚ)/2^80,(57418359747399:ℚ)/2^80⟩,
  ⟨(9224588943024:ℚ)/2^80,(9224588943025:ℚ)/2^80⟩,
  ⟨(1481983141666:ℚ)/2^80,(1481983141667:ℚ)/2^80⟩,
  ⟨(238089094890:ℚ)/2^80,(238089094891:ℚ)/2^80⟩,
  ⟨(38250379179:ℚ)/2^80,(38250379180:ℚ)/2^80⟩,
  ⟨(6145142884:ℚ)/2^80,(6145142885:ℚ)/2^80⟩,
  ⟨(987252463:ℚ)/2^80,(987252464:ℚ)/2^80⟩,
  ⟨(158607772:ℚ)/2^80,(158607773:ℚ)/2^80⟩,
  ⟨(25481248:ℚ)/2^80,(25481249:ℚ)/2^80⟩,
  ⟨(4093708:ℚ)/2^80,(4093709:ℚ)/2^80⟩,
  ⟨(657677:ℚ)/2^80,(657678:ℚ)/2^80⟩,
  ⟨(105659:ℚ)/2^80,(105660:ℚ)/2^80⟩,
  ⟨(16974:ℚ)/2^80,(16975:ℚ)/2^80⟩,
  ⟨(2726:ℚ)/2^80,(2728:ℚ)/2^80⟩,
  ⟨(437:ℚ)/2^80,(439:ℚ)/2^80⟩,
  ⟨(70:ℚ)/2^80,(71:ℚ)/2^80⟩,
  ⟨(11:ℚ)/2^80,(12:ℚ)/2^80⟩,
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
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (177:ℚ)/128,
  ⟨⟨(194220869380710916592139:ℚ)/2^80,(194220869380710916592140:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(373684305473185846:ℚ)/2^60,(373684305473185847:ℚ)/2^60⟩
/-- Every rational identity and every rounded series multiplication is checked by Lean's kernel. -/
theorem trace_checked : trace.check input 40 = true := by decide +kernel
/-- The reported endpoints enclose the entire exact certificate interval. -/
theorem bounds_checked : bounds.encloses (trace.bounds 40) = true := by decide +kernel
/-- The reported interval contains the actual real natural logarithm. -/
theorem log_bounds : bounds.Contains (Real.log (input : ℝ)) :=
  Interval.encloses_sound bounds_checked (ScaledLogTrace.sound trace_checked)
/-- The complete enclosure has width at most one trillionth. -/
theorem tight : bounds.upper-bounds.lower ≤ (1:ℚ)/10^12 := by decide +kernel
end Point098

namespace Point099
/-- Exact original rational input. -/
def input : ℚ := (355:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(195881597613499653512129:ℚ)/2^80,(195881597613499653512130:ℚ)/2^80⟩,
  ⟨(31738589466017128801474:ℚ)/2^80,(31738589466017128801475:ℚ)/2^80⟩,
  ⟨(5142586509223724633954:ℚ)/2^80,(5142586509223724633955:ℚ)/2^80⟩,
  ⟨(833250514587804809756:ℚ)/2^80,(833250514587804809758:ℚ)/2^80⟩,
  ⟨(135011130841559208127:ℚ)/2^80,(135011130841559208128:ℚ)/2^80⟩,
  ⟨(21875780610989135195:ℚ)/2^80,(21875780610989135196:ℚ)/2^80⟩,
  ⟨(3544520917328845146:ℚ)/2^80,(3544520917328845147:ℚ)/2^80⟩,
  ⟨(574316809845426627:ℚ)/2^80,(574316809845426628:ℚ)/2^80⟩,
  ⟨(93056242511779437:ℚ)/2^80,(93056242511779438:ℚ)/2^80⟩,
  ⟨(15077852714674573:ℚ)/2^80,(15077852714674574:ℚ)/2^80⟩,
  ⟨(2443056331837614:ℚ)/2^80,(2443056331837616:ℚ)/2^80⟩,
  ⟨(395847097957322:ℚ)/2^80,(395847097957323:ℚ)/2^80⟩,
  ⟨(64138891485719:ℚ)/2^80,(64138891485721:ℚ)/2^80⟩,
  ⟨(10392389946131:ℚ)/2^80,(10392389946132:ℚ)/2^80⟩,
  ⟨(1683873330060:ℚ)/2^80,(1683873330061:ℚ)/2^80⟩,
  ⟨(272837086212:ℚ)/2^80,(272837086213:ℚ)/2^80⟩,
  ⟨(44207645720:ℚ)/2^80,(44207645721:ℚ)/2^80⟩,
  ⟨(7162940959:ℚ)/2^80,(7162940960:ℚ)/2^80⟩,
  ⟨(1160607454:ℚ)/2^80,(1160607456:ℚ)/2^80⟩,
  ⟨(188052598:ℚ)/2^80,(188052600:ℚ)/2^80⟩,
  ⟨(30470060:ℚ)/2^80,(30470062:ℚ)/2^80⟩,
  ⟨(4937047:ℚ)/2^80,(4937048:ℚ)/2^80⟩,
  ⟨(799947:ℚ)/2^80,(799948:ℚ)/2^80⟩,
  ⟨(129614:ℚ)/2^80,(129616:ℚ)/2^80⟩,
  ⟨(21001:ℚ)/2^80,(21002:ℚ)/2^80⟩,
  ⟨(3402:ℚ)/2^80,(3403:ℚ)/2^80⟩,
  ⟨(551:ℚ)/2^80,(552:ℚ)/2^80⟩,
  ⟨(89:ℚ)/2^80,(90:ℚ)/2^80⟩,
  ⟨(14:ℚ)/2^80,(15:ℚ)/2^80⟩,
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
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (355:ℚ)/256,
  ⟨⟨(195881597613499653512129:ℚ)/2^80,(195881597613499653512130:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(376936554469300843:ℚ)/2^60,(376936554469300844:ℚ)/2^60⟩
/-- Every rational identity and every rounded series multiplication is checked by Lean's kernel. -/
theorem trace_checked : trace.check input 40 = true := by decide +kernel
/-- The reported endpoints enclose the entire exact certificate interval. -/
theorem bounds_checked : bounds.encloses (trace.bounds 40) = true := by decide +kernel
/-- The reported interval contains the actual real natural logarithm. -/
theorem log_bounds : bounds.Contains (Real.log (input : ℝ)) :=
  Interval.encloses_sound bounds_checked (ScaledLogTrace.sound trace_checked)
/-- The complete enclosure has width at most one trillionth. -/
theorem tight : bounds.upper-bounds.lower ≤ (1:ℚ)/10^12 := by decide +kernel
end Point099

namespace Point100
/-- Exact original rational input. -/
def input : ℚ := (89:ℚ)/64
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(197536898629841368416041:ℚ)/2^80,(197536898629841368416042:ℚ)/2^80⟩,
  ⟨(32277271017947936015692:ℚ)/2^80,(32277271017947936015694:ℚ)/2^80⟩,
  ⟨(5274063891821558172498:ℚ)/2^80,(5274063891821558172500:ℚ)/2^80⟩,
  ⟨(861775145722476825571:ℚ)/2^80,(861775145722476825572:ℚ)/2^80⟩,
  ⟨(140812932307594252544:ℚ)/2^80,(140812932307594252545:ℚ)/2^80⟩,
  ⟨(23008649069868341918:ℚ)/2^80,(23008649069868341920:ℚ)/2^80⟩,
  ⟨(3759583181351036261:ℚ)/2^80,(3759583181351036262:ℚ)/2^80⟩,
  ⟨(614310977344940565:ℚ)/2^80,(614310977344940566:ℚ)/2^80⟩,
  ⟨(100377610677277870:ℚ)/2^80,(100377610677277871:ℚ)/2^80⟩,
  ⟨(16401570372104227:ℚ)/2^80,(16401570372104228:ℚ)/2^80⟩,
  ⟨(2679995158840559:ℚ)/2^80,(2679995158840561:ℚ)/2^80⟩,
  ⟨(437907705692901:ℚ)/2^80,(437907705692903:ℚ)/2^80⟩,
  ⟨(71553546681846:ℚ)/2^80,(71553546681847:ℚ)/2^80⟩,
  ⟨(11691755993765:ℚ)/2^80,(11691755993766:ℚ)/2^80⟩,
  ⟨(1910417646040:ℚ)/2^80,(1910417646041:ℚ)/2^80⟩,
  ⟨(312159746084:ℚ)/2^80,(312159746086:ℚ)/2^80⟩,
  ⟨(51006494458:ℚ)/2^80,(51006494459:ℚ)/2^80⟩,
  ⟨(8334394519:ℚ)/2^80,(8334394520:ℚ)/2^80⟩,
  ⟨(1361829169:ℚ)/2^80,(1361829170:ℚ)/2^80⟩,
  ⟨(222521106:ℚ)/2^80,(222521107:ℚ)/2^80⟩,
  ⟨(36359657:ℚ)/2^80,(36359659:ℚ)/2^80⟩,
  ⟨(5941120:ℚ)/2^80,(5941121:ℚ)/2^80⟩,
  ⟨(970771:ℚ)/2^80,(970772:ℚ)/2^80⟩,
  ⟨(158622:ℚ)/2^80,(158623:ℚ)/2^80⟩,
  ⟨(25918:ℚ)/2^80,(25919:ℚ)/2^80⟩,
  ⟨(4234:ℚ)/2^80,(4236:ℚ)/2^80⟩,
  ⟨(691:ℚ)/2^80,(693:ℚ)/2^80⟩,
  ⟨(112:ℚ)/2^80,(114:ℚ)/2^80⟩,
  ⟨(18:ℚ)/2^80,(19:ℚ)/2^80⟩,
  ⟨(2:ℚ)/2^80,(4:ℚ)/2^80⟩,
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
def trace : ScaledLogTrace := ⟨0, (89:ℚ)/64,
  ⟨⟨(197536898629841368416041:ℚ)/2^80,(197536898629841368416042:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(380179655073598274:ℚ)/2^60,(380179655073598275:ℚ)/2^60⟩
/-- Every rational identity and every rounded series multiplication is checked by Lean's kernel. -/
theorem trace_checked : trace.check input 40 = true := by decide +kernel
/-- The reported endpoints enclose the entire exact certificate interval. -/
theorem bounds_checked : bounds.encloses (trace.bounds 40) = true := by decide +kernel
/-- The reported interval contains the actual real natural logarithm. -/
theorem log_bounds : bounds.Contains (Real.log (input : ℝ)) :=
  Interval.encloses_sound bounds_checked (ScaledLogTrace.sound trace_checked)
/-- The complete enclosure has width at most one trillionth. -/
theorem tight : bounds.upper-bounds.lower ≤ (1:ℚ)/10^12 := by decide +kernel
end Point100

namespace Point101
/-- Exact original rational input. -/
def input : ℚ := (357:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(199186798990338575277852:ℚ)/2^80,(199186798990338575277853:ℚ)/2^80⟩,
  ⟨(32818705869533761995208:ℚ)/2^80,(32818705869533761995210:ℚ)/2^80⟩,
  ⟨(5407323479319592106877:ℚ)/2^80,(5407323479319592106878:ℚ)/2^80⟩,
  ⟨(890929317147273740284:ℚ)/2^80,(890929317147273740285:ℚ)/2^80⟩,
  ⟨(146792595484297957208:ℚ)/2^80,(146792595484297957209:ℚ)/2^80⟩,
  ⟨(24186055699696727044:ℚ)/2^80,(24186055699696727045:ℚ)/2^80⟩,
  ⟨(3984978182168628762:ℚ)/2^80,(3984978182168628763:ℚ)/2^80⟩,
  ⟨(656578786947849110:ℚ)/2^80,(656578786947849112:ℚ)/2^80⟩,
  ⟨(108180191650461272:ℚ)/2^80,(108180191650461273:ℚ)/2^80⟩,
  ⟨(17824142506845984:ℚ)/2^80,(17824142506845985:ℚ)/2^80⟩,
  ⟨(2936767362465651:ℚ)/2^80,(2936767362465652:ℚ)/2^80⟩,
  ⟨(483871947159919:ℚ)/2^80,(483871947159920:ℚ)/2^80⟩,
  ⟨(79724415437441:ℚ)/2^80,(79724415437442:ℚ)/2^80⟩,
  ⟨(13135670406495:ℚ)/2^80,(13135670406496:ℚ)/2^80⟩,
  ⟨(2164278484593:ℚ)/2^80,(2164278484594:ℚ)/2^80⟩,
  ⟨(356594008065:ℚ)/2^80,(356594008066:ℚ)/2^80⟩,
  ⟨(58753662013:ℚ)/2^80,(58753662015:ℚ)/2^80⟩,
  ⟨(9680456547:ℚ)/2^80,(9680456548:ℚ)/2^80⟩,
  ⟨(1594985499:ℚ)/2^80,(1594985500:ℚ)/2^80⟩,
  ⟨(262795326:ℚ)/2^80,(262795328:ℚ)/2^80⟩,
  ⟨(43299066:ℚ)/2^80,(43299068:ℚ)/2^80⟩,
  ⟨(7134103:ℚ)/2^80,(7134105:ℚ)/2^80⟩,
  ⟨(1175439:ℚ)/2^80,(1175440:ℚ)/2^80⟩,
  ⟨(193669:ℚ)/2^80,(193670:ℚ)/2^80⟩,
  ⟨(31909:ℚ)/2^80,(31910:ℚ)/2^80⟩,
  ⟨(5257:ℚ)/2^80,(5258:ℚ)/2^80⟩,
  ⟨(866:ℚ)/2^80,(867:ℚ)/2^80⟩,
  ⟨(142:ℚ)/2^80,(143:ℚ)/2^80⟩,
  ⟨(23:ℚ)/2^80,(24:ℚ)/2^80⟩,
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
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (357:ℚ)/256,
  ⟨⟨(199186798990338575277852:ℚ)/2^80,(199186798990338575277853:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(383413658609555635:ℚ)/2^60,(383413658609555637:ℚ)/2^60⟩
/-- Every rational identity and every rounded series multiplication is checked by Lean's kernel. -/
theorem trace_checked : trace.check input 40 = true := by decide +kernel
/-- The reported endpoints enclose the entire exact certificate interval. -/
theorem bounds_checked : bounds.encloses (trace.bounds 40) = true := by decide +kernel
/-- The reported interval contains the actual real natural logarithm. -/
theorem log_bounds : bounds.Contains (Real.log (input : ℝ)) :=
  Interval.encloses_sound bounds_checked (ScaledLogTrace.sound trace_checked)
/-- The complete enclosure has width at most one trillionth. -/
theorem tight : bounds.upper-bounds.lower ≤ (1:ℚ)/10^12 := by decide +kernel
end Point101

namespace Point102
/-- Exact original rational input. -/
def input : ℚ := (179:ℚ)/128
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(200831325082560546938159:ℚ)/2^80,(200831325082560546938160:ℚ)/2^80⟩,
  ⟨(33362858564203869361062:ℚ)/2^80,(33362858564203869361063:ℚ)/2^80⟩,
  ⟨(5542364126300968525779:ℚ)/2^80,(5542364126300968525780:ℚ)/2^80⟩,
  ⟨(920718470492994771383:ℚ)/2^80,(920718470492994771384:ℚ)/2^80⟩,
  ⟨(152953231254536590685:ℚ)/2^80,(152953231254536590686:ℚ)/2^80⟩,
  ⟨(25409168710037023208:ℚ)/2^80,(25409168710037023209:ℚ)/2^80⟩,
  ⟨(4221067114696704181:ℚ)/2^80,(4221067114696704182:ℚ)/2^80⟩,
  ⟨(701219618402384082:ℚ)/2^80,(701219618402384083:ℚ)/2^80⟩,
  ⟨(116489252568474228:ℚ)/2^80,(116489252568474229:ℚ)/2^80⟩,
  ⟨(19351634791505490:ℚ)/2^80,(19351634791505491:ℚ)/2^80⟩,
  ⟨(3214766691748469:ℚ)/2^80,(3214766691748470:ℚ)/2^80⟩,
  ⟨(534049189834436:ℚ)/2^80,(534049189834437:ℚ)/2^80⟩,
  ⟨(88718269321030:ℚ)/2^80,(88718269321031:ℚ)/2^80⟩,
  ⟨(14738214121734:ℚ)/2^80,(14738214121735:ℚ)/2^80⟩,
  ⟨(2448367818268:ℚ)/2^80,(2448367818269:ℚ)/2^80⟩,
  ⟨(406732113132:ℚ)/2^80,(406732113133:ℚ)/2^80⟩,
  ⟨(67567875471:ℚ)/2^80,(67567875472:ℚ)/2^80⟩,
  ⟨(11224630778:ℚ)/2^80,(11224630779:ℚ)/2^80⟩,
  ⟨(1864678077:ℚ)/2^80,(1864678078:ℚ)/2^80⟩,
  ⟨(309767367:ℚ)/2^80,(309767369:ℚ)/2^80⟩,
  ⟨(51459725:ℚ)/2^80,(51459726:ℚ)/2^80⟩,
  ⟨(8548683:ℚ)/2^80,(8548685:ℚ)/2^80⟩,
  ⟨(1420139:ℚ)/2^80,(1420140:ℚ)/2^80⟩,
  ⟨(235918:ℚ)/2^80,(235920:ℚ)/2^80⟩,
  ⟨(39191:ℚ)/2^80,(39192:ℚ)/2^80⟩,
  ⟨(6510:ℚ)/2^80,(6511:ℚ)/2^80⟩,
  ⟨(1081:ℚ)/2^80,(1082:ℚ)/2^80⟩,
  ⟨(179:ℚ)/2^80,(180:ℚ)/2^80⟩,
  ⟨(29:ℚ)/2^80,(30:ℚ)/2^80⟩,
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
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (179:ℚ)/128,
  ⟨⟨(200831325082560546938159:ℚ)/2^80,(200831325082560546938160:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(386638615969962773:ℚ)/2^60,(386638615969962774:ℚ)/2^60⟩
/-- Every rational identity and every rounded series multiplication is checked by Lean's kernel. -/
theorem trace_checked : trace.check input 40 = true := by decide +kernel
/-- The reported endpoints enclose the entire exact certificate interval. -/
theorem bounds_checked : bounds.encloses (trace.bounds 40) = true := by decide +kernel
/-- The reported interval contains the actual real natural logarithm. -/
theorem log_bounds : bounds.Contains (Real.log (input : ℝ)) :=
  Interval.encloses_sound bounds_checked (ScaledLogTrace.sound trace_checked)
/-- The complete enclosure has width at most one trillionth. -/
theorem tight : bounds.upper-bounds.lower ≤ (1:ℚ)/10^12 := by decide +kernel
end Point102

namespace Point103
/-- Exact original rational input. -/
def input : ℚ := (359:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(202470503122450089422335:ℚ)/2^80,(202470503122450089422336:ℚ)/2^80⟩,
  ⟨(33909694018881884895122:ℚ)/2^80,(33909694018881884895124:ℚ)/2^80⟩,
  ⟨(5679184526739567714142:ℚ)/2^80,(5679184526739567714143:ℚ)/2^80⟩,
  ⟨(951147977649065812287:ℚ)/2^80,(951147977649065812288:ℚ)/2^80⟩,
  ⟨(159297953980250046610:ℚ)/2^80,(159297953980250046611:ℚ)/2^80⟩,
  ⟨(26679169528399601302:ℚ)/2^80,(26679169528399601303:ℚ)/2^80⟩,
  ⟨(4468218636463673063:ℚ)/2^80,(4468218636463673064:ℚ)/2^80⟩,
  ⟨(748335804155704594:ℚ)/2^80,(748335804155704595:ℚ)/2^80⟩,
  ⟨(125331037118760281:ℚ)/2^80,(125331037118760282:ℚ)/2^80⟩,
  ⟨(20990401338589120:ℚ)/2^80,(20990401338589121:ℚ)/2^80⟩,
  ⟨(3515465590040129:ℚ)/2^80,(3515465590040130:ℚ)/2^80⟩,
  ⟨(588769033779078:ℚ)/2^80,(588769033779079:ℚ)/2^80⟩,
  ⟨(98606846307715:ℚ)/2^80,(98606846307716:ℚ)/2^80⟩,
  ⟨(16514642552349:ℚ)/2^80,(16514642552350:ℚ)/2^80⟩,
  ⟨(2765866964051:ℚ)/2^80,(2765866964053:ℚ)/2^80⟩,
  ⟨(463226499670:ℚ)/2^80,(463226499671:ℚ)/2^80⟩,
  ⟨(77581023521:ℚ)/2^80,(77581023523:ℚ)/2^80⟩,
  ⟨(12993244589:ℚ)/2^80,(12993244591:ℚ)/2^80⟩,
  ⟨(2176104378:ℚ)/2^80,(2176104379:ℚ)/2^80⟩,
  ⟨(364453253:ℚ)/2^80,(364453254:ℚ)/2^80⟩,
  ⟨(61038512:ℚ)/2^80,(61038513:ℚ)/2^80⟩,
  ⟨(10222710:ℚ)/2^80,(10222711:ℚ)/2^80⟩,
  ⟨(1712096:ℚ)/2^80,(1712097:ℚ)/2^80⟩,
  ⟨(286741:ℚ)/2^80,(286742:ℚ)/2^80⟩,
  ⟨(48023:ℚ)/2^80,(48024:ℚ)/2^80⟩,
  ⟨(8042:ℚ)/2^80,(8044:ℚ)/2^80⟩,
  ⟨(1346:ℚ)/2^80,(1348:ℚ)/2^80⟩,
  ⟨(225:ℚ)/2^80,(226:ℚ)/2^80⟩,
  ⟨(37:ℚ)/2^80,(38:ℚ)/2^80⟩,
  ⟨(6:ℚ)/2^80,(7:ℚ)/2^80⟩,
  ⟨(1:ℚ)/2^80,(2:ℚ)/2^80⟩,
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
def trace : ScaledLogTrace := ⟨0, (359:ℚ)/256,
  ⟨⟨(202470503122450089422335:ℚ)/2^80,(202470503122450089422336:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(389854577621727334:ℚ)/2^60,(389854577621727336:ℚ)/2^60⟩
/-- Every rational identity and every rounded series multiplication is checked by Lean's kernel. -/
theorem trace_checked : trace.check input 40 = true := by decide +kernel
/-- The reported endpoints enclose the entire exact certificate interval. -/
theorem bounds_checked : bounds.encloses (trace.bounds 40) = true := by decide +kernel
/-- The reported interval contains the actual real natural logarithm. -/
theorem log_bounds : bounds.Contains (Real.log (input : ℝ)) :=
  Interval.encloses_sound bounds_checked (ScaledLogTrace.sound trace_checked)
/-- The complete enclosure has width at most one trillionth. -/
theorem tight : bounds.upper-bounds.lower ≤ (1:ℚ)/10^12 := by decide +kernel
end Point103

/-- Reusable proved logarithm bounds for these consecutive exact grid inputs. -/
def entries : Array CertifiedLogBound := #[⟨Point096.input, Point096.bounds, Point096.log_bounds⟩,
  ⟨Point097.input, Point097.bounds, Point097.log_bounds⟩,
  ⟨Point098.input, Point098.bounds, Point098.log_bounds⟩,
  ⟨Point099.input, Point099.bounds, Point099.log_bounds⟩,
  ⟨Point100.input, Point100.bounds, Point100.log_bounds⟩,
  ⟨Point101.input, Point101.bounds, Point101.log_bounds⟩,
  ⟨Point102.input, Point102.bounds, Point102.log_bounds⟩,
  ⟨Point103.input, Point103.bounds, Point103.log_bounds⟩]
end MatrixBounds.Numeric.LogGridData.Part012
