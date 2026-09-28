import SuppliedPairedFineBlocks
import PairedFine4Children015
import PairedFine4Parent015

namespace MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4Node015
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete parent4 integer lookup through the checked single-parent table. -/
def parents : ParentValues4 := parent4Window PairedFine4Parent015.table
/-- Every parent4 value equals the complete original integer hierarchy. -/
theorem parents_eq : ∀ source axis orbit, parents source axis orbit =
    SuppliedRootFineParent4Integers.numerator source axis orbit :=
  parent4Window_eq PairedFine4Parent015.table
/-- Complete literal child numerators of this parent. -/
def children : ChildValues4 := PairedFine4Children015.numerator
/-- Every child value equals the complete original integer child hierarchy. -/
theorem children_eq : ∀ column axis orbit, children column axis orbit =
    SuppliedRootFineChild3Integers.numerator 15 (shapeColumnEquiv 8 column) axis orbit :=
  PairedFine4Children015.numerator_eq
/-- One physical role of this source evaluated from checked integer caches. -/
def roleExpression (role : Fin 6) (axis : Fin 2) : RationalLogExpression :=
  cachedRole4 parents children 15 role axis

/-- Exact summary of physical role 0 on fine axis 0. -/
def summary00 : RationalLogExpression := [

]
/-- Physical role 0, fine axis 0: the cached expression normalizes to its summary. -/
theorem checked00 : mergeNormalizeLogExpression (roleExpression 0 0) = summary00 := by decide +kernel
/-- Exact summary of physical role 1 on fine axis 0. -/
def summary10 : RationalLogExpression := [

]
/-- Physical role 1, fine axis 0: the cached expression normalizes to its summary. -/
theorem checked10 : mergeNormalizeLogExpression (roleExpression 1 0) = summary10 := by decide +kernel
/-- Exact summary of physical role 2 on fine axis 0. -/
def summary20 : RationalLogExpression := [
  ⟨(2124611524543 : ℚ) / 4398046511104, (-6807763106790137777 : ℚ) / 9671406556917033397649408⟩, ⟨(2273434986561 : ℚ) / 4398046511104, (-7284629047903232079 : ℚ) / 9671406556917033397649408⟩, ⟨(2 : ℚ) / 1, (-55003257689294097105448510996441035858778128788684862689 : ℚ) / 205688069665150755269371147819668813122841983204197482918576128⟩,
  ⟨(4 : ℚ) / 1, (-167245314229228200394329162032831255448294287678244326175 : ℚ) / 102844034832575377634685573909834406561420991602098741459288064⟩, ⟨(8 : ℚ) / 1, (99923668220801792467419424186357099814348159630784793375 : ℚ) / 205688069665150755269371147819668813122841983204197482918576128⟩, ⟨(16 : ℚ) / 1, (6807763106790137777 : ℚ) / 9671406556917033397649408⟩
]
/-- Physical role 2, fine axis 0: the cached expression normalizes to its summary. -/
theorem checked20 : mergeNormalizeLogExpression (roleExpression 2 0) = summary20 := by decide +kernel
/-- Exact summary of physical role 3 on fine axis 0. -/
def summary30 : RationalLogExpression := [

]
/-- Physical role 3, fine axis 0: the cached expression normalizes to its summary. -/
theorem checked30 : mergeNormalizeLogExpression (roleExpression 3 0) = summary30 := by decide +kernel
/-- Exact summary of physical role 4 on fine axis 0. -/
def summary40 : RationalLogExpression := [

]
/-- Physical role 4, fine axis 0: the cached expression normalizes to its summary. -/
theorem checked40 : mergeNormalizeLogExpression (roleExpression 4 0) = summary40 := by decide +kernel
/-- Exact summary of physical role 5 on fine axis 0. -/
def summary50 : RationalLogExpression := [

]
/-- Physical role 5, fine axis 0: the cached expression normalizes to its summary. -/
theorem checked50 : mergeNormalizeLogExpression (roleExpression 5 0) = summary50 := by decide +kernel
/-- Exact summary of physical role 0 on fine axis 1. -/
def summary01 : RationalLogExpression := [

]
/-- Physical role 0, fine axis 1: the cached expression normalizes to its summary. -/
theorem checked01 : mergeNormalizeLogExpression (roleExpression 0 1) = summary01 := by decide +kernel
/-- Exact summary of physical role 1 on fine axis 1. -/
def summary11 : RationalLogExpression := [

]
/-- Physical role 1, fine axis 1: the cached expression normalizes to its summary. -/
theorem checked11 : mergeNormalizeLogExpression (roleExpression 1 1) = summary11 := by decide +kernel
/-- Exact summary of physical role 2 on fine axis 1. -/
def summary21 : RationalLogExpression := [
  ⟨(15484527445922866416268729142569166324793 : ℚ) / 46768052394588893382517914646921056628989841375232, (49616126738796439562798496399056682935388397527 : ℚ) / 102844034832575377634685573909834406561420991602098741459288064⟩, ⟨(1266684346541956312474955453130057465902166600927544156254930052770686624290391772759 : ℚ) / 3978585891278293137243057985174566720803649206378781739523711815145275976100267004264448, (-4058759383879251552728438786182002204484892407189473159694140817359892138329620643553525401 : ℚ) / 8749002899132047697490008908470485461412677723572849745703082425639811996797503692894052708092215296⟩, ⟨(2392731755 : ℚ) / 549755813888, (-7666884405909445 : ℚ) / 1208925819614629174706176⟩,
  ⟨(14848540773474055120869485652225282887255181588260429863020868551618398915934212534697 : ℚ) / 1989292945639146568621528992587283360401824603189390869761855907572637988050133502132224, (-47578273439455732906439719836800688213375655797186011523856124826969186923994125237964980583 : ℚ) / 4374501449566023848745004454235242730706338861786424872851541212819905998398751846447026354046107648⟩, ⟨(2722861616370075536131398762867653831104188677116456086671388088258220697 : ℚ) / 226156424291633194186662080095093570025917938800079226639565593765455331328, (-8724699382776034465818137040532288244123454422574956134699841896532432827934583 : ℚ) / 497323236409786642155382248146820840100456150797347717440463976893159497012533375533056⟩, ⟨(34761199299 : ℚ) / 1099511627776, (156037608319672749651044796243 : ℚ) / 10633823966279326983230456482242756608⟩,
  ⟨(139044797787 : ℚ) / 4398046511104, (624150435931597928647283364459 : ℚ) / 42535295865117307932921825928971026432⟩, ⟨(183188803901161799445108573572885080198980669319835205135160099629251009126861859769943 : ℚ) / 3978585891278293137243057985174566720803649206378781739523711815145275976100267004264448, (-586980709823454783092195250676607716491701620880719437867080262475931624233646718687382388377 : ℚ) / 8749002899132047697490008908470485461412677723572849745703082425639811996797503692894052708092215296⟩, ⟨(2408802754089374804450410590489742440439357225927 : ℚ) / 46768052394588893382517914646921056628989841375232, (7718379727960584234037379180060261827610965558247104553 : ℚ) / 102844034832575377634685573909834406561420991602098741459288064⟩,
  ⟨(42528824569478579576755596045376573794577801684867516546155338877673975143 : ℚ) / 226156424291633194186662080095093570025917938800079226639565593765455331328, (-136272518309681474344443774316841387438964180692918206350336236890059180438231177 : ℚ) / 497323236409786642155382248146820840100456150797347717440463976893159497012533375533056⟩, ⟨(18185692254336509023502506850025506636062076167819041218499447 : ℚ) / 51422017416287688817342786954917203280710495801049370729644032, (-58271304363342961336958649046618879358028910877896316814923449555833 : ℚ) / 113078212145816597093331040047546785012958969400039613319782796882727665664⟩, ⟨(1629934355113 : ℚ) / 4398046511104, (7316521397960432514525919370841 : ℚ) / 42535295865117307932921825928971026432⟩,
  ⟨(1629934360197 : ℚ) / 4398046511104, (7316521420781716494795194579829 : ℚ) / 42535295865117307932921825928971026432⟩, ⟨(1706773580027 : ℚ) / 4398046511104, (-5468910469292134453 : ℚ) / 9671406556917033397649408⟩, ⟨(2799779507125716160612661438592256983 : ℚ) / 5316911983139663491615228241121378304, (8971162688132997624765353675333414922950937 : ℚ) / 11692013098647223345629478661730264157247460343808⟩,
  ⟨(635611512887 : ℚ) / 1099511627776, (-2036651198441527993 : ℚ) / 2417851639229258349412352⟩, ⟨(82158354785 : ℚ) / 137438953472, (368796055448505124401030905745 : ℚ) / 1329227995784915872903807060280344576⟩, ⟨(2629067358795 : ℚ) / 4398046511104, (11801473799826354891145368372315 : ℚ) / 42535295865117307932921825928971026432⟩,
  ⟨(2 : ℚ) / 1, (-93595304726403618882789416752852571916766109784585825245203544100261 : ℚ) / 226156424291633194186662080095093570025917938800079226639565593765455331328⟩, ⟨(4 : ℚ) / 1, (-20943576004462224105962860635112582132399801872592314881655654630419651523863381778923668062567 : ℚ) / 8749002899132047697490008908470485461412677723572849745703082425639811996797503692894052708092215296⟩, ⟨(8 : ℚ) / 1, (-5046711688845319141328428118397681733364338878018741472927863321179 : ℚ) / 226156424291633194186662080095093570025917938800079226639565593765455331328⟩,
  ⟨(16 : ℚ) / 1, (7011602394681595545983898695585692339169290193175894796463388158233160125457179125023302173031 : ℚ) / 8749002899132047697490008908470485461412677723572849745703082425639811996797503692894052708092215296⟩, ⟨(32 : ℚ) / 1, (279033148733653995698576016506268752224039388772576936727938901393295966394083191 : ℚ) / 497323236409786642155382248146820840100456150797347717440463976893159497012533375533056⟩, ⟨(64 : ℚ) / 1, (18055632317720389411530423736698454920857601538829860601 : ℚ) / 822752278660603021077484591278675252491367932816789931674304512⟩
]
/-- Physical role 2, fine axis 1: the cached expression normalizes to its summary. -/
theorem checked21 : mergeNormalizeLogExpression (roleExpression 2 1) = summary21 := by decide +kernel
/-- Exact summary of physical role 3 on fine axis 1. -/
def summary31 : RationalLogExpression := [

]
/-- Physical role 3, fine axis 1: the cached expression normalizes to its summary. -/
theorem checked31 : mergeNormalizeLogExpression (roleExpression 3 1) = summary31 := by decide +kernel
/-- Exact summary of physical role 4 on fine axis 1. -/
def summary41 : RationalLogExpression := [

]
/-- Physical role 4, fine axis 1: the cached expression normalizes to its summary. -/
theorem checked41 : mergeNormalizeLogExpression (roleExpression 4 1) = summary41 := by decide +kernel
/-- Exact summary of physical role 5 on fine axis 1. -/
def summary51 : RationalLogExpression := [

]
/-- Physical role 5, fine axis 1: the cached expression normalizes to its summary. -/
theorem checked51 : mergeNormalizeLogExpression (roleExpression 5 1) = summary51 := by decide +kernel

/-- All six role summaries on fine axis 0. -/
def summaries0 : Fin 6 → RationalLogExpression := ![summary00, summary10, summary20, summary30, summary40, summary50]
/-- Every physical role on fine axis 0 is identified separately. -/
theorem checked0 : ∀ role, mergeNormalizeLogExpression (roleExpression role 0) = summaries0 role := by
  intro role
  fin_cases role
  · exact checked00
  · exact checked10
  · exact checked20
  · exact checked30
  · exact checked40
  · exact checked50
/-- Six independently checked role summaries on fine axis 0. -/
def expression0 : RationalLogExpression := finiteLogSum summaries0
/-- The checked summaries retain the complete original source value on fine axis 0. -/
theorem value0 : rationalLogValue expression0 = rationalLogValue (sourceSum4 15 0) :=
  roles4_value parents parents_eq children 15 children_eq 0 summaries0 checked0
/-- All six role summaries on fine axis 1. -/
def summaries1 : Fin 6 → RationalLogExpression := ![summary01, summary11, summary21, summary31, summary41, summary51]
/-- Every physical role on fine axis 1 is identified separately. -/
theorem checked1 : ∀ role, mergeNormalizeLogExpression (roleExpression role 1) = summaries1 role := by
  intro role
  fin_cases role
  · exact checked01
  · exact checked11
  · exact checked21
  · exact checked31
  · exact checked41
  · exact checked51
/-- Six independently checked role summaries on fine axis 1. -/
def expression1 : RationalLogExpression := finiteLogSum summaries1
/-- The checked summaries retain the complete original source value on fine axis 1. -/
theorem value1 : rationalLogValue expression1 = rationalLogValue (sourceSum4 15 1) :=
  roles4_value parents parents_eq children 15 children_eq 1 summaries1 checked1

end MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4Node015
