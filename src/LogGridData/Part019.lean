module

public import TabulatedLogBounds
public import FKLLog.GridTrace

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

namespace MatrixBounds.Numeric.LogGridData.Part019
set_option maxRecDepth 100000
set_option maxHeartbeats 16000000

namespace Point152
/-- Exact original rational input. -/
def input : ℚ := (51:ℚ)/32
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(276742055092505473727919:ℚ)/2^80,(276742055092505473727920:ℚ)/2^80⟩,
  ⟨(63350590924790409648559:ℚ)/2^80,(63350590924790409648561:ℚ)/2^80⟩,
  ⟨(14501942500855635943645:ℚ)/2^80,(14501942500855635943647:ℚ)/2^80⟩,
  ⟨(3319721777304302203966:ℚ)/2^80,(3319721777304302203968:ℚ)/2^80⟩,
  ⟨(759936310467249902112:ℚ)/2^80,(759936310467249902114:ℚ)/2^80⟩,
  ⟨(173961324082864435423:ℚ)/2^80,(173961324082864435424:ℚ)/2^80⟩,
  ⟨(39822471778005111723:ℚ)/2^80,(39822471778005111724:ℚ)/2^80⟩,
  ⟨(9115987515446953285:ℚ)/2^80,(9115987515446953287:ℚ)/2^80⟩,
  ⟨(2086792322813157980:ℚ)/2^80,(2086792322813157982:ℚ)/2^80⟩,
  ⟨(477699447390963874:ℚ)/2^80,(477699447390963876:ℚ)/2^80⟩,
  ⟨(109352885547329079:ℚ)/2^80,(109352885547329081:ℚ)/2^80⟩,
  ⟨(25032588257822319:ℚ)/2^80,(25032588257822320:ℚ)/2^80⟩,
  ⟨(5730351528899085:ℚ)/2^80,(5730351528899086:ℚ)/2^80⟩,
  ⟨(1311767217458826:ℚ)/2^80,(1311767217458827:ℚ)/2^80⟩,
  ⟨(300284061827924:ℚ)/2^80,(300284061827925:ℚ)/2^80⟩,
  ⟨(68739724996753:ℚ)/2^80,(68739724996754:ℚ)/2^80⟩,
  ⟨(15735599698051:ℚ)/2^80,(15735599698053:ℚ)/2^80⟩,
  ⟨(3602125232083:ℚ)/2^80,(3602125232085:ℚ)/2^80⟩,
  ⟨(824582884452:ℚ)/2^80,(824582884454:ℚ)/2^80⟩,
  ⟨(188759937404:ℚ)/2^80,(188759937406:ℚ)/2^80⟩,
  ⟨(43210106152:ℚ)/2^80,(43210106154:ℚ)/2^80⟩,
  ⟨(9891470082:ℚ)/2^80,(9891470084:ℚ)/2^80⟩,
  ⟨(2264312428:ℚ)/2^80,(2264312429:ℚ)/2^80⟩,
  ⟨(518336579:ℚ)/2^80,(518336581:ℚ)/2^80⟩,
  ⟨(118655361:ℚ)/2^80,(118655362:ℚ)/2^80⟩,
  ⟨(27162070:ℚ)/2^80,(27162071:ℚ)/2^80⟩,
  ⟨(6217823:ℚ)/2^80,(6217824:ℚ)/2^80⟩,
  ⟨(1423357:ℚ)/2^80,(1423358:ℚ)/2^80⟩,
  ⟨(325828:ℚ)/2^80,(325829:ℚ)/2^80⟩,
  ⟨(74587:ℚ)/2^80,(74588:ℚ)/2^80⟩,
  ⟨(17074:ℚ)/2^80,(17075:ℚ)/2^80⟩,
  ⟨(3908:ℚ)/2^80,(3909:ℚ)/2^80⟩,
  ⟨(894:ℚ)/2^80,(895:ℚ)/2^80⟩,
  ⟨(204:ℚ)/2^80,(205:ℚ)/2^80⟩,
  ⟨(46:ℚ)/2^80,(47:ℚ)/2^80⟩,
  ⟨(10:ℚ)/2^80,(11:ℚ)/2^80⟩,
  ⟨(2:ℚ)/2^80,(3:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (51:ℚ)/32,
  ⟨⟨(276742055092505473727919:ℚ)/2^80,(276742055092505473727920:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(537364872706467887:ℚ)/2^60,(537364872706467888:ℚ)/2^60⟩
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
end Point152

namespace Point153
/-- Exact original rational input. -/
def input : ℚ := (409:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(278143835189531223654202:ℚ)/2^80,(278143835189531223654203:ℚ)/2^80⟩,
  ⟨(63993995163907183788109:ℚ)/2^80,(63993995163907183788110:ℚ)/2^80⟩,
  ⟨(14723430466282404691098:ℚ)/2^80,(14723430466282404691099:ℚ)/2^80⟩,
  ⟨(3387496032092041981560:ℚ)/2^80,(3387496032092041981562:ℚ)/2^80⟩,
  ⟨(779378786330951012298:ℚ)/2^80,(779378786330951012300:ℚ)/2^80⟩,
  ⟨(179315720764865420874:ℚ)/2^80,(179315720764865420876:ℚ)/2^80⟩,
  ⟨(41256098160938961494:ℚ)/2^80,(41256098160938961495:ℚ)/2^80⟩,
  ⟨(9492004539283700915:ℚ)/2^80,(9492004539283700916:ℚ)/2^80⟩,
  ⟨(2183874728587077052:ℚ)/2^80,(2183874728587077053:ℚ)/2^80⟩,
  ⟨(502455388682440284:ℚ)/2^80,(502455388682440285:ℚ)/2^80⟩,
  ⟨(115602517997614080:ℚ)/2^80,(115602517997614081:ℚ)/2^80⟩,
  ⟨(26597271058097675:ℚ)/2^80,(26597271058097676:ℚ)/2^80⟩,
  ⟨(6119372138178863:ℚ)/2^80,(6119372138178864:ℚ)/2^80⟩,
  ⟨(1407915694949422:ℚ)/2^80,(1407915694949423:ℚ)/2^80⟩,
  ⟨(323926468161295:ℚ)/2^80,(323926468161296:ℚ)/2^80⟩,
  ⟨(74527443050643:ℚ)/2^80,(74527443050645:ℚ)/2^80⟩,
  ⟨(17146915468794:ℚ)/2^80,(17146915468796:ℚ)/2^80⟩,
  ⟨(3945079799587:ℚ)/2^80,(3945079799588:ℚ)/2^80⟩,
  ⟨(907664976446:ℚ)/2^80,(907664976447:ℚ)/2^80⟩,
  ⟨(208831190069:ℚ)/2^80,(208831190070:ℚ)/2^80⟩,
  ⟨(48046875309:ℚ)/2^80,(48046875310:ℚ)/2^80⟩,
  ⟨(11054393868:ℚ)/2^80,(11054393869:ℚ)/2^80⟩,
  ⟨(2543341747:ℚ)/2^80,(2543341748:ℚ)/2^80⟩,
  ⟨(585159830:ℚ)/2^80,(585159831:ℚ)/2^80⟩,
  ⟨(134630757:ℚ)/2^80,(134630759:ℚ)/2^80⟩,
  ⟨(30975196:ℚ)/2^80,(30975198:ℚ)/2^80⟩,
  ⟨(7126624:ℚ)/2^80,(7126625:ℚ)/2^80⟩,
  ⟨(1639659:ℚ)/2^80,(1639660:ℚ)/2^80⟩,
  ⟨(377244:ℚ)/2^80,(377246:ℚ)/2^80⟩,
  ⟨(86794:ℚ)/2^80,(86795:ℚ)/2^80⟩,
  ⟨(19969:ℚ)/2^80,(19970:ℚ)/2^80⟩,
  ⟨(4594:ℚ)/2^80,(4595:ℚ)/2^80⟩,
  ⟨(1056:ℚ)/2^80,(1058:ℚ)/2^80⟩,
  ⟨(242:ℚ)/2^80,(244:ℚ)/2^80⟩,
  ⟨(55:ℚ)/2^80,(57:ℚ)/2^80⟩,
  ⟨(12:ℚ)/2^80,(14:ℚ)/2^80⟩,
  ⟨(2:ℚ)/2^80,(4:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (409:ℚ)/256,
  ⟨⟨(278143835189531223654202:ℚ)/2^80,(278143835189531223654203:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(540187203380538704:ℚ)/2^60,(540187203380538705:ℚ)/2^60⟩
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
end Point153

namespace Point154
/-- Exact original rational input. -/
def input : ℚ := (205:ℚ)/128
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(279541405736716055412539:ℚ)/2^80,(279541405736716055412540:ℚ)/2^80⟩,
  ⟨(64638703428610018819115:ℚ)/2^80,(64638703428610018819117:ℚ)/2^80⟩,
  ⟨(14946486978987902249465:ℚ)/2^80,(14946486978987902249466:ℚ)/2^80⟩,
  ⟨(3456094586732938357984:ℚ)/2^80,(3456094586732938357985:ℚ)/2^80⟩,
  ⟨(799157006541850611305:ℚ)/2^80,(799157006541850611306:ℚ)/2^80⟩,
  ⟨(184790058569737228439:ℚ)/2^80,(184790058569737228441:ℚ)/2^80⟩,
  ⟨(42729232762371671440:ℚ)/2^80,(42729232762371671442:ℚ)/2^80⟩,
  ⟨(9880333101209065167:ℚ)/2^80,(9880333101209065169:ℚ)/2^80⟩,
  ⟨(2284641587967261314:ℚ)/2^80,(2284641587967261316:ℚ)/2^80⟩,
  ⟨(528280487307745108:ℚ)/2^80,(528280487307745110:ℚ)/2^80⟩,
  ⟨(122154947515604724:ℚ)/2^80,(122154947515604726:ℚ)/2^80⟩,
  ⟨(28246038915019710:ℚ)/2^80,(28246038915019712:ℚ)/2^80⟩,
  ⟨(6531366355725278:ℚ)/2^80,(6531366355725279:ℚ)/2^80⟩,
  ⟨(1510255884056595:ℚ)/2^80,(1510255884056597:ℚ)/2^80⟩,
  ⟨(349218327544618:ℚ)/2^80,(349218327544619:ℚ)/2^80⟩,
  ⟨(80750183846653:ℚ)/2^80,(80750183846654:ℚ)/2^80⟩,
  ⟨(18671964433009:ℚ)/2^80,(18671964433011:ℚ)/2^80⟩,
  ⟨(4317541325350:ℚ)/2^80,(4317541325351:ℚ)/2^80⟩,
  ⟨(998350396552:ℚ)/2^80,(998350396553:ℚ)/2^80⟩,
  ⟨(230849791394:ℚ)/2^80,(230849791396:ℚ)/2^80⟩,
  ⟨(53379681493:ℚ)/2^80,(53379681494:ℚ)/2^80⟩,
  ⟨(12343049474:ℚ)/2^80,(12343049475:ℚ)/2^80⟩,
  ⟨(2854098527:ℚ)/2^80,(2854098528:ℚ)/2^80⟩,
  ⟨(659956716:ℚ)/2^80,(659956717:ℚ)/2^80⟩,
  ⟨(152602603:ℚ)/2^80,(152602605:ℚ)/2^80⟩,
  ⟨(35286487:ℚ)/2^80,(35286489:ℚ)/2^80⟩,
  ⟨(8159337:ℚ)/2^80,(8159339:ℚ)/2^80⟩,
  ⟨(1886693:ℚ)/2^80,(1886695:ℚ)/2^80⟩,
  ⟨(436262:ℚ)/2^80,(436263:ℚ)/2^80⟩,
  ⟨(100877:ℚ)/2^80,(100878:ℚ)/2^80⟩,
  ⟨(23325:ℚ)/2^80,(23327:ℚ)/2^80⟩,
  ⟨(5393:ℚ)/2^80,(5394:ℚ)/2^80⟩,
  ⟨(1247:ℚ)/2^80,(1248:ℚ)/2^80⟩,
  ⟨(288:ℚ)/2^80,(289:ℚ)/2^80⟩,
  ⟨(66:ℚ)/2^80,(67:ℚ)/2^80⟩,
  ⟨(15:ℚ)/2^80,(16:ℚ)/2^80⟩,
  ⟨(3:ℚ)/2^80,(4:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (205:ℚ)/128,
  ⟨⟨(279541405736716055412539:ℚ)/2^80,(279541405736716055412540:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(543002641909352839:ℚ)/2^60,(543002641909352840:ℚ)/2^60⟩
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
end Point154

namespace Point155
/-- Exact original rational input. -/
def input : ℚ := (411:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(280934785667567499369501:ℚ)/2^80,(280934785667567499369502:ℚ)/2^80⟩,
  ⟨(65284695320049418893961:ℚ)/2^80,(65284695320049418893963:ℚ)/2^80⟩,
  ⟨(15171106108857061362164:ℚ)/2^80,(15171106108857061362166:ℚ)/2^80⟩,
  ⟨(3525519410603964784310:ℚ)/2^80,(3525519410603964784312:ℚ)/2^80⟩,
  ⟨(819273626152345639532:ℚ)/2^80,(819273626152345639533:ℚ)/2^80⟩,
  ⟨(190385925117861430475:ℚ)/2^80,(190385925117861430477:ℚ)/2^80⟩,
  ⟨(44242606286759402883:ℚ)/2^80,(44242606286759402885:ℚ)/2^80⟩,
  ⟨(10281265329007057641:ℚ)/2^80,(10281265329007057642:ℚ)/2^80⟩,
  ⟨(2389199589199541130:ℚ)/2^80,(2389199589199541132:ℚ)/2^80⟩,
  ⟨(555211298839473575:ℚ)/2^80,(555211298839473577:ℚ)/2^80⟩,
  ⟨(129022115922216497:ℚ)/2^80,(129022115922216499:ℚ)/2^80⟩,
  ⟨(29982650626602034:ℚ)/2^80,(29982650626602036:ℚ)/2^80⟩,
  ⟨(6967482529420262:ℚ)/2^80,(6967482529420264:ℚ)/2^80⟩,
  ⟨(1619130123028696:ℚ)/2^80,(1619130123028698:ℚ)/2^80⟩,
  ⟨(376259623792275:ℚ)/2^80,(376259623792277:ℚ)/2^80⟩,
  ⟨(87436644209599:ℚ)/2^80,(87436644209600:ℚ)/2^80⟩,
  ⟨(20318860348557:ℚ)/2^80,(20318860348558:ℚ)/2^80⟩,
  ⟨(4721774143967:ℚ)/2^80,(4721774143968:ℚ)/2^80⟩,
  ⟨(1097263856544:ℚ)/2^80,(1097263856545:ℚ)/2^80⟩,
  ⟨(254986353469:ℚ)/2^80,(254986353470:ℚ)/2^80⟩,
  ⟨(59254699831:ℚ)/2^80,(59254699832:ℚ)/2^80⟩,
  ⟨(13769832794:ℚ)/2^80,(13769832795:ℚ)/2^80⟩,
  ⟨(3199886181:ℚ)/2^80,(3199886182:ℚ)/2^80⟩,
  ⟨(743601736:ℚ)/2^80,(743601737:ℚ)/2^80⟩,
  ⟨(172801003:ℚ)/2^80,(172801004:ℚ)/2^80⟩,
  ⟨(40156155:ℚ)/2^80,(40156156:ℚ)/2^80⟩,
  ⟨(9331640:ℚ)/2^80,(9331641:ℚ)/2^80⟩,
  ⟨(2168522:ℚ)/2^80,(2168523:ℚ)/2^80⟩,
  ⟨(503929:ℚ)/2^80,(503930:ℚ)/2^80⟩,
  ⟨(117104:ℚ)/2^80,(117106:ℚ)/2^80⟩,
  ⟨(27213:ℚ)/2^80,(27214:ℚ)/2^80⟩,
  ⟨(6323:ℚ)/2^80,(6325:ℚ)/2^80⟩,
  ⟨(1469:ℚ)/2^80,(1470:ℚ)/2^80⟩,
  ⟨(341:ℚ)/2^80,(342:ℚ)/2^80⟩,
  ⟨(79:ℚ)/2^80,(80:ℚ)/2^80⟩,
  ⟨(18:ℚ)/2^80,(19:ℚ)/2^80⟩,
  ⟨(4:ℚ)/2^80,(5:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(2:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (411:ℚ)/256,
  ⟨⟨(280934785667567499369501:ℚ)/2^80,(280934785667567499369502:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(545811221872230667:ℚ)/2^60,(545811221872230668:ℚ)/2^60⟩
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
end Point155

namespace Point156
/-- Exact original rational input. -/
def input : ℚ := (103:ℚ)/64
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(282323993802218789302639:ℚ)/2^80,(282323993802218789302640:ℚ)/2^80⟩,
  ⟨(65931950648422351992831:ℚ)/2^80,(65931950648422351992833:ℚ)/2^80⟩,
  ⟨(15397281887954920525271:ℚ)/2^80,(15397281887954920525273:ℚ)/2^80⟩,
  ⟨(3595772416947556290332:ℚ)/2^80,(3595772416947556290334:ℚ)/2^80⟩,
  ⟨(839731282999728714508:ℚ)/2^80,(839731282999728714510:ℚ)/2^80⟩,
  ⟨(196104910401134250693:ℚ)/2^80,(196104910401134250694:ℚ)/2^80⟩,
  ⟨(45796955123618178305:ℚ)/2^80,(45796955123618178306:ℚ)/2^80⟩,
  ⟨(10695097304318017687:ℚ)/2^80,(10695097304318017689:ℚ)/2^80⟩,
  ⟨(2497657454301812513:ℚ)/2^80,(2497657454301812515:ℚ)/2^80⟩,
  ⟨(583285273759105916:ℚ)/2^80,(583285273759105917:ℚ)/2^80⟩,
  ⟨(136216321416797189:ℚ)/2^80,(136216321416797191:ℚ)/2^80⟩,
  ⟨(31810997217096349:ℚ)/2^80,(31810997217096350:ℚ)/2^80⟩,
  ⟨(7428915517765015:ℚ)/2^80,(7428915517765016:ℚ)/2^80⟩,
  ⟨(1734896438280452:ℚ)/2^80,(1734896438280453:ℚ)/2^80⟩,
  ⟨(405155455646333:ℚ)/2^80,(405155455646334:ℚ)/2^80⟩,
  ⟨(94617142336568:ℚ)/2^80,(94617142336570:ℚ)/2^80⟩,
  ⟨(22096218869018:ℚ)/2^80,(22096218869020:ℚ)/2^80⟩,
  ⟨(5160194825698:ℚ)/2^80,(5160194825700:ℚ)/2^80⟩,
  ⟨(1205075438336:ℚ)/2^80,(1205075438338:ℚ)/2^80⟩,
  ⟨(281424802964:ℚ)/2^80,(281424802966:ℚ)/2^80⟩,
  ⟨(65721959973:ℚ)/2^80,(65721959975:ℚ)/2^80⟩,
  ⟨(15348242149:ℚ)/2^80,(15348242150:ℚ)/2^80⟩,
  ⟨(3584320022:ℚ)/2^80,(3584320024:ℚ)/2^80⟩,
  ⟨(837056771:ℚ)/2^80,(837056773:ℚ)/2^80⟩,
  ⟨(195480323:ℚ)/2^80,(195480325:ℚ)/2^80⟩,
  ⟨(45651093:ℚ)/2^80,(45651094:ℚ)/2^80⟩,
  ⟨(10661033:ℚ)/2^80,(10661034:ℚ)/2^80⟩,
  ⟨(2489702:ℚ)/2^80,(2489703:ℚ)/2^80⟩,
  ⟨(581427:ℚ)/2^80,(581428:ℚ)/2^80⟩,
  ⟨(135782:ℚ)/2^80,(135783:ℚ)/2^80⟩,
  ⟨(31709:ℚ)/2^80,(31710:ℚ)/2^80⟩,
  ⟨(7405:ℚ)/2^80,(7406:ℚ)/2^80⟩,
  ⟨(1729:ℚ)/2^80,(1730:ℚ)/2^80⟩,
  ⟨(403:ℚ)/2^80,(405:ℚ)/2^80⟩,
  ⟨(94:ℚ)/2^80,(95:ℚ)/2^80⟩,
  ⟨(21:ℚ)/2^80,(23:ℚ)/2^80⟩,
  ⟨(4:ℚ)/2^80,(6:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(2:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (103:ℚ)/64,
  ⟨⟨(282323993802218789302639:ℚ)/2^80,(282323993802218789302640:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(548612976603685368:ℚ)/2^60,(548612976603685369:ℚ)/2^60⟩
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
end Point156

namespace Point157
/-- Exact original rational input. -/
def input : ℚ := (413:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(283709048848276203929551:ℚ)/2^80,(283709048848276203929552:ℚ)/2^80⟩,
  ⟨(66580449430761381191239:ℚ)/2^80,(66580449430761381191241:ℚ)/2^80⟩,
  ⟨(15625008311852820399139:ℚ)/2^80,(15625008311852820399141:ℚ)/2^80⟩,
  ⟨(3666855463319720183355:ℚ)/2^80,(3666855463319720183356:ℚ)/2^80⟩,
  ⟨(860532597520472449606:ℚ)/2^80,(860532597520472449607:ℚ)/2^80⟩,
  ⟨(201948606592995776663:ℚ)/2^80,(201948606592995776665:ℚ)/2^80⟩,
  ⟨(47393021278176886302:ℚ)/2^80,(47393021278176886303:ℚ)/2^80⟩,
  ⟨(11122129059303095888:ℚ)/2^80,(11122129059303095889:ℚ)/2^80⟩,
  ⟨(2610125952631668242:ℚ)/2^80,(2610125952631668244:ℚ)/2^80⟩,
  ⟨(612540769152723339:ℚ)/2^80,(612540769152723340:ℚ)/2^80⟩,
  ⟨(143750225346752711:ℚ)/2^80,(143750225346752713:ℚ)/2^80⟩,
  ⟨(33735105200956914:ℚ)/2^80,(33735105200956915:ℚ)/2^80⟩,
  ⟨(7916908096487646:ℚ)/2^80,(7916908096487647:ℚ)/2^80⟩,
  ⟨(1857929104855845:ℚ)/2^80,(1857929104855846:ℚ)/2^80⟩,
  ⟨(436016247327903:ℚ)/2^80,(436016247327905:ℚ)/2^80⟩,
  ⟨(102323693319104:ℚ)/2^80,(102323693319105:ℚ)/2^80⟩,
  ⟨(24013183633930:ℚ)/2^80,(24013183633931:ℚ)/2^80⟩,
  ⟨(5635380912596:ℚ)/2^80,(5635380912597:ℚ)/2^80⟩,
  ⟨(1322503442866:ℚ)/2^80,(1322503442867:ℚ)/2^80⟩,
  ⟨(310363289282:ℚ)/2^80,(310363289283:ℚ)/2^80⟩,
  ⟨(72835629921:ℚ)/2^80,(72835629922:ℚ)/2^80⟩,
  ⟨(17092965467:ℚ)/2^80,(17092965468:ℚ)/2^80⟩,
  ⟨(4011353629:ℚ)/2^80,(4011353631:ℚ)/2^80⟩,
  ⟨(941378953:ℚ)/2^80,(941378954:ℚ)/2^80⟩,
  ⟨(220921518:ℚ)/2^80,(220921519:ℚ)/2^80⟩,
  ⟨(51845558:ℚ)/2^80,(51845559:ℚ)/2^80⟩,
  ⟨(12167044:ℚ)/2^80,(12167045:ℚ)/2^80⟩,
  ⟨(2855345:ℚ)/2^80,(2855346:ℚ)/2^80⟩,
  ⟨(670088:ℚ)/2^80,(670089:ℚ)/2^80⟩,
  ⟨(157255:ℚ)/2^80,(157256:ℚ)/2^80⟩,
  ⟨(36904:ℚ)/2^80,(36905:ℚ)/2^80⟩,
  ⟨(8660:ℚ)/2^80,(8661:ℚ)/2^80⟩,
  ⟨(2032:ℚ)/2^80,(2033:ℚ)/2^80⟩,
  ⟨(476:ℚ)/2^80,(478:ℚ)/2^80⟩,
  ⟨(111:ℚ)/2^80,(113:ℚ)/2^80⟩,
  ⟨(26:ℚ)/2^80,(27:ℚ)/2^80⟩,
  ⟨(6:ℚ)/2^80,(7:ℚ)/2^80⟩,
  ⟨(1:ℚ)/2^80,(2:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (413:ℚ)/256,
  ⟨⟨(283709048848276203929551:ℚ)/2^80,(283709048848276203929552:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(551407939195796825:ℚ)/2^60,(551407939195796826:ℚ)/2^60⟩
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
end Point157

namespace Point158
/-- Exact original rational input. -/
def input : ℚ := (207:ℚ)/128
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(285089969401658820303844:ℚ)/2^80,(285089969401658820303845:ℚ)/2^80⟩,
  ⟨(67230171888749393444786:ℚ)/2^80,(67230171888749393444788:ℚ)/2^80⟩,
  ⟨(15854279340928961439218:ℚ)/2^80,(15854279340928961439219:ℚ)/2^80⟩,
  ⟨(3738770352039964040890:ℚ)/2^80,(3738770352039964040891:ℚ)/2^80⟩,
  ⟨(881680172570618385762:ℚ)/2^80,(881680172570618385763:ℚ)/2^80⟩,
  ⟨(207918607859936873060:ℚ)/2^80,(207918607859936873061:ℚ)/2^80⟩,
  ⟨(49031552301298546184:ℚ)/2^80,(49031552301298546185:ℚ)/2^80⟩,
  ⟨(11562664572545030294:ℚ)/2^80,(11562664572545030295:ℚ)/2^80⟩,
  ⟨(2726717914122559382:ℚ)/2^80,(2726717914122559384:ℚ)/2^80⟩,
  ⟨(643017060345319973:ℚ)/2^80,(643017060345319975:ℚ)/2^80⟩,
  ⟨(151636859006806799:ℚ)/2^80,(151636859006806801:ℚ)/2^80⟩,
  ⟨(35759139885187274:ℚ)/2^80,(35759139885187276:ℚ)/2^80⟩,
  ⟨(8432752390835207:ℚ)/2^80,(8432752390835209:ℚ)/2^80⟩,
  ⟨(1988619220525317:ℚ)/2^80,(1988619220525318:ℚ)/2^80⟩,
  ⟨(468957965437313:ℚ)/2^80,(468957965437314:ℚ)/2^80⟩,
  ⟨(110590087371784:ℚ)/2^80,(110590087371785:ℚ)/2^80⟩,
  ⟨(26079453439913:ℚ)/2^80,(26079453439914:ℚ)/2^80⟩,
  ⟨(6150080064934:ℚ)/2^80,(6150080064935:ℚ)/2^80⟩,
  ⟨(1450317388447:ℚ)/2^80,(1450317388448:ℚ)/2^80⟩,
  ⟨(342015145335:ℚ)/2^80,(342015145336:ℚ)/2^80⟩,
  ⟨(80654317855:ℚ)/2^80,(80654317856:ℚ)/2^80⟩,
  ⟨(19019973464:ℚ)/2^80,(19019973465:ℚ)/2^80⟩,
  ⟨(4485307175:ℚ)/2^80,(4485307176:ℚ)/2^80⟩,
  ⟨(1057729154:ℚ)/2^80,(1057729155:ℚ)/2^80⟩,
  ⟨(249434636:ℚ)/2^80,(249434637:ℚ)/2^80⟩,
  ⟨(58821899:ℚ)/2^80,(58821900:ℚ)/2^80⟩,
  ⟨(13871432:ℚ)/2^80,(13871434:ℚ)/2^80⟩,
  ⟨(3271173:ℚ)/2^80,(3271174:ℚ)/2^80⟩,
  ⟨(771410:ℚ)/2^80,(771412:ℚ)/2^80⟩,
  ⟨(181914:ℚ)/2^80,(181916:ℚ)/2^80⟩,
  ⟨(42899:ℚ)/2^80,(42900:ℚ)/2^80⟩,
  ⟨(10116:ℚ)/2^80,(10117:ℚ)/2^80⟩,
  ⟨(2385:ℚ)/2^80,(2386:ℚ)/2^80⟩,
  ⟨(562:ℚ)/2^80,(563:ℚ)/2^80⟩,
  ⟨(132:ℚ)/2^80,(133:ℚ)/2^80⟩,
  ⟨(31:ℚ)/2^80,(32:ℚ)/2^80⟩,
  ⟨(7:ℚ)/2^80,(8:ℚ)/2^80⟩,
  ⟨(1:ℚ)/2^80,(2:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (207:ℚ)/128,
  ⟨⟨(285089969401658820303844:ℚ)/2^80,(285089969401658820303845:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(554196142500556805:ℚ)/2^60,(554196142500556806:ℚ)/2^60⟩
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
end Point158

namespace Point159
/-- Exact original rational input. -/
def input : ℚ := (415:ℚ)/256
/-- Outward-rounded powers of the normalized logarithm-series parameter. -/
def powers : PowerTrace := ⟨#[
  ⟨(1208925819614629174706176:ℚ)/2^80,(1208925819614629174706176:ℚ)/2^80⟩,
  ⟨(286466773947430758238870:ℚ)/2^80,(286466773947430758238871:ℚ)/2^80⟩,
  ⟨(67881098446559598450045:ℚ)/2^80,(67881098446559598450046:ℚ)/2^80⟩,
  ⟨(16085088901643779662529:ℚ)/2^80,(16085088901643779662530:ℚ)/2^80⟩,
  ⟨(3811518830642862841046:ℚ)/2^80,(3811518830642862841047:ℚ)/2^80⟩,
  ⟨(903176593252183594226:ℚ)/2^80,(903176593252183594228:ℚ)/2^80⟩,
  ⟨(214016510174511462715:ℚ)/2^80,(214016510174511462716:ℚ)/2^80⟩,
  ⟨(50713301218699437513:ℚ)/2^80,(50713301218699437514:ℚ)/2^80⟩,
  ⟨(12017011764192564179:ℚ)/2^80,(12017011764192564180:ℚ)/2^80⟩,
  ⟨(2847548242185719380:ℚ)/2^80,(2847548242185719381:ℚ)/2^80⟩,
  ⟨(674754352470237528:ℚ)/2^80,(674754352470237529:ℚ)/2^80⟩,
  ⟨(159889630466121858:ℚ)/2^80,(159889630466121859:ℚ)/2^80⟩,
  ⟨(37887408709557936:ℚ)/2^80,(37887408709557937:ℚ)/2^80⟩,
  ⟨(8977791333561418:ℚ)/2^80,(8977791333561419:ℚ)/2^80⟩,
  ⟨(2127375293645701:ℚ)/2^80,(2127375293645702:ℚ)/2^80⟩,
  ⟨(504102342309488:ℚ)/2^80,(504102342309489:ℚ)/2^80⟩,
  ⟨(119451970830415:ℚ)/2^80,(119451970830416:ℚ)/2^80⟩,
  ⟨(28305310524643:ℚ)/2^80,(28305310524645:ℚ)/2^80⟩,
  ⟨(6707219632516:ℚ)/2^80,(6707219632517:ℚ)/2^80⟩,
  ⟨(1589341164783:ℚ)/2^80,(1589341164785:ℚ)/2^80⟩,
  ⟨(376609903428:ℚ)/2^80,(376609903429:ℚ)/2^80⟩,
  ⟨(89241392913:ℚ)/2^80,(89241392914:ℚ)/2^80⟩,
  ⟨(21146619185:ℚ)/2^80,(21146619186:ℚ)/2^80⟩,
  ⟨(5010897839:ℚ)/2^80,(5010897840:ℚ)/2^80⟩,
  ⟨(1187381157:ℚ)/2^80,(1187381158:ℚ)/2^80⟩,
  ⟨(281361555:ℚ)/2^80,(281361557:ℚ)/2^80⟩,
  ⟨(66671366:ℚ)/2^80,(66671368:ℚ)/2^80⟩,
  ⟨(15798430:ℚ)/2^80,(15798432:ℚ)/2^80⟩,
  ⟨(3743592:ℚ)/2^80,(3743593:ℚ)/2^80⟩,
  ⟨(887080:ℚ)/2^80,(887081:ℚ)/2^80⟩,
  ⟨(210202:ℚ)/2^80,(210203:ℚ)/2^80⟩,
  ⟨(49809:ℚ)/2^80,(49810:ℚ)/2^80⟩,
  ⟨(11802:ℚ)/2^80,(11803:ℚ)/2^80⟩,
  ⟨(2796:ℚ)/2^80,(2797:ℚ)/2^80⟩,
  ⟨(662:ℚ)/2^80,(663:ℚ)/2^80⟩,
  ⟨(156:ℚ)/2^80,(158:ℚ)/2^80⟩,
  ⟨(36:ℚ)/2^80,(38:ℚ)/2^80⟩,
  ⟨(8:ℚ)/2^80,(10:ℚ)/2^80⟩,
  ⟨(1:ℚ)/2^80,(3:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩,
  ⟨(0:ℚ)/2^80,(1:ℚ)/2^80⟩
]⟩
/-- Exact binary reduction and normalized finite-series certificate. -/
def trace : ScaledLogTrace := ⟨0, (415:ℚ)/256,
  ⟨⟨(286466773947430758238870:ℚ)/2^80,(286466773947430758238871:ℚ)/2^80⟩, powers, powers.negateBase⟩⟩
/-- Reported outward-rounded enclosure of the original natural logarithm. -/
def bounds : Interval := ⟨(556977619132185869:ℚ)/2^60,(556977619132185870:ℚ)/2^60⟩
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
end Point159

/-- Reusable proved logarithm bounds for these consecutive exact grid inputs. -/
def entries : Array CertifiedLogBound := #[⟨Point152.input, Point152.bounds, Point152.log_bounds⟩,
  ⟨Point153.input, Point153.bounds, Point153.log_bounds⟩,
  ⟨Point154.input, Point154.bounds, Point154.log_bounds⟩,
  ⟨Point155.input, Point155.bounds, Point155.log_bounds⟩,
  ⟨Point156.input, Point156.bounds, Point156.log_bounds⟩,
  ⟨Point157.input, Point157.bounds, Point157.log_bounds⟩,
  ⟨Point158.input, Point158.bounds, Point158.log_bounds⟩,
  ⟨Point159.input, Point159.bounds, Point159.log_bounds⟩]
end MatrixBounds.Numeric.LogGridData.Part019
