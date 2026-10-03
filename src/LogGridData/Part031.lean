module

public import TabulatedLogBounds
public import FKLLog.GridTrace

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

namespace MatrixBounds.Numeric.LogGridData.Part031
set_option maxRecDepth 100000
set_option maxHeartbeats 16000000

namespace Point248
/-- Exact original rational input. -/
def input : ℚ := (63:ℚ)/32
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(394491583242668467535699:ℚ)/2^80,(394491583242668467535700:ℚ)/2^80⟩,
  ⟨(128728832426554973616912:ℚ)/2^80,(128728832426554973616913:ℚ)/2^80⟩,
  ⟨(42006250581296886127623:ℚ)/2^80,(42006250581296886127625:ℚ)/2^80⟩,
  ⟨(13707302821265299683750:ℚ)/2^80,(13707302821265299683752:ℚ)/2^80⟩,
  ⟨(4472909341676045159960:ℚ)/2^80,(4472909341676045159962:ℚ)/2^80⟩,
  ⟨(1459580943073235789039:ℚ)/2^80,(1459580943073235789041:ℚ)/2^80⟩,
  ⟨(476284307739687468002:ℚ)/2^80,(476284307739687468003:ℚ)/2^80⟩,
  ⟨(155419089894003279032:ℚ)/2^80,(155419089894003279033:ℚ)/2^80⟩,
  ⟨(50715703018043175263:ℚ)/2^80,(50715703018043175264:ℚ)/2^80⟩,
  ⟨(16549334669045667717:ℚ)/2^80,(16549334669045667718:ℚ)/2^80⟩,
  ⟨(5400309207793849465:ℚ)/2^80,(5400309207793849466:ℚ)/2^80⟩,
  ⟨(1762206162543256141:ℚ)/2^80,(1762206162543256142:ℚ)/2^80⟩,
  ⟨(575035695145694109:ℚ)/2^80,(575035695145694110:ℚ)/2^80⟩,
  ⟨(187643226837015972:ℚ)/2^80,(187643226837015973:ℚ)/2^80⟩,
  ⟨(61230947704710475:ℚ)/2^80,(61230947704710476:ℚ)/2^80⟩,
  ⟨(19980625040484470:ℚ)/2^80,(19980625040484472:ℚ)/2^80⟩,
  ⟨(6519993434263353:ℚ)/2^80,(6519993434263355:ℚ)/2^80⟩,
  ⟨(2127576804864883:ℚ)/2^80,(2127576804864885:ℚ)/2^80⟩,
  ⟨(694261904745382:ℚ)/2^80,(694261904745384:ℚ)/2^80⟩,
  ⟨(226548621548493:ℚ)/2^80,(226548621548494:ℚ)/2^80⟩,
  ⟨(73926392294771:ℚ)/2^80,(73926392294772:ℚ)/2^80⟩,
  ⟨(24123349064609:ℚ)/2^80,(24123349064610:ℚ)/2^80⟩,
  ⟨(7871829694767:ℚ)/2^80,(7871829694768:ℚ)/2^80⟩,
  ⟨(2568702321450:ℚ)/2^80,(2568702321451:ℚ)/2^80⟩,
  ⟨(838208125946:ℚ)/2^80,(838208125948:ℚ)/2^80⟩,
  ⟨(273520546361:ℚ)/2^80,(273520546362:ℚ)/2^80⟩,
  ⟨(89254073023:ℚ)/2^80,(89254073024:ℚ)/2^80⟩,
  ⟨(29125013302:ℚ)/2^80,(29125013303:ℚ)/2^80⟩,
  ⟨(9503951709:ℚ)/2^80,(9503951710:ℚ)/2^80⟩,
  ⟨(3101289505:ℚ)/2^80,(3101289506:ℚ)/2^80⟩,
  ⟨(1011999733:ℚ)/2^80,(1011999734:ℚ)/2^80⟩,
  ⟨(330231491:ℚ)/2^80,(330231493:ℚ)/2^80⟩,
  ⟨(107759749:ℚ)/2^80,(107759751:ℚ)/2^80⟩,
  ⟨(35163707:ℚ)/2^80,(35163709:ℚ)/2^80⟩,
  ⟨(11474472:ℚ)/2^80,(11474474:ℚ)/2^80⟩,
  ⟨(3744301:ℚ)/2^80,(3744303:ℚ)/2^80⟩,
  ⟨(1221824:ℚ)/2^80,(1221826:ℚ)/2^80⟩,
  ⟨(398700:ℚ)/2^80,(398702:ℚ)/2^80⟩,
  ⟨(130102:ℚ)/2^80,(130103:ℚ)/2^80⟩,
  ⟨(42454:ℚ)/2^80,(42455:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (63:ℚ)/32,
  ⟨⟨(394491583242668467535699:ℚ)/2^80,(394491583242668467535700:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(780987670914373245:ℚ)/2^60,(780987670914373246:ℚ)/2^60⟩
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
end Point248

namespace Point249
/-- Exact original rational input. -/
def input : ℚ := (505:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(395561799059188783839471:ℚ)/2^80,(395561799059188783839472:ℚ)/2^80⟩,
  ⟨(129428236485858090901482:ℚ)/2^80,(129428236485858090901484:ℚ)/2^80⟩,
  ⟨(42349055039393777443454:ℚ)/2^80,(42349055039393777443456:ℚ)/2^80⟩,
  ⟨(13856655328264192619474:ℚ)/2^80,(13856655328264192619476:ℚ)/2^80⟩,
  ⟨(4533912190194197059459:ℚ)/2^80,(4533912190194197059461:ℚ)/2^80⟩,
  ⟨(1483500834899283926156:ℚ)/2^80,(1483500834899283926158:ℚ)/2^80⟩,
  ⟨(485403032706861626298:ℚ)/2^80,(485403032706861626299:ℚ)/2^80⟩,
  ⟨(158824382580825946055:ℚ)/2^80,(158824382580825946056:ℚ)/2^80⟩,
  ⟨(51967504944317556593:ℚ)/2^80,(51967504944317556594:ℚ)/2^80⟩,
  ⟨(17003822248534916677:ℚ)/2^80,(17003822248534916678:ℚ)/2^80⟩,
  ⟨(5563668514960833446:ℚ)/2^80,(5563668514960833447:ℚ)/2^80⟩,
  ⟨(1820438186892572310:ℚ)/2^80,(1820438186892572311:ℚ)/2^80⟩,
  ⟨(595649288483903423:ℚ)/2^80,(595649288483903424:ℚ)/2^80⟩,
  ⟨(194897073367269319:ℚ)/2^80,(194897073367269321:ℚ)/2^80⟩,
  ⟨(63770527290998765:ℚ)/2^80,(63770527290998767:ℚ)/2^80⟩,
  ⟨(20865783568276862:ℚ)/2^80,(20865783568276864:ℚ)/2^80⟩,
  ⟨(6827306318660891:ℚ)/2^80,(6827306318660893:ℚ)/2^80⟩,
  ⟨(2233901804660396:ℚ)/2^80,(2233901804660398:ℚ)/2^80⟩,
  ⟨(730935018870484:ℚ)/2^80,(730935018870486:ℚ)/2^80⟩,
  ⟨(239162706568660:ℚ)/2^80,(239162706568661:ℚ)/2^80⟩,
  ⟨(78254289008667:ℚ)/2^80,(78254289008669:ℚ)/2^80⟩,
  ⟨(25604885628328:ℚ)/2^80,(25604885628330:ℚ)/2^80⟩,
  ⟨(8377945494682:ℚ)/2^80,(8377945494684:ℚ)/2^80⟩,
  ⟨(2741272573161:ℚ)/2^80,(2741272573163:ℚ)/2^80⟩,
  ⟨(896947267696:ℚ)/2^80,(896947267698:ℚ)/2^80⟩,
  ⟨(293482088904:ℚ)/2^80,(293482088906:ℚ)/2^80⟩,
  ⟨(96027648011:ℚ)/2^80,(96027648013:ℚ)/2^80⟩,
  ⟨(31420347378:ℚ)/2^80,(31420347379:ℚ)/2^80⟩,
  ⟨(10280770692:ℚ)/2^80,(10280770693:ℚ)/2^80⟩,
  ⟨(3363878978:ℚ)/2^80,(3363878979:ℚ)/2^80⟩,
  ⟨(1100664737:ℚ)/2^80,(1100664739:ℚ)/2^80⟩,
  ⟨(360138659:ℚ)/2^80,(360138660:ℚ)/2^80⟩,
  ⟨(117837747:ℚ)/2^80,(117837749:ℚ)/2^80⟩,
  ⟨(38556634:ℚ)/2^80,(38556636:ℚ)/2^80⟩,
  ⟨(12615771:ℚ)/2^80,(12615772:ℚ)/2^80⟩,
  ⟨(4127893:ℚ)/2^80,(4127894:ℚ)/2^80⟩,
  ⟨(1350650:ℚ)/2^80,(1350652:ℚ)/2^80⟩,
  ⟨(441934:ℚ)/2^80,(441935:ℚ)/2^80⟩,
  ⟨(144601:ℚ)/2^80,(144602:ℚ)/2^80⟩,
  ⟨(47313:ℚ)/2^80,(47314:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (505:ℚ)/256,
  ⟨⟨(395561799059188783839471:ℚ)/2^80,(395561799059188783839472:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(783272947192052109:ℚ)/2^60,(783272947192052111:ℚ)/2^60⟩
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
end Point249

namespace Point250
/-- Exact original rational input. -/
def input : ℚ := (253:ℚ)/128
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(396629205910311409024335:ℚ)/2^80,(396629205910311409024336:ℚ)/2^80⟩,
  ⟨(130127692227792457028980:ℚ)/2^80,(130127692227792457028982:ℚ)/2^80⟩,
  ⟨(42692812410693063329717:ℚ)/2^80,(42692812410693063329719:ℚ)/2^80⟩,
  ⟨(14006828218731319990064:ℚ)/2^80,(14006828218731319990066:ℚ)/2^80⟩,
  ⟨(4595416082260931755270:ℚ)/2^80,(4595416082260931755271:ℚ)/2^80⟩,
  ⟨(1507682441686657400022:ℚ)/2^80,(1507682441686657400024:ℚ)/2^80⟩,
  ⟨(494646470369638254600:ℚ)/2^80,(494646470369638254602:ℚ)/2^80⟩,
  ⟨(162285587391613600590:ℚ)/2^80,(162285587391613600592:ℚ)/2^80⟩,
  ⟨(53243302950004462135:ℚ)/2^80,(53243302950004462137:ℚ)/2^80⟩,
  ⟨(17468275246064456081:ℚ)/2^80,(17468275246064456082:ℚ)/2^80⟩,
  ⟨(5731061432435845170:ℚ)/2^80,(5731061432435845172:ℚ)/2^80⟩,
  ⟨(1880269498830657864:ℚ)/2^80,(1880269498830657865:ℚ)/2^80⟩,
  ⟨(616886318513995362:ℚ)/2^80,(616886318513995363:ℚ)/2^80⟩,
  ⟨(202390524446848872:ℚ)/2^80,(202390524446848873:ℚ)/2^80⟩,
  ⟨(66401090697785062:ℚ)/2^80,(66401090697785064:ℚ)/2^80⟩,
  ⟨(21785134743367802:ℚ)/2^80,(21785134743367804:ℚ)/2^80⟩,
  ⟨(7147353918427756:ℚ)/2^80,(7147353918427758:ℚ)/2^80⟩,
  ⟨(2344932387935615:ℚ)/2^80,(2344932387935617:ℚ)/2^80⟩,
  ⟨(769334772944755:ℚ)/2^80,(769334772944757:ℚ)/2^80⟩,
  ⟨(252406421569801:ℚ)/2^80,(252406421569803:ℚ)/2^80⟩,
  ⟨(82810505764370:ℚ)/2^80,(82810505764372:ℚ)/2^80⟩,
  ⟨(27168801103795:ℚ)/2^80,(27168801103797:ℚ)/2^80⟩,
  ⟨(8913648656100:ℚ)/2^80,(8913648656102:ℚ)/2^80⟩,
  ⟨(2924425412106:ℚ)/2^80,(2924425412107:ℚ)/2^80⟩,
  ⟨(959457156202:ℚ)/2^80,(959457156204:ℚ)/2^80⟩,
  ⟨(314782531562:ℚ)/2^80,(314782531563:ℚ)/2^80⟩,
  ⟨(103275108780:ℚ)/2^80,(103275108781:ℚ)/2^80⟩,
  ⟨(33882909704:ℚ)/2^80,(33882909706:ℚ)/2^80⟩,
  ⟨(11116440191:ℚ)/2^80,(11116440193:ℚ)/2^80⟩,
  ⟨(3647126046:ℚ)/2^80,(3647126048:ℚ)/2^80⟩,
  ⟨(1196563663:ℚ)/2^80,(1196563665:ℚ)/2^80⟩,
  ⟨(392573380:ℚ)/2^80,(392573381:ℚ)/2^80⟩,
  ⟨(128797040:ℚ)/2^80,(128797042:ℚ)/2^80⟩,
  ⟨(42256246:ℚ)/2^80,(42256248:ℚ)/2^80⟩,
  ⟨(13863597:ℚ)/2^80,(13863599:ℚ)/2^80⟩,
  ⟨(4548424:ℚ)/2^80,(4548425:ℚ)/2^80⟩,
  ⟨(1492265:ℚ)/2^80,(1492266:ℚ)/2^80⟩,
  ⟨(489588:ℚ)/2^80,(489589:ℚ)/2^80⟩,
  ⟨(160625:ℚ)/2^80,(160627:ℚ)/2^80⟩,
  ⟨(52698:ℚ)/2^80,(52700:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (253:ℚ)/128,
  ⟨⟨(396629205910311409024335:ℚ)/2^80,(396629205910311409024336:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(785553702643282502:ℚ)/2^60,(785553702643282503:ℚ)/2^60⟩
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
end Point250

namespace Point251
/-- Exact original rational input. -/
def input : ℚ := (507:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(397693814840461235715924:ℚ)/2^80,(397693814840461235715925:ℚ)/2^80⟩,
  ⟨(130827192037949895366575:ℚ)/2^80,(130827192037949895366576:ℚ)/2^80⟩,
  ⟨(43037516646822311581927:ℚ)/2^80,(43037516646822311581928:ℚ)/2^80⟩,
  ⟨(14157820024052949157357:ℚ)/2^80,(14157820024052949157358:ℚ)/2^80⟩,
  ⟨(4657421790350314860414:ℚ)/2^80,(4657421790350314860416:ℚ)/2^80⟩,
  ⟨(1532126958555608165090:ℚ)/2^80,(1532126958555608165091:ℚ)/2^80⟩,
  ⟨(504015552552369134256:ℚ)/2^80,(504015552552369134257:ℚ)/2^80⟩,
  ⟨(165803281376991681124:ℚ)/2^80,(165803281376991681126:ℚ)/2^80⟩,
  ⟨(54543412353374720789:ℚ)/2^80,(54543412353374720790:ℚ)/2^80⟩,
  ⟨(17942852556614750875:ℚ)/2^80,(17942852556614750876:ℚ)/2^80⟩,
  ⟨(5902563554010881349:ℚ)/2^80,(5902563554010881350:ℚ)/2^80⟩,
  ⟨(1941734537426908543:ℚ)/2^80,(1941734537426908544:ℚ)/2^80⟩,
  ⟨(638761951368484985:ℚ)/2^80,(638761951368484987:ℚ)/2^80⟩,
  ⟨(210130078366303710:ℚ)/2^80,(210130078366303712:ℚ)/2^80⟩,
  ⟨(69125359986818127:ℚ)/2^80,(69125359986818129:ℚ)/2^80⟩,
  ⟨(22739797322007011:ℚ)/2^80,(22739797322007013:ℚ)/2^80⟩,
  ⟨(7480588634107155:ℚ)/2^80,(7480588634107157:ℚ)/2^80⟩,
  ⟨(2460848947786233:ℚ)/2^80,(2460848947786234:ℚ)/2^80⟩,
  ⟨(809532222666244:ℚ)/2^80,(809532222666245:ℚ)/2^80⟩,
  ⟨(266307454638567:ℚ)/2^80,(266307454638569:ℚ)/2^80⟩,
  ⟨(87605728852267:ℚ)/2^80,(87605728852269:ℚ)/2^80⟩,
  ⟨(28819184720732:ℚ)/2^80,(28819184720734:ℚ)/2^80⟩,
  ⟨(9480491959244:ℚ)/2^80,(9480491959246:ℚ)/2^80⟩,
  ⟨(3118746371913:ℚ)/2^80,(3118746371915:ℚ)/2^80⟩,
  ⟨(1025957194430:ℚ)/2^80,(1025957194431:ℚ)/2^80⟩,
  ⟨(337503611798:ℚ)/2^80,(337503611799:ℚ)/2^80⟩,
  ⟨(111026745165:ℚ)/2^80,(111026745166:ℚ)/2^80⟩,
  ⟨(36523870296:ℚ)/2^80,(36523870298:ℚ)/2^80⟩,
  ⟨(12015060870:ℚ)/2^80,(12015060872:ℚ)/2^80⟩,
  ⟨(3952529853:ℚ)/2^80,(3952529855:ℚ)/2^80⟩,
  ⟨(1300242454:ℚ)/2^80,(1300242456:ℚ)/2^80⟩,
  ⟨(427733756:ℚ)/2^80,(427733757:ℚ)/2^80⟩,
  ⟨(140709269:ℚ)/2^80,(140709270:ℚ)/2^80⟩,
  ⟨(46288370:ℚ)/2^80,(46288371:ℚ)/2^80⟩,
  ⟨(15227235:ℚ)/2^80,(15227237:ℚ)/2^80⟩,
  ⟨(5009221:ℚ)/2^80,(5009223:ℚ)/2^80⟩,
  ⟨(1647856:ℚ)/2^80,(1647858:ℚ)/2^80⟩,
  ⟨(542086:ℚ)/2^80,(542087:ℚ)/2^80⟩,
  ⟨(178327:ℚ)/2^80,(178328:ℚ)/2^80⟩,
  ⟨(58663:ℚ)/2^80,(58664:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (507:ℚ)/256,
  ⟨⟨(397693814840461235715924:ℚ)/2^80,(397693814840461235715925:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(787829955119321531:ℚ)/2^60,(787829955119321532:ℚ)/2^60⟩
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
end Point251

namespace Point252
/-- Exact original rational input. -/
def input : ℚ := (127:ℚ)/64
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(398755636836238942442351:ℚ)/2^80,(398755636836238942442352:ℚ)/2^80⟩,
  ⟨(131526728380539546460042:ℚ)/2^80,(131526728380539546460044:ℚ)/2^80⟩,
  ⟨(43383161717141316371636:ℚ)/2^80,(43383161717141316371638:ℚ)/2^80⟩,
  ⟨(14309629257486402782267:ℚ)/2^80,(14309629257486402782269:ℚ)/2^80⟩,
  ⟨(4719930069223263744936:ℚ)/2^80,(4719930069223263744937:ℚ)/2^80⟩,
  ⟨(1556835572571024167177:ℚ)/2^80,(1556835572571024167179:ℚ)/2^80⟩,
  ⟨(513511209800913730534:ℚ)/2^80,(513511209800913730536:ℚ)/2^80⟩,
  ⟨(169378043023338036772:ℚ)/2^80,(169378043023338036774:ℚ)/2^80⟩,
  ⟨(55868150316598410034:ℚ)/2^80,(55868150316598410036:ℚ)/2^80⟩,
  ⟨(18427714502333506974:ℚ)/2^80,(18427714502333506976:ℚ)/2^80⟩,
  ⟨(6078251380350842614:ℚ)/2^80,(6078251380350842616:ℚ)/2^80⟩,
  ⟨(2004868256346089448:ℚ)/2^80,(2004868256346089450:ℚ)/2^80⟩,
  ⟨(661291623820961440:ℚ)/2^80,(661291623820961442:ℚ)/2^80⟩,
  ⟨(218122368066599846:ℚ)/2^80,(218122368066599848:ℚ)/2^80⟩,
  ⟨(71946121404166441:ℚ)/2^80,(71946121404166443:ℚ)/2^80⟩,
  ⟨(23730919625458040:ℚ)/2^80,(23730919625458042:ℚ)/2^80⟩,
  ⟨(7827476106826473:ℚ)/2^80,(7827476106826475:ℚ)/2^80⟩,
  ⟨(2581837668743810:ℚ)/2^80,(2581837668743812:ℚ)/2^80⟩,
  ⟨(851600906444293:ℚ)/2^80,(851600906444295:ℚ)/2^80⟩,
  ⟨(280894539821939:ℚ)/2^80,(280894539821941:ℚ)/2^80⟩,
  ⟨(92651078580011:ℚ)/2^80,(92651078580012:ℚ)/2^80⟩,
  ⟨(30560303405972:ℚ)/2^80,(30560303405973:ℚ)/2^80⟩,
  ⟨(10080100076315:ℚ)/2^80,(10080100076316:ℚ)/2^80⟩,
  ⟨(3324849763391:ℚ)/2^80,(3324849763393:ℚ)/2^80⟩,
  ⟨(1096678194207:ℚ)/2^80,(1096678194209:ℚ)/2^80⟩,
  ⟨(361731550968:ℚ)/2^80,(361731550970:ℚ)/2^80⟩,
  ⟨(119314595345:ℚ)/2^80,(119314595347:ℚ)/2^80⟩,
  ⟨(39355075951:ℚ)/2^80,(39355075953:ℚ)/2^80⟩,
  ⟨(12980993638:ℚ)/2^80,(12980993639:ℚ)/2^80⟩,
  ⟨(4281689001:ℚ)/2^80,(4281689002:ℚ)/2^80⟩,
  ⟨(1412284853:ℚ)/2^80,(1412284855:ℚ)/2^80⟩,
  ⟨(465832176:ℚ)/2^80,(465832178:ℚ)/2^80⟩,
  ⟨(153651450:ℚ)/2^80,(153651452:ℚ)/2^80⟩,
  ⟨(50680844:ℚ)/2^80,(50680846:ℚ)/2^80⟩,
  ⟨(16716718:ℚ)/2^80,(16716719:ℚ)/2^80⟩,
  ⟨(5513891:ℚ)/2^80,(5513892:ℚ)/2^80⟩,
  ⟨(1818717:ℚ)/2^80,(1818719:ℚ)/2^80⟩,
  ⟨(599890:ℚ)/2^80,(599892:ℚ)/2^80⟩,
  ⟨(197869:ℚ)/2^80,(197871:ℚ)/2^80⟩,
  ⟨(65265:ℚ)/2^80,(65267:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (127:ℚ)/64,
  ⟨⟨(398755636836238942442351:ℚ)/2^80,(398755636836238942442352:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(790101722365901496:ℚ)/2^60,(790101722365901497:ℚ)/2^60⟩
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
end Point252

namespace Point253
/-- Exact original rational input. -/
def input : ℚ := (509:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(399814682826798929674068:ℚ)/2^80,(399814682826798929674069:ℚ)/2^80⟩,
  ⟨(132226293797621083931423:ℚ)/2^80,(132226293797621083931425:ℚ)/2^80⟩,
  ⟨(43729741608886449979934:ℚ)/2^80,(43729741608886449979936:ℚ)/2^80⟩,
  ⟨(14462254414442185418200:ℚ)/2^80,(14462254414442185418202:ℚ)/2^80⟩,
  ⟨(4782941656018134523927:ℚ)/2^80,(4782941656018134523929:ℚ)/2^80⟩,
  ⟨(1581809462709265404645:ℚ)/2^80,(1581809462709265404646:ℚ)/2^80⟩,
  ⟨(523134371327377970425:ℚ)/2^80,(523134371327377970426:ℚ)/2^80⟩,
  ⟨(173010452216766832049:ℚ)/2^80,(173010452216766832050:ℚ)/2^80⟩,
  ⟨(57217835831166024193:ℚ)/2^80,(57217835831166024195:ℚ)/2^80⟩,
  ⟨(18923022830437913883:ℚ)/2^80,(18923022830437913885:ℚ)/2^80⟩,
  ⟨(6258202321700381976:ℚ)/2^80,(6258202321700381978:ℚ)/2^80⟩,
  ⟨(2069706127307446588:ℚ)/2^80,(2069706127307446589:ℚ)/2^80⟩,
  ⟨(684491046024554231:ℚ)/2^80,(684491046024554232:ℚ)/2^80⟩,
  ⟨(226374162933610745:ℚ)/2^80,(226374162933610747:ℚ)/2^80⟩,
  ⟨(74866226434252965:ℚ)/2^80,(74866226434252967:ℚ)/2^80⟩,
  ⟨(24759680114857516:ℚ)/2^80,(24759680114857518:ℚ)/2^80⟩,
  ⟨(8188495515109740:ℚ)/2^80,(8188495515109742:ℚ)/2^80⟩,
  ⟨(2708090673624528:ℚ)/2^80,(2708090673624530:ℚ)/2^80⟩,
  ⟨(895616915590856:ℚ)/2^80,(895616915590858:ℚ)/2^80⟩,
  ⟨(296197489731354:ℚ)/2^80,(296197489731356:ℚ)/2^80⟩,
  ⟨(97958124054944:ℚ)/2^80,(97958124054946:ℚ)/2^80⟩,
  ⟨(32396608347582:ℚ)/2^80,(32396608347584:ℚ)/2^80⟩,
  ⟨(10714172433906:ℚ)/2^80,(10714172433907:ℚ)/2^80⟩,
  ⟨(3543379902978:ℚ)/2^80,(3543379902979:ℚ)/2^80⟩,
  ⟨(1171862896017:ℚ)/2^80,(1171862896018:ℚ)/2^80⟩,
  ⟨(387557271493:ℚ)/2^80,(387557271494:ℚ)/2^80⟩,
  ⟨(128172535539:ℚ)/2^80,(128172535540:ℚ)/2^80⟩,
  ⟨(42389086916:ℚ)/2^80,(42389086918:ℚ)/2^80⟩,
  ⟨(14018874496:ℚ)/2^80,(14018874498:ℚ)/2^80⟩,
  ⟨(4636307513:ℚ)/2^80,(4636307514:ℚ)/2^80⟩,
  ⟨(1533314772:ℚ)/2^80,(1533314773:ℚ)/2^80⟩,
  ⟨(507096257:ℚ)/2^80,(507096259:ℚ)/2^80⟩,
  ⟨(167706343:ℚ)/2^80,(167706345:ℚ)/2^80⟩,
  ⟨(55463666:ℚ)/2^80,(55463668:ℚ)/2^80⟩,
  ⟨(18342885:ℚ)/2^80,(18342887:ℚ)/2^80⟩,
  ⟨(6066339:ℚ)/2^80,(6066341:ℚ)/2^80⟩,
  ⟨(2006253:ℚ)/2^80,(2006254:ℚ)/2^80⟩,
  ⟨(663505:ℚ)/2^80,(663507:ℚ)/2^80⟩,
  ⟨(219433:ℚ)/2^80,(219435:ℚ)/2^80⟩,
  ⟨(72570:ℚ)/2^80,(72572:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (509:ℚ)/256,
  ⟨⟨(399814682826798929674068:ℚ)/2^80,(399814682826798929674069:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(792369022024059974:ℚ)/2^60,(792369022024059975:ℚ)/2^60⟩
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
end Point253

namespace Point254
/-- Exact original rational input. -/
def input : ℚ := (255:ℚ)/128
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(400870963684224295529201:ℚ)/2^80,(400870963684224295529202:ℚ)/2^80⟩,
  ⟨(132925880908345915227698:ℚ)/2^80,(132925880908345915227699:ℚ)/2^80⟩,
  ⟨(44077250327310525414928:ℚ)/2^80,(44077250327310525414929:ℚ)/2^80⟩,
  ⟨(14615693972763542369963:ℚ)/2^80,(14615693972763542369964:ℚ)/2^80⟩,
  ⟨(4846457270341957913799:ℚ)/2^80,(4846457270341957913801:ℚ)/2^80⟩,
  ⟨(1607049799826184477943:ℚ)/2^80,(1607049799826184477945:ℚ)/2^80⟩,
  ⟨(532885964955418873887:ℚ)/2^80,(532885964955418873888:ℚ)/2^80⟩,
  ⟨(176701090207149339382:ℚ)/2^80,(176701090207149339384:ℚ)/2^80⟩,
  ⟨(58592789703153958489:ℚ)/2^80,(58592789703153958491:ℚ)/2^80⟩,
  ⟨(19428940710967500595:ℚ)/2^80,(19428940710967500597:ℚ)/2^80⟩,
  ⟨(6442494700503583748:ℚ)/2^80,(6442494700503583749:ℚ)/2^80⟩,
  ⟨(2136284143509021242:ℚ)/2^80,(2136284143509021244:ℚ)/2^80⟩,
  ⟨(708376204244505738:ℚ)/2^80,(708376204244505739:ℚ)/2^80⟩,
  ⟨(234892370598047594:ℚ)/2^80,(234892370598047595:ℚ)/2^80⟩,
  ⟨(77888592861493588:ℚ)/2^80,(77888592861493589:ℚ)/2^80⟩,
  ⟨(25827287972349048:ℚ)/2^80,(25827287972349050:ℚ)/2^80⟩,
  ⟨(8564139875948639:ℚ)/2^80,(8564139875948641:ℚ)/2^80⟩,
  ⟨(2839806172964692:ℚ)/2^80,(2839806172964693:ℚ)/2^80⟩,
  ⟨(941658965970015:ℚ)/2^80,(941658965970016:ℚ)/2^80⟩,
  ⟨(312247228924783:ℚ)/2^80,(312247228924784:ℚ)/2^80⟩,
  ⟨(103538898364092:ℚ)/2^80,(103538898364093:ℚ)/2^80⟩,
  ⟨(34332741755194:ℚ)/2^80,(34332741755196:ℚ)/2^80⟩,
  ⟨(11384486169476:ℚ)/2^80,(11384486169478:ℚ)/2^80⟩,
  ⟨(3775012385178:ℚ)/2^80,(3775012385180:ℚ)/2^80⟩,
  ⟨(1251766508923:ℚ)/2^80,(1251766508924:ℚ)/2^80⟩,
  ⟨(415076623063:ℚ)/2^80,(415076623064:ℚ)/2^80⟩,
  ⟨(137636373704:ℚ)/2^80,(137636373706:ℚ)/2^80⟩,
  ⟨(45639215301:ℚ)/2^80,(45639215302:ℚ)/2^80⟩,
  ⟨(15133630138:ℚ)/2^80,(15133630140:ℚ)/2^80⟩,
  ⟨(5018201116:ℚ)/2^80,(5018201117:ℚ)/2^80⟩,
  ⟨(1663998803:ℚ)/2^80,(1663998804:ℚ)/2^80⟩,
  ⟨(551769838:ℚ)/2^80,(551769839:ℚ)/2^80⟩,
  ⟨(182962844:ℚ)/2^80,(182962845:ℚ)/2^80⟩,
  ⟨(60669141:ℚ)/2^80,(60669142:ℚ)/2^80⟩,
  ⟨(20117443:ℚ)/2^80,(20117444:ℚ)/2^80⟩,
  ⟨(6670797:ℚ)/2^80,(6670798:ℚ)/2^80⟩,
  ⟨(2211987:ℚ)/2^80,(2211988:ℚ)/2^80⟩,
  ⟨(733478:ℚ)/2^80,(733480:ℚ)/2^80⟩,
  ⟨(243215:ℚ)/2^80,(243217:ℚ)/2^80⟩,
  ⟨(80648:ℚ)/2^80,(80649:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (255:ℚ)/128,
  ⟨⟨(400870963684224295529201:ℚ)/2^80,(400870963684224295529202:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(794631871630961765:ℚ)/2^60,(794631871630961766:ℚ)/2^60⟩
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
end Point254

namespace Point255
/-- Exact original rational input. -/
def input : ℚ := (511:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(401924490223898878161766:ℚ)/2^80,(401924490223898878161767:ℚ)/2^80⟩,
  ⟨(133625482408206276311929:ℚ)/2^80,(133625482408206276311931:ℚ)/2^80⟩,
  ⟨(44425681895818253532649:ℚ)/2^80,(44425681895818253532650:ℚ)/2^80⟩,
  ⟨(14769946393003461083214:ℚ)/2^80,(14769946393003461083215:ℚ)/2^80⟩,
  ⟨(4910477614362298013324:ℚ)/2^80,(4910477614362298013325:ℚ)/2^80⟩,
  ⟨(1632557746626318113947:ℚ)/2^80,(1632557746626318113948:ℚ)/2^80⟩,
  ⟨(542766917066116191729:ℚ)/2^80,(542766917066116191730:ℚ)/2^80⟩,
  ⟨(180450539572176830366:ℚ)/2^80,(180450539572176830367:ℚ)/2^80⟩,
  ⟨(59993334538337798883:ℚ)/2^80,(59993334538337798884:ℚ)/2^80⟩,
  ⟨(19945632734388707581:ℚ)/2^80,(19945632734388707583:ℚ)/2^80⟩,
  ⟨(6631207753936271751:ℚ)/2^80,(6631207753936271752:ℚ)/2^80⟩,
  ⟨(2204638823016622290:ℚ)/2^80,(2204638823016622291:ℚ)/2^80⟩,
  ⟨(732963363584405063:ℚ)/2^80,(732963363584405065:ℚ)/2^80⟩,
  ⟨(243684038740577954:ℚ)/2^80,(243684038740577956:ℚ)/2^80⟩,
  ⟨(81016205839435956:ℚ)/2^80,(81016205839435957:ℚ)/2^80⟩,
  ⟨(26934983688469581:ℚ)/2^80,(26934983688469582:ℚ)/2^80⟩,
  ⟨(8954916350143081:ℚ)/2^80,(8954916350143082:ℚ)/2^80⟩,
  ⟨(2977188617061910:ℚ)/2^80,(2977188617061912:ℚ)/2^80⟩,
  ⟨(989808471122277:ℚ)/2^80,(989808471122279:ℚ)/2^80⟩,
  ⟨(329075828078462:ℚ)/2^80,(329075828078464:ℚ)/2^80⟩,
  ⟨(109405914159071:ℚ)/2^80,(109405914159073:ℚ)/2^80⟩,
  ⟨(36373543820812:ℚ)/2^80,(36373543820814:ℚ)/2^80⟩,
  ⟨(12092899184233:ℚ)/2^80,(12092899184235:ℚ)/2^80⟩,
  ⟨(4020455400233:ℚ)/2^80,(4020455400235:ℚ)/2^80⟩,
  ⟨(1336657271263:ℚ)/2^80,(1336657271265:ℚ)/2^80⟩,
  ⟨(444390618216:ℚ)/2^80,(444390618218:ℚ)/2^80⟩,
  ⟨(147743947386:ℚ)/2^80,(147743947387:ℚ)/2^80⟩,
  ⟨(49119565297:ℚ)/2^80,(49119565299:ℚ)/2^80⟩,
  ⟨(16330494329:ℚ)/2^80,(16330494331:ℚ)/2^80⟩,
  ⟨(5429303851:ℚ)/2^80,(5429303852:ℚ)/2^80⟩,
  ⟨(1805048868:ℚ)/2^80,(1805048869:ℚ)/2^80⟩,
  ⟨(600114030:ℚ)/2^80,(600114031:ℚ)/2^80⟩,
  ⟨(199516398:ℚ)/2^80,(199516399:ℚ)/2^80⟩,
  ⟨(66332048:ℚ)/2^80,(66332050:ℚ)/2^80⟩,
  ⟨(22053027:ℚ)/2^80,(22053029:ℚ)/2^80⟩,
  ⟨(7331840:ℚ)/2^80,(7331842:ℚ)/2^80⟩,
  ⟨(2437573:ℚ)/2^80,(2437575:ℚ)/2^80⟩,
  ⟨(810405:ℚ)/2^80,(810407:ℚ)/2^80⟩,
  ⟨(269430:ℚ)/2^80,(269432:ℚ)/2^80⟩,
  ⟨(89575:ℚ)/2^80,(89577:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (511:ℚ)/256,
  ⟨⟨(401924490223898878161766:ℚ)/2^80,(401924490223898878161767:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(796890288620712779:ℚ)/2^60,(796890288620712780:ℚ)/2^60⟩
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
end Point255

/-- Reusable proved logarithm bounds for these consecutive exact grid inputs. -/
def entries : Array CertifiedLogBound := #[⟨Point248.input, Point248.bounds, Point248.log_bounds⟩,
  ⟨Point249.input, Point249.bounds, Point249.log_bounds⟩,
  ⟨Point250.input, Point250.bounds, Point250.log_bounds⟩,
  ⟨Point251.input, Point251.bounds, Point251.log_bounds⟩,
  ⟨Point252.input, Point252.bounds, Point252.log_bounds⟩,
  ⟨Point253.input, Point253.bounds, Point253.log_bounds⟩,
  ⟨Point254.input, Point254.bounds, Point254.log_bounds⟩,
  ⟨Point255.input, Point255.bounds, Point255.log_bounds⟩]
end MatrixBounds.Numeric.LogGridData.Part031
