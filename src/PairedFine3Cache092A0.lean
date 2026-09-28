import SuppliedPairedFineBlocks
import SuppliedPairedFineTableReads
import SuppliedRootFineParent3Block644
import SuppliedRootFineParent3Block645
import SuppliedRootFineParent3Block646
import SuppliedRootFineParent3Block647
import SuppliedRootFineParent3Block648
import SuppliedRootFineParent3Block649
import SuppliedRootFineParent3Block650

namespace MatrixBounds.Numeric.SuppliedPairedFine.PairedFine3Cache092A0
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Proof-free read of the checked complete parent3 table of original node 644. -/
def read644 (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  SuppliedRootFineParent3Block644.value 0 strategy axis orbit
/-- The proof-free read equals the complete original integer parent3 law of node 644. -/
theorem read644_eq (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) :
    read644 strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator ⟨644, by omega⟩ strategy axis orbit :=
  nodeRead_eq SuppliedRootFineParent3Block644.table read644 (fun _ _ _ => rfl) strategy axis orbit

/-- Proof-free read of the checked complete parent3 table of original node 645. -/
def read645 (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  SuppliedRootFineParent3Block645.value 0 strategy axis orbit
/-- The proof-free read equals the complete original integer parent3 law of node 645. -/
theorem read645_eq (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) :
    read645 strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator ⟨645, by omega⟩ strategy axis orbit :=
  nodeRead_eq SuppliedRootFineParent3Block645.table read645 (fun _ _ _ => rfl) strategy axis orbit

/-- Proof-free read of the checked complete parent3 table of original node 646. -/
def read646 (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  SuppliedRootFineParent3Block646.value 0 strategy axis orbit
/-- The proof-free read equals the complete original integer parent3 law of node 646. -/
theorem read646_eq (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) :
    read646 strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator ⟨646, by omega⟩ strategy axis orbit :=
  nodeRead_eq SuppliedRootFineParent3Block646.table read646 (fun _ _ _ => rfl) strategy axis orbit

/-- Proof-free read of the checked complete parent3 table of original node 647. -/
def read647 (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  SuppliedRootFineParent3Block647.value 0 strategy axis orbit
/-- The proof-free read equals the complete original integer parent3 law of node 647. -/
theorem read647_eq (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) :
    read647 strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator ⟨647, by omega⟩ strategy axis orbit :=
  nodeRead_eq SuppliedRootFineParent3Block647.table read647 (fun _ _ _ => rfl) strategy axis orbit

/-- Proof-free read of the checked complete parent3 table of original node 648. -/
def read648 (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  SuppliedRootFineParent3Block648.value 0 strategy axis orbit
/-- The proof-free read equals the complete original integer parent3 law of node 648. -/
theorem read648_eq (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) :
    read648 strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator ⟨648, by omega⟩ strategy axis orbit :=
  nodeRead_eq SuppliedRootFineParent3Block648.table read648 (fun _ _ _ => rfl) strategy axis orbit

/-- Proof-free read of the checked complete parent3 table of original node 649. -/
def read649 (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  SuppliedRootFineParent3Block649.value 0 strategy axis orbit
/-- The proof-free read equals the complete original integer parent3 law of node 649. -/
theorem read649_eq (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) :
    read649 strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator ⟨649, by omega⟩ strategy axis orbit :=
  nodeRead_eq SuppliedRootFineParent3Block649.table read649 (fun _ _ _ => rfl) strategy axis orbit

/-- Proof-free read of the checked complete parent3 table of original node 650. -/
def read650 (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  SuppliedRootFineParent3Block650.value 0 strategy axis orbit
/-- The proof-free read equals the complete original integer parent3 law of node 650. -/
theorem read650_eq (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) :
    read650 strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator ⟨650, by omega⟩ strategy axis orbit :=
  nodeRead_eq SuppliedRootFineParent3Block650.table read650 (fun _ _ _ => rfl) strategy axis orbit

/-- Complete parent3 lookup through the proof-free read of original node 644. -/
def parents0 : ParentValues3 :=
  extendParent3 644 read644 SuppliedRootFineParent3Integers.numerator
/-- Every value equals the complete original integer hierarchy. -/
theorem parents0_eq : ∀ node strategy axis orbit, parents0 node strategy axis orbit =
    SuppliedRootFineParent3Integers.numerator node strategy axis orbit :=
  extendParent3_eq 644 (by omega) read644 read644_eq _ (fun _ _ _ _ => rfl)
/-- Complete parent3 lookup through the proof-free read of original node 645. -/
def parents1 : ParentValues3 :=
  extendParent3 645 read645 SuppliedRootFineParent3Integers.numerator
/-- Every value equals the complete original integer hierarchy. -/
theorem parents1_eq : ∀ node strategy axis orbit, parents1 node strategy axis orbit =
    SuppliedRootFineParent3Integers.numerator node strategy axis orbit :=
  extendParent3_eq 645 (by omega) read645 read645_eq _ (fun _ _ _ _ => rfl)
/-- Complete parent3 lookup through the proof-free read of original node 646. -/
def parents2 : ParentValues3 :=
  extendParent3 646 read646 SuppliedRootFineParent3Integers.numerator
/-- Every value equals the complete original integer hierarchy. -/
theorem parents2_eq : ∀ node strategy axis orbit, parents2 node strategy axis orbit =
    SuppliedRootFineParent3Integers.numerator node strategy axis orbit :=
  extendParent3_eq 646 (by omega) read646 read646_eq _ (fun _ _ _ _ => rfl)
/-- Complete parent3 lookup through the proof-free read of original node 647. -/
def parents3 : ParentValues3 :=
  extendParent3 647 read647 SuppliedRootFineParent3Integers.numerator
/-- Every value equals the complete original integer hierarchy. -/
theorem parents3_eq : ∀ node strategy axis orbit, parents3 node strategy axis orbit =
    SuppliedRootFineParent3Integers.numerator node strategy axis orbit :=
  extendParent3_eq 647 (by omega) read647 read647_eq _ (fun _ _ _ _ => rfl)
/-- Complete parent3 lookup through the proof-free read of original node 648. -/
def parents4 : ParentValues3 :=
  extendParent3 648 read648 SuppliedRootFineParent3Integers.numerator
/-- Every value equals the complete original integer hierarchy. -/
theorem parents4_eq : ∀ node strategy axis orbit, parents4 node strategy axis orbit =
    SuppliedRootFineParent3Integers.numerator node strategy axis orbit :=
  extendParent3_eq 648 (by omega) read648 read648_eq _ (fun _ _ _ _ => rfl)
/-- Complete parent3 lookup through the proof-free read of original node 649. -/
def parents5 : ParentValues3 :=
  extendParent3 649 read649 SuppliedRootFineParent3Integers.numerator
/-- Every value equals the complete original integer hierarchy. -/
theorem parents5_eq : ∀ node strategy axis orbit, parents5 node strategy axis orbit =
    SuppliedRootFineParent3Integers.numerator node strategy axis orbit :=
  extendParent3_eq 649 (by omega) read649 read649_eq _ (fun _ _ _ _ => rfl)
/-- Complete parent3 lookup through the proof-free read of original node 650. -/
def parents6 : ParentValues3 :=
  extendParent3 650 read650 SuppliedRootFineParent3Integers.numerator
/-- Every value equals the complete original integer hierarchy. -/
theorem parents6_eq : ∀ node strategy axis orbit, parents6 node strategy axis orbit =
    SuppliedRootFineParent3Integers.numerator node strategy axis orbit :=
  extendParent3_eq 650 (by omega) read650 read650_eq _ (fun _ _ _ _ => rfl)

/-- Exact summary of original node 644 on fine axis 0. -/
def summary0 : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (-86731970868460096455 : ℚ) / 19342813113834066795298816⟩, ⟨(4 : ℚ) / 1, (86731970868460096455 : ℚ) / 19342813113834066795298816⟩
]
/-- Original node 644: all strategies and physical roles normalize to the summary. -/
theorem checked0 : mergeNormalizeLogExpression (cachedNode3 parents0 644 0) = summary0 := by decide +kernel
/-- Exact summary of original node 645 on fine axis 0. -/
def summary1 : RationalLogExpression := [
  ⟨(281 : ℚ) / 4398046511104, (-391531875579851365702033625924407765 : ℚ) / 374144419156711147060143317175368453031918731001856⟩, ⟨(283 : ℚ) / 4398046511104, (-55027663029139067223420987704038175 : ℚ) / 374144419156711147060143317175368453031918731001856⟩, ⟨(539545928956871 : ℚ) / 1208925819614629174706176, (751777329273868115757078506538292039463504991115 : ℚ) / 102844034832575377634685573909834406561420991602098741459288064⟩,
  ⟨(1119945205021275 : ℚ) / 2417851639229258349412352, (217766669091910908643066899401695387779520449375 : ℚ) / 205688069665150755269371147819668813122841983204197482918576128⟩, ⟨(69966243380475410733445 : ℚ) / 2417851639229258349412352, (-97487596078412447448649049305350462248329612675038801425 : ℚ) / 205688069665150755269371147819668813122841983204197482918576128⟩, ⟨(559729947233068042842183 : ℚ) / 19342813113834066795298816, (-108836151673706923240195972730061740551361609993121315675 : ℚ) / 1645504557321206042154969182557350504982735865633579863348609024⟩,
  ⟨(354130735493 : ℚ) / 4398046511104, (108836149931573570504908703585526545337798507756957720675 : ℚ) / 1645504557321206042154969182557350504982735865633579863348609024⟩, ⟨(44266341947 : ℚ) / 549755813888, (97487594574857788900912817791193449171745533748028819195 : ℚ) / 205688069665150755269371147819668813122841983204197482918576128⟩, ⟨(395142590351 : ℚ) / 1099511627776, (-38920864363082285933908649921567592354752215 : ℚ) / 46768052394588893382517914646921056628989841375232⟩,
  ⟨(1548921728933976963483045 : ℚ) / 2417851639229258349412352, (301178597025761017595522693794698303505942432961341502625 : ℚ) / 205688069665150755269371147819668813122841983204197482918576128⟩, ⟨(774460864483017108784185 : ℚ) / 1208925819614629174706176, (1079096494071988555916747267164775983259855744514502929525 : ℚ) / 102844034832575377634685573909834406561420991602098741459288064⟩, ⟨(1408736106937 : ℚ) / 2199023255552, (-1962865089487906307459735004016428301471292405 : ℚ) / 187072209578355573530071658587684226515959365500928⟩,
  ⟨(1408736106945 : ℚ) / 2199023255552, (-273920338480391080054172200505277217332730125 : ℚ) / 187072209578355573530071658587684226515959365500928⟩, ⟨(704369037425 : ℚ) / 1099511627776, (-69379136637286247705286286574627099008227625 : ℚ) / 46768052394588893382517914646921056628989841375232⟩, ⟨(505489471941 : ℚ) / 549755813888, (1113237519410227044182582432038897533481886597859300686085 : ℚ) / 205688069665150755269371147819668813122841983204197482918576128⟩,
  ⟨(4043915775611 : ℚ) / 4398046511104, (1242829778816965262812623700612107536675018599869429325725 : ℚ) / 1645504557321206042154969182557350504982735865633579863348609024⟩, ⟨(18783083165356351589814201 : ℚ) / 19342813113834066795298816, (-3652258555023053403576805250969693964722558063560161346725 : ℚ) / 1645504557321206042154969182557350504982735865633579863348609024⟩, ⟨(2347885395694301554976379 : ℚ) / 2417851639229258349412352, (-3271430507554204156016076966368449500001598086888306545135 : ℚ) / 205688069665150755269371147819668813122841983204197482918576128⟩,
  ⟨(2 : ℚ) / 1, (-271941833440910765394669499263850322256446474954340650577275 : ℚ) / 1645504557321206042154969182557350504982735865633579863348609024⟩, ⟨(4 : ℚ) / 1, (268982439425695277047926578064655068488069593127522579674345 : ℚ) / 1645504557321206042154969182557350504982735865633579863348609024⟩, ⟨(8 : ℚ) / 1, (888736920301006502829388367172865438537998511393431727075 : ℚ) / 1645504557321206042154969182557350504982735865633579863348609024⟩
]
/-- Original node 645: all strategies and physical roles normalize to the summary. -/
theorem checked1 : mergeNormalizeLogExpression (cachedNode3 parents1 645 0) = summary1 := by decide +kernel
/-- Exact summary of original node 646 on fine axis 0. -/
def summary2 : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (-10080847571779355771555 : ℚ) / 9671406556917033397649408⟩, ⟨(4 : ℚ) / 1, (10080847571779355771555 : ℚ) / 9671406556917033397649408⟩
]
/-- Original node 646: all strategies and physical roles normalize to the summary. -/
theorem checked2 : mergeNormalizeLogExpression (cachedNode3 parents2 646 0) = summary2 := by decide +kernel
/-- Exact summary of original node 647 on fine axis 0. -/
def summary3 : RationalLogExpression := [
  ⟨(44940641243 : ℚ) / 2199023255552, (-26435671464835144696375674201735542142232615 : ℚ) / 2923003274661805836407369665432566039311865085952⟩, ⟨(2154082614309 : ℚ) / 2199023255552, (-1267107427152158671953447460550890014428534745 : ℚ) / 2923003274661805836407369665432566039311865085952⟩, ⟨(2 : ℚ) / 1, (-198378415175680534020213517021105233999781222287902298567745 : ℚ) / 411376139330301510538742295639337626245683966408394965837152256⟩,
  ⟨(4 : ℚ) / 1, (165721598861268502775816326802658187627774299359725138774975 : ℚ) / 411376139330301510538742295639337626245683966408394965837152256⟩, ⟨(8 : ℚ) / 1, (16328408157206015622198595109223523186003461464088579896385 : ℚ) / 411376139330301510538742295639337626245683966408394965837152256⟩
]
/-- Original node 647: all strategies and physical roles normalize to the summary. -/
theorem checked3 : mergeNormalizeLogExpression (cachedNode3 parents3 647 0) = summary3 := by decide +kernel
/-- Exact summary of original node 648 on fine axis 0. -/
def summary4 : RationalLogExpression := [
  ⟨(506790712685982897 : ℚ) / 9671406556917033397649408, (13423126242531322572742559205875381090535804602025 : ℚ) / 411376139330301510538742295639337626245683966408394965837152256⟩, ⟨(222238123926419697 : ℚ) / 2417851639229258349412352, (379038700722020315849273387494340380242310934565 : ℚ) / 12855504354071922204335696738729300820177623950262342682411008⟩, ⟨(200155691623145737 : ℚ) / 1208925819614629174706176, (314194176877664827357062100335065574631141760655 : ℚ) / 25711008708143844408671393477458601640355247900524685364822016⟩,
  ⟨(62559698163 : ℚ) / 4398046511104, (-1656989177417950858186110967088079252032475 : ℚ) / 187072209578355573530071658587684226515959365500928⟩, ⟨(15639925177 : ℚ) / 1099511627776, (-26674707353282133832480382358290915169165 : ℚ) / 5846006549323611672814739330865132078623730171904⟩, ⟨(31279852723 : ℚ) / 2199023255552, (-49101514423390381614012636007790288284245 : ℚ) / 46768052394588893382517914646921056628989841375232⟩,
  ⟨(404448387610110824391921 : ℚ) / 9671406556917033397649408, (-10712433415966417160119113350333377409927141542733550825 : ℚ) / 411376139330301510538742295639337626245683966408394965837152256⟩, ⟨(101112151332823783789057 : ℚ) / 2417851639229258349412352, (-172452042841627367873507246386131283327502001356571765 : ℚ) / 12855504354071922204335696738729300820177623950262342682411008⟩, ⟨(101112252782407309799429 : ℚ) / 2417851639229258349412352, (-158720847644090321160651268207162594392418557731779635 : ℚ) / 51422017416287688817342786954917203280710495801049370729644032⟩,
  ⟨(127257940065 : ℚ) / 1099511627776, (158720219255736565830996554082961924261269295448258325 : ℚ) / 51422017416287688817342786954917203280710495801049370729644032⟩, ⟨(127258026155 : ℚ) / 1099511627776, (10778228987682915365824462319546486811695109940352325 : ℚ) / 803469022129495137770981046170581301261101496891396417650688⟩, ⟨(15907259043 : ℚ) / 137438953472, (167381562388127728574945946996471430227282046983264825 : ℚ) / 6427752177035961102167848369364650410088811975131171341205504⟩,
  ⟨(12903444705 : ℚ) / 34359738368, (-32769684441865706049593841361195480954725 : ℚ) / 1461501637330902918203684832716283019655932542976⟩, ⟨(1651641135243 : ℚ) / 4398046511104, (-2959081511301492362371791179867265674397525 : ℚ) / 93536104789177786765035829293842113257979682750464⟩, ⟨(1651641252779 : ℚ) / 4398046511104, (-770309020091568458517126379067204281227043965 : ℚ) / 93536104789177786765035829293842113257979682750464⟩,
  ⟨(754924933902342923198199 : ℚ) / 1208925819614629174706176, (1185042585041551109193933421583829010304978331598627185 : ℚ) / 25711008708143844408671393477458601640355247900524685364822016⟩, ⟨(1509849977448739500001039 : ℚ) / 2417851639229258349412352, (2575127811674744783970349187078923242331631750876680155 : ℚ) / 12855504354071922204335696738729300820177623950262342682411008⟩, ⟨(6039400145108167037193039 : ℚ) / 9671406556917033397649408, (159962739149839058799333350619558338422364548859438201175 : ℚ) / 411376139330301510538742295639337626245683966408394965837152256⟩,
  ⟨(2746401447393 : ℚ) / 4398046511104, (-72742637973062892947680631260535639875227225 : ℚ) / 187072209578355573530071658587684226515959365500928⟩, ⟨(686600378543 : ℚ) / 1099511627776, (-1171032722919992696002129849308544515530235 : ℚ) / 5846006549323611672814739330865132078623730171904⟩, ⟨(686600409661 : ℚ) / 1099511627776, (-1077790238228524673885440987438350335078715 : ℚ) / 23384026197294446691258957323460528314494920687616⟩,
  ⟨(2746405258325 : ℚ) / 4398046511104, (-1280896041894722347872285894289486016584063875 : ℚ) / 93536104789177786765035829293842113257979682750464⟩, ⟨(2746405375861 : ℚ) / 4398046511104, (-4920461955589183600444625856245169358485675 : ℚ) / 93536104789177786765035829293842113257979682750464⟩, ⟨(21456293663 : ℚ) / 34359738368, (-54490563466053372808166042520507386644635 : ℚ) / 1461501637330902918203684832716283019655932542976⟩,
  ⟨(121531694429 : ℚ) / 137438953472, (1278797612977461500347818435634385752273980602527851975 : ℚ) / 6427752177035961102167848369364650410088811975131171341205504⟩, ⟨(972253601621 : ℚ) / 1099511627776, (82345862724658094174980772286400669814066140256496315 : ℚ) / 803469022129495137770981046170581301261101496891396417650688⟩, ⟨(972253687711 : ℚ) / 1099511627776, (1212626248757976451225478328249200744255499527751403755 : ℚ) / 51422017416287688817342786954917203280710495801049370729644032⟩,
  ⟨(2282346824662791763578875 : ℚ) / 2417851639229258349412352, (-3582711418841078669613345171416858764865456190948658125 : ℚ) / 51422017416287688817342786954917203280710495801049370729644032⟩, ⟨(2282346928717118335790591 : ℚ) / 2417851639229258349412352, (-3892661615269274290770041543661333959356689994980621195 : ℚ) / 12855504354071922204335696738729300820177623950262342682411008⟩, ⟨(9129387938186171839306511 : ℚ) / 9671406556917033397649408, (-241805786380396594821593730500159026567899307421220727575 : ℚ) / 411376139330301510538742295639337626245683966408394965837152256⟩,
  ⟨(2 : ℚ) / 1, (-9138011363635934011903780414754404354870586360059237529535 : ℚ) / 411376139330301510538742295639337626245683966408394965837152256⟩, ⟨(4 : ℚ) / 1, (3228522082342168875384988036633567147199378476991246920215 : ℚ) / 205688069665150755269371147819668813122841983204197482918576128⟩, ⟨(8 : ℚ) / 1, (17500665568051215501356555380346879231546554047998084385 : ℚ) / 411376139330301510538742295639337626245683966408394965837152256⟩
]
/-- Original node 648: all strategies and physical roles normalize to the summary. -/
theorem checked4 : mergeNormalizeLogExpression (cachedNode3 parents4 648 0) = summary4 := by decide +kernel
/-- Exact summary of original node 649 on fine axis 0. -/
def summary5 : RationalLogExpression := [
  ⟨(1046123719743 : ℚ) / 4398046511104, (-349505175364940143417206993341105454882195 : ℚ) / 187072209578355573530071658587684226515959365500928⟩, ⟨(3351922791361 : ℚ) / 4398046511104, (-1119862154824450927436739530836267048198765 : ℚ) / 187072209578355573530071658587684226515959365500928⟩, ⟨(2 : ℚ) / 1, (-8809397247274855995048081659459917190527045719055173135 : ℚ) / 51422017416287688817342786954917203280710495801049370729644032⟩,
  ⟨(4 : ℚ) / 1, (17187183158040897299466820374402446961656271766659827215 : ℚ) / 102844034832575377634685573909834406561420991602098741459288064⟩
]
/-- Original node 649: all strategies and physical roles normalize to the summary. -/
theorem checked5 : mergeNormalizeLogExpression (cachedNode3 parents5 649 0) = summary5 := by decide +kernel
/-- Exact summary of original node 650 on fine axis 0. -/
def summary6 : RationalLogExpression := [
  ⟨(583 : ℚ) / 2199023255552, (-155142524011235715904851028383575 : ℚ) / 46768052394588893382517914646921056628989841375232⟩, ⟨(2199023254969 : ℚ) / 2199023255552, (-585183564554534823871342146712000176941225 : ℚ) / 46768052394588893382517914646921056628989841375232⟩, ⟨(2 : ℚ) / 1, (-159025529110736352269707228165596889310495498662347338725 : ℚ) / 51422017416287688817342786954917203280710495801049370729644032⟩,
  ⟨(4 : ℚ) / 1, (316764225954582262995799449690439065430821613058739991525 : ℚ) / 102844034832575377634685573909834406561420991602098741459288064⟩
]
/-- Original node 650: all strategies and physical roles normalize to the summary. -/
theorem checked6 : mergeNormalizeLogExpression (cachedNode3 parents6 650 0) = summary6 := by decide +kernel

/-- Every complete node summary in original source order. -/
def summaries : Fin 7 → RationalLogExpression := ![summary0, summary1, summary2, summary3, summary4, summary5, summary6]
/-- Each original node is identified separately without omitting any strategy or role. -/
theorem checked : ∀ offset, rationalLogValue (summaries offset) =
    rationalLogValue (sourceSum3 (finProdFinEquiv ((92 : Fin 135), offset)) 0) := by
  intro offset
  fin_cases offset
  · exact node3_value parents0 parents0_eq 644 0 summary0 checked0
  · exact node3_value parents1 parents1_eq 645 0 summary1 checked1
  · exact node3_value parents2 parents2_eq 646 0 summary2 checked2
  · exact node3_value parents3 parents3_eq 647 0 summary3 checked3
  · exact node3_value parents4 parents4_eq 648 0 summary4 checked4
  · exact node3_value parents5 parents5_eq 649 0 summary5 checked5
  · exact node3_value parents6 parents6_eq 650 0 summary6 checked6
/-- Seven independently checked complete node summaries. -/
def expression : RationalLogExpression := finiteLogSum summaries
/-- Combining the seven exact summaries preserves the whole source-block value. -/
theorem value : rationalLogValue expression =
    ∑ offset : Fin 7, rationalLogValue (sourceSum3 (finProdFinEquiv ((92 : Fin 135), offset)) 0) :=
  block3_value 92 0 summaries checked

end MatrixBounds.Numeric.SuppliedPairedFine.PairedFine3Cache092A0
