import TabulatedLogBounds

namespace MatrixBounds.Numeric.LogGridData.Part007
set_option maxRecDepth 100000
set_option maxHeartbeats 16000000

namespace Point056
/-- Exact original rational input. -/
def input : ℚ := (39:ℚ)/32
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(119189869539470482013284:ℚ)/2^80,(119189869539470482013285:ℚ)/2^80⟩,
  ⟨(11751113898257653156239:ℚ)/2^80,(11751113898257653156240:ℚ)/2^80⟩,
  ⟨(1158560525180332001319:ℚ)/2^80,(1158560525180332001320:ℚ)/2^80⟩,
  ⟨(114224277130455267735:ℚ)/2^80,(114224277130455267736:ℚ)/2^80⟩,
  ⟨(11261548449481505269:ℚ)/2^80,(11261548449481505270:ℚ)/2^80⟩,
  ⟨(1110293509103810378:ℚ)/2^80,(1110293509103810379:ℚ)/2^80⟩,
  ⟨(109465557235586938:ℚ)/2^80,(109465557235586939:ℚ)/2^80⟩,
  ⟨(10792378882381810:ℚ)/2^80,(10792378882381811:ℚ)/2^80⟩,
  ⟨(1064037354601023:ℚ)/2^80,(1064037354601024:ℚ)/2^80⟩,
  ⟨(104905091298692:ℚ)/2^80,(104905091298693:ℚ)/2^80⟩,
  ⟨(10342755480152:ℚ)/2^80,(10342755480153:ℚ)/2^80⟩,
  ⟨(1019708286775:ℚ)/2^80,(1019708286776:ℚ)/2^80⟩,
  ⟨(100534619822:ℚ)/2^80,(100534619823:ℚ)/2^80⟩,
  ⟨(9911863926:ℚ)/2^80,(9911863927:ℚ)/2^80⟩,
  ⟨(977226020:ℚ)/2^80,(977226021:ℚ)/2^80⟩,
  ⟨(96346227:ℚ)/2^80,(96346228:ℚ)/2^80⟩,
  ⟨(9498923:ℚ)/2^80,(9498924:ℚ)/2^80⟩,
  ⟨(936513:ℚ)/2^80,(936514:ℚ)/2^80⟩,
  ⟨(92332:ℚ)/2^80,(92333:ℚ)/2^80⟩,
  ⟨(9103:ℚ)/2^80,(9104:ℚ)/2^80⟩,
  ⟨(897:ℚ)/2^80,(898:ℚ)/2^80⟩,
  ⟨(88:ℚ)/2^80,(89:ℚ)/2^80⟩,
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
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (39:ℚ)/32,
  ⟨⟨(119189869539470482013284:ℚ)/2^80,(119189869539470482013285:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(228077553649899150:ℚ)/2^60,(228077553649899151:ℚ)/2^60⟩
/-- Every rational identity and every rounded series multiplication is checked by Lean's kernel. -/
theorem trace_checked : trace.check input 40 = true := by decide +kernel
/-- The reported endpoints enclose the entire exact certificate interval. -/
theorem bounds_checked : bounds.encloses (trace.bounds 40) = true := by decide +kernel
/-- The reported interval contains the actual real natural logarithm. -/
theorem log_bounds : bounds.Contains (Real.log (input : ℝ)) :=
  Interval.encloses_sound bounds_checked (ScaledLogTrace.sound trace_checked)
/-- The complete enclosure has width at most one trillionth. -/
theorem tight : bounds.upper-bounds.lower ≤ (1:ℚ)/10^12 := by decide +kernel
end Point056

namespace Point057
/-- Exact original rational input. -/
def input : ℚ := (313:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(121105046956122782000442:ℚ)/2^80,(121105046956122782000443:ℚ)/2^80⟩,
  ⟨(12131788535147624910413:ℚ)/2^80,(12131788535147624910414:ℚ)/2^80⟩,
  ⟨(1215310978037635535841:ℚ)/2^80,(1215310978037635535842:ℚ)/2^80⟩,
  ⟨(121744684970378252272:ℚ)/2^80,(121744684970378252273:ℚ)/2^80⟩,
  ⟨(12195864750986925095:ℚ)/2^80,(12195864750986925096:ℚ)/2^80⟩,
  ⟨(1221729860819428348:ℚ)/2^80,(1221729860819428349:ℚ)/2^80⟩,
  ⟨(122387701347464702:ℚ)/2^80,(122387701347464703:ℚ)/2^80⟩,
  ⟨(12260279396846200:ℚ)/2^80,(12260279396846201:ℚ)/2^80⟩,
  ⟨(1228182646081253:ℚ)/2^80,(1228182646081254:ℚ)/2^80⟩,
  ⟨(123034113930810:ℚ)/2^80,(123034113930812:ℚ)/2^80⟩,
  ⟨(12325034260204:ℚ)/2^80,(12325034260205:ℚ)/2^80⟩,
  ⟨(1234669512885:ℚ)/2^80,(1234669512886:ℚ)/2^80⟩,
  ⟨(123683940658:ℚ)/2^80,(123683940659:ℚ)/2^80⟩,
  ⟨(12390131137:ℚ)/2^80,(12390131139:ℚ)/2^80⟩,
  ⟨(1241190641:ℚ)/2^80,(1241190642:ℚ)/2^80⟩,
  ⟨(124337199:ℚ)/2^80,(124337200:ℚ)/2^80⟩,
  ⟨(12455571:ℚ)/2^80,(12455572:ℚ)/2^80⟩,
  ⟨(1247746:ℚ)/2^80,(1247747:ℚ)/2^80⟩,
  ⟨(124993:ℚ)/2^80,(124994:ℚ)/2^80⟩,
  ⟨(12521:ℚ)/2^80,(12522:ℚ)/2^80⟩,
  ⟨(1254:ℚ)/2^80,(1255:ℚ)/2^80⟩,
  ⟨(125:ℚ)/2^80,(126:ℚ)/2^80⟩,
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
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (313:ℚ)/256,
  ⟨⟨(121105046956122782000442:ℚ)/2^80,(121105046956122782000443:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(231766905612890218:ℚ)/2^60,(231766905612890219:ℚ)/2^60⟩
/-- Every rational identity and every rounded series multiplication is checked by Lean's kernel. -/
theorem trace_checked : trace.check input 40 = true := by decide +kernel
/-- The reported endpoints enclose the entire exact certificate interval. -/
theorem bounds_checked : bounds.encloses (trace.bounds 40) = true := by decide +kernel
/-- The reported interval contains the actual real natural logarithm. -/
theorem log_bounds : bounds.Contains (Real.log (input : ℝ)) :=
  Interval.encloses_sound bounds_checked (ScaledLogTrace.sound trace_checked)
/-- The complete enclosure has width at most one trillionth. -/
theorem tight : bounds.upper-bounds.lower ≤ (1:ℚ)/10^12 := by decide +kernel
end Point057

namespace Point058
/-- Exact original rational input. -/
def input : ℚ := (157:ℚ)/128
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(123013504452014898478874:ℚ)/2^80,(123013504452014898478875:ℚ)/2^80⟩,
  ⟨(12517163610906779143464:ℚ)/2^80,(12517163610906779143465:ℚ)/2^80⟩,
  ⟨(1273676297250163491791:ℚ)/2^80,(1273676297250163491792:ℚ)/2^80⟩,
  ⟨(129602149544753478112:ℚ)/2^80,(129602149544753478113:ℚ)/2^80⟩,
  ⟨(13187587146659125842:ℚ)/2^80,(13187587146659125844:ℚ)/2^80⟩,
  ⟨(1341894832467068945:ℚ)/2^80,(1341894832467068946:ℚ)/2^80⟩,
  ⟨(136543684707175436:ℚ)/2^80,(136543684707175437:ℚ)/2^80⟩,
  ⟨(13893918794765219:ℚ)/2^80,(13893918794765220:ℚ)/2^80⟩,
  ⟨(1413767175607688:ℚ)/2^80,(1413767175607690:ℚ)/2^80⟩,
  ⟨(143857010851308:ℚ)/2^80,(143857010851309:ℚ)/2^80⟩,
  ⟨(14638081805922:ℚ)/2^80,(14638081805923:ℚ)/2^80⟩,
  ⟨(1489489025865:ℚ)/2^80,(1489489025866:ℚ)/2^80⟩,
  ⟨(151562041228:ℚ)/2^80,(151562041229:ℚ)/2^80⟩,
  ⟨(15422102440:ℚ)/2^80,(15422102441:ℚ)/2^80⟩,
  ⟨(1569266564:ℚ)/2^80,(1569266565:ℚ)/2^80⟩,
  ⟨(159679755:ℚ)/2^80,(159679756:ℚ)/2^80⟩,
  ⟨(16248115:ℚ)/2^80,(16248116:ℚ)/2^80⟩,
  ⟨(1653316:ℚ)/2^80,(1653318:ℚ)/2^80⟩,
  ⟨(168232:ℚ)/2^80,(168233:ℚ)/2^80⟩,
  ⟨(17118:ℚ)/2^80,(17119:ℚ)/2^80⟩,
  ⟨(1741:ℚ)/2^80,(1742:ℚ)/2^80⟩,
  ⟨(177:ℚ)/2^80,(178:ℚ)/2^80⟩,
  ⟨(18:ℚ)/2^80,(19:ℚ)/2^80⟩,
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
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (157:ℚ)/128,
  ⟨⟨(123013504452014898478874:ℚ)/2^80,(123013504452014898478875:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(235444489288068195:ℚ)/2^60,(235444489288068196:ℚ)/2^60⟩
/-- Every rational identity and every rounded series multiplication is checked by Lean's kernel. -/
theorem trace_checked : trace.check input 40 = true := by decide +kernel
/-- The reported endpoints enclose the entire exact certificate interval. -/
theorem bounds_checked : bounds.encloses (trace.bounds 40) = true := by decide +kernel
/-- The reported interval contains the actual real natural logarithm. -/
theorem log_bounds : bounds.Contains (Real.log (input : ℝ)) :=
  Interval.encloses_sound bounds_checked (ScaledLogTrace.sound trace_checked)
/-- The complete enclosure has width at most one trillionth. -/
theorem tight : bounds.upper-bounds.lower ≤ (1:ℚ)/10^12 := by decide +kernel
end Point058

namespace Point059
/-- Exact original rational input. -/
def input : ℚ := (315:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(124915277333210370065962:ℚ)/2^80,(124915277333210370065963:ℚ)/2^80⟩,
  ⟨(12907182771732770287025:ℚ)/2^80,(12907182771732770287027:ℚ)/2^80⟩,
  ⟨(1333666871334909714421:ℚ)/2^80,(1333666871334909714422:ℚ)/2^80⟩,
  ⟨(137804457808685942470:ℚ)/2^80,(137804457808685942471:ℚ)/2^80⟩,
  ⟨(14238989510879983547:ℚ)/2^80,(14238989510879983548:ℚ)/2^80⟩,
  ⟨(1471279126343115637:ℚ)/2^80,(1471279126343115639:ℚ)/2^80⟩,
  ⟨(152023587485540845:ℚ)/2^80,(152023587485540846:ℚ)/2^80⟩,
  ⟨(15708216570309824:ℚ)/2^80,(15708216570309825:ℚ)/2^80⟩,
  ⟨(1623090678893659:ℚ)/2^80,(1623090678893660:ℚ)/2^80⟩,
  ⟨(167709895017033:ℚ)/2^80,(167709895017034:ℚ)/2^80⟩,
  ⟨(17329043443090:ℚ)/2^80,(17329043443092:ℚ)/2^80⟩,
  ⟨(1790566660494:ℚ)/2^80,(1790566660495:ℚ)/2^80⟩,
  ⟨(185014768772:ℚ)/2^80,(185014768773:ℚ)/2^80⟩,
  ⟨(19117112710:ℚ)/2^80,(19117112711:ℚ)/2^80⟩,
  ⟨(1975323379:ℚ)/2^80,(1975323380:ℚ)/2^80⟩,
  ⟨(204105217:ℚ)/2^80,(204105218:ℚ)/2^80⟩,
  ⟨(21089680:ℚ)/2^80,(21089682:ℚ)/2^80⟩,
  ⟨(2179143:ℚ)/2^80,(2179145:ℚ)/2^80⟩,
  ⟨(225165:ℚ)/2^80,(225166:ℚ)/2^80⟩,
  ⟨(23265:ℚ)/2^80,(23266:ℚ)/2^80⟩,
  ⟨(2403:ℚ)/2^80,(2405:ℚ)/2^80⟩,
  ⟨(248:ℚ)/2^80,(249:ℚ)/2^80⟩,
  ⟨(25:ℚ)/2^80,(26:ℚ)/2^80⟩,
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
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (315:ℚ)/256,
  ⟨⟨(124915277333210370065962:ℚ)/2^80,(124915277333210370065963:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(239110379513701144:ℚ)/2^60,(239110379513701145:ℚ)/2^60⟩
/-- Every rational identity and every rounded series multiplication is checked by Lean's kernel. -/
theorem trace_checked : trace.check input 40 = true := by decide +kernel
/-- The reported endpoints enclose the entire exact certificate interval. -/
theorem bounds_checked : bounds.encloses (trace.bounds 40) = true := by decide +kernel
/-- The reported interval contains the actual real natural logarithm. -/
theorem log_bounds : bounds.Contains (Real.log (input : ℝ)) :=
  Interval.encloses_sound bounds_checked (ScaledLogTrace.sound trace_checked)
/-- The complete enclosure has width at most one trillionth. -/
theorem tight : bounds.upper-bounds.lower ≤ (1:ℚ)/10^12 := by decide +kernel
end Point059

namespace Point060
/-- Exact original rational input. -/
def input : ℚ := (79:ℚ)/64
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(126810400658877186157990:ℚ)/2^80,(126810400658877186157991:ℚ)/2^80⟩,
  ⟨(13301790278903201345243:ℚ)/2^80,(13301790278903201345244:ℚ)/2^80⟩,
  ⟨(1395292686598237903347:ℚ)/2^80,(1395292686598237903348:ℚ)/2^80⟩,
  ⟨(146359372720094884966:ℚ)/2^80,(146359372720094884967:ℚ)/2^80⟩,
  ⟨(15352381753856106814:ℚ)/2^80,(15352381753856106815:ℚ)/2^80⟩,
  ⟨(1610389694460430784:ℚ)/2^80,(1610389694460430785:ℚ)/2^80⟩,
  ⟨(168921995922422809:ℚ)/2^80,(168921995922422810:ℚ)/2^80⟩,
  ⟨(17719090481373021:ℚ)/2^80,(17719090481373023:ℚ)/2^80⟩,
  ⟨(1858645854689477:ℚ)/2^80,(1858645854689478:ℚ)/2^80⟩,
  ⟨(194962851890504:ℚ)/2^80,(194962851890505:ℚ)/2^80⟩,
  ⟨(20450648799703:ℚ)/2^80,(20450648799704:ℚ)/2^80⟩,
  ⟨(2145172951017:ℚ)/2^80,(2145172951018:ℚ)/2^80⟩,
  ⟨(225018141715:ℚ)/2^80,(225018141716:ℚ)/2^80⟩,
  ⟨(23603301578:ℚ)/2^80,(23603301579:ℚ)/2^80⟩,
  ⟨(2475870794:ℚ)/2^80,(2475870796:ℚ)/2^80⟩,
  ⟨(259706726:ℚ)/2^80,(259706727:ℚ)/2^80⟩,
  ⟨(27241964:ℚ)/2^80,(27241965:ℚ)/2^80⟩,
  ⟨(2857548:ℚ)/2^80,(2857549:ℚ)/2^80⟩,
  ⟨(299742:ℚ)/2^80,(299743:ℚ)/2^80⟩,
  ⟨(31441:ℚ)/2^80,(31442:ℚ)/2^80⟩,
  ⟨(3298:ℚ)/2^80,(3299:ℚ)/2^80⟩,
  ⟨(345:ℚ)/2^80,(347:ℚ)/2^80⟩,
  ⟨(36:ℚ)/2^80,(37:ℚ)/2^80⟩,
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
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (79:ℚ)/64,
  ⟨⟨(126810400658877186157990:ℚ)/2^80,(126810400658877186157991:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(242764650416438875:ℚ)/2^60,(242764650416438876:ℚ)/2^60⟩
/-- Every rational identity and every rounded series multiplication is checked by Lean's kernel. -/
theorem trace_checked : trace.check input 40 = true := by decide +kernel
/-- The reported endpoints enclose the entire exact certificate interval. -/
theorem bounds_checked : bounds.encloses (trace.bounds 40) = true := by decide +kernel
/-- The reported interval contains the actual real natural logarithm. -/
theorem log_bounds : bounds.Contains (Real.log (input : ℝ)) :=
  Interval.encloses_sound bounds_checked (ScaledLogTrace.sound trace_checked)
/-- The complete enclosure has width at most one trillionth. -/
theorem tight : bounds.upper-bounds.lower ≤ (1:ℚ)/10^12 := by decide +kernel
end Point060

namespace Point061
/-- Exact original rational input. -/
def input : ℚ := (317:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(128698909243442198354409:ℚ)/2^80,(128698909243442198354410:ℚ)/2^80⟩,
  ⟨(13700931001483375392005:ℚ)/2^80,(13700931001483375392006:ℚ)/2^80⟩,
  ⟨(1458563335236450085361:ℚ)/2^80,(1458563335236450085362:ℚ)/2^80⟩,
  ⟨(155274630801786134741:ℚ)/2^80,(155274630801786134742:ℚ)/2^80⟩,
  ⟨(16530109038235522197:ℚ)/2^80,(16530109038235522198:ℚ)/2^80⟩,
  ⟨(1759749827805177755:ℚ)/2^80,(1759749827805177756:ℚ)/2^80⟩,
  ⟨(187338114303867090:ℚ)/2^80,(187338114303867091:ℚ)/2^80⟩,
  ⟨(19943499079469271:ℚ)/2^80,(19943499079469272:ℚ)/2^80⟩,
  ⟨(2123129919454843:ℚ)/2^80,(2123129919454844:ℚ)/2^80⟩,
  ⟨(226022556870410:ℚ)/2^80,(226022556870411:ℚ)/2^80⟩,
  ⟨(24061738165959:ℚ)/2^80,(24061738165960:ℚ)/2^80⟩,
  ⟨(2561546296899:ℚ)/2^80,(2561546296900:ℚ)/2^80⟩,
  ⟨(272695155516:ℚ)/2^80,(272695155517:ℚ)/2^80⟩,
  ⟨(29030374321:ℚ)/2^80,(29030374323:ℚ)/2^80⟩,
  ⟨(3090493601:ℚ)/2^80,(3090493602:ℚ)/2^80⟩,
  ⟨(329005426:ℚ)/2^80,(329005428:ℚ)/2^80⟩,
  ⟨(35025010:ℚ)/2^80,(35025011:ℚ)/2^80⟩,
  ⟨(3728665:ℚ)/2^80,(3728667:ℚ)/2^80⟩,
  ⟨(396943:ℚ)/2^80,(396944:ℚ)/2^80⟩,
  ⟨(42257:ℚ)/2^80,(42258:ℚ)/2^80⟩,
  ⟨(4498:ℚ)/2^80,(4499:ℚ)/2^80⟩,
  ⟨(478:ℚ)/2^80,(479:ℚ)/2^80⟩,
  ⟨(50:ℚ)/2^80,(51:ℚ)/2^80⟩,
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
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (317:ℚ)/256,
  ⟨⟨(128698909243442198354409:ℚ)/2^80,(128698909243442198354410:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(246407375420306573:ℚ)/2^60,(246407375420306574:ℚ)/2^60⟩
/-- Every rational identity and every rounded series multiplication is checked by Lean's kernel. -/
theorem trace_checked : trace.check input 40 = true := by decide +kernel
/-- The reported endpoints enclose the entire exact certificate interval. -/
theorem bounds_checked : bounds.encloses (trace.bounds 40) = true := by decide +kernel
/-- The reported interval contains the actual real natural logarithm. -/
theorem log_bounds : bounds.Contains (Real.log (input : ℝ)) :=
  Interval.encloses_sound bounds_checked (ScaledLogTrace.sound trace_checked)
/-- The complete enclosure has width at most one trillionth. -/
theorem tight : bounds.upper-bounds.lower ≤ (1:ℚ)/10^12 := by decide +kernel
end Point061

namespace Point062
/-- Exact original rational input. -/
def input : ℚ := (159:ℚ)/128
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(130580837658723011902060:ℚ)/2^80,(130580837658723011902061:ℚ)/2^80⟩,
  ⟨(14104550409130360170605:ℚ)/2^80,(14104550409130360170606:ℚ)/2^80⟩,
  ⟨(1523488023285857718776:ℚ)/2^80,(1523488023285857718777:ℚ)/2^80⟩,
  ⟨(164557939797427140355:ℚ)/2^80,(164557939797427140356:ℚ)/2^80⟩,
  ⟨(17774550988572269515:ℚ)/2^80,(17774550988572269516:ℚ)/2^80⟩,
  ⟨(1919899235699443745:ℚ)/2^80,(1919899235699443746:ℚ)/2^80⟩,
  ⟨(207375875633040962:ℚ)/2^80,(207375875633040963:ℚ)/2^80⟩,
  ⟨(22399484824474807:ℚ)/2^80,(22399484824474808:ℚ)/2^80⟩,
  ⟨(2419456548985083:ℚ)/2^80,(2419456548985084:ℚ)/2^80⟩,
  ⟨(261335027939155:ℚ)/2^80,(261335027939156:ℚ)/2^80⟩,
  ⟨(28227825317469:ℚ)/2^80,(28227825317470:ℚ)/2^80⟩,
  ⟨(3048998553454:ℚ)/2^80,(3048998553455:ℚ)/2^80⟩,
  ⟨(329334338526:ℚ)/2^80,(329334338527:ℚ)/2^80⟩,
  ⟨(35572698586:ℚ)/2^80,(35572698587:ℚ)/2^80⟩,
  ⟨(3842347234:ℚ)/2^80,(3842347235:ℚ)/2^80⟩,
  ⟨(415027053:ℚ)/2^80,(415027054:ℚ)/2^80⟩,
  ⟨(44828706:ℚ)/2^80,(44828707:ℚ)/2^80⟩,
  ⟨(4842125:ℚ)/2^80,(4842126:ℚ)/2^80⟩,
  ⟨(523016:ℚ)/2^80,(523018:ℚ)/2^80⟩,
  ⟨(56493:ℚ)/2^80,(56494:ℚ)/2^80⟩,
  ⟨(6102:ℚ)/2^80,(6103:ℚ)/2^80⟩,
  ⟨(659:ℚ)/2^80,(660:ℚ)/2^80⟩,
  ⟨(71:ℚ)/2^80,(72:ℚ)/2^80⟩,
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
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (159:ℚ)/128,
  ⟨⟨(130580837658723011902060:ℚ)/2^80,(130580837658723011902061:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(250038627255556805:ℚ)/2^60,(250038627255556806:ℚ)/2^60⟩
/-- Every rational identity and every rounded series multiplication is checked by Lean's kernel. -/
theorem trace_checked : trace.check input 40 = true := by decide +kernel
/-- The reported endpoints enclose the entire exact certificate interval. -/
theorem bounds_checked : bounds.encloses (trace.bounds 40) = true := by decide +kernel
/-- The reported interval contains the actual real natural logarithm. -/
theorem log_bounds : bounds.Contains (Real.log (input : ℝ)) :=
  Interval.encloses_sound bounds_checked (ScaledLogTrace.sound trace_checked)
/-- The complete enclosure has width at most one trillionth. -/
theorem tight : bounds.upper-bounds.lower ≤ (1:ℚ)/10^12 := by decide +kernel
end Point062

namespace Point063
/-- Exact original rational input. -/
def input : ℚ := (319:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(132456220236037631315633:ℚ)/2^80,(132456220236037631315634:ℚ)/2^80⟩,
  ⟨(14512594564991949170234:ℚ)/2^80,(14512594564991949170235:ℚ)/2^80⟩,
  ⟨(1590075578425204865608:ℚ)/2^80,(1590075578425204865609:ℚ)/2^80⟩,
  ⟨(174216976418761576579:ℚ)/2^80,(174216976418761576580:ℚ)/2^80⟩,
  ⟨(19088120894577355346:ℚ)/2^80,(19088120894577355348:ℚ)/2^80⟩,
  ⟨(2091394115405866759:ℚ)/2^80,(2091394115405866760:ℚ)/2^80⟩,
  ⟨(229144050905338444:ℚ)/2^80,(229144050905338446:ℚ)/2^80⟩,
  ⟨(25106217751367516:ℚ)/2^80,(25106217751367517:ℚ)/2^80⟩,
  ⟨(2750768205802006:ℚ)/2^80,(2750768205802007:ℚ)/2^80⟩,
  ⟨(301388516461785:ℚ)/2^80,(301388516461786:ℚ)/2^80⟩,
  ⟨(33021698325378:ℚ)/2^80,(33021698325379:ℚ)/2^80⟩,
  ⟨(3618029555650:ℚ)/2^80,(3618029555651:ℚ)/2^80⟩,
  ⟨(396410194792:ℚ)/2^80,(396410194794:ℚ)/2^80⟩,
  ⟨(43432769168:ℚ)/2^80,(43432769169:ℚ)/2^80⟩,
  ⟨(4758720795:ℚ)/2^80,(4758720796:ℚ)/2^80⟩,
  ⟨(521390278:ℚ)/2^80,(521390279:ℚ)/2^80⟩,
  ⟨(57126239:ℚ)/2^80,(57126240:ℚ)/2^80⟩,
  ⟨(6259048:ℚ)/2^80,(6259049:ℚ)/2^80⟩,
  ⟨(685773:ℚ)/2^80,(685775:ℚ)/2^80⟩,
  ⟨(75136:ℚ)/2^80,(75138:ℚ)/2^80⟩,
  ⟨(8232:ℚ)/2^80,(8233:ℚ)/2^80⟩,
  ⟨(901:ℚ)/2^80,(903:ℚ)/2^80⟩,
  ⟨(98:ℚ)/2^80,(99:ℚ)/2^80⟩,
  ⟨(10:ℚ)/2^80,(11:ℚ)/2^80⟩,
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
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (319:ℚ)/256,
  ⟨⟨(132456220236037631315633:ℚ)/2^80,(132456220236037631315634:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(253658477967382548:ℚ)/2^60,(253658477967382549:ℚ)/2^60⟩
/-- Every rational identity and every rounded series multiplication is checked by Lean's kernel. -/
theorem trace_checked : trace.check input 40 = true := by decide +kernel
/-- The reported endpoints enclose the entire exact certificate interval. -/
theorem bounds_checked : bounds.encloses (trace.bounds 40) = true := by decide +kernel
/-- The reported interval contains the actual real natural logarithm. -/
theorem log_bounds : bounds.Contains (Real.log (input : ℝ)) :=
  Interval.encloses_sound bounds_checked (ScaledLogTrace.sound trace_checked)
/-- The complete enclosure has width at most one trillionth. -/
theorem tight : bounds.upper-bounds.lower ≤ (1:ℚ)/10^12 := by decide +kernel
end Point063

/-- Reusable proved logarithm bounds for these consecutive exact grid inputs. -/
def entries : Array CertifiedLogBound := #[⟨Point056.input, Point056.bounds, Point056.log_bounds⟩,
  ⟨Point057.input, Point057.bounds, Point057.log_bounds⟩,
  ⟨Point058.input, Point058.bounds, Point058.log_bounds⟩,
  ⟨Point059.input, Point059.bounds, Point059.log_bounds⟩,
  ⟨Point060.input, Point060.bounds, Point060.log_bounds⟩,
  ⟨Point061.input, Point061.bounds, Point061.log_bounds⟩,
  ⟨Point062.input, Point062.bounds, Point062.log_bounds⟩,
  ⟨Point063.input, Point063.bounds, Point063.log_bounds⟩]
end MatrixBounds.Numeric.LogGridData.Part007
