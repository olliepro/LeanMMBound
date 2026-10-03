module

public import TabulatedLogBounds
public import FKLLog.GridTrace

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

namespace MatrixBounds.Numeric.LogGridData.Part022
set_option maxRecDepth 100000
set_option maxHeartbeats 16000000

namespace Point176
/-- Exact original rational input. -/
def input : ℚ := (27:ℚ)/16
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(309260093389788858645765:ℚ)/2^80,(309260093389788858645766:ℚ)/2^80⟩,
  ⟨(79113047146225056862869:ℚ)/2^80,(79113047146225056862871:ℚ)/2^80⟩,
  ⟨(20238221362987805243989:ℚ)/2^80,(20238221362987805243991:ℚ)/2^80⟩,
  ⟨(5177219418438740876369:ℚ)/2^80,(5177219418438740876370:ℚ)/2^80⟩,
  ⟨(1324404967507584875350:ℚ)/2^80,(1324404967507584875351:ℚ)/2^80⟩,
  ⟨(338801270757754270438:ℚ)/2^80,(338801270757754270439:ℚ)/2^80⟩,
  ⟨(86670092519425511042:ℚ)/2^80,(86670092519425511043:ℚ)/2^80⟩,
  ⟨(22171419016597223754:ℚ)/2^80,(22171419016597223756:ℚ)/2^80⟩,
  ⟨(5671758353083010727:ℚ)/2^80,(5671758353083010729:ℚ)/2^80⟩,
  ⟨(1450914927532863209:ℚ)/2^80,(1450914927532863210:ℚ)/2^80⟩,
  ⟨(371164283787476634:ℚ)/2^80,(371164283787476636:ℚ)/2^80⟩,
  ⟨(94949002829354487:ℚ)/2^80,(94949002829354489:ℚ)/2^80⟩,
  ⟨(24289279793555798:ℚ)/2^80,(24289279793555800:ℚ)/2^80⟩,
  ⟨(6213536691374739:ℚ)/2^80,(6213536691374740:ℚ)/2^80⟩,
  ⟨(1589509386165630:ℚ)/2^80,(1589509386165632:ℚ)/2^80⟩,
  ⟨(406618680181905:ℚ)/2^80,(406618680181906:ℚ)/2^80⟩,
  ⟨(104018732139557:ℚ)/2^80,(104018732139558:ℚ)/2^80⟩,
  ⟨(26609443105468:ℚ)/2^80,(26609443105469:ℚ)/2^80⟩,
  ⟨(6807066840933:ℚ)/2^80,(6807066840934:ℚ)/2^80⟩,
  ⟨(1741342680238:ℚ)/2^80,(1741342680239:ℚ)/2^80⟩,
  ⟨(445459755409:ℚ)/2^80,(445459755410:ℚ)/2^80⟩,
  ⟨(113954821151:ℚ)/2^80,(113954821152:ℚ)/2^80⟩,
  ⟨(29151233317:ℚ)/2^80,(29151233318:ℚ)/2^80⟩,
  ⟨(7457292243:ℚ)/2^80,(7457292245:ℚ)/2^80⟩,
  ⟨(1907679410:ℚ)/2^80,(1907679412:ℚ)/2^80⟩,
  ⟨(488011011:ℚ)/2^80,(488011013:ℚ)/2^80⟩,
  ⟨(124840026:ℚ)/2^80,(124840027:ℚ)/2^80⟩,
  ⟨(31935820:ℚ)/2^80,(31935821:ℚ)/2^80⟩,
  ⟨(8169628:ℚ)/2^80,(8169629:ℚ)/2^80⟩,
  ⟨(2089904:ℚ)/2^80,(2089906:ℚ)/2^80⟩,
  ⟨(534626:ℚ)/2^80,(534628:ℚ)/2^80⟩,
  ⟨(136764:ℚ)/2^80,(136766:ℚ)/2^80⟩,
  ⟨(34986:ℚ)/2^80,(34987:ℚ)/2^80⟩,
  ⟨(8949:ℚ)/2^80,(8951:ℚ)/2^80⟩,
  ⟨(2289:ℚ)/2^80,(2290:ℚ)/2^80⟩,
  ⟨(585:ℚ)/2^80,(586:ℚ)/2^80⟩,
  ⟨(149:ℚ)/2^80,(150:ℚ)/2^80⟩,
  ⟨(38:ℚ)/2^80,(39:ℚ)/2^80⟩,
  ⟨(9:ℚ)/2^80,(10:ℚ)/2^80⟩,
  ⟨(2:ℚ)/2^80,(3:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (27:ℚ)/16,
  ⟨⟨(309260093389788858645765:ℚ)/2^80,(309260093389788858645766:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(603264037191762267:ℚ)/2^60,(603264037191762268:ℚ)/2^60⟩
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
end Point176

namespace Point177
/-- Exact original rational input. -/
def input : ℚ := (433:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(310565849160797335156738:ℚ)/2^80,(310565849160797335156739:ℚ)/2^80⟩,
  ⟨(79782518579769417014139:ℚ)/2^80,(79782518579769417014141:ℚ)/2^80⟩,
  ⟨(20495654265049618013791:ℚ)/2^80,(20495654265049618013793:ℚ)/2^80⟩,
  ⟨(5265211618162238589899:ℚ)/2^80,(5265211618162238589901:ℚ)/2^80⟩,
  ⟨(1352601533257933570990:ℚ)/2^80,(1352601533257933570991:ℚ)/2^80⟩,
  ⟨(347475285031428508077:ℚ)/2^80,(347475285031428508078:ℚ)/2^80⟩,
  ⟨(89264333019684827183:ℚ)/2^80,(89264333019684827185:ℚ)/2^80⟩,
  ⟨(22931475971675202338:ℚ)/2^80,(22931475971675202340:ℚ)/2^80⟩,
  ⟨(5890959719864311776:ℚ)/2^80,(5890959719864311777:ℚ)/2^80⟩,
  ⟨(1513352496975302154:ℚ)/2^80,(1513352496975302155:ℚ)/2^80⟩,
  ⟨(388771251037196634:ℚ)/2^80,(388771251037196635:ℚ)/2^80⟩,
  ⟨(99873020948597683:ℚ)/2^80,(99873020948597685:ℚ)/2^80⟩,
  ⟨(25656784771990986:ℚ)/2^80,(25656784771990988:ℚ)/2^80⟩,
  ⟨(6591075333298119:ℚ)/2^80,(6591075333298121:ℚ)/2^80⟩,
  ⟨(1693208031921287:ℚ)/2^80,(1693208031921288:ℚ)/2^80⟩,
  ⟨(434975067706919:ℚ)/2^80,(434975067706921:ℚ)/2^80⟩,
  ⟨(111742506508163:ℚ)/2^80,(111742506508165:ℚ)/2^80⟩,
  ⟨(28705984981052:ℚ)/2^80,(28705984981053:ℚ)/2^80⟩,
  ⟨(7374396722273:ℚ)/2^80,(7374396722274:ℚ)/2^80⟩,
  ⟨(1894438635475:ℚ)/2^80,(1894438635476:ℚ)/2^80⟩,
  ⟨(486670012306:ℚ)/2^80,(486670012307:ℚ)/2^80⟩,
  ⟨(125022630156:ℚ)/2^80,(125022630158:ℚ)/2^80⟩,
  ⟨(32117569720:ℚ)/2^80,(32117569722:ℚ)/2^80⟩,
  ⟨(8250812540:ℚ)/2^80,(8250812542:ℚ)/2^80⟩,
  ⟨(2119584643:ℚ)/2^80,(2119584645:ℚ)/2^80⟩,
  ⟨(544508681:ℚ)/2^80,(544508683:ℚ)/2^80⟩,
  ⟨(139881039:ℚ)/2^80,(139881041:ℚ)/2^80⟩,
  ⟨(35934606:ℚ)/2^80,(35934608:ℚ)/2^80⟩,
  ⟨(9231386:ℚ)/2^80,(9231387:ℚ)/2^80⟩,
  ⟨(2371488:ℚ)/2^80,(2371489:ℚ)/2^80⟩,
  ⟨(609221:ℚ)/2^80,(609222:ℚ)/2^80⟩,
  ⟨(156505:ℚ)/2^80,(156506:ℚ)/2^80⟩,
  ⟨(40205:ℚ)/2^80,(40206:ℚ)/2^80⟩,
  ⟨(10328:ℚ)/2^80,(10329:ℚ)/2^80⟩,
  ⟨(2653:ℚ)/2^80,(2654:ℚ)/2^80⟩,
  ⟨(681:ℚ)/2^80,(682:ℚ)/2^80⟩,
  ⟨(174:ℚ)/2^80,(176:ℚ)/2^80⟩,
  ⟨(44:ℚ)/2^80,(46:ℚ)/2^80⟩,
  ⟨(11:ℚ)/2^80,(12:ℚ)/2^80⟩,
  ⟨(2:ℚ)/2^80,(4:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (433:ℚ)/256,
  ⟨⟨(310565849160797335156738:ℚ)/2^80,(310565849160797335156739:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(605929752840854512:ℚ)/2^60,(605929752840854513:ℚ)/2^60⟩
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
end Point177

namespace Point178
/-- Exact original rational input. -/
def input : ℚ := (217:ℚ)/128
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(311867820132469555214056:ℚ)/2^80,(311867820132469555214057:ℚ)/2^80⟩,
  ⟨(80452857947216783808843:ℚ)/2^80,(80452857947216783808844:ℚ)/2^80⟩,
  ⟨(20754505383484909446339:ℚ)/2^80,(20754505383484909446340:ℚ)/2^80⟩,
  ⟨(5354060809072918668765:ℚ)/2^80,(5354060809072918668766:ℚ)/2^80⟩,
  ⟨(1381192498572434091362:ℚ)/2^80,(1381192498572434091363:ℚ)/2^80⟩,
  ⟨(356307630066511982989:ℚ)/2^80,(356307630066511982990:ℚ)/2^80⟩,
  ⟨(91917040799766859379:ℚ)/2^80,(91917040799766859381:ℚ)/2^80⟩,
  ⟨(23711932264287682564:ℚ)/2^80,(23711932264287682565:ℚ)/2^80⟩,
  ⟨(6116991221801749994:ℚ)/2^80,(6116991221801749996:ℚ)/2^80⟩,
  ⟨(1578006431131465940:ℚ)/2^80,(1578006431131465941:ℚ)/2^80⟩,
  ⟨(407079919915073822:ℚ)/2^80,(407079919915073823:ℚ)/2^80⟩,
  ⟨(105014819920120493:ℚ)/2^80,(105014819920120494:ℚ)/2^80⟩,
  ⟨(27090779631567315:ℚ)/2^80,(27090779631567316:ℚ)/2^80⟩,
  ⟨(6988635904955046:ℚ)/2^80,(6988635904955047:ℚ)/2^80⟩,
  ⟨(1802865494321736:ℚ)/2^80,(1802865494321737:ℚ)/2^80⟩,
  ⟨(465087040564157:ℚ)/2^80,(465087040564159:ℚ)/2^80⟩,
  ⟨(119978975681768:ℚ)/2^80,(119978975681769:ℚ)/2^80⟩,
  ⟨(30951098074427:ℚ)/2^80,(30951098074428:ℚ)/2^80⟩,
  ⟨(7984486169924:ℚ)/2^80,(7984486169925:ℚ)/2^80⟩,
  ⟨(2059765997458:ℚ)/2^80,(2059765997459:ℚ)/2^80⟩,
  ⟨(531359923981:ℚ)/2^80,(531359923983:ℚ)/2^80⟩,
  ⟨(137075458650:ℚ)/2^80,(137075458651:ℚ)/2^80⟩,
  ⟨(35361495129:ℚ)/2^80,(35361495131:ℚ)/2^80⟩,
  ⟨(9122240772:ℚ)/2^80,(9122240773:ℚ)/2^80⟩,
  ⟨(2353273706:ℚ)/2^80,(2353273707:ℚ)/2^80⟩,
  ⟨(607076405:ℚ)/2^80,(607076406:ℚ)/2^80⟩,
  ⟨(156608116:ℚ)/2^80,(156608117:ℚ)/2^80⟩,
  ⟨(40400354:ℚ)/2^80,(40400355:ℚ)/2^80⟩,
  ⟨(10422120:ℚ)/2^80,(10422121:ℚ)/2^80⟩,
  ⟨(2688604:ℚ)/2^80,(2688606:ℚ)/2^80⟩,
  ⟨(693581:ℚ)/2^80,(693583:ℚ)/2^80⟩,
  ⟨(178923:ℚ)/2^80,(178925:ℚ)/2^80⟩,
  ⟨(46156:ℚ)/2^80,(46158:ℚ)/2^80⟩,
  ⟨(11906:ℚ)/2^80,(11908:ℚ)/2^80⟩,
  ⟨(3071:ℚ)/2^80,(3072:ℚ)/2^80⟩,
  ⟨(792:ℚ)/2^80,(793:ℚ)/2^80⟩,
  ⟨(204:ℚ)/2^80,(205:ℚ)/2^80⟩,
  ⟨(52:ℚ)/2^80,(53:ℚ)/2^80⟩,
  ⟨(13:ℚ)/2^80,(14:ℚ)/2^80⟩,
  ⟨(3:ℚ)/2^80,(4:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (217:ℚ)/128,
  ⟨⟨(311867820132469555214056:ℚ)/2^80,(311867820132469555214057:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(608589319198098939:ℚ)/2^60,(608589319198098940:ℚ)/2^60⟩
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
end Point178

namespace Point179
/-- Exact original rational input. -/
def input : ℚ := (435:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(313166022736640553216216:ℚ)/2^80,(313166022736640553216217:ℚ)/2^80⟩,
  ⟨(81124049305150013061798:ℚ)/2^80,(81124049305150013061799:ℚ)/2^80⟩,
  ⟨(21014768199163317421218:ℚ)/2^80,(21014768199163317421219:ℚ)/2^80⟩,
  ⟨(5443767739001785554845:ℚ)/2^80,(5443767739001785554846:ℚ)/2^80⟩,
  ⟨(1410180065530129687868:ℚ)/2^80,(1410180065530129687869:ℚ)/2^80⟩,
  ⟨(365299901201003204237:ℚ)/2^80,(365299901201003204239:ℚ)/2^80⟩,
  ⟨(94629062684485634672:ℚ)/2^80,(94629062684485634673:ℚ)/2^80⟩,
  ⟨(24513172533318275841:ℚ)/2^80,(24513172533318275842:ℚ)/2^80⟩,
  ⟨(6350011408775645984:ℚ)/2^80,(6350011408775645986:ℚ)/2^80⟩,
  ⟨(1644937832374588467:ℚ)/2^80,(1644937832374588469:ℚ)/2^80⟩,
  ⟨(426112694638279791:ℚ)/2^80,(426112694638279792:ℚ)/2^80⟩,
  ⟨(110382304399785937:ℚ)/2^80,(110382304399785938:ℚ)/2^80⟩,
  ⟨(28593968867672478:ℚ)/2^80,(28593968867672479:ℚ)/2^80⟩,
  ⟨(7407120734172754:ℚ)/2^80,(7407120734172756:ℚ)/2^80⟩,
  ⟨(1918776572238672:ℚ)/2^80,(1918776572238674:ℚ)/2^80⟩,
  ⟨(497049213358498:ℚ)/2^80,(497049213358499:ℚ)/2^80⟩,
  ⟨(128758045139176:ℚ)/2^80,(128758045139178:ℚ)/2^80⟩,
  ⟨(33354110101175:ℚ)/2^80,(33354110101177:ℚ)/2^80⟩,
  ⟨(8640210865572:ℚ)/2^80,(8640210865573:ℚ)/2^80⟩,
  ⟨(2238202235799:ℚ)/2^80,(2238202235800:ℚ)/2^80⟩,
  ⟨(579794790460:ℚ)/2^80,(579794790461:ℚ)/2^80⟩,
  ⟨(150192861783:ℚ)/2^80,(150192861784:ℚ)/2^80⟩,
  ⟨(38906689231:ℚ)/2^80,(38906689233:ℚ)/2^80⟩,
  ⟨(10078577962:ℚ)/2^80,(10078577964:ℚ)/2^80⟩,
  ⟨(2610803842:ℚ)/2^80,(2610803844:ℚ)/2^80⟩,
  ⟨(676315322:ℚ)/2^80,(676315323:ℚ)/2^80⟩,
  ⟨(175196009:ℚ)/2^80,(175196010:ℚ)/2^80⟩,
  ⟨(45383626:ℚ)/2^80,(45383627:ℚ)/2^80⟩,
  ⟨(11756395:ℚ)/2^80,(11756396:ℚ)/2^80⟩,
  ⟨(3045433:ℚ)/2^80,(3045434:ℚ)/2^80⟩,
  ⟨(788903:ℚ)/2^80,(788905:ℚ)/2^80⟩,
  ⟨(204361:ℚ)/2^80,(204362:ℚ)/2^80⟩,
  ⟨(52938:ℚ)/2^80,(52939:ℚ)/2^80⟩,
  ⟨(13713:ℚ)/2^80,(13714:ℚ)/2^80⟩,
  ⟨(3552:ℚ)/2^80,(3553:ℚ)/2^80⟩,
  ⟨(920:ℚ)/2^80,(921:ℚ)/2^80⟩,
  ⟨(238:ℚ)/2^80,(239:ℚ)/2^80⟩,
  ⟨(61:ℚ)/2^80,(62:ℚ)/2^80⟩,
  ⟨(15:ℚ)/2^80,(17:ℚ)/2^80⟩,
  ⟨(3:ℚ)/2^80,(5:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (435:ℚ)/256,
  ⟨⟨(313166022736640553216216:ℚ)/2^80,(313166022736640553216217:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(611242764568673959:ℚ)/2^60,(611242764568673960:ℚ)/2^60⟩
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
end Point179

namespace Point180
/-- Exact original rational input. -/
def input : ℚ := (109:ℚ)/64
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(314460473310163658160566:ℚ)/2^80,(314460473310163658160567:ℚ)/2^80⟩,
  ⟨(81796076872585922642921:ℚ)/2^80,(81796076872585922642923:ℚ)/2^80⟩,
  ⟨(21276436180730442305962:ℚ)/2^80,(21276436180730442305963:ℚ)/2^80⟩,
  ⟨(5534333110594623721203:ℚ)/2^80,(5534333110594623721205:ℚ)/2^80⟩,
  ⟨(1439566416050624667364:ℚ)/2^80,(1439566416050624667366:ℚ)/2^80⟩,
  ⟨(374453692036289653360:ℚ)/2^80,(374453692036289653362:ℚ)/2^80⟩,
  ⟨(97401249373601354920:ℚ)/2^80,(97401249373601354921:ℚ)/2^80⟩,
  ⟨(25335585097179543187:ℚ)/2^80,(25335585097179543188:ℚ)/2^80⟩,
  ⟨(6590181094642077707:ℚ)/2^80,(6590181094642077708:ℚ)/2^80⟩,
  ⟨(1714208955253719634:ℚ)/2^80,(1714208955253719636:ℚ)/2^80⟩,
  ⟨(445892502811661176:ℚ)/2^80,(445892502811661177:ℚ)/2^80⟩,
  ⟨(115983598997252907:ℚ)/2^80,(115983598997252908:ℚ)/2^80⟩,
  ⟨(30169144247840351:ℚ)/2^80,(30169144247840352:ℚ)/2^80⟩,
  ⟨(7847465266779282:ℚ)/2^80,(7847465266779283:ℚ)/2^80⟩,
  ⟨(2041248190780738:ℚ)/2^80,(2041248190780739:ℚ)/2^80⟩,
  ⟨(530960512052793:ℚ)/2^80,(530960512052794:ℚ)/2^80⟩,
  ⟨(138111115851882:ℚ)/2^80,(138111115851883:ℚ)/2^80⟩,
  ⟨(35924856724477:ℚ)/2^80,(35924856724479:ℚ)/2^80⟩,
  ⟨(9344615910991:ℚ)/2^80,(9344615910992:ℚ)/2^80⟩,
  ⟨(2430680439275:ℚ)/2^80,(2430680439276:ℚ)/2^80⟩,
  ⟨(632257917730:ℚ)/2^80,(632257917731:ℚ)/2^80⟩,
  ⟨(164460152010:ℚ)/2^80,(164460152011:ℚ)/2^80⟩,
  ⟨(42778652256:ℚ)/2^80,(42778652258:ℚ)/2^80⟩,
  ⟨(11127395095:ℚ)/2^80,(11127395097:ℚ)/2^80⟩,
  ⟨(2894409128:ℚ)/2^80,(2894409130:ℚ)/2^80⟩,
  ⟨(752880987:ℚ)/2^80,(752880988:ℚ)/2^80⟩,
  ⟨(195836094:ℚ)/2^80,(195836096:ℚ)/2^80⟩,
  ⟨(50940024:ℚ)/2^80,(50940025:ℚ)/2^80⟩,
  ⟨(13250295:ℚ)/2^80,(13250296:ℚ)/2^80⟩,
  ⟨(3446608:ℚ)/2^80,(3446609:ℚ)/2^80⟩,
  ⟨(896516:ℚ)/2^80,(896517:ℚ)/2^80⟩,
  ⟨(233197:ℚ)/2^80,(233199:ℚ)/2^80⟩,
  ⟨(60658:ℚ)/2^80,(60659:ℚ)/2^80⟩,
  ⟨(15778:ℚ)/2^80,(15779:ℚ)/2^80⟩,
  ⟨(4104:ℚ)/2^80,(4105:ℚ)/2^80⟩,
  ⟨(1067:ℚ)/2^80,(1068:ℚ)/2^80⟩,
  ⟨(277:ℚ)/2^80,(278:ℚ)/2^80⟩,
  ⟨(72:ℚ)/2^80,(73:ℚ)/2^80⟩,
  ⟨(18:ℚ)/2^80,(19:ℚ)/2^80⟩,
  ⟨(4:ℚ)/2^80,(5:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (109:ℚ)/64,
  ⟨⟨(314460473310163658160566:ℚ)/2^80,(314460473310163658160567:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(613890117062773630:ℚ)/2^60,(613890117062773632:ℚ)/2^60⟩
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
end Point180

namespace Point181
/-- Exact original rational input. -/
def input : ℚ := (437:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(315751188095595787333070:ℚ)/2^80,(315751188095595787333071:ℚ)/2^80⟩,
  ⟨(82468925029297023820036:ℚ)/2^80,(82468925029297023820038:ℚ)/2^80⟩,
  ⟨(21539502785429670002058:ℚ)/2^80,(21539502785429670002060:ℚ)/2^80⟩,
  ⟨(5625757581764459264606:ℚ)/2^80,(5625757581764459264608:ℚ)/2^80⟩,
  ⟨(1469353711831698595806:ℚ)/2^80,(1469353711831698595807:ℚ)/2^80⟩,
  ⟨(383770594287932822281:ℚ)/2^80,(383770594287932822282:ℚ)/2^80⟩,
  ⟨(100234455362360520682:ℚ)/2^80,(100234455362360520683:ℚ)/2^80⟩,
  ⟨(26179561934469342342:ℚ)/2^80,(26179561934469342343:ℚ)/2^80⟩,
  ⟨(6837663362393868634:ℚ)/2^80,(6837663362393868636:ℚ)/2^80⟩,
  ⟨(1785883215863333654:ℚ)/2^80,(1785883215863333656:ℚ)/2^80⟩,
  ⟨(466442802411635485:ℚ)/2^80,(466442802411635486:ℚ)/2^80⟩,
  ⟨(121827052289330480:ℚ)/2^80,(121827052289330481:ℚ)/2^80⟩,
  ⟨(31819186817271020:ℚ)/2^80,(31819186817271021:ℚ)/2^80⟩,
  ⟨(8310638981134277:ℚ)/2^80,(8310638981134279:ℚ)/2^80⟩,
  ⟨(2170599791609385:ℚ)/2^80,(2170599791609387:ℚ)/2^80⟩,
  ⟨(566924332296246:ℚ)/2^80,(566924332296247:ℚ)/2^80⟩,
  ⟨(148071145953276:ℚ)/2^80,(148071145953277:ℚ)/2^80⟩,
  ⟨(38673704787219:ℚ)/2^80,(38673704787220:ℚ)/2^80⟩,
  ⟨(10100924338364:ℚ)/2^80,(10100924338365:ℚ)/2^80⟩,
  ⟨(2638192359659:ℚ)/2^80,(2638192359660:ℚ)/2^80⟩,
  ⟨(689051684124:ℚ)/2^80,(689051684125:ℚ)/2^80⟩,
  ⟨(179968765983:ℚ)/2^80,(179968765984:ℚ)/2^80⟩,
  ⟨(47004829210:ℚ)/2^80,(47004829211:ℚ)/2^80⟩,
  ⟨(12276874584:ℚ)/2^80,(12276874585:ℚ)/2^80⟩,
  ⟨(3206514140:ℚ)/2^80,(3206514142:ℚ)/2^80⟩,
  ⟨(837487820:ℚ)/2^80,(837487821:ℚ)/2^80⟩,
  ⟨(218737800:ℚ)/2^80,(218737801:ℚ)/2^80⟩,
  ⟨(57130651:ℚ)/2^80,(57130653:ℚ)/2^80⟩,
  ⟨(14921569:ℚ)/2^80,(14921571:ℚ)/2^80⟩,
  ⟨(3897264:ℚ)/2^80,(3897265:ℚ)/2^80⟩,
  ⟨(1017900:ℚ)/2^80,(1017901:ℚ)/2^80⟩,
  ⟨(265858:ℚ)/2^80,(265859:ℚ)/2^80⟩,
  ⟨(69437:ℚ)/2^80,(69438:ℚ)/2^80⟩,
  ⟨(18135:ℚ)/2^80,(18137:ℚ)/2^80⟩,
  ⟨(4736:ℚ)/2^80,(4738:ℚ)/2^80⟩,
  ⟨(1236:ℚ)/2^80,(1238:ℚ)/2^80⟩,
  ⟨(322:ℚ)/2^80,(324:ℚ)/2^80⟩,
  ⟨(84:ℚ)/2^80,(85:ℚ)/2^80⟩,
  ⟨(21:ℚ)/2^80,(23:ℚ)/2^80⟩,
  ⟨(5:ℚ)/2^80,(7:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (437:ℚ)/256,
  ⟨⟨(315751188095595787333070:ℚ)/2^80,(315751188095595787333071:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(616531404597394464:ℚ)/2^60,(616531404597394465:ℚ)/2^60⟩
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
end Point181

namespace Point182
/-- Exact original rational input. -/
def input : ℚ := (219:ℚ)/128
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(317038183241876815268766:ℚ)/2^80,(317038183241876815268767:ℚ)/2^80⟩,
  ⟨(83142578314152133110828:ℚ)/2^80,(83142578314152133110830:ℚ)/2^80⟩,
  ⟨(21803961459907331737998:ℚ)/2^80,(21803961459907331737999:ℚ)/2^80⟩,
  ⟨(5718041766142844922644:ℚ)/2^80,(5718041766142844922646:ℚ)/2^80⟩,
  ⟨(1499544094291063077696:ℚ)/2^80,(1499544094291063077697:ℚ)/2^80⟩,
  ⟨(393252197638290317205:ℚ)/2^80,(393252197638290317206:ℚ)/2^80⟩,
  ⟨(103129538861914751774:ℚ)/2^80,(103129538861914751775:ℚ)/2^80⟩,
  ⟨(27045498664075626545:ℚ)/2^80,(27045498664075626547:ℚ)/2^80⟩,
  ⟨(7092623568965077854:ℚ)/2^80,(7092623568965077856:ℚ)/2^80⟩,
  ⟨(1860025201083060762:ℚ)/2^80,(1860025201083060764:ℚ)/2^80⟩,
  ⟨(487787588756652822:ℚ)/2^80,(487787588756652823:ℚ)/2^80⟩,
  ⟨(127921240855491085:ℚ)/2^80,(127921240855491087:ℚ)/2^80⟩,
  ⟨(33547068927520716:ℚ)/2^80,(33547068927520718:ℚ)/2^80⟩,
  ⟨(8797646318168256:ℚ)/2^80,(8797646318168258:ℚ)/2^80⟩,
  ⟨(2307163731853923:ℚ)/2^80,(2307163731853924:ℚ)/2^80⟩,
  ⟨(605048702013564:ℚ)/2^80,(605048702013566:ℚ)/2^80⟩,
  ⟨(158672714360905:ℚ)/2^80,(158672714360907:ℚ)/2^80⟩,
  ⟨(41611576388594:ℚ)/2^80,(41611576388596:ℚ)/2^80⟩,
  ⟨(10912545969343:ℚ)/2^80,(10912545969344:ℚ)/2^80⟩,
  ⟨(2861791594265:ℚ)/2^80,(2861791594267:ℚ)/2^80⟩,
  ⟨(750498660167:ℚ)/2^80,(750498660169:ℚ)/2^80⟩,
  ⟨(196816651513:ℚ)/2^80,(196816651515:ℚ)/2^80⟩,
  ⟨(51614741463:ℚ)/2^80,(51614741464:ℚ)/2^80⟩,
  ⟨(13535854389:ℚ)/2^80,(13535854390:ℚ)/2^80⟩,
  ⟨(3549748557:ℚ)/2^80,(3549748558:ℚ)/2^80⟩,
  ⟨(930913886:ℚ)/2^80,(930913887:ℚ)/2^80⟩,
  ⟨(244130154:ℚ)/2^80,(244130155:ℚ)/2^80⟩,
  ⟨(64022605:ℚ)/2^80,(64022606:ℚ)/2^80⟩,
  ⟨(16789789:ℚ)/2^80,(16789791:ℚ)/2^80⟩,
  ⟨(4403085:ℚ)/2^80,(4403087:ℚ)/2^80⟩,
  ⟨(1154699:ℚ)/2^80,(1154701:ℚ)/2^80⟩,
  ⟨(302817:ℚ)/2^80,(302818:ℚ)/2^80⟩,
  ⟨(79413:ℚ)/2^80,(79414:ℚ)/2^80⟩,
  ⟨(20825:ℚ)/2^80,(20827:ℚ)/2^80⟩,
  ⟨(5461:ℚ)/2^80,(5462:ℚ)/2^80⟩,
  ⟨(1432:ℚ)/2^80,(1433:ℚ)/2^80⟩,
  ⟨(375:ℚ)/2^80,(376:ℚ)/2^80⟩,
  ⟨(98:ℚ)/2^80,(99:ℚ)/2^80⟩,
  ⟨(25:ℚ)/2^80,(26:ℚ)/2^80⟩,
  ⟨(6:ℚ)/2^80,(7:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (219:ℚ)/128,
  ⟨⟨(317038183241876815268766:ℚ)/2^80,(317038183241876815268767:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(619166654898101801:ℚ)/2^60,(619166654898101802:ℚ)/2^60⟩
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
end Point182

namespace Point183
/-- Exact original rational input. -/
def input : ℚ := (439:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(318321474805003077656446:ℚ)/2^80,(318321474805003077656447:ℚ)/2^80⟩,
  ⟨(83817021423475630519610:ℚ)/2^80,(83817021423475630519612:ℚ)/2^80⟩,
  ⟨(22069805641001496956962:ℚ)/2^80,(22069805641001496956963:ℚ)/2^80⟩,
  ⟨(5811186233529890565646:ℚ)/2^80,(5811186233529890565647:ℚ)/2^80⟩,
  ⟨(1530139684512187012249:ℚ)/2^80,(1530139684512187012250:ℚ)/2^80⟩,
  ⟨(402900089590978738477:ℚ)/2^80,(402900089590978738478:ℚ)/2^80⟩,
  ⟨(106087361719639005958:ℚ)/2^80,(106087361719639005959:ℚ)/2^80⟩,
  ⟨(27933794524739479266:ℚ)/2^80,(27933794524739479267:ℚ)/2^80⟩,
  ⟨(7355229349679603893:ℚ)/2^80,(7355229349679603894:ℚ)/2^80⟩,
  ⟨(1936700677685420881:ℚ)/2^80,(1936700677685420882:ℚ)/2^80⟩,
  ⟨(509951401462492116:ℚ)/2^80,(509951401462492118:ℚ)/2^80⟩,
  ⟨(134274973334728139:ℚ)/2^80,(134274973334728141:ℚ)/2^80⟩,
  ⟨(35355856288137049:ℚ)/2^80,(35355856288137051:ℚ)/2^80⟩,
  ⟨(9309527626948316:ℚ)/2^80,(9309527626948318:ℚ)/2^80⟩,
  ⟨(2451285691700060:ℚ)/2^80,(2451285691700061:ℚ)/2^80⟩,
  ⟨(645446448318145:ℚ)/2^80,(645446448318146:ℚ)/2^80⟩,
  ⟨(169952086391684:ℚ)/2^80,(169952086391685:ℚ)/2^80⟩,
  ⟨(44749973826875:ℚ)/2^80,(44749973826876:ℚ)/2^80⟩,
  ⟨(11783086633551:ℚ)/2^80,(11783086633552:ℚ)/2^80⟩,
  ⟨(3102596912143:ℚ)/2^80,(3102596912144:ℚ)/2^80⟩,
  ⟨(816942784060:ℚ)/2^80,(816942784061:ℚ)/2^80⟩,
  ⟨(215108675515:ℚ)/2^80,(215108675516:ℚ)/2^80⟩,
  ⟨(56640126070:ℚ)/2^80,(56640126072:ℚ)/2^80⟩,
  ⟨(14913874922:ℚ)/2^80,(14913874923:ℚ)/2^80⟩,
  ⟨(3926962749:ℚ)/2^80,(3926962750:ℚ)/2^80⟩,
  ⟨(1034006018:ℚ)/2^80,(1034006020:ℚ)/2^80⟩,
  ⟨(272263455:ℚ)/2^80,(272263456:ℚ)/2^80⟩,
  ⟨(71689514:ℚ)/2^80,(71689515:ℚ)/2^80⟩,
  ⟨(18876519:ℚ)/2^80,(18876520:ℚ)/2^80⟩,
  ⟨(4970363:ℚ)/2^80,(4970365:ℚ)/2^80⟩,
  ⟨(1308743:ℚ)/2^80,(1308744:ℚ)/2^80⟩,
  ⟨(344604:ℚ)/2^80,(344605:ℚ)/2^80⟩,
  ⟨(90737:ℚ)/2^80,(90738:ℚ)/2^80⟩,
  ⟨(23891:ℚ)/2^80,(23893:ℚ)/2^80⟩,
  ⟨(6290:ℚ)/2^80,(6292:ℚ)/2^80⟩,
  ⟨(1656:ℚ)/2^80,(1657:ℚ)/2^80⟩,
  ⟨(436:ℚ)/2^80,(437:ℚ)/2^80⟩,
  ⟨(114:ℚ)/2^80,(116:ℚ)/2^80⟩,
  ⟨(30:ℚ)/2^80,(31:ℚ)/2^80⟩,
  ⟨(7:ℚ)/2^80,(9:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (439:ℚ)/256,
  ⟨⟨(318321474805003077656446:ℚ)/2^80,(318321474805003077656447:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(621795895500776057:ℚ)/2^60,(621795895500776058:ℚ)/2^60⟩
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
end Point183

/-- Reusable proved logarithm bounds for these consecutive exact grid inputs. -/
def entries : Array CertifiedLogBound := #[⟨Point176.input, Point176.bounds, Point176.log_bounds⟩,
  ⟨Point177.input, Point177.bounds, Point177.log_bounds⟩,
  ⟨Point178.input, Point178.bounds, Point178.log_bounds⟩,
  ⟨Point179.input, Point179.bounds, Point179.log_bounds⟩,
  ⟨Point180.input, Point180.bounds, Point180.log_bounds⟩,
  ⟨Point181.input, Point181.bounds, Point181.log_bounds⟩,
  ⟨Point182.input, Point182.bounds, Point182.log_bounds⟩,
  ⟨Point183.input, Point183.bounds, Point183.log_bounds⟩]
end MatrixBounds.Numeric.LogGridData.Part022
