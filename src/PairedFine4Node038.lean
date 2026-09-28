import SuppliedPairedFineBlocks
import PairedFine4Children038
import PairedFine4Parent038

namespace MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4Node038
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete parent4 integer lookup through the checked single-parent table. -/
def parents : ParentValues4 := parent4Window PairedFine4Parent038.table
/-- Every parent4 value equals the complete original integer hierarchy. -/
theorem parents_eq : ∀ source axis orbit, parents source axis orbit =
    SuppliedRootFineParent4Integers.numerator source axis orbit :=
  parent4Window_eq PairedFine4Parent038.table
/-- Complete literal child numerators of this parent. -/
def children : ChildValues4 := PairedFine4Children038.numerator
/-- Every child value equals the complete original integer child hierarchy. -/
theorem children_eq : ∀ column axis orbit, children column axis orbit =
    SuppliedRootFineChild3Integers.numerator 38 (shapeColumnEquiv 8 column) axis orbit :=
  PairedFine4Children038.numerator_eq
/-- One physical role of this source evaluated from checked integer caches. -/
def roleExpression (role : Fin 6) (axis : Fin 2) : RationalLogExpression :=
  cachedRole4 parents children 38 role axis

/-- Exact summary of physical role 0 on fine axis 0. -/
def summary00 : RationalLogExpression := [
  ⟨(1512861197883874742560136805 : ℚ) / 42535295865117307932921825928971026432, (3601800272726356496715520423565535 : ℚ) / 93536104789177786765035829293842113257979682750464⟩, ⟨(215741769292206851254235765072485284986349451913779263 : ℚ) / 822752278660603021077484591278675252491367932816789931674304512, (-513635199687885272777018204419627024186795952573450790219981 : ℚ) / 1809251394333065553493296640760748560207343510400633813116524750123642650624⟩, ⟨(1579419432337439258151668498157228071879931 : ℚ) / 187072209578355573530071658587684226515959365500928, (3760261252056354999097136388722252549566805285697 : ℚ) / 411376139330301510538742295639337626245683966408394965837152256⟩,
  ⟨(157458793121360523184646719968244234761653857509047360017353 : ℚ) / 102844034832575377634685573909834406561420991602098741459288064, (-374875847699024555911205510493036286945493602457392337113633796811 : ℚ) / 226156424291633194186662080095093570025917938800079226639565593765455331328⟩, ⟨(943740442682423636627073748339373518981390579299 : ℚ) / 187072209578355573530071658587684226515959365500928, (2246844977312559322574461028087652062135147933117528313 : ℚ) / 411376139330301510538742295639337626245683966408394965837152256⟩, ⟨(305911215612638326097708075975745125 : ℚ) / 42535295865117307932921825928971026432, (-728309445284766362475184117078066308913375 : ℚ) / 93536104789177786765035829293842113257979682750464⟩,
  ⟨(23027414745 : ℚ) / 2199023255552, (-54823369668504315 : ℚ) / 4835703278458516698824704⟩, ⟨(7360244031952465152051468840067806270247194959844466157410461 : ℚ) / 411376139330301510538742295639337626245683966408394965837152256, (-17523173308100013651957160345338512286723008546863227049502779212807 : ℚ) / 904625697166532776746648320380374280103671755200316906558262375061821325312⟩, ⟨(14946151677914821131082627842969712766405581557230677073103225 : ℚ) / 822752278660603021077484591278675252491367932816789931674304512, (-35583603614807793256206816294380333547992445298894551976842207738075 : ℚ) / 1809251394333065553493296640760748560207343510400633813116524750123642650624⟩,
  ⟨(3591071408534773984516361614341711846834009454179 : ℚ) / 187072209578355573530071658587684226515959365500928, (-8549576125511278950274755018723761122688400866386458873 : ℚ) / 411376139330301510538742295639337626245683966408394965837152256⟩, ⟨(136595615373 : ℚ) / 4398046511104, (894441595231955901814383669543 : ℚ) / 42535295865117307932921825928971026432⟩, ⟨(169808951101 : ℚ) / 4398046511104, (331196789230928557003075011545 : ℚ) / 42535295865117307932921825928971026432⟩,
  ⟨(9221875692875699730398881737793827109480889547525 : ℚ) / 187072209578355573530071658587684226515959365500928, (21955321765214458534037162455876952262499678583183402175 : ℚ) / 411376139330301510538742295639337626245683966408394965837152256⟩, ⟨(334128563421 : ℚ) / 4398046511104, (651687126490508043935685405945 : ℚ) / 42535295865117307932921825928971026432⟩, ⟨(32334629546177414775412750824307522162954360146333 : ℚ) / 187072209578355573530071658587684226515959365500928, (76981865673355088790910596796750632767773622229707704071 : ℚ) / 411376139330301510538742295639337626245683966408394965837152256⟩,
  ⟨(391185359343 : ℚ) / 2199023255552, (-931329018114142941 : ℚ) / 4835703278458516698824704⟩, ⟨(99506610150103799183151981581942256710965078127634815641986915 : ℚ) / 411376139330301510538742295639337626245683966408394965837152256, (-236904043859435173745858856774527559528128415460257309827839101402105 : ℚ) / 904625697166532776746648320380374280103671755200316906558262375061821325312⟩, ⟨(63188008932561931078850095777536772283155329403293 : ℚ) / 187072209578355573530071658587684226515959365500928, (-150437190222527322207422282975914439473696527224077731591 : ℚ) / 411376139330301510538742295639337626245683966408394965837152256⟩,
  ⟨(64706565481514910007254542168406791386941826254285 : ℚ) / 187072209578355573530071658587684226515959365500928, (-154052549913039438051441519685494699645743069702460422295 : ℚ) / 411376139330301510538742295639337626245683966408394965837152256⟩, ⟨(1620727949029 : ℚ) / 4398046511104, (10612686858271275224556897275439 : ℚ) / 42535295865117307932921825928971026432⟩, ⟨(49006705199670390929507403880565737035 : ℚ) / 85070591730234615865843651857942052864, (116674526652207671009889143562600459378346545 : ℚ) / 187072209578355573530071658587684226515959365500928⟩,
  ⟨(1320361473351 : ℚ) / 2199023255552, (8645857477064539972033700397141 : ℚ) / 21267647932558653966460912964485513216⟩, ⟨(2750392569393 : ℚ) / 4398046511104, (-6548098874107452291 : ℚ) / 9671406556917033397649408⟩, ⟨(1947054498291 : ℚ) / 2199023255552, (3797551272241608717076900915095 : ℚ) / 21267647932558653966460912964485513216⟩,
  ⟨(2 : ℚ) / 1, (-132155615444918085427184068284443930509460751019107534400055155025997 : ℚ) / 452312848583266388373324160190187140051835877600158453279131187530910662656⟩, ⟨(4 : ℚ) / 1, (-3256390855315185903081959682149551430762567981444343193597581263038553 : ℚ) / 1809251394333065553493296640760748560207343510400633813116524750123642650624⟩, ⟨(8 : ℚ) / 1, (-9201337216764299353072240702492021141060437314344343979214078023603 : ℚ) / 452312848583266388373324160190187140051835877600158453279131187530910662656⟩,
  ⟨(16 : ℚ) / 1, (1154519341311491462024267481851229494878398034684839922598234493304599 : ℚ) / 1809251394333065553493296640760748560207343510400633813116524750123642650624⟩, ⟨(32 : ℚ) / 1, (355381829851929245831912189040253392819210768754475254313974527788039 : ℚ) / 904625697166532776746648320380374280103671755200316906558262375061821325312⟩, ⟨(64 : ℚ) / 1, (8549576125511278950274755018723761122688400866386458873 : ℚ) / 411376139330301510538742295639337626245683966408394965837152256⟩
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
  ⟨(4 : ℚ) / 1, (-2380787 : ℚ) / 2199023255552⟩, ⟨(8 : ℚ) / 1, (2380787 : ℚ) / 2199023255552⟩
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
theorem value0 : rationalLogValue expression0 = rationalLogValue (sourceSum4 38 0) :=
  roles4_value parents parents_eq children 38 children_eq 0 summaries0 checked0
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
theorem value1 : rationalLogValue expression1 = rationalLogValue (sourceSum4 38 1) :=
  roles4_value parents parents_eq children 38 children_eq 1 summaries1 checked1

end MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4Node038
