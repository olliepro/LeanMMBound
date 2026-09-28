import SuppliedPairedFineBlocks
import PairedFine4Children025
import PairedFine4Parent025

namespace MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4Node025
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete parent4 integer lookup through the checked single-parent table. -/
def parents : ParentValues4 := parent4Window PairedFine4Parent025.table
/-- Every parent4 value equals the complete original integer hierarchy. -/
theorem parents_eq : ∀ source axis orbit, parents source axis orbit =
    SuppliedRootFineParent4Integers.numerator source axis orbit :=
  parent4Window_eq PairedFine4Parent025.table
/-- Complete literal child numerators of this parent. -/
def children : ChildValues4 := PairedFine4Children025.numerator
/-- Every child value equals the complete original integer child hierarchy. -/
theorem children_eq : ∀ column axis orbit, children column axis orbit =
    SuppliedRootFineChild3Integers.numerator 25 (shapeColumnEquiv 8 column) axis orbit :=
  PairedFine4Children025.numerator_eq
/-- One physical role of this source evaluated from checked integer caches. -/
def roleExpression (role : Fin 6) (axis : Fin 2) : RationalLogExpression :=
  cachedRole4 parents children 25 role axis

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
  ⟨(2136868280075 : ℚ) / 4398046511104, (-6763869767418718925 : ℚ) / 9671406556917033397649408⟩, ⟨(2261178231029 : ℚ) / 4398046511104, (-7157350417062483251 : ℚ) / 9671406556917033397649408⟩, ⟨(2 : ℚ) / 1, (-106727873749175142724138850436709703226248914240378651357 : ℚ) / 411376139330301510538742295639337626245683966408394965837152256⟩,
  ⟨(4 : ℚ) / 1, (-333195336801139001298736628983830727951575355127514119459 : ℚ) / 205688069665150755269371147819668813122841983204197482918576128⟩, ⟨(8 : ℚ) / 1, (197712143850898340531375975300429530800642512719899639075 : ℚ) / 411376139330301510538742295639337626245683966408394965837152256⟩, ⟨(16 : ℚ) / 1, (6763869767418718925 : ℚ) / 9671406556917033397649408⟩
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
  ⟨(30483926386038205964765036054606431802991 : ℚ) / 93536104789177786765035829293842113257979682750464, (96491351384328068066184099159330776108211669129 : ℚ) / 205688069665150755269371147819668813122841983204197482918576128⟩, ⟨(2359210124698386557563373506642086889318128175508781190800715558729237588594741877093 : ℚ) / 7957171782556586274486115970349133441607298412757563479047423630290551952200534008528896, (-7467652632700172239999939864670823830409568158373279770084130171641271594693119763658137667 : ℚ) / 17498005798264095394980017816940970922825355447145699491406164851279623993595007385788105416184430592⟩, ⟨(28227686466149718847245603541399427215947469866463449448676877471026964169776688391835 : ℚ) / 3978585891278293137243057985174566720803649206378781739523711815145275976100267004264448, (-89349632297346561911844606556058893555755629370244219345436445119713599198913377523754770365 : ℚ) / 8749002899132047697490008908470485461412677723572849745703082425639811996797503692894052708092215296⟩,
  ⟨(46682822987 : ℚ) / 4398046511104, (-147766026574387853 : ℚ) / 9671406556917033397649408⟩, ⟨(21471564851841452804852268091996436290616296514537845679976617792841539031 : ℚ) / 1809251394333065553493296640760748560207343510400633813116524750123642650624, (-67964352185265935550802176384690067722977285067100419149897907855419387484065889 : ℚ) / 3978585891278293137243057985174566720803649206378781739523711815145275976100267004264448⟩, ⟨(66680379155 : ℚ) / 2199023255552, (149663804110566179076552819845 : ℚ) / 10633823966279326983230456482242756608⟩,
  ⟨(66680379209 : ℚ) / 2199023255552, (149663804231768930536381012991 : ℚ) / 10633823966279326983230456482242756608⟩, ⟨(352538745277958358339725751908534367859385028442620082707234676968785009963729225914725 : ℚ) / 7957171782556586274486115970349133441607298412757563479047423630290551952200534008528896, (-1115897588664481872861542377305370096738300758844965757574781360468157598953381429643171422275 : ℚ) / 17498005798264095394980017816940970922825355447145699491406164851279623993595007385788105416184430592⟩, ⟨(4453866441278872897228167540662353205719521143185 : ℚ) / 93536104789177786765035829293842113257979682750464, (14097908070042400680181366051641819186774908945425201015 : ℚ) / 205688069665150755269371147819668813122841983204197482918576128⟩,
  ⟨(336326002117509787163343518470227363859307632187146384273682826393089385001 : ℚ) / 1809251394333065553493296640760748560207343510400633813116524750123642650624, (-1064579084696593961994087342540661609143779775006986005922789450355747299041980319 : ℚ) / 3978585891278293137243057985174566720803649206378781739523711815145275976100267004264448⟩, ⟨(796317926099 : ℚ) / 2199023255552, (-2520600261521760581 : ℚ) / 4835703278458516698824704⟩, ⟨(99727913675 : ℚ) / 274877906944, (223838843236263449562879901325 : ℚ) / 1329227995784915872903807060280344576⟩,
  ⟨(1595646620467 : ℚ) / 4398046511104, (3581421495521789020478922828133 : ℚ) / 21267647932558653966460912964485513216⟩, ⟨(621681757788536621820563874238806945141460129925059426823524285 : ℚ) / 1645504557321206042154969182557350504982735865633579863348609024, (-1967821079881452951244445421841706160788221436994259179853611066271915 : ℚ) / 3618502788666131106986593281521497120414687020801267626233049500247285301248⟩, ⟨(23904590253394903794425096964664896069 : ℚ) / 42535295865117307932921825928971026432, (75665653716285703483665853499096124160231011 : ℚ) / 93536104789177786765035829293842113257979682750464⟩,
  ⟨(2669039132219 : ℚ) / 4398046511104, (5990646047757314371726491917981 : ℚ) / 21267647932558653966460912964485513216⟩, ⟨(1334519566997 : ℚ) / 2199023255552, (2995323025870646851059496355603 : ℚ) / 10633823966279326983230456482242756608⟩, ⟨(1340548248077 : ℚ) / 2199023255552, (-4243262840054841563 : ℚ) / 4835703278458516698824704⟩,
  ⟨(2 : ℚ) / 1, (-88356563782836013239531213893990165581511646698155539598691045733145 : ℚ) / 226156424291633194186662080095093570025917938800079226639565593765455331328⟩, ⟨(4 : ℚ) / 1, (-41306398705369656989123486199879181499195227125534103427153509108153743846393636319088832847805 : ℚ) / 17498005798264095394980017816940970922825355447145699491406164851279623993595007385788105416184430592⟩, ⟨(8 : ℚ) / 1, (-4203101427030311615937870576767952092253877857738472806517620346087 : ℚ) / 226156424291633194186662080095093570025917938800079226639565593765455331328⟩,
  ⟨(16 : ℚ) / 1, (14384810100787905204265772219734009869072500885040491999322374386554078347719268026803270361021 : ℚ) / 17498005798264095394980017816940970922825355447145699491406164851279623993595007385788105416184430592⟩, ⟨(32 : ℚ) / 1, (2065694645534005613123196458156427262084149278090063795576871884813078094950977633 : ℚ) / 3978585891278293137243057985174566720803649206378781739523711815145275976100267004264448⟩, ⟨(64 : ℚ) / 1, (983560599005815790703805833346633664220593430122674677 : ℚ) / 51422017416287688817342786954917203280710495801049370729644032⟩
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
theorem value0 : rationalLogValue expression0 = rationalLogValue (sourceSum4 25 0) :=
  roles4_value parents parents_eq children 25 children_eq 0 summaries0 checked0
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
theorem value1 : rationalLogValue expression1 = rationalLogValue (sourceSum4 25 1) :=
  roles4_value parents parents_eq children 25 children_eq 1 summaries1 checked1

end MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4Node025
