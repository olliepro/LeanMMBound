import SuppliedPairedFineBlocks
import PairedFine4Children101
import PairedFine4Parent101

namespace MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4Node101
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete parent4 integer lookup through the checked single-parent table. -/
def parents : ParentValues4 := parent4Window PairedFine4Parent101.table
/-- Every parent4 value equals the complete original integer hierarchy. -/
theorem parents_eq : ∀ source axis orbit, parents source axis orbit =
    SuppliedRootFineParent4Integers.numerator source axis orbit :=
  parent4Window_eq PairedFine4Parent101.table
/-- Complete literal child numerators of this parent. -/
def children : ChildValues4 := PairedFine4Children101.numerator
/-- Every child value equals the complete original integer child hierarchy. -/
theorem children_eq : ∀ column axis orbit, children column axis orbit =
    SuppliedRootFineChild3Integers.numerator 101 (shapeColumnEquiv 8 column) axis orbit :=
  PairedFine4Children101.numerator_eq
/-- One physical role of this source evaluated from checked integer caches. -/
def roleExpression (role : Fin 6) (axis : Fin 2) : RationalLogExpression :=
  cachedRole4 parents children 101 role axis

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
  ⟨(4 : ℚ) / 1, (-2432231 : ℚ) / 2199023255552⟩, ⟨(8 : ℚ) / 1, (2432231 : ℚ) / 2199023255552⟩
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

]
/-- Physical role 2, fine axis 1: the cached expression normalizes to its summary. -/
theorem checked21 : mergeNormalizeLogExpression (roleExpression 2 1) = summary21 := by decide +kernel
/-- Exact summary of physical role 3 on fine axis 1. -/
def summary31 : RationalLogExpression := [
  ⟨(23505106649708730849148965 : ℚ) / 664613997892457936451903530140172288, (57169849051727716141956436290915 : ℚ) / 1461501637330902918203684832716283019655932542976⟩, ⟨(522272164511291978728624477599446541795270561748159755 : ℚ) / 102844034832575377634685573909834406561420991602098741459288064, (-1270286548961464200715101041776179461797252713671288349063405 : ℚ) / 226156424291633194186662080095093570025917938800079226639565593765455331328⟩, ⟨(7119716924703011487504061740801719800475841 : ℚ) / 46768052394588893382517914646921056628989841375232, (17316796215487330333263491591891907752031155231271 : ℚ) / 102844034832575377634685573909834406561420991602098741459288064⟩,
  ⟨(58229617001505419345998702469816648791940748894796268148123 : ℚ) / 25711008708143844408671393477458601640355247900524685364822016, (-141627879589188527601337770106864617507870839625139222074177352413 : ℚ) / 56539106072908298546665520023773392506479484700019806659891398441363832832⟩, ⟨(2496011718388902093197120948163358924048445685 : ℚ) / 365375409332725729550921208179070754913983135744, (6070877077828757727038926680872314639197275096873235 : ℚ) / 803469022129495137770981046170581301261101496891396417650688⟩, ⟨(6167652965580502752231970127986725 : ℚ) / 664613997892457936451903530140172288, (-15001156740126831789563916936363280133475 : ℚ) / 1461501637330902918203684832716283019655932542976⟩,
  ⟨(11648298365 : ℚ) / 1099511627776, (-28331352380602315 : ℚ) / 2417851639229258349412352⟩, ⟨(888950420432411196956908411637762825125532273739907831285695 : ℚ) / 51422017416287688817342786954917203280710495801049370729644032, (-2162132770038743917985698302946127513917898487690689764395837235545 : ℚ) / 113078212145816597093331040047546785012958969400039613319782796882727665664⟩, ⟨(8331799111417781784062173060116614997434183925 : ℚ) / 365375409332725729550921208179070754913983135744, (-20264860084562782806431323244180494611824342602086675 : ℚ) / 803469022129495137770981046170581301261101496891396417650688⟩,
  ⟨(2624710210131544181823554438740387531380241324813962550353033 : ℚ) / 102844034832575377634685573909834406561420991602098741459288064, (-6383901539098455836900885636091971505836495737693588947807707806623 : ℚ) / 226156424291633194186662080095093570025917938800079226639565593765455331328⟩, ⟨(73355748555 : ℚ) / 2199023255552, (459923122150476401780869215495 : ℚ) / 21267647932558653966460912964485513216⟩, ⟨(214901393777 : ℚ) / 4398046511104, (436591120755677773204987193295 : ℚ) / 42535295865117307932921825928971026432⟩,
  ⟨(3175110159298462519269114435656626841616893038399 : ℚ) / 46768052394588893382517914646921056628989841375232, (7722601357860658791704437472951553159612697371678238169 : ℚ) / 102844034832575377634685573909834406561420991602098741459288064⟩, ⟨(369869853321 : ℚ) / 4398046511104, (751423203716961049969507556535 : ℚ) / 42535295865117307932921825928971026432⟩, ⟨(75462644728008098039116489424527772785630760715 : ℚ) / 365375409332725729550921208179070754913983135744, (183542583849447864301778338189508609330167490764605165 : ℚ) / 803469022129495137770981046170581301261101496891396417650688⟩,
  ⟨(29324787285 : ℚ) / 137438953472, (-71324656702982835 : ℚ) / 302231454903657293676544⟩, ⟨(12079859233813470007420033646992586971725290739354095785490497 : ℚ) / 51422017416287688817342786954917203280710495801049370729644032, (-29381008104117369969617235857258426802826375620269951746439337008807 : ℚ) / 113078212145816597093331040047546785012958969400039613319782796882727665664⟩, ⟨(28634244717346950536427745798390722004297132270935 : ℚ) / 93536104789177786765035829293842113257979682750464, (-69645097663117490850166192590965664171233618320468505985 : ℚ) / 205688069665150755269371147819668813122841983204197482918576128⟩,
  ⟨(135628304383762499135625105136844923375131545355 : ℚ) / 365375409332725729550921208179070754913983135744, (-329879366399623047035140585092093464825619573690337005 : ℚ) / 803469022129495137770981046170581301261101496891396417650688⟩, ⟨(826651699767 : ℚ) / 2199023255552, (5182909835658985129430359240803 : ℚ) / 21267647932558653966460912964485513216⟩, ⟨(44086060474361962220335198958902544169 : ℚ) / 85070591730234615865843651857942052864, (107227482953617869733128101299010493906711039 : ℚ) / 187072209578355573530071658587684226515959365500928⟩,
  ⟨(2577782500739 : ℚ) / 4398046511104, (-6269762509554918709 : ℚ) / 9671406556917033397649408⟩, ⟨(649507903615 : ℚ) / 1099511627776, (4072260303744936657394332233035 : ℚ) / 10633823966279326983230456482242756608⟩, ⟨(1906637632003 : ℚ) / 2199023255552, (3873502381724579806799383363005 : ℚ) / 21267647932558653966460912964485513216⟩,
  ⟨(2 : ℚ) / 1, (-70086860355992018612630047275280854816519918104251137092177858730327 : ℚ) / 226156424291633194186662080095093570025917938800079226639565593765455331328⟩, ⟨(4 : ℚ) / 1, (-51376887993288436682733756566079712932490860859859297290793818635191 : ℚ) / 28269553036454149273332760011886696253239742350009903329945699220681916416⟩, ⟨(8 : ℚ) / 1, (-5900498333096630358613480431425919878093684796527550519686619915945 : ℚ) / 226156424291633194186662080095093570025917938800079226639565593765455331328⟩,
  ⟨(16 : ℚ) / 1, (136320840969198930927615502039741564788540521201704950546251351490991 : ℚ) / 226156424291633194186662080095093570025917938800079226639565593765455331328⟩, ⟨(32 : ℚ) / 1, (49749184542631093536463830069380099720344388768767545583295302410585 : ℚ) / 113078212145816597093331040047546785012958969400039613319782796882727665664⟩, ⟨(64 : ℚ) / 1, (20264860084562782806431323244180494611824342602086675 : ℚ) / 803469022129495137770981046170581301261101496891396417650688⟩
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
theorem value0 : rationalLogValue expression0 = rationalLogValue (sourceSum4 101 0) :=
  roles4_value parents parents_eq children 101 children_eq 0 summaries0 checked0
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
theorem value1 : rationalLogValue expression1 = rationalLogValue (sourceSum4 101 1) :=
  roles4_value parents parents_eq children 101 children_eq 1 summaries1 checked1

end MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4Node101
