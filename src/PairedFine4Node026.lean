import SuppliedPairedFineBlocks
import PairedFine4Children026
import PairedFine4Parent026

namespace MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4Node026
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete parent4 integer lookup through the checked single-parent table. -/
def parents : ParentValues4 := parent4Window PairedFine4Parent026.table
/-- Every parent4 value equals the complete original integer hierarchy. -/
theorem parents_eq : ∀ source axis orbit, parents source axis orbit =
    SuppliedRootFineParent4Integers.numerator source axis orbit :=
  parent4Window_eq PairedFine4Parent026.table
/-- Complete literal child numerators of this parent. -/
def children : ChildValues4 := PairedFine4Children026.numerator
/-- Every child value equals the complete original integer child hierarchy. -/
theorem children_eq : ∀ column axis orbit, children column axis orbit =
    SuppliedRootFineChild3Integers.numerator 26 (shapeColumnEquiv 8 column) axis orbit :=
  PairedFine4Children026.numerator_eq
/-- One physical role of this source evaluated from checked integer caches. -/
def roleExpression (role : Fin 6) (axis : Fin 2) : RationalLogExpression :=
  cachedRole4 parents children 26 role axis

/-- Exact summary of physical role 0 on fine axis 0. -/
def summary00 : RationalLogExpression := [
  ⟨(39115913191326144110334227571675134553 : ℚ) / 93536104789177786765035829293842113257979682750464, (3140029931433706218457080118316221426242075 : ℚ) / 205688069665150755269371147819668813122841983204197482918576128⟩, ⟨(11511 : ℚ) / 4398046511104, (-924045525 : ℚ) / 9671406556917033397649408⟩, ⟨(880685873402771198610402884018682159269287 : ℚ) / 93536104789177786765035829293842113257979682750464, (70697058487407457968450091514599710335342013925 : ℚ) / 205688069665150755269371147819668813122841983204197482918576128⟩,
  ⟨(1439509517858199583709069733024624810252936575577 : ℚ) / 93536104789177786765035829293842113257979682750464, (-115556626546066971582245572818551756643054483604443675 : ℚ) / 205688069665150755269371147819668813122841983204197482918576128⟩, ⟨(66711083793 : ℚ) / 2199023255552, (11948275141042470544878180825 : ℚ) / 21267647932558653966460912964485513216⟩, ⟨(17993869666135858680438852570055543861857857144231 : ℚ) / 93536104789177786765035829293842113257979682750464, (-1444457887449056055572228890061208783510639482253143525 : ℚ) / 205688069665150755269371147819668813122841983204197482918576128⟩,
  ⟨(833888538733 : ℚ) / 2199023255552, (149353437708490793563154434325 : ℚ) / 21267647932558653966460912964485513216⟩, ⟨(20957029254566550427171108672840065881 : ℚ) / 42535295865117307932921825928971026432, (1682325523410329835541160748712236288597275 : ℚ) / 93536104789177786765035829293842113257979682750464⟩, ⟨(1083453039211 : ℚ) / 2199023255552, (-86974192722663025 : ℚ) / 4835703278458516698824704⟩,
  ⟨(649211816513 : ℚ) / 1099511627776, (116276950807494484725701938825 : ℚ) / 10633823966279326983230456482242756608⟩, ⟨(33698018051096293288176294110067090265 : ℚ) / 42535295865117307932921825928971026432, (-2705108399051754943708352009685635671022875 : ℚ) / 93536104789177786765035829293842113257979682750464⟩, ⟨(2 : ℚ) / 1, (-1444457887449056055572228890061208783510639482253143525 : ℚ) / 205688069665150755269371147819668813122841983204197482918576128⟩,
  ⟨(4 : ℚ) / 1, (-13572763715787446007895189311307807831138166970644231325 : ℚ) / 205688069665150755269371147819668813122841983204197482918576128⟩, ⟨(8 : ℚ) / 1, (4406210373687702402420112699725576004585058625 : ℚ) / 51422017416287688817342786954917203280710495801049370729644032⟩, ⟨(16 : ℚ) / 1, (1444457888462772757874987084086836740183148680369605475 : ℚ) / 205688069665150755269371147819668813122841983204197482918576128⟩,
  ⟨(32 : ℚ) / 1, (6064152904849915877634696308770260146026357135967195675 : ℚ) / 205688069665150755269371147819668813122841983204197482918576128⟩
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
  ⟨(4 : ℚ) / 1, (-80275 : ℚ) / 2199023255552⟩, ⟨(8 : ℚ) / 1, (80275 : ℚ) / 2199023255552⟩
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
theorem value0 : rationalLogValue expression0 = rationalLogValue (sourceSum4 26 0) :=
  roles4_value parents parents_eq children 26 children_eq 0 summaries0 checked0
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
theorem value1 : rationalLogValue expression1 = rationalLogValue (sourceSum4 26 1) :=
  roles4_value parents parents_eq children 26 children_eq 1 summaries1 checked1

end MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4Node026
