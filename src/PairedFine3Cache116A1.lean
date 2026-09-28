import SuppliedPairedFineBlocks
import SuppliedPairedFineTableReads
import SuppliedRootFineParent3Block812
import SuppliedRootFineParent3Block813
import SuppliedRootFineParent3Block814
import SuppliedRootFineParent3Block815
import SuppliedRootFineParent3Block816
import SuppliedRootFineParent3Block817
import SuppliedRootFineParent3Block818

namespace MatrixBounds.Numeric.SuppliedPairedFine.PairedFine3Cache116A1
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Proof-free read of the checked complete parent3 table of original node 812. -/
def read812 (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  SuppliedRootFineParent3Block812.value 0 strategy axis orbit
/-- The proof-free read equals the complete original integer parent3 law of node 812. -/
theorem read812_eq (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) :
    read812 strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator ⟨812, by omega⟩ strategy axis orbit :=
  nodeRead_eq SuppliedRootFineParent3Block812.table read812 (fun _ _ _ => rfl) strategy axis orbit

/-- Proof-free read of the checked complete parent3 table of original node 813. -/
def read813 (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  SuppliedRootFineParent3Block813.value 0 strategy axis orbit
/-- The proof-free read equals the complete original integer parent3 law of node 813. -/
theorem read813_eq (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) :
    read813 strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator ⟨813, by omega⟩ strategy axis orbit :=
  nodeRead_eq SuppliedRootFineParent3Block813.table read813 (fun _ _ _ => rfl) strategy axis orbit

/-- Proof-free read of the checked complete parent3 table of original node 814. -/
def read814 (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  SuppliedRootFineParent3Block814.value 0 strategy axis orbit
/-- The proof-free read equals the complete original integer parent3 law of node 814. -/
theorem read814_eq (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) :
    read814 strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator ⟨814, by omega⟩ strategy axis orbit :=
  nodeRead_eq SuppliedRootFineParent3Block814.table read814 (fun _ _ _ => rfl) strategy axis orbit

/-- Proof-free read of the checked complete parent3 table of original node 815. -/
def read815 (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  SuppliedRootFineParent3Block815.value 0 strategy axis orbit
/-- The proof-free read equals the complete original integer parent3 law of node 815. -/
theorem read815_eq (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) :
    read815 strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator ⟨815, by omega⟩ strategy axis orbit :=
  nodeRead_eq SuppliedRootFineParent3Block815.table read815 (fun _ _ _ => rfl) strategy axis orbit

/-- Proof-free read of the checked complete parent3 table of original node 816. -/
def read816 (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  SuppliedRootFineParent3Block816.value 0 strategy axis orbit
/-- The proof-free read equals the complete original integer parent3 law of node 816. -/
theorem read816_eq (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) :
    read816 strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator ⟨816, by omega⟩ strategy axis orbit :=
  nodeRead_eq SuppliedRootFineParent3Block816.table read816 (fun _ _ _ => rfl) strategy axis orbit

/-- Proof-free read of the checked complete parent3 table of original node 817. -/
def read817 (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  SuppliedRootFineParent3Block817.value 0 strategy axis orbit
/-- The proof-free read equals the complete original integer parent3 law of node 817. -/
theorem read817_eq (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) :
    read817 strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator ⟨817, by omega⟩ strategy axis orbit :=
  nodeRead_eq SuppliedRootFineParent3Block817.table read817 (fun _ _ _ => rfl) strategy axis orbit

/-- Proof-free read of the checked complete parent3 table of original node 818. -/
def read818 (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  SuppliedRootFineParent3Block818.value 0 strategy axis orbit
/-- The proof-free read equals the complete original integer parent3 law of node 818. -/
theorem read818_eq (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) :
    read818 strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator ⟨818, by omega⟩ strategy axis orbit :=
  nodeRead_eq SuppliedRootFineParent3Block818.table read818 (fun _ _ _ => rfl) strategy axis orbit

/-- Complete parent3 lookup through the proof-free read of original node 812. -/
def parents0 : ParentValues3 :=
  extendParent3 812 read812 SuppliedRootFineParent3Integers.numerator
/-- Every value equals the complete original integer hierarchy. -/
theorem parents0_eq : ∀ node strategy axis orbit, parents0 node strategy axis orbit =
    SuppliedRootFineParent3Integers.numerator node strategy axis orbit :=
  extendParent3_eq 812 (by omega) read812 read812_eq _ (fun _ _ _ _ => rfl)
/-- Complete parent3 lookup through the proof-free read of original node 813. -/
def parents1 : ParentValues3 :=
  extendParent3 813 read813 SuppliedRootFineParent3Integers.numerator
/-- Every value equals the complete original integer hierarchy. -/
theorem parents1_eq : ∀ node strategy axis orbit, parents1 node strategy axis orbit =
    SuppliedRootFineParent3Integers.numerator node strategy axis orbit :=
  extendParent3_eq 813 (by omega) read813 read813_eq _ (fun _ _ _ _ => rfl)
/-- Complete parent3 lookup through the proof-free read of original node 814. -/
def parents2 : ParentValues3 :=
  extendParent3 814 read814 SuppliedRootFineParent3Integers.numerator
/-- Every value equals the complete original integer hierarchy. -/
theorem parents2_eq : ∀ node strategy axis orbit, parents2 node strategy axis orbit =
    SuppliedRootFineParent3Integers.numerator node strategy axis orbit :=
  extendParent3_eq 814 (by omega) read814 read814_eq _ (fun _ _ _ _ => rfl)
/-- Complete parent3 lookup through the proof-free read of original node 815. -/
def parents3 : ParentValues3 :=
  extendParent3 815 read815 SuppliedRootFineParent3Integers.numerator
/-- Every value equals the complete original integer hierarchy. -/
theorem parents3_eq : ∀ node strategy axis orbit, parents3 node strategy axis orbit =
    SuppliedRootFineParent3Integers.numerator node strategy axis orbit :=
  extendParent3_eq 815 (by omega) read815 read815_eq _ (fun _ _ _ _ => rfl)
/-- Complete parent3 lookup through the proof-free read of original node 816. -/
def parents4 : ParentValues3 :=
  extendParent3 816 read816 SuppliedRootFineParent3Integers.numerator
/-- Every value equals the complete original integer hierarchy. -/
theorem parents4_eq : ∀ node strategy axis orbit, parents4 node strategy axis orbit =
    SuppliedRootFineParent3Integers.numerator node strategy axis orbit :=
  extendParent3_eq 816 (by omega) read816 read816_eq _ (fun _ _ _ _ => rfl)
/-- Complete parent3 lookup through the proof-free read of original node 817. -/
def parents5 : ParentValues3 :=
  extendParent3 817 read817 SuppliedRootFineParent3Integers.numerator
/-- Every value equals the complete original integer hierarchy. -/
theorem parents5_eq : ∀ node strategy axis orbit, parents5 node strategy axis orbit =
    SuppliedRootFineParent3Integers.numerator node strategy axis orbit :=
  extendParent3_eq 817 (by omega) read817 read817_eq _ (fun _ _ _ _ => rfl)
/-- Complete parent3 lookup through the proof-free read of original node 818. -/
def parents6 : ParentValues3 :=
  extendParent3 818 read818 SuppliedRootFineParent3Integers.numerator
/-- Every value equals the complete original integer hierarchy. -/
theorem parents6_eq : ∀ node strategy axis orbit, parents6 node strategy axis orbit =
    SuppliedRootFineParent3Integers.numerator node strategy axis orbit :=
  extendParent3_eq 818 (by omega) read818 read818_eq _ (fun _ _ _ _ => rfl)

/-- Exact summary of original node 812 on fine axis 1. -/
def summary0 : RationalLogExpression := [
  ⟨(1046132605939 : ℚ) / 4398046511104, (-78642828483112407634370943366201421025180907 : ℚ) / 374144419156711147060143317175368453031918731001856⟩, ⟨(1046132605963 : ℚ) / 4398046511104, (-33294164090680139220267029220164811765419439 : ℚ) / 93536104789177786765035829293842113257979682750464⟩, ⟨(3351913905141 : ℚ) / 4398046511104, (-106677844605432360404734206345103209318216273 : ℚ) / 93536104789177786765035829293842113257979682750464⟩,
  ⟨(3351913905165 : ℚ) / 4398046511104, (-251979518502285697952931500379922272820986645 : ℚ) / 374144419156711147060143317175368453031918731001856⟩, ⟨(2 : ℚ) / 1, (-4980544327428836181557725088774547479860016685294895571235 : ℚ) / 205688069665150755269371147819668813122841983204197482918576128⟩, ⟨(4 : ℚ) / 1, (9437936244190415583257186921849403219359351744365349904675 : ℚ) / 411376139330301510538742295639337626245683966408394965837152256⟩
]
/-- Original node 812: all strategies and physical roles normalize to the summary. -/
theorem checked0 : mergeNormalizeLogExpression (cachedNode3 parents0 812 1) = summary0 := by decide +kernel
/-- Exact summary of original node 813 on fine axis 1. -/
def summary1 : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (-316657759226278599 : ℚ) / 1208925819614629174706176⟩, ⟨(4 : ℚ) / 1, (316657759226278599 : ℚ) / 1208925819614629174706176⟩
]
/-- Original node 813: all strategies and physical roles normalize to the summary. -/
theorem checked1 : mergeNormalizeLogExpression (cachedNode3 parents1 813 1) = summary1 := by decide +kernel
/-- Exact summary of original node 814 on fine axis 1. -/
def summary2 : RationalLogExpression := [
  ⟨(145 : ℚ) / 2199023255552, (-909088259197073629971578643462915 : ℚ) / 46768052394588893382517914646921056628989841375232⟩, ⟨(335 : ℚ) / 4398046511104, (-47017295245699314078140723329785 : ℚ) / 11692013098647223345629478661730264157247460343808⟩, ⟨(1827000312025717 : ℚ) / 1208925819614629174706176, (11454514022151513201426330174353527954506315759 : ℚ) / 25711008708143844408671393477458601640355247900524685364822016⟩,
  ⟨(7434998763359255 : ℚ) / 2417851639229258349412352, (1043503080621705610878861105600057198853125105 : ℚ) / 6427752177035961102167848369364650410088811975131171341205504⟩, ⟨(268234044524688641541221 : ℚ) / 9671406556917033397649408, (-1681713245478203699946359416673901438815780484428671167 : ℚ) / 205688069665150755269371147819668813122841983204197482918576128⟩, ⟨(134117026424991913632549 : ℚ) / 4835703278458516698824704, (-18823342772833139028944671718532221884635502776827379 : ℚ) / 12855504354071922204335696738729300820177623950262342682411008⟩,
  ⟨(85106129141 : ℚ) / 1099511627776, (18823340685826977785533449960810010684521105070577169 : ℚ) / 12855504354071922204335696738729300820177623950262342682411008⟩, ⟨(340424524879 : ℚ) / 4398046511104, (1681713153842091522734253805263260043987556848378145095 : ℚ) / 205688069665150755269371147819668813122841983204197482918576128⟩, ⟨(1551502667230721770124265 : ℚ) / 2417851639229258349412352, (217753608894557670620444517830065430735055062400076815 : ℚ) / 6427752177035961102167848369364650410088811975131171341205504⟩,
  ⟨(775751335119381617552779 : ℚ) / 1208925819614629174706176, (4863630557334374644309895277024904971330024435781666833 : ℚ) / 25711008708143844408671393477458601640355247900524685364822016⟩, ⟨(352770865423 : ℚ) / 549755813888, (-2211723116847173817614661165158047490733021 : ℚ) / 11692013098647223345629478661730264157247460343808⟩, ⟨(1411083462395 : ℚ) / 2199023255552, (-198045754530595105499878744657441108152045 : ℚ) / 5846006549323611672814739330865132078623730171904⟩,
  ⟨(4057621986225 : ℚ) / 4398046511104, (20044843331951134947316986039066747289815702057214973625 : ℚ) / 205688069665150755269371147819668813122841983204197482918576128⟩, ⟨(1014405498635 : ℚ) / 1099511627776, (224361047636744124046438604984835543325786767441439215 : ℚ) / 12855504354071922204335696738729300820177623950262342682411008⟩, ⟨(4701586251665188389887195 : ℚ) / 4835703278458516698824704, (-659868265425859465287327640644966404795896892241592845 : ℚ) / 12855504354071922204335696738729300820177623950262342682411008⟩,
  ⟨(9403172511754628011998107 : ℚ) / 9671406556917033397649408, (-58953887790626132101796148255265987060455897543468308289 : ℚ) / 205688069665150755269371147819668813122841983204197482918576128⟩, ⟨(2 : ℚ) / 1, (-5505081441156742222483779432883824434566640589983456233455 : ℚ) / 205688069665150755269371147819668813122841983204197482918576128⟩, ⟨(4 : ℚ) / 1, (5501115667697055154634960484555483600588700692925740414993 : ℚ) / 205688069665150755269371147819668813122841983204197482918576128⟩,
  ⟨(8 : ℚ) / 1, (1982886729843533924409474164170416988969948528857909231 : ℚ) / 205688069665150755269371147819668813122841983204197482918576128⟩
]
/-- Original node 814: all strategies and physical roles normalize to the summary. -/
theorem checked2 : mergeNormalizeLogExpression (cachedNode3 parents2 814 1) = summary2 := by decide +kernel
/-- Exact summary of original node 815 on fine axis 1. -/
def summary3 : RationalLogExpression := [
  ⟨(83 : ℚ) / 4398046511104, (-82913091536382064531705491484804911 : ℚ) / 46768052394588893382517914646921056628989841375232⟩, ⟨(312553202781855027767609835 : ℚ) / 10633823966279326983230456482242756608, (-312225931472787123496765746324023876282135426107019273974695 : ℚ) / 113078212145816597093331040047546785012958969400039613319782796882727665664⟩, ⟨(253 : ℚ) / 4398046511104, (-39817685851772858440116803335159119 : ℚ) / 93536104789177786765035829293842113257979682750464⟩,
  ⟨(31 : ℚ) / 274877906944, (-7534275206783933070595581742189413 : ℚ) / 182687704666362864775460604089535377456991567872⟩, ⟨(5127551663362532974456840471 : ℚ) / 42535295865117307932921825928971026432, (-806985143559307177394133473347310598629772873142048888473933 : ℚ) / 904625697166532776746648320380374280103671755200316906558262375061821325312⟩, ⟨(3518483281894035 : ℚ) / 9671406556917033397649408, (3514799113504941000901183196009364626262777706095 : ℚ) / 102844034832575377634685573909834406561420991602098741459288064⟩,
  ⟨(8781256531977203826363782295 : ℚ) / 21267647932558653966460912964485513216, (-2134206560428558398160689442294984853677974217526706483414285 : ℚ) / 14134776518227074636666380005943348126619871175004951664972849610340958208⟩, ⟨(14430507135581957 : ℚ) / 9671406556917033397649408, (2271104347060746905631188451148776749440052412711 : ℚ) / 205688069665150755269371147819668813122841983204197482918576128⟩, ⟨(49426312768221285 : ℚ) / 9671406556917033397649408, (12012627188785734626889323543802935849746631234055 : ℚ) / 6427752177035961102167848369364650410088811975131171341205504⟩,
  ⟨(101974127451 : ℚ) / 4398046511104, (-24783907747983682927740891388887478227254073 : ℚ) / 2923003274661805836407369665432566039311865085952⟩, ⟨(12746765941 : ℚ) / 549755813888, (-2006113525157374887085752003218978126026743 : ℚ) / 11692013098647223345629478661730264157247460343808⟩, ⟨(25493531939 : ℚ) / 1099511627776, (-25466837918602249911395096690476705201958463 : ℚ) / 11692013098647223345629478661730264157247460343808⟩,
  ⟨(419604251630641878310069465485080085 : ℚ) / 5316911983139663491615228241121378304, (-419164888247066303863357313051348054568547328607633221536850089593945 : ℚ) / 56539106072908298546665520023773392506479484700019806659891398441363832832⟩, ⟨(1678417018534398861863943476162748137 : ℚ) / 21267647932558653966460912964485513216, (-264152891590007577381978011597390504948596506818351609040119277532851 : ℚ) / 452312848583266388373324160190187140051835877600158453279131187530910662656⟩, ⟨(839208534341722736213994311807871849 : ℚ) / 10633823966279326983230456482242756608, (-203962195277816918257422582848760829096605292528782942571698238339827 : ℚ) / 7067388259113537318333190002971674063309935587502475832486424805170479104⟩,
  ⟨(177663597387 : ℚ) / 2199023255552, (185502525895572220613706166214253355382700931553820641757 : ℚ) / 6427752177035961102167848369364650410088811975131171341205504⟩, ⟨(355327197803 : ℚ) / 4398046511104, (240245651550850603570745303169785828707881176880633786387 : ℚ) / 411376139330301510538742295639337626245683966408394965837152256⟩, ⟨(88831799881 : ℚ) / 1099511627776, (381228243556516634306185282446915599856087211363881897405 : ℚ) / 51422017416287688817342786954917203280710495801049370729644032⟩,
  ⟨(19096114230262695811277934084285584535 : ℚ) / 21267647932558653966460912964485513216, (-4641141290031679980084039127814656227381062563904794936824204690113805 : ℚ) / 14134776518227074636666380005943348126619871175004951664972849610340958208⟩, ⟨(38192228574863899732724060685757686039 : ℚ) / 42535295865117307932921825928971026432, (-6010775333490250517151475214581075956443249396930915113452550266046797 : ℚ) / 904625697166532776746648320380374280103671755200316906558262375061821325312⟩, ⟨(9548057150550989925476329210131319275 : ℚ) / 10633823966279326983230456482242756608, (-9538059476123391982052472717765010335290205687957196444771729691915175 : ℚ) / 113078212145816597093331040047546785012958969400039613319782796882727665664⟩,
  ⟨(1010679827895 : ℚ) / 1099511627776, (4337407280980063908452914374169243823296172367571108049475 : ℚ) / 51422017416287688817342786954917203280710495801049370729644032⟩, ⟨(4042719313301 : ℚ) / 4398046511104, (2733384163853628671647954398689105247121894500202578792429 : ℚ) / 411376139330301510538742295639337626245683966408394965837152256⟩, ⟨(2021359658165 : ℚ) / 2199023255552, (2110546717773795520802903681511480992035399766460645537315 : ℚ) / 6427752177035961102167848369364650410088811975131171341205504⟩,
  ⟨(9447163028670632503316379 : ℚ) / 9671406556917033397649408, (2296049231656740552630875220836410803615164848267834945017 : ℚ) / 6427752177035961102167848369364650410088811975131171341205504⟩, ⟨(9447163064031475996377339 : ℚ) / 9671406556917033397649408, (1486814905431135290548602945298257086766111089101553876697 : ℚ) / 205688069665150755269371147819668813122841983204197482918576128⟩, ⟨(9447163074815956501243245 : ℚ) / 9671406556917033397649408, (9437271045558361972013258312331135650295154531607202187665 : ℚ) / 102844034832575377634685573909834406561420991602098741459288064⟩,
  ⟨(4296072383157 : ℚ) / 4398046511104, (-1044122311063514526457133728274918370251771511 : ℚ) / 2923003274661805836407369665432566039311865085952⟩, ⟨(4296072383265 : ℚ) / 4398046511104, (-4291574009163542125642470324797759006425858005 : ℚ) / 46768052394588893382517914646921056628989841375232⟩, ⟨(4296072383323 : ℚ) / 4398046511104, (-676125140536096131476983760389632851872596729 : ℚ) / 93536104789177786765035829293842113257979682750464⟩,
  ⟨(2 : ℚ) / 1, (-26933507514468501347628648316492501501241405547370946523909 : ℚ) / 411376139330301510538742295639337626245683966408394965837152256⟩, ⟨(4 : ℚ) / 1, (39635680088014834014166385593211056261855856993756974490790005033195067 : ℚ) / 904625697166532776746648320380374280103671755200316906558262375061821325312⟩, ⟨(8 : ℚ) / 1, (63304291217847178254722207124622798118500749 : ℚ) / 5846006549323611672814739330865132078623730171904⟩
]
/-- Original node 815: all strategies and physical roles normalize to the summary. -/
theorem checked3 : mergeNormalizeLogExpression (cachedNode3 parents3 815 1) = summary3 := by decide +kernel
/-- Exact summary of original node 816 on fine axis 1. -/
def summary4 : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (-4941352780384502337831 : ℚ) / 4835703278458516698824704⟩, ⟨(4 : ℚ) / 1, (4941352780384502337831 : ℚ) / 4835703278458516698824704⟩
]
/-- Original node 816: all strategies and physical roles normalize to the summary. -/
theorem checked4 : mergeNormalizeLogExpression (cachedNode3 parents4 816 1) = summary4 := by decide +kernel
/-- Exact summary of original node 817 on fine axis 1. -/
def summary5 : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (-732824819583922509543 : ℚ) / 4835703278458516698824704⟩, ⟨(4 : ℚ) / 1, (732824819583922509543 : ℚ) / 4835703278458516698824704⟩
]
/-- Original node 817: all strategies and physical roles normalize to the summary. -/
theorem checked5 : mergeNormalizeLogExpression (cachedNode3 parents5 817 1) = summary5 := by decide +kernel
/-- Exact summary of original node 818 on fine axis 1. -/
def summary6 : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (-4295688787444580595 : ℚ) / 1208925819614629174706176⟩, ⟨(4 : ℚ) / 1, (4295688787444580595 : ℚ) / 1208925819614629174706176⟩
]
/-- Original node 818: all strategies and physical roles normalize to the summary. -/
theorem checked6 : mergeNormalizeLogExpression (cachedNode3 parents6 818 1) = summary6 := by decide +kernel

/-- Every complete node summary in original source order. -/
def summaries : Fin 7 → RationalLogExpression := ![summary0, summary1, summary2, summary3, summary4, summary5, summary6]
/-- Each original node is identified separately without omitting any strategy or role. -/
theorem checked : ∀ offset, rationalLogValue (summaries offset) =
    rationalLogValue (sourceSum3 (finProdFinEquiv ((116 : Fin 135), offset)) 1) := by
  intro offset
  fin_cases offset
  · exact node3_value parents0 parents0_eq 812 1 summary0 checked0
  · exact node3_value parents1 parents1_eq 813 1 summary1 checked1
  · exact node3_value parents2 parents2_eq 814 1 summary2 checked2
  · exact node3_value parents3 parents3_eq 815 1 summary3 checked3
  · exact node3_value parents4 parents4_eq 816 1 summary4 checked4
  · exact node3_value parents5 parents5_eq 817 1 summary5 checked5
  · exact node3_value parents6 parents6_eq 818 1 summary6 checked6
/-- Seven independently checked complete node summaries. -/
def expression : RationalLogExpression := finiteLogSum summaries
/-- Combining the seven exact summaries preserves the whole source-block value. -/
theorem value : rationalLogValue expression =
    ∑ offset : Fin 7, rationalLogValue (sourceSum3 (finProdFinEquiv ((116 : Fin 135), offset)) 1) :=
  block3_value 116 1 summaries checked

end MatrixBounds.Numeric.SuppliedPairedFine.PairedFine3Cache116A1
