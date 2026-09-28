import SuppliedPairedFineBlocks
import PairedFine4Children012
import PairedFine4Parent012

namespace MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4Node012
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete parent4 integer lookup through the checked single-parent table. -/
def parents : ParentValues4 := parent4Window PairedFine4Parent012.table
/-- Every parent4 value equals the complete original integer hierarchy. -/
theorem parents_eq : ∀ source axis orbit, parents source axis orbit =
    SuppliedRootFineParent4Integers.numerator source axis orbit :=
  parent4Window_eq PairedFine4Parent012.table
/-- Complete literal child numerators of this parent. -/
def children : ChildValues4 := PairedFine4Children012.numerator
/-- Every child value equals the complete original integer child hierarchy. -/
theorem children_eq : ∀ column axis orbit, children column axis orbit =
    SuppliedRootFineChild3Integers.numerator 12 (shapeColumnEquiv 8 column) axis orbit :=
  PairedFine4Children012.numerator_eq
/-- One physical role of this source evaluated from checked integer caches. -/
def roleExpression (role : Fin 6) (axis : Fin 2) : RationalLogExpression :=
  cachedRole4 parents children 12 role axis

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
  ⟨(4 : ℚ) / 1, (-160347 : ℚ) / 4398046511104⟩, ⟨(8 : ℚ) / 1, (160347 : ℚ) / 4398046511104⟩
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
  ⟨(64831903571473308060794848643516406005 : ℚ) / 93536104789177786765035829293842113257979682750464, (10395601241975030527624271595441925153683735 : ℚ) / 411376139330301510538742295639337626245683966408394965837152256⟩, ⟨(3203 : ℚ) / 1099511627776, (-513591441 : ℚ) / 4835703278458516698824704⟩, ⟨(941773898252360978693920923580242899035915 : ℚ) / 93536104789177786765035829293842113257979682750464, (151010619263071325850634138333321208131711862505 : ℚ) / 411376139330301510538742295639337626245683966408394965837152256⟩,
  ⟨(1439512048856959108590519463653348389507793098997 : ℚ) / 93536104789177786765035829293842113257979682750464, (-230821438498066822185164024438423454212406100044871959 : ℚ) / 411376139330301510538742295639337626245683966408394965837152256⟩, ⟨(66711347999 : ℚ) / 2199023255552, (23866377359825359803985623753 : ℚ) / 42535295865117307932921825928971026432⟩, ⟨(17993901341082864097741641700786321487834190505739 : ℚ) / 93536104789177786765035829293842113257979682750464, (-2885268098338614009480579021795984291609748945023731433 : ℚ) / 411376139330301510538742295639337626245683966408394965837152256⟩,
  ⟨(208472960057 : ℚ) / 549755813888, (74582428376574608854981058079 : ℚ) / 10633823966279326983230456482242756608⟩, ⟨(41914153468717427924039799291107391961 : ℚ) / 85070591730234615865843651857942052864, (6720808766248433415336009696931196978770467 : ℚ) / 374144419156711147060143317175368453031918731001856⟩, ⟨(2166910990591 : ℚ) / 4398046511104, (-347457676608295077 : ℚ) / 19342813113834066795298816⟩,
  ⟨(1298420067325 : ℚ) / 2199023255552, (464517420616546630830333529275 : ℚ) / 42535295865117307932921825928971026432⟩, ⟨(67396004966901144368204944395170265561 : ℚ) / 85070591730234615865843651857942052864, (-10806747208427697796008558218932366571909667 : ℚ) / 374144419156711147060143317175368453031918731001856⟩, ⟨(2 : ℚ) / 1, (-2885268098338614009480579021795984291609748945023731433 : ℚ) / 411376139330301510538742295639337626245683966408394965837152256⟩,
  ⟨(4 : ℚ) / 1, (-27111199445839185960951598448767495060948334100308724711 : ℚ) / 411376139330301510538742295639337626245683966408394965837152256⟩, ⟨(8 : ℚ) / 1, (1278406906986662292308389527564857875170941229 : ℚ) / 12855504354071922204335696738729300820177623950262342682411008⟩, ⟨(16 : ℚ) / 1, (2885268099729867394420922160171803769783416054748640281 : ℚ) / 411376139330301510538742295639337626245683966408394965837152256⟩,
  ⟨(32 : ℚ) / 1, (12112965652600148771478741467363613204544733020044982551 : ℚ) / 411376139330301510538742295639337626245683966408394965837152256⟩
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
theorem value0 : rationalLogValue expression0 = rationalLogValue (sourceSum4 12 0) :=
  roles4_value parents parents_eq children 12 children_eq 0 summaries0 checked0
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
theorem value1 : rationalLogValue expression1 = rationalLogValue (sourceSum4 12 1) :=
  roles4_value parents parents_eq children 12 children_eq 1 summaries1 checked1

end MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4Node012
