module

public import TabulatedLogBounds
public import FKLLog.GridTrace

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

namespace MatrixBounds.Numeric.LogGridData.Part011
set_option maxRecDepth 100000
set_option maxHeartbeats 16000000

namespace Point088
/-- Exact original rational input. -/
def input : ℚ := (43:ℚ)/32
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(177309120210145612290239:ℚ)/2^80,(177309120210145612290240:ℚ)/2^80⟩,
  ⟨(26005337630821356469235:ℚ)/2^80,(26005337630821356469236:ℚ)/2^80⟩,
  ⟨(3814116185853798948821:ℚ)/2^80,(3814116185853798948822:ℚ)/2^80⟩,
  ⟨(559403707258557179160:ℚ)/2^80,(559403707258557179161:ℚ)/2^80⟩,
  ⟨(82045877064588386276:ℚ)/2^80,(82045877064588386277:ℚ)/2^80⟩,
  ⟨(12033395302806296653:ℚ)/2^80,(12033395302806296654:ℚ)/2^80⟩,
  ⟨(1764897977744923509:ℚ)/2^80,(1764897977744923510:ℚ)/2^80⟩,
  ⟨(258851703402588781:ℚ)/2^80,(258851703402588782:ℚ)/2^80⟩,
  ⟨(37964916499046354:ℚ)/2^80,(37964916499046355:ℚ)/2^80⟩,
  ⟨(5568187753193465:ℚ)/2^80,(5568187753193466:ℚ)/2^80⟩,
  ⟨(816667537135041:ℚ)/2^80,(816667537135042:ℚ)/2^80⟩,
  ⟨(119777905446472:ℚ)/2^80,(119777905446473:ℚ)/2^80⟩,
  ⟨(17567426132149:ℚ)/2^80,(17567426132150:ℚ)/2^80⟩,
  ⟨(2576555832715:ℚ)/2^80,(2576555832716:ℚ)/2^80⟩,
  ⟨(377894855464:ℚ)/2^80,(377894855466:ℚ)/2^80⟩,
  ⟨(55424578801:ℚ)/2^80,(55424578802:ℚ)/2^80⟩,
  ⟨(8128938224:ℚ)/2^80,(8128938225:ℚ)/2^80⟩,
  ⟨(1192244272:ℚ)/2^80,(1192244274:ℚ)/2^80⟩,
  ⟨(174862493:ℚ)/2^80,(174862494:ℚ)/2^80⟩,
  ⟨(25646498:ℚ)/2^80,(25646500:ℚ)/2^80⟩,
  ⟨(3761486:ℚ)/2^80,(3761487:ℚ)/2^80⟩,
  ⟨(551684:ℚ)/2^80,(551685:ℚ)/2^80⟩,
  ⟨(80913:ℚ)/2^80,(80914:ℚ)/2^80⟩,
  ⟨(11867:ℚ)/2^80,(11868:ℚ)/2^80⟩,
  ⟨(1740:ℚ)/2^80,(1741:ℚ)/2^80⟩,
  ⟨(255:ℚ)/2^80,(256:ℚ)/2^80⟩,
  ⟨(37:ℚ)/2^80,(38:ℚ)/2^80⟩,
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
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (43:ℚ)/32,
  ⟨⟨(177309120210145612290239:ℚ)/2^80,(177309120210145612290240:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(340647044887039014:ℚ)/2^60,(340647044887039016:ℚ)/2^60⟩
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
end Point088

namespace Point089
/-- Exact original rational input. -/
def input : ℚ := (345:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(179025620541933438517220:ℚ)/2^80,(179025620541933438517221:ℚ)/2^80⟩,
  ⟨(26511281577757198049970:ℚ)/2^80,(26511281577757198049972:ℚ)/2^80⟩,
  ⟨(3925963494875857947499:ℚ)/2^80,(3925963494875857947501:ℚ)/2^80⟩,
  ⟨(581382281271133706035:ℚ)/2^80,(581382281271133706036:ℚ)/2^80⟩,
  ⟨(86094880254793510544:ℚ)/2^80,(86094880254793510545:ℚ)/2^80⟩,
  ⟨(12749491418763098899:ℚ)/2^80,(12749491418763098900:ℚ)/2^80⟩,
  ⟨(1888027847370908156:ℚ)/2^80,(1888027847370908157:ℚ)/2^80⟩,
  ⟨(279591478229635317:ℚ)/2^80,(279591478229635318:ℚ)/2^80⟩,
  ⟨(41403729721193915:ℚ)/2^80,(41403729721193916:ℚ)/2^80⟩,
  ⟨(6131334351391444:ℚ)/2^80,(6131334351391446:ℚ)/2^80⟩,
  ⟨(907967982152809:ℚ)/2^80,(907967982152810:ℚ)/2^80⟩,
  ⟨(134457820984359:ℚ)/2^80,(134457820984360:ℚ)/2^80⟩,
  ⟨(19911391127467:ℚ)/2^80,(19911391127468:ℚ)/2^80⟩,
  ⟨(2948608669458:ℚ)/2^80,(2948608669459:ℚ)/2^80⟩,
  ⟨(436649203962:ℚ)/2^80,(436649203964:ℚ)/2^80⟩,
  ⟨(64661862150:ℚ)/2^80,(64661862152:ℚ)/2^80⟩,
  ⟨(9575550301:ℚ)/2^80,(9575550303:ℚ)/2^80⟩,
  ⟨(1418009944:ℚ)/2^80,(1418009946:ℚ)/2^80⟩,
  ⟨(209988161:ℚ)/2^80,(209988162:ℚ)/2^80⟩,
  ⟨(31096416:ℚ)/2^80,(31096417:ℚ)/2^80⟩,
  ⟨(4604960:ℚ)/2^80,(4604961:ℚ)/2^80⟩,
  ⟨(681932:ℚ)/2^80,(681933:ℚ)/2^80⟩,
  ⟨(100984:ℚ)/2^80,(100986:ℚ)/2^80⟩,
  ⟨(14954:ℚ)/2^80,(14955:ℚ)/2^80⟩,
  ⟨(2214:ℚ)/2^80,(2215:ℚ)/2^80⟩,
  ⟨(327:ℚ)/2^80,(329:ℚ)/2^80⟩,
  ⟨(48:ℚ)/2^80,(49:ℚ)/2^80⟩,
  ⟨(7:ℚ)/2^80,(8:ℚ)/2^80⟩,
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
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (345:ℚ)/256,
  ⟨⟨(179025620541933438517220:ℚ)/2^80,(179025620541933438517221:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(343993698919407934:ℚ)/2^60,(343993698919407935:ℚ)/2^60⟩
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
end Point089

namespace Point090
/-- Exact original rational input. -/
def input : ℚ := (173:ℚ)/128
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(180736418214811670637135:ℚ)/2^80,(180736418214811670637136:ℚ)/2^80⟩,
  ⟨(27020394749722675012196:ℚ)/2^80,(27020394749722675012197:ℚ)/2^80⟩,
  ⟨(4039593899460200583218:ℚ)/2^80,(4039593899460200583219:ℚ)/2^80⟩,
  ⟨(603925998258169522408:ℚ)/2^80,(603925998258169522409:ℚ)/2^80⟩,
  ⟨(90287939938928998366:ℚ)/2^80,(90287939938928998367:ℚ)/2^80⟩,
  ⟨(13498197000836561217:ℚ)/2^80,(13498197000836561218:ℚ)/2^80⟩,
  ⟨(2018002873879220115:ℚ)/2^80,(2018002873879220116:ℚ)/2^80⟩,
  ⟨(301694781809185731:ℚ)/2^80,(301694781809185732:ℚ)/2^80⟩,
  ⟨(45103871034595873:ℚ)/2^80,(45103871034595874:ℚ)/2^80⟩,
  ⟨(6743103643045894:ℚ)/2^80,(6743103643045895:ℚ)/2^80⟩,
  ⟨(1008105195804203:ℚ)/2^80,(1008105195804204:ℚ)/2^80⟩,
  ⟨(150713401366076:ℚ)/2^80,(150713401366078:ℚ)/2^80⟩,
  ⟨(22531903858715:ℚ)/2^80,(22531903858716:ℚ)/2^80⟩,
  ⟨(3368557055289:ℚ)/2^80,(3368557055290:ℚ)/2^80⟩,
  ⟨(503604875375:ℚ)/2^80,(503604875376:ℚ)/2^80⟩,
  ⟨(75289765421:ℚ)/2^80,(75289765422:ℚ)/2^80⟩,
  ⟨(11255944996:ℚ)/2^80,(11255944997:ℚ)/2^80⟩,
  ⟨(1682782474:ℚ)/2^80,(1682782475:ℚ)/2^80⟩,
  ⟨(251578775:ℚ)/2^80,(251578776:ℚ)/2^80⟩,
  ⟨(37611444:ℚ)/2^80,(37611445:ℚ)/2^80⟩,
  ⟨(5622973:ℚ)/2^80,(5622974:ℚ)/2^80⟩,
  ⟨(840643:ℚ)/2^80,(840644:ℚ)/2^80⟩,
  ⟨(125677:ℚ)/2^80,(125678:ℚ)/2^80⟩,
  ⟨(18788:ℚ)/2^80,(18790:ℚ)/2^80⟩,
  ⟨(2808:ℚ)/2^80,(2810:ℚ)/2^80⟩,
  ⟨(419:ℚ)/2^80,(421:ℚ)/2^80⟩,
  ⟨(62:ℚ)/2^80,(63:ℚ)/2^80⟩,
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
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (173:ℚ)/128,
  ⟨⟨(180736418214811670637135:ℚ)/2^80,(180736418214811670637136:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(347330666530034997:ℚ)/2^60,(347330666530034998:ℚ)/2^60⟩
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
end Point090

namespace Point091
/-- Exact original rational input. -/
def input : ℚ := (347:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(182441541600217669814696:ℚ)/2^80,(182441541600217669814697:ℚ)/2^80⟩,
  ⟨(27532637289585087816148:ℚ)/2^80,(27532637289585087816149:ℚ)/2^80⟩,
  ⟨(4155008280849490864460:ℚ)/2^80,(4155008280849490864461:ℚ)/2^80⟩,
  ⟨(627041050675462137090:ℚ)/2^80,(627041050675462137092:ℚ)/2^80⟩,
  ⟨(94628085591155977570:ℚ)/2^80,(94628085591155977572:ℚ)/2^80⟩,
  ⟨(14280523696177767759:ℚ)/2^80,(14280523696177767760:ℚ)/2^80⟩,
  ⟨(2155103907715052845:ℚ)/2^80,(2155103907715052847:ℚ)/2^80⟩,
  ⟨(325231269655173812:ℚ)/2^80,(325231269655173813:ℚ)/2^80⟩,
  ⟨(49081335884943311:ℚ)/2^80,(49081335884943312:ℚ)/2^80⟩,
  ⟨(7406967770364579:ℚ)/2^80,(7406967770364580:ℚ)/2^80⟩,
  ⟨(1117801106307092:ℚ)/2^80,(1117801106307093:ℚ)/2^80⟩,
  ⟨(168689719193939:ℚ)/2^80,(168689719193940:ℚ)/2^80⟩,
  ⟨(25457320807045:ℚ)/2^80,(25457320807046:ℚ)/2^80⟩,
  ⟨(3841817899570:ℚ)/2^80,(3841817899571:ℚ)/2^80⟩,
  ⟨(579776830615:ℚ)/2^80,(579776830616:ℚ)/2^80⟩,
  ⟨(87495342596:ℚ)/2^80,(87495342598:ℚ)/2^80⟩,
  ⟨(13204106428:ℚ)/2^80,(13204106429:ℚ)/2^80⟩,
  ⟨(1992659510:ℚ)/2^80,(1992659511:ℚ)/2^80⟩,
  ⟨(300716443:ℚ)/2^80,(300716444:ℚ)/2^80⟩,
  ⟨(45381751:ℚ)/2^80,(45381752:ℚ)/2^80⟩,
  ⟨(6848655:ℚ)/2^80,(6848656:ℚ)/2^80⟩,
  ⟨(1033544:ℚ)/2^80,(1033546:ℚ)/2^80⟩,
  ⟨(155974:ℚ)/2^80,(155975:ℚ)/2^80⟩,
  ⟨(23538:ℚ)/2^80,(23539:ℚ)/2^80⟩,
  ⟨(3552:ℚ)/2^80,(3553:ℚ)/2^80⟩,
  ⟨(536:ℚ)/2^80,(537:ℚ)/2^80⟩,
  ⟨(80:ℚ)/2^80,(82:ℚ)/2^80⟩,
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
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (347:ℚ)/256,
  ⟨⟨(182441541600217669814696:ℚ)/2^80,(182441541600217669814697:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(350658003629119164:ℚ)/2^60,(350658003629119165:ℚ)/2^60⟩
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
end Point091

namespace Point092
/-- Exact original rational input. -/
def input : ℚ := (87:ℚ)/64
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(184141018881698483564516:ℚ)/2^80,(184141018881698483564517:ℚ)/2^80⟩,
  ⟨(28047969763437517364131:ℚ)/2^80,(28047969763437517364132:ℚ)/2^80⟩,
  ⟨(4272207314960681452814:ℚ)/2^80,(4272207314960681452815:ℚ)/2^80⟩,
  ⟨(650733564530434923276:ℚ)/2^80,(650733564530434923277:ℚ)/2^80⟩,
  ⟨(99118357511258299571:ℚ)/2^80,(99118357511258299572:ℚ)/2^80⟩,
  ⟨(15097498163966495961:ℚ)/2^80,(15097498163966495962:ℚ)/2^80⟩,
  ⟨(2299618925637280841:ℚ)/2^80,(2299618925637280842:ℚ)/2^80⟩,
  ⟨(350273081388459995:ℚ)/2^80,(350273081388459996:ℚ)/2^80⟩,
  ⟨(53352853456520396:ℚ)/2^80,(53352853456520397:ℚ)/2^80⟩,
  ⟨(8126593572847477:ℚ)/2^80,(8126593572847478:ℚ)/2^80⟩,
  ⟨(1237825511095973:ℚ)/2^80,(1237825511095974:ℚ)/2^80⟩,
  ⟨(188542958643757:ℚ)/2^80,(188542958643758:ℚ)/2^80⟩,
  ⟨(28718463899380:ℚ)/2^80,(28718463899381:ℚ)/2^80⟩,
  ⟨(4374335560832:ℚ)/2^80,(4374335560833:ℚ)/2^80⟩,
  ⟨(666289522510:ℚ)/2^80,(666289522511:ℚ)/2^80⟩,
  ⟨(101487808064:ℚ)/2^80,(101487808065:ℚ)/2^80⟩,
  ⟨(15458407850:ℚ)/2^80,(15458407851:ℚ)/2^80⟩,
  ⟨(2354591924:ℚ)/2^80,(2354591925:ℚ)/2^80⟩,
  ⟨(358646451:ℚ)/2^80,(358646453:ℚ)/2^80⟩,
  ⟨(54628267:ℚ)/2^80,(54628268:ℚ)/2^80⟩,
  ⟨(8320861:ℚ)/2^80,(8320863:ℚ)/2^80⟩,
  ⟨(1267415:ℚ)/2^80,(1267417:ℚ)/2^80⟩,
  ⟨(193049:ℚ)/2^80,(193051:ℚ)/2^80⟩,
  ⟨(29404:ℚ)/2^80,(29406:ℚ)/2^80⟩,
  ⟨(4478:ℚ)/2^80,(4480:ℚ)/2^80⟩,
  ⟨(682:ℚ)/2^80,(683:ℚ)/2^80⟩,
  ⟨(103:ℚ)/2^80,(105:ℚ)/2^80⟩,
  ⟨(15:ℚ)/2^80,(16:ℚ)/2^80⟩,
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
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (87:ℚ)/64,
  ⟨⟨(184141018881698483564516:ℚ)/2^80,(184141018881698483564517:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(353975765644180081:ℚ)/2^60,(353975765644180082:ℚ)/2^60⟩
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
end Point092

namespace Point093
/-- Exact original rational input. -/
def input : ℚ := (349:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(185834878056463658260618:ℚ)/2^80,(185834878056463658260619:ℚ)/2^80⟩,
  ⟨(28566353155786975567334:ℚ)/2^80,(28566353155786975567335:ℚ)/2^80⟩,
  ⟨(4391191476839981368201:ℚ)/2^80,(4391191476839981368202:ℚ)/2^80⟩,
  ⟨(675009598919203747508:ℚ)/2^80,(675009598919203747509:ℚ)/2^80⟩,
  ⟨(103761806114852807468:ℚ)/2^80,(103761806114852807469:ℚ)/2^80⟩,
  ⟨(15950161931704646437:ℚ)/2^80,(15950161931704646438:ℚ)/2^80⟩,
  ⟨(2451843073799226642:ℚ)/2^80,(2451843073799226643:ℚ)/2^80⟩,
  ⟨(376894885724509219:ℚ)/2^80,(376894885724509220:ℚ)/2^80⟩,
  ⟨(57935908053519598:ℚ)/2^80,(57935908053519600:ℚ)/2^80⟩,
  ⟨(8905850328888136:ℚ)/2^80,(8905850328888137:ℚ)/2^80⟩,
  ⟨(1368998480308424:ℚ)/2^80,(1368998480308425:ℚ)/2^80⟩,
  ⟨(210441088708567:ℚ)/2^80,(210441088708568:ℚ)/2^80⟩,
  ⟨(32348795454374:ℚ)/2^80,(32348795454375:ℚ)/2^80⟩,
  ⟨(4972624755796:ℚ)/2^80,(4972624755797:ℚ)/2^80⟩,
  ⟨(764386945932:ℚ)/2^80,(764386945933:ℚ)/2^80⟩,
  ⟨(117500803258:ℚ)/2^80,(117500803260:ℚ)/2^80⟩,
  ⟨(18062106947:ℚ)/2^80,(18062106948:ℚ)/2^80⟩,
  ⟨(2776489167:ℚ)/2^80,(2776489168:ℚ)/2^80⟩,
  ⟨(426799161:ℚ)/2^80,(426799162:ℚ)/2^80⟩,
  ⟨(65607143:ℚ)/2^80,(65607144:ℚ)/2^80⟩,
  ⟨(10085064:ℚ)/2^80,(10085066:ℚ)/2^80⟩,
  ⟨(1550266:ℚ)/2^80,(1550267:ℚ)/2^80⟩,
  ⟨(238305:ℚ)/2^80,(238306:ℚ)/2^80⟩,
  ⟨(36632:ℚ)/2^80,(36633:ℚ)/2^80⟩,
  ⟨(5631:ℚ)/2^80,(5632:ℚ)/2^80⟩,
  ⟨(865:ℚ)/2^80,(866:ℚ)/2^80⟩,
  ⟨(132:ℚ)/2^80,(134:ℚ)/2^80⟩,
  ⟨(20:ℚ)/2^80,(21:ℚ)/2^80⟩,
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
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (349:ℚ)/256,
  ⟨⟨(185834878056463658260618:ℚ)/2^80,(185834878056463658260619:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(357284007525598177:ℚ)/2^60,(357284007525598178:ℚ)/2^60⟩
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
end Point093

namespace Point094
/-- Exact original rational input. -/
def input : ℚ := (175:ℚ)/128
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(187523146936922677264654:ℚ)/2^80,(187523146936922677264655:ℚ)/2^80⟩,
  ⟨(29087748864803187562504:ℚ)/2^80,(29087748864803187562505:ℚ)/2^80⟩,
  ⟨(4511961045035477938738:ℚ)/2^80,(4511961045035477938739:ℚ)/2^80⟩,
  ⟨(699875145599562584556:ℚ)/2^80,(699875145599562584557:ℚ)/2^80⟩,
  ⟨(108561491231615318396:ℚ)/2^80,(108561491231615318397:ℚ)/2^80⟩,
  ⟨(16839571247148250708:ℚ)/2^80,(16839571247148250709:ℚ)/2^80⟩,
  ⟨(2612078708303524037:ℚ)/2^80,(2612078708303524038:ℚ)/2^80⟩,
  ⟨(405173925050381616:ℚ)/2^80,(405173925050381617:ℚ)/2^80⟩,
  ⟨(62848760651379326:ℚ)/2^80,(62848760651379327:ℚ)/2^80⟩,
  ⟨(9748817658794812:ℚ)/2^80,(9748817658794814:ℚ)/2^80⟩,
  ⟨(1512192838162891:ℚ)/2^80,(1512192838162892:ℚ)/2^80⟩,
  ⟨(234564565655629:ℚ)/2^80,(234564565655631:ℚ)/2^80⟩,
  ⟨(36384602593447:ℚ)/2^80,(36384602593448:ℚ)/2^80⟩,
  ⟨(5643816243868:ℚ)/2^80,(5643816243869:ℚ)/2^80⟩,
  ⟨(875443443768:ℚ)/2^80,(875443443769:ℚ)/2^80⟩,
  ⟨(135794857614:ℚ)/2^80,(135794857615:ℚ)/2^80⟩,
  ⟨(21063888804:ℚ)/2^80,(21063888805:ℚ)/2^80⟩,
  ⟨(3267335887:ℚ)/2^80,(3267335888:ℚ)/2^80⟩,
  ⟨(506814477:ℚ)/2^80,(506814478:ℚ)/2^80⟩,
  ⟨(78614786:ℚ)/2^80,(78614788:ℚ)/2^80⟩,
  ⟨(12194372:ℚ)/2^80,(12194374:ℚ)/2^80⟩,
  ⟨(1891536:ℚ)/2^80,(1891537:ℚ)/2^80⟩,
  ⟨(293406:ℚ)/2^80,(293407:ℚ)/2^80⟩,
  ⟨(45511:ℚ)/2^80,(45512:ℚ)/2^80⟩,
  ⟨(7059:ℚ)/2^80,(7060:ℚ)/2^80⟩,
  ⟨(1094:ℚ)/2^80,(1096:ℚ)/2^80⟩,
  ⟨(169:ℚ)/2^80,(171:ℚ)/2^80⟩,
  ⟨(26:ℚ)/2^80,(27:ℚ)/2^80⟩,
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
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (175:ℚ)/128,
  ⟨⟨(187523146936922677264654:ℚ)/2^80,(187523146936922677264655:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(360582783752075503:ℚ)/2^60,(360582783752075504:ℚ)/2^60⟩
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
end Point094

namespace Point095
/-- Exact original rational input. -/
def input : ℚ := (351:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(189205853152207201972136:ℚ)/2^80,(189205853152207201972137:ℚ)/2^80⟩,
  ⟨(29612118697627156816067:ℚ)/2^80,(29612118697627156816068:ℚ)/2^80⟩,
  ⟨(4634516105888928990982:ℚ)/2^80,(4634516105888928990983:ℚ)/2^80⟩,
  ⟨(725336128598761538951:ℚ)/2^80,(725336128598761538952:ℚ)/2^80⟩,
  ⟨(113520481411667786162:ℚ)/2^80,(113520481411667786163:ℚ)/2^80⟩,
  ⟨(17766796926043557966:ℚ)/2^80,(17766796926043557967:ℚ)/2^80⟩,
  ⟨(2780635433235812202:ℚ)/2^80,(2780635433235812203:ℚ)/2^80⟩,
  ⟨(435190059567384117:ℚ)/2^80,(435190059567384118:ℚ)/2^80⟩,
  ⟨(68110470607745454:ℚ)/2^80,(68110470607745456:ℚ)/2^80⟩,
  ⟨(10659793587703160:ℚ)/2^80,(10659793587703161:ℚ)/2^80⟩,
  ⟨(1668336722951894:ℚ)/2^80,(1668336722951896:ℚ)/2^80⟩,
  ⟨(261107065371383:ℚ)/2^80,(261107065371385:ℚ)/2^80⟩,
  ⟨(40865191450216:ℚ)/2^80,(40865191450217:ℚ)/2^80⟩,
  ⟨(6395705416425:ℚ)/2^80,(6395705416427:ℚ)/2^80⟩,
  ⟨(1000975312290:ℚ)/2^80,(1000975312291:ℚ)/2^80⟩,
  ⟨(156660057112:ℚ)/2^80,(156660057114:ℚ)/2^80⟩,
  ⟨(24518460338:ℚ)/2^80,(24518460340:ℚ)/2^80⟩,
  ⟨(3837320810:ℚ)/2^80,(3837320812:ℚ)/2^80⟩,
  ⟨(600569154:ℚ)/2^80,(600569156:ℚ)/2^80⟩,
  ⟨(93993524:ℚ)/2^80,(93993526:ℚ)/2^80⟩,
  ⟨(14710683:ℚ)/2^80,(14710684:ℚ)/2^80⟩,
  ⟨(2302330:ℚ)/2^80,(2302332:ℚ)/2^80⟩,
  ⟨(360331:ℚ)/2^80,(360333:ℚ)/2^80⟩,
  ⟨(56394:ℚ)/2^80,(56395:ℚ)/2^80⟩,
  ⟨(8826:ℚ)/2^80,(8827:ℚ)/2^80⟩,
  ⟨(1381:ℚ)/2^80,(1382:ℚ)/2^80⟩,
  ⟨(216:ℚ)/2^80,(217:ℚ)/2^80⟩,
  ⟨(33:ℚ)/2^80,(34:ℚ)/2^80⟩,
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
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (351:ℚ)/256,
  ⟨⟨(189205853152207201972136:ℚ)/2^80,(189205853152207201972137:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(363872148336018669:ℚ)/2^60,(363872148336018670:ℚ)/2^60⟩
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
end Point095

/-- Reusable proved logarithm bounds for these consecutive exact grid inputs. -/
def entries : Array CertifiedLogBound := #[⟨Point088.input, Point088.bounds, Point088.log_bounds⟩,
  ⟨Point089.input, Point089.bounds, Point089.log_bounds⟩,
  ⟨Point090.input, Point090.bounds, Point090.log_bounds⟩,
  ⟨Point091.input, Point091.bounds, Point091.log_bounds⟩,
  ⟨Point092.input, Point092.bounds, Point092.log_bounds⟩,
  ⟨Point093.input, Point093.bounds, Point093.log_bounds⟩,
  ⟨Point094.input, Point094.bounds, Point094.log_bounds⟩,
  ⟨Point095.input, Point095.bounds, Point095.log_bounds⟩]
end MatrixBounds.Numeric.LogGridData.Part011
