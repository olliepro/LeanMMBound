module

public import TabulatedLogBounds
public import FKLLog.GridTrace

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

namespace MatrixBounds.Numeric.LogGridData.Part029
set_option maxRecDepth 100000
set_option maxHeartbeats 16000000

namespace Point232
/-- Exact original rational input. -/
def input : ℚ := (61:ℚ)/32
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(376976868481981140499775:ℚ)/2^80,(376976868481981140499776:ℚ)/2^80⟩,
  ⟨(117551926730940355639714:ℚ)/2^80,(117551926730940355639716:ℚ)/2^80⟩,
  ⟨(36655977152658820575824:ℚ)/2^80,(36655977152658820575826:ℚ)/2^80⟩,
  ⟨(11430358466958126846224:ℚ)/2^80,(11430358466958126846226:ℚ)/2^80⟩,
  ⟨(3564305328406297618715:ℚ)/2^80,(3564305328406297618716:ℚ)/2^80⟩,
  ⟨(1111450048642823988631:ℚ)/2^80,(1111450048642823988632:ℚ)/2^80⟩,
  ⟨(346581197963891351293:ℚ)/2^80,(346581197963891351294:ℚ)/2^80⟩,
  ⟨(108073706891966120295:ℚ)/2^80,(108073706891966120296:ℚ)/2^80⟩,
  ⟨(33700403224376532134:ℚ)/2^80,(33700403224376532136:ℚ)/2^80⟩,
  ⟨(10508727887171176686:ℚ)/2^80,(10508727887171176688:ℚ)/2^80⟩,
  ⟨(3276915147612517461:ℚ)/2^80,(3276915147612517462:ℚ)/2^80⟩,
  ⟨(1021833755707129100:ℚ)/2^80,(1021833755707129102:ℚ)/2^80⟩,
  ⟨(318636332424803697:ℚ)/2^80,(318636332424803699:ℚ)/2^80⟩,
  ⟨(99359716562573195:ℚ)/2^80,(99359716562573197:ℚ)/2^80⟩,
  ⟨(30983137422737878:ℚ)/2^80,(30983137422737879:ℚ)/2^80⟩,
  ⟨(9661408443649445:ℚ)/2^80,(9661408443649447:ℚ)/2^80⟩,
  ⟨(3012697256621869:ℚ)/2^80,(3012697256621871:ℚ)/2^80⟩,
  ⟨(939443230559507:ℚ)/2^80,(939443230559509:ℚ)/2^80⟩,
  ⟨(292944663292749:ℚ)/2^80,(292944663292751:ℚ)/2^80⟩,
  ⟨(91348335865480:ℚ)/2^80,(91348335865482:ℚ)/2^80⟩,
  ⟨(28484964947300:ℚ)/2^80,(28484964947301:ℚ)/2^80⟩,
  ⟨(8882408424426:ℚ)/2^80,(8882408424428:ℚ)/2^80⟩,
  ⟨(2769783272132:ℚ)/2^80,(2769783272134:ℚ)/2^80⟩,
  ⟨(863695859051:ℚ)/2^80,(863695859053:ℚ)/2^80⟩,
  ⟨(269324515187:ℚ)/2^80,(269324515189:ℚ)/2^80⟩,
  ⟨(83982913337:ℚ)/2^80,(83982913339:ℚ)/2^80⟩,
  ⟨(26188220287:ℚ)/2^80,(26188220289:ℚ)/2^80⟩,
  ⟨(8166219229:ℚ)/2^80,(8166219230:ℚ)/2^80⟩,
  ⟨(2546455458:ℚ)/2^80,(2546455459:ℚ)/2^80⟩,
  ⟨(794056003:ℚ)/2^80,(794056004:ℚ)/2^80⟩,
  ⟨(247608861:ℚ)/2^80,(247608862:ℚ)/2^80⟩,
  ⟨(77211365:ℚ)/2^80,(77211366:ℚ)/2^80⟩,
  ⟨(24076662:ℚ)/2^80,(24076663:ℚ)/2^80⟩,
  ⟨(7507776:ℚ)/2^80,(7507777:ℚ)/2^80⟩,
  ⟨(2341134:ℚ)/2^80,(2341135:ℚ)/2^80⟩,
  ⟨(730031:ℚ)/2^80,(730032:ℚ)/2^80⟩,
  ⟨(227644:ℚ)/2^80,(227645:ℚ)/2^80⟩,
  ⟨(70985:ℚ)/2^80,(70987:ℚ)/2^80⟩,
  ⟨(22135:ℚ)/2^80,(22136:ℚ)/2^80⟩,
  ⟨(6902:ℚ)/2^80,(6903:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (61:ℚ)/32,
  ⟨⟨(376976868481981140499775:ℚ)/2^80,(376976868481981140499776:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(743793429105827200:ℚ)/2^60,(743793429105827202:ℚ)/2^60⟩
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
end Point232

namespace Point233
/-- Exact original rational input. -/
def input : ℚ := (489:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(378093578483501473431595:ℚ)/2^80,(378093578483501473431596:ℚ)/2^80⟩,
  ⟨(118249401055913883636995:ℚ)/2^80,(118249401055913883636996:ℚ)/2^80⟩,
  ⟨(36982698585272395822039:ℚ)/2^80,(36982698585272395822041:ℚ)/2^80⟩,
  ⟨(11566401034051635203402:ℚ)/2^80,(11566401034051635203404:ℚ)/2^80⟩,
  ⟨(3617411330112793291802:ℚ)/2^80,(3617411330112793291803:ℚ)/2^80⟩,
  ⟨(1131351462974873606697:ℚ)/2^80,(1131351462974873606699:ℚ)/2^80⟩,
  ⟨(353832068286101409879:ℚ)/2^80,(353832068286101409881:ℚ)/2^80⟩,
  ⟨(110661573034445138928:ℚ)/2^80,(110661573034445138930:ℚ)/2^80⟩,
  ⟨(34609592640302976335:ℚ)/2^80,(34609592640302976337:ℚ)/2^80⟩,
  ⟨(10824208168041065081:ℚ)/2^80,(10824208168041065083:ℚ)/2^80⟩,
  ⟨(3385289265977943844:ℚ)/2^80,(3385289265977943845:ℚ)/2^80⟩,
  ⟨(1058754897950148880:ℚ)/2^80,(1058754897950148881:ℚ)/2^80⟩,
  ⟨(331127370768301596:ℚ)/2^80,(331127370768301597:ℚ)/2^80⟩,
  ⟨(103560640790623183:ℚ)/2^80,(103560640790623185:ℚ)/2^80⟩,
  ⟨(32388764166731814:ℚ)/2^80,(32388764166731815:ℚ)/2^80⟩,
  ⟨(10129640336709412:ℚ)/2^80,(10129640336709414:ℚ)/2^80⟩,
  ⟨(3168062011346702:ℚ)/2^80,(3168062011346703:ℚ)/2^80⟩,
  ⟨(990816709588968:ℚ)/2^80,(990816709588969:ℚ)/2^80⟩,
  ⟨(309879588368093:ℚ)/2^80,(309879588368094:ℚ)/2^80⟩,
  ⟨(96915361194316:ℚ)/2^80,(96915361194317:ℚ)/2^80⟩,
  ⟨(30310441823188:ℚ)/2^80,(30310441823190:ℚ)/2^80⟩,
  ⟨(9479641536648:ℚ)/2^80,(9479641536649:ℚ)/2^80⟩,
  ⟨(2964773796025:ℚ)/2^80,(2964773796026:ℚ)/2^80⟩,
  ⟨(927237979159:ℚ)/2^80,(927237979160:ℚ)/2^80⟩,
  ⟨(289995233750:ℚ)/2^80,(289995233751:ℚ)/2^80⟩,
  ⟨(90696495924:ℚ)/2^80,(90696495925:ℚ)/2^80⟩,
  ⟨(28365481275:ℚ)/2^80,(28365481276:ℚ)/2^80⟩,
  ⟨(8871351861:ℚ)/2^80,(8871351863:ℚ)/2^80⟩,
  ⟨(2774530179:ℚ)/2^80,(2774530180:ℚ)/2^80⟩,
  ⟨(867738968:ℚ)/2^80,(867738970:ℚ)/2^80⟩,
  ⟨(271386818:ℚ)/2^80,(271386819:ℚ)/2^80⟩,
  ⟨(84876682:ℚ)/2^80,(84876683:ℚ)/2^80⟩,
  ⟨(26545324:ℚ)/2^80,(26545326:ℚ)/2^80⟩,
  ⟨(8302094:ℚ)/2^80,(8302096:ℚ)/2^80⟩,
  ⟨(2596493:ℚ)/2^80,(2596495:ℚ)/2^80⟩,
  ⟨(812057:ℚ)/2^80,(812059:ℚ)/2^80⟩,
  ⟨(253972:ℚ)/2^80,(253973:ℚ)/2^80⟩,
  ⟨(79430:ℚ)/2^80,(79431:ℚ)/2^80⟩,
  ⟨(24841:ℚ)/2^80,(24843:ℚ)/2^80⟩,
  ⟨(7769:ℚ)/2^80,(7770:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (489:ℚ)/256,
  ⟨⟨(378093578483501473431595:ℚ)/2^80,(378093578483501473431596:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(746153555835042246:ℚ)/2^60,(746153555835042248:ℚ)/2^60⟩
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
end Point233

namespace Point234
/-- Exact original rational input. -/
def input : ℚ := (245:ℚ)/128
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(379207294624427918071374:ℚ)/2^80,(379207294624427918071375:ℚ)/2^80⟩,
  ⟨(118947060244123502451342:ℚ)/2^80,(118947060244123502451344:ℚ)/2^80⟩,
  ⟨(37310471980060187095997:ℚ)/2^80,(37310471980060187095999:ℚ)/2^80⟩,
  ⟨(11703284776587243673543:ℚ)/2^80,(11703284776587243673544:ℚ)/2^80⟩,
  ⟨(3671003535819591179100:ℚ)/2^80,(3671003535819591179101:ℚ)/2^80⟩,
  ⟨(1151494406677995088350:ℚ)/2^80,(1151494406677995088351:ℚ)/2^80⟩,
  ⟨(361192615499531971412:ℚ)/2^80,(361192615499531971414:ℚ)/2^80⟩,
  ⟨(113296343199585095590:ℚ)/2^80,(113296343199585095591:ℚ)/2^80⟩,
  ⟨(35537995051880579581:ℚ)/2^80,(35537995051880579583:ℚ)/2^80⟩,
  ⟨(11147306758900878849:ℚ)/2^80,(11147306758900878851:ℚ)/2^80⟩,
  ⟨(3496608286304029022:ℚ)/2^80,(3496608286304029023:ℚ)/2^80⟩,
  ⟨(1096791339135580148:ℚ)/2^80,(1096791339135580150:ℚ)/2^80⟩,
  ⟨(344033744447353558:ℚ)/2^80,(344033744447353560:ℚ)/2^80⟩,
  ⟨(107914069974102858:ℚ)/2^80,(107914069974102860:ℚ)/2^80⟩,
  ⟨(33849721680884810:ℚ)/2^80,(33849721680884812:ℚ)/2^80⟩,
  ⟨(10617741117060382:ℚ)/2^80,(10617741117060384:ℚ)/2^80⟩,
  ⟨(3330497883903658:ℚ)/2^80,(3330497883903660:ℚ)/2^80⟩,
  ⟨(1044687003798198:ℚ)/2^80,(1044687003798199:ℚ)/2^80⟩,
  ⟨(327690025320078:ℚ)/2^80,(327690025320079:ℚ)/2^80⟩,
  ⟨(102787487834984:ℚ)/2^80,(102787487834985:ℚ)/2^80⟩,
  ⟨(32241651680142:ℚ)/2^80,(32241651680143:ℚ)/2^80⟩,
  ⟨(10113333100741:ℚ)/2^80,(10113333100742:ℚ)/2^80⟩,
  ⟨(3172278747417:ℚ)/2^80,(3172278747418:ℚ)/2^80⟩,
  ⟨(995057944900:ℚ)/2^80,(995057944901:ℚ)/2^80⟩,
  ⟨(312122733386:ℚ)/2^80,(312122733388:ℚ)/2^80⟩,
  ⟨(97904449882:ℚ)/2^80,(97904449884:ℚ)/2^80⟩,
  ⟨(30709974895:ℚ)/2^80,(30709974897:ℚ)/2^80⟩,
  ⟨(9632887567:ℚ)/2^80,(9632887569:ℚ)/2^80⟩,
  ⟨(3021575992:ℚ)/2^80,(3021575994:ℚ)/2^80⟩,
  ⟨(947786571:ℚ)/2^80,(947786572:ℚ)/2^80⟩,
  ⟨(297294983:ℚ)/2^80,(297294984:ℚ)/2^80⟩,
  ⟨(93253386:ℚ)/2^80,(93253387:ℚ)/2^80⟩,
  ⟨(29251062:ℚ)/2^80,(29251063:ℚ)/2^80⟩,
  ⟨(9175266:ℚ)/2^80,(9175267:ℚ)/2^80⟩,
  ⟨(2878032:ℚ)/2^80,(2878033:ℚ)/2^80⟩,
  ⟨(902760:ℚ)/2^80,(902762:ℚ)/2^80⟩,
  ⟨(283171:ℚ)/2^80,(283172:ℚ)/2^80⟩,
  ⟨(88823:ℚ)/2^80,(88824:ℚ)/2^80⟩,
  ⟨(27861:ℚ)/2^80,(27862:ℚ)/2^80⟩,
  ⟨(8739:ℚ)/2^80,(8740:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (245:ℚ)/128,
  ⟨⟨(379207294624427918071374:ℚ)/2^80,(379207294624427918071375:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(748508861055835352:ℚ)/2^60,(748508861055835353:ℚ)/2^60⟩
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
end Point234

namespace Point235
/-- Exact original rational input. -/
def input : ℚ := (491:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(380318028928296996058837:ℚ)/2^80,(380318028928296996058838:ℚ)/2^80⟩,
  ⟨(119644895312114851504453:ℚ)/2^80,(119644895312114851504454:ℚ)/2^80⟩,
  ⟨(37639291028576961316661:ℚ)/2^80,(37639291028576961316663:ℚ)/2^80⟩,
  ⟨(11841008556513501886767:ℚ)/2^80,(11841008556513501886769:ℚ)/2^80⟩,
  ⟨(3725083013093270339210:ℚ)/2^80,(3725083013093270339212:ℚ)/2^80⟩,
  ⟨(1171880198228806599349:ℚ)/2^80,(1171880198228806599351:ℚ)/2^80⟩,
  ⟨(368663783914015462981:ℚ)/2^80,(368663783914015462982:ℚ)/2^80⟩,
  ⟨(115978566559295359840:ℚ)/2^80,(115978566559295359841:ℚ)/2^80⟩,
  ⟨(36485894432977790578:ℚ)/2^80,(36485894432977790580:ℚ)/2^80⟩,
  ⟨(11478159560575342417:ℚ)/2^80,(11478159560575342419:ℚ)/2^80⟩,
  ⟨(3610933730569217493:ℚ)/2^80,(3610933730569217495:ℚ)/2^80⟩,
  ⟨(1135969781370503495:ℚ)/2^80,(1135969781370503496:ℚ)/2^80⟩,
  ⟨(357366664822045945:ℚ)/2^80,(357366664822045946:ℚ)/2^80⟩,
  ⟨(112424586657537880:ℚ)/2^80,(112424586657537882:ℚ)/2^80⟩,
  ⟨(35367841853442304:ℚ)/2^80,(35367841853442306:ℚ)/2^80⟩,
  ⟨(11126429498740216:ℚ)/2^80,(11126429498740217:ℚ)/2^80⟩,
  ⟨(3500282372428314:ℚ)/2^80,(3500282372428315:ℚ)/2^80⟩,
  ⟨(1101159782490835:ℚ)/2^80,(1101159782490836:ℚ)/2^80⟩,
  ⟨(346415728092832:ℚ)/2^80,(346415728092834:ℚ)/2^80⟩,
  ⟨(108979512853836:ℚ)/2^80,(108979512853837:ℚ)/2^80⟩,
  ⟨(34284050228449:ℚ)/2^80,(34284050228450:ℚ)/2^80⟩,
  ⟨(10785477648842:ℚ)/2^80,(10785477648844:ℚ)/2^80⟩,
  ⟨(3393021750305:ℚ)/2^80,(3393021750306:ℚ)/2^80⟩,
  ⟨(1067416481019:ℚ)/2^80,(1067416481020:ℚ)/2^80⟩,
  ⟨(335800365514:ℚ)/2^80,(335800365515:ℚ)/2^80⟩,
  ⟨(105640007892:ℚ)/2^80,(105640007893:ℚ)/2^80⟩,
  ⟨(33233469684:ℚ)/2^80,(33233469686:ℚ)/2^80⟩,
  ⟨(10454973729:ℚ)/2^80,(10454973730:ℚ)/2^80⟩,
  ⟨(3289047960:ℚ)/2^80,(3289047961:ℚ)/2^80⟩,
  ⟨(1034707189:ℚ)/2^80,(1034707190:ℚ)/2^80⟩,
  ⟨(325510293:ℚ)/2^80,(325510295:ℚ)/2^80⟩,
  ⟨(102402836:ℚ)/2^80,(102402838:ℚ)/2^80⟩,
  ⟨(32215082:ℚ)/2^80,(32215083:ℚ)/2^80⟩,
  ⟨(10134597:ℚ)/2^80,(10134598:ℚ)/2^80⟩,
  ⟨(3188260:ℚ)/2^80,(3188261:ℚ)/2^80⟩,
  ⟨(1003000:ℚ)/2^80,(1003001:ℚ)/2^80⟩,
  ⟨(315535:ℚ)/2^80,(315536:ℚ)/2^80⟩,
  ⟨(99264:ℚ)/2^80,(99266:ℚ)/2^80⟩,
  ⟨(31227:ℚ)/2^80,(31229:ℚ)/2^80⟩,
  ⟨(9823:ℚ)/2^80,(9825:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (491:ℚ)/256,
  ⟨⟨(380318028928296996058837:ℚ)/2^80,(380318028928296996058838:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(750859364427792419:ℚ)/2^60,(750859364427792420:ℚ)/2^60⟩
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
end Point235

namespace Point236
/-- Exact original rational input. -/
def input : ℚ := (123:ℚ)/64
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(381425793354348242286975:ℚ)/2^80,(381425793354348242286976:ℚ)/2^80⟩,
  ⟨(120342897368484204785729:ℚ)/2^80,(120342897368484204785731:ℚ)/2^80⟩,
  ⟨(37969149437115337338812:ℚ)/2^80,(37969149437115337338814:ℚ)/2^80⟩,
  ⟨(11979571212779705363582:ℚ)/2^80,(11979571212779705363584:ℚ)/2^80⟩,
  ⟨(3779650810449211852680:ℚ)/2^80,(3779650810449211852682:ℚ)/2^80⟩,
  ⟨(1192510148751355611273:ℚ)/2^80,(1192510148751355611275:ℚ)/2^80⟩,
  ⟨(376246517520481182166:ℚ)/2^80,(376246517520481182167:ℚ)/2^80⟩,
  ⟨(118708794297905827528:ℚ)/2^80,(118708794297905827529:ℚ)/2^80⟩,
  ⟨(37453576810569218310:ℚ)/2^80,(37453576810569218312:ℚ)/2^80⟩,
  ⟨(11816903913495100964:ℚ)/2^80,(11816903913495100965:ℚ)/2^80⟩,
  ⟨(3728327972707010464:ℚ)/2^80,(3728327972707010465:ℚ)/2^80⟩,
  ⟨(1176317381763174424:ℚ)/2^80,(1176317381763174425:ℚ)/2^80⟩,
  ⟨(371137569647204764:ℚ)/2^80,(371137569647204766:ℚ)/2^80⟩,
  ⟨(117096880263021823:ℚ)/2^80,(117096880263021825:ℚ)/2^80⟩,
  ⟨(36945005002771591:ℚ)/2^80,(36945005002771592:ℚ)/2^80⟩,
  ⟨(11656445428681945:ℚ)/2^80,(11656445428681947:ℚ)/2^80⟩,
  ⟨(3677702033648314:ℚ)/2^80,(3677702033648315:ℚ)/2^80⟩,
  ⟨(1160344491899735:ℚ)/2^80,(1160344491899736:ℚ)/2^80⟩,
  ⟨(366097994770504:ℚ)/2^80,(366097994770505:ℚ)/2^80⟩,
  ⟨(115506853965025:ℚ)/2^80,(115506853965026:ℚ)/2^80⟩,
  ⟨(36443338951531:ℚ)/2^80,(36443338951533:ℚ)/2^80⟩,
  ⟨(11498165765456:ℚ)/2^80,(11498165765457:ℚ)/2^80⟩,
  ⟨(3627763530277:ℚ)/2^80,(3627763530278:ℚ)/2^80⟩,
  ⟨(1144588493509:ℚ)/2^80,(1144588493511:ℚ)/2^80⟩,
  ⟨(361126850893:ℚ)/2^80,(361126850894:ℚ)/2^80⟩,
  ⟨(113938418196:ℚ)/2^80,(113938418197:ℚ)/2^80⟩,
  ⟨(35948484885:ℚ)/2^80,(35948484886:ℚ)/2^80⟩,
  ⟨(11342035338:ℚ)/2^80,(11342035339:ℚ)/2^80⟩,
  ⟨(3578503128:ℚ)/2^80,(3578503129:ℚ)/2^80⟩,
  ⟨(1129046441:ℚ)/2^80,(1129046442:ℚ)/2^80⟩,
  ⟨(356223208:ℚ)/2^80,(356223209:ℚ)/2^80⟩,
  ⟨(112391279:ℚ)/2^80,(112391280:ℚ)/2^80⟩,
  ⟨(35460350:ℚ)/2^80,(35460351:ℚ)/2^80⟩,
  ⟨(11188024:ℚ)/2^80,(11188026:ℚ)/2^80⟩,
  ⟨(3529911:ℚ)/2^80,(3529912:ℚ)/2^80⟩,
  ⟨(1113715:ℚ)/2^80,(1113716:ℚ)/2^80⟩,
  ⟨(351386:ℚ)/2^80,(351387:ℚ)/2^80⟩,
  ⟨(110865:ℚ)/2^80,(110866:ℚ)/2^80⟩,
  ⟨(34978:ℚ)/2^80,(34980:ℚ)/2^80⟩,
  ⟨(11035:ℚ)/2^80,(11037:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (123:ℚ)/64,
  ⟨⟨(381425793354348242286975:ℚ)/2^80,(381425793354348242286976:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(753205085490501710:ℚ)/2^60,(753205085490501711:ℚ)/2^60⟩
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
end Point236

namespace Point237
/-- Exact original rational input. -/
def input : ℚ := (493:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(382530599797953423772181:ℚ)/2^80,(382530599797953423772182:ℚ)/2^80⟩,
  ⟨(121041057612970576013360:ℚ)/2^80,(121041057612970576013361:ℚ)/2^80⟩,
  ⟨(38300040926934614840008:ℚ)/2^80,(38300040926934614840009:ℚ)/2^80⟩,
  ⟨(12118971561660218580883:ℚ)/2^80,(12118971561660218580885:ℚ)/2^80⟩,
  ⟨(3834707957427866226527:ℚ)/2^80,(3834707957427866226529:ℚ)/2^80⟩,
  ⟨(1213385561963156603053:ℚ)/2^80,(1213385561963156603054:ℚ)/2^80⟩,
  ⟨(383941759926926722194:ℚ)/2^80,(383941759926926722195:ℚ)/2^80⟩,
  ⟨(121487579576343969505:ℚ)/2^80,(121487579576343969507:ℚ)/2^80⟩,
  ⟨(38441330253128866185:ℚ)/2^80,(38441330253128866186:ℚ)/2^80⟩,
  ⟨(12163678598119547778:ℚ)/2^80,(12163678598119547779:ℚ)/2^80⟩,
  ⟨(3848854242662660645:ℚ)/2^80,(3848854242662660646:ℚ)/2^80⟩,
  ⟨(1217861756356542820:ℚ)/2^80,(1217861756356542822:ℚ)/2^80⟩,
  ⟨(385358125843125031:ℚ)/2^80,(385358125843125032:ℚ)/2^80⟩,
  ⟨(121935748764780550:ℚ)/2^80,(121935748764780551:ℚ)/2^80⟩,
  ⟨(38583140797400521:ℚ)/2^80,(38583140797400522:ℚ)/2^80⟩,
  ⟨(12208550559391086:ℚ)/2^80,(12208550559391087:ℚ)/2^80⟩,
  ⟨(3863052713719208:ℚ)/2^80,(3863052713719210:ℚ)/2^80⟩,
  ⟨(1222354463486585:ℚ)/2^80,(1222354463486586:ℚ)/2^80⟩,
  ⟨(386779716750761:ℚ)/2^80,(386779716750763:ℚ)/2^80⟩,
  ⟨(122385571254913:ℚ)/2^80,(122385571254915:ℚ)/2^80⟩,
  ⟨(38725474482529:ℚ)/2^80,(38725474482530:ℚ)/2^80⟩,
  ⟨(12253588053884:ℚ)/2^80,(12253588053885:ℚ)/2^80⟩,
  ⟨(3877303563111:ℚ)/2^80,(3877303563112:ℚ)/2^80⟩,
  ⟨(1226863744268:ℚ)/2^80,(1226863744270:ℚ)/2^80⟩,
  ⟨(388206551924:ℚ)/2^80,(388206551926:ℚ)/2^80⟩,
  ⟨(122837053145:ℚ)/2^80,(122837053147:ℚ)/2^80⟩,
  ⟨(38868333238:ℚ)/2^80,(38868333239:ℚ)/2^80⟩,
  ⟨(12298791692:ℚ)/2^80,(12298791693:ℚ)/2^80⟩,
  ⟨(3891606983:ℚ)/2^80,(3891606985:ℚ)/2^80⟩,
  ⟨(1231389659:ℚ)/2^80,(1231389661:ℚ)/2^80⟩,
  ⟨(389638650:ℚ)/2^80,(389638652:ℚ)/2^80⟩,
  ⟨(123290200:ℚ)/2^80,(123290201:ℚ)/2^80⟩,
  ⟨(39011718:ℚ)/2^80,(39011720:ℚ)/2^80⟩,
  ⟨(12344161:ℚ)/2^80,(12344163:ℚ)/2^80⟩,
  ⟨(3905962:ℚ)/2^80,(3905964:ℚ)/2^80⟩,
  ⟨(1235931:ℚ)/2^80,(1235933:ℚ)/2^80⟩,
  ⟨(391075:ℚ)/2^80,(391077:ℚ)/2^80⟩,
  ⟨(123744:ℚ)/2^80,(123746:ℚ)/2^80⟩,
  ⟨(39155:ℚ)/2^80,(39156:ℚ)/2^80⟩,
  ⟨(12389:ℚ)/2^80,(12390:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (493:ℚ)/256,
  ⟨⟨(382530599797953423772181:ℚ)/2^80,(382530599797953423772182:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(755546043664528450:ℚ)/2^60,(755546043664528451:ℚ)/2^60⟩
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
end Point237

namespace Point238
/-- Exact original rational input. -/
def input : ℚ := (247:ℚ)/128
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(383632460091042324773426:ℚ)/2^80,(383632460091042324773427:ℚ)/2^80⟩,
  ⟨(121739367335557431061433:ℚ)/2^80,(121739367335557431061435:ℚ)/2^80⟩,
  ⟨(38631959234483558123494:ℚ)/2^80,(38631959234483558123496:ℚ)/2^80⟩,
  ⟨(12259208397076115777855:ℚ)/2^80,(12259208397076115777857:ℚ)/2^80⟩,
  ⟨(3890255464672154073505:ℚ)/2^80,(3890255464672154073507:ℚ)/2^80⟩,
  ⟨(1234507734122630225992:ℚ)/2^80,(1234507734122630225993:ℚ)/2^80⟩,
  ⟨(391750454294914658381:ℚ)/2^80,(391750454294914658382:ℚ)/2^80⟩,
  ⟨(124315477496252918259:ℚ)/2^80,(124315477496252918260:ℚ)/2^80⟩,
  ⟨(39449444858810926060:ℚ)/2^80,(39449444858810926062:ℚ)/2^80⟩,
  ⟨(12518623835196000536:ℚ)/2^80,(12518623835196000538:ℚ)/2^80⟩,
  ⟨(3972576630368864170:ℚ)/2^80,(3972576630368864171:ℚ)/2^80⟩,
  ⟨(1260630984037052896:ℚ)/2^80,(1260630984037052897:ℚ)/2^80⟩,
  ⟨(400040232267758118:ℚ)/2^80,(400040232267758120:ℚ)/2^80⟩,
  ⟨(126946100372968576:ℚ)/2^80,(126946100372968577:ℚ)/2^80⟩,
  ⟨(40284229185022028:ℚ)/2^80,(40284229185022029:ℚ)/2^80⟩,
  ⟨(12783528728046990:ℚ)/2^80,(12783528728046991:ℚ)/2^80⟩,
  ⟨(4056639783033578:ℚ)/2^80,(4056639783033579:ℚ)/2^80⟩,
  ⟨(1287307024482655:ℚ)/2^80,(1287307024482656:ℚ)/2^80⟩,
  ⟨(408505429102495:ℚ)/2^80,(408505429102497:ℚ)/2^80⟩,
  ⟨(129632389501858:ℚ)/2^80,(129632389501860:ℚ)/2^80⟩,
  ⟨(41136678268589:ℚ)/2^80,(41136678268591:ℚ)/2^80⟩,
  ⟨(13054039237232:ℚ)/2^80,(13054039237233:ℚ)/2^80⟩,
  ⟨(4142481784614:ℚ)/2^80,(4142481784616:ℚ)/2^80⟩,
  ⟨(1314547552984:ℚ)/2^80,(1314547552985:ℚ)/2^80⟩,
  ⟨(417149756813:ℚ)/2^80,(417149756814:ℚ)/2^80⟩,
  ⟨(132375522828:ℚ)/2^80,(132375522829:ℚ)/2^80⟩,
  ⟨(42007165910:ℚ)/2^80,(42007165912:ℚ)/2^80⟩,
  ⟨(13330273982:ℚ)/2^80,(13330273983:ℚ)/2^80⟩,
  ⟨(4230140276:ℚ)/2^80,(4230140278:ℚ)/2^80⟩,
  ⟨(1342364514:ℚ)/2^80,(1342364515:ℚ)/2^80⟩,
  ⟨(425977005:ℚ)/2^80,(425977007:ℚ)/2^80⟩,
  ⟨(135176702:ℚ)/2^80,(135176704:ℚ)/2^80⟩,
  ⟨(42896073:ℚ)/2^80,(42896075:ℚ)/2^80⟩,
  ⟨(13612353:ℚ)/2^80,(13612355:ℚ)/2^80⟩,
  ⟨(4319653:ℚ)/2^80,(4319654:ℚ)/2^80⟩,
  ⟨(1370769:ℚ)/2^80,(1370771:ℚ)/2^80⟩,
  ⟨(434990:ℚ)/2^80,(434992:ℚ)/2^80⟩,
  ⟨(138036:ℚ)/2^80,(138038:ℚ)/2^80⟩,
  ⟨(43803:ℚ)/2^80,(43805:ℚ)/2^80⟩,
  ⟨(13900:ℚ)/2^80,(13901:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (247:ℚ)/128,
  ⟨⟨(383632460091042324773426:ℚ)/2^80,(383632460091042324773427:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(757882258252379557:ℚ)/2^60,(757882258252379558:ℚ)/2^60⟩
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
end Point238

namespace Point239
/-- Exact original rational input. -/
def input : ℚ := (495:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(384731386002525130166146:ℚ)/2^80,(384731386002525130166147:ℚ)/2^80⟩,
  ⟨(122437817915583896284565:ℚ)/2^80,(122437817915583896284567:ℚ)/2^80⟩,
  ⟨(38964898111617245288962:ℚ)/2^80,(38964898111617245288964:ℚ)/2^80⟩,
  ⟨(12400280490914143307672:ℚ)/2^80,(12400280490914143307673:ℚ)/2^80⟩,
  ⟨(3946294324005965713094:ℚ)/2^80,(3946294324005965713095:ℚ)/2^80⟩,
  ⟨(1255877953977930499906:ℚ)/2^80,(1255877953977930499907:ℚ)/2^80⟩,
  ⟨(399673543276598388119:ℚ)/2^80,(399673543276598388120:ℚ)/2^80⟩,
  ⟨(127193045064057276645:ℚ)/2^80,(127193045064057276646:ℚ)/2^80⟩,
  ⟨(40478212743421689904:ℚ)/2^80,(40478212743421689905:ℚ)/2^80⟩,
  ⟨(12881881285855903977:ℚ)/2^80,(12881881285855903978:ℚ)/2^80⟩,
  ⟨(4099560089639894874:ℚ)/2^80,(4099560089639894875:ℚ)/2^80⟩,
  ⟨(1304653610418022469:ℚ)/2^80,(1304653610418022471:ℚ)/2^80⟩,
  ⟨(415196022489889973:ℚ)/2^80,(415196022489889975:ℚ)/2^80⟩,
  ⟨(132132955226476302:ℚ)/2^80,(132132955226476304:ℚ)/2^80⟩,
  ⟨(42050301330396586:ℚ)/2^80,(42050301330396587:ℚ)/2^80⟩,
  ⟨(13382186442030338:ℚ)/2^80,(13382186442030339:ℚ)/2^80⟩,
  ⟨(4258778375026965:ℚ)/2^80,(4258778375026966:ℚ)/2^80⟩,
  ⟨(1355323610694333:ℚ)/2^80,(1355323610694335:ℚ)/2^80⟩,
  ⟨(431321362125093:ℚ)/2^80,(431321362125095:ℚ)/2^80⟩,
  ⟨(137264721102393:ℚ)/2^80,(137264721102394:ℚ)/2^80⟩,
  ⟨(43683446529256:ℚ)/2^80,(43683446529258:ℚ)/2^80⟩,
  ⟨(13901922397459:ℚ)/2^80,(13901922397461:ℚ)/2^80⟩,
  ⟨(4424180363505:ℚ)/2^80,(4424180363507:ℚ)/2^80⟩,
  ⟨(1407961527134:ℚ)/2^80,(1407961527135:ℚ)/2^80⟩,
  ⟨(448072976012:ℚ)/2^80,(448072976013:ℚ)/2^80⟩,
  ⟨(142595793963:ℚ)/2^80,(142595793965:ℚ)/2^80⟩,
  ⟨(45380019650:ℚ)/2^80,(45380019651:ℚ)/2^80⟩,
  ⟨(14441843803:ℚ)/2^80,(14441843804:ℚ)/2^80⟩,
  ⟨(4596006216:ℚ)/2^80,(4596006218:ℚ)/2^80⟩,
  ⟨(1462643789:ℚ)/2^80,(1462643790:ℚ)/2^80⟩,
  ⟨(465475187:ℚ)/2^80,(465475188:ℚ)/2^80⟩,
  ⟨(148133914:ℚ)/2^80,(148133915:ℚ)/2^80⟩,
  ⟨(47142483:ℚ)/2^80,(47142485:ℚ)/2^80⟩,
  ⟨(15002734:ℚ)/2^80,(15002735:ℚ)/2^80⟩,
  ⟨(4774505:ℚ)/2^80,(4774506:ℚ)/2^80⟩,
  ⟨(1519449:ℚ)/2^80,(1519450:ℚ)/2^80⟩,
  ⟨(483553:ℚ)/2^80,(483554:ℚ)/2^80⟩,
  ⟨(153887:ℚ)/2^80,(153888:ℚ)/2^80⟩,
  ⟨(48973:ℚ)/2^80,(48974:ℚ)/2^80⟩,
  ⟨(15585:ℚ)/2^80,(15586:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (495:ℚ)/256,
  ⟨⟨(384731386002525130166146:ℚ)/2^80,(384731386002525130166147:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(760213748439458611:ℚ)/2^60,(760213748439458612:ℚ)/2^60⟩
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
end Point239

/-- Reusable proved logarithm bounds for these consecutive exact grid inputs. -/
def entries : Array CertifiedLogBound := #[⟨Point232.input, Point232.bounds, Point232.log_bounds⟩,
  ⟨Point233.input, Point233.bounds, Point233.log_bounds⟩,
  ⟨Point234.input, Point234.bounds, Point234.log_bounds⟩,
  ⟨Point235.input, Point235.bounds, Point235.log_bounds⟩,
  ⟨Point236.input, Point236.bounds, Point236.log_bounds⟩,
  ⟨Point237.input, Point237.bounds, Point237.log_bounds⟩,
  ⟨Point238.input, Point238.bounds, Point238.log_bounds⟩,
  ⟨Point239.input, Point239.bounds, Point239.log_bounds⟩]
end MatrixBounds.Numeric.LogGridData.Part029
