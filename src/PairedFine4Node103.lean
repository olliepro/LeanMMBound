import SuppliedPairedFineBlocks
import PairedFine4Children103
import PairedFine4Parent103

namespace MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4Node103
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete parent4 integer lookup through the checked single-parent table. -/
def parents : ParentValues4 := parent4Window PairedFine4Parent103.table
/-- Every parent4 value equals the complete original integer hierarchy. -/
theorem parents_eq : ∀ source axis orbit, parents source axis orbit =
    SuppliedRootFineParent4Integers.numerator source axis orbit :=
  parent4Window_eq PairedFine4Parent103.table
/-- Complete literal child numerators of this parent. -/
def children : ChildValues4 := PairedFine4Children103.numerator
/-- Every child value equals the complete original integer child hierarchy. -/
theorem children_eq : ∀ column axis orbit, children column axis orbit =
    SuppliedRootFineChild3Integers.numerator 103 (shapeColumnEquiv 8 column) axis orbit :=
  PairedFine4Children103.numerator_eq
/-- One physical role of this source evaluated from checked integer caches. -/
def roleExpression (role : Fin 6) (axis : Fin 2) : RationalLogExpression :=
  cachedRole4 parents children 103 role axis

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
  ⟨(223674416186189267573082726196181785869627 : ℚ) / 187072209578355573530071658587684226515959365500928, (17921017899253670307222961105564280865660384867 : ℚ) / 411376139330301510538742295639337626245683966408394965837152256⟩, ⟨(2967341129482240837838127766922805298420059700539 : ℚ) / 187072209578355573530071658587684226515959365500928, (-237746338635246618168428634813622083314713603266885219 : ℚ) / 411376139330301510538742295639337626245683966408394965837152256⟩, ⟨(4394943584767696178320262360365435997454487028421 : ℚ) / 187072209578355573530071658587684226515959365500928, (352127274955172585503197740574839097552050955204118941 : ℚ) / 411376139330301510538742295639337626245683966408394965837152256⟩,
  ⟨(18797403057 : ℚ) / 549755813888, (3072799175009754433964186043 : ℚ) / 5316911983139663491615228241121378304⟩, ⟨(34146033427 : ℚ) / 549755813888, (-2735814344204667 : ℚ) / 1208925819614629174706176⟩, ⟨(39695806118438819186816522560713945433393204331205 : ℚ) / 187072209578355573530071658587684226515959365500928, (-3180467682015436632066926604086962022068896924220475805 : ℚ) / 411376139330301510538742295639337626245683966408394965837152256⟩,
  ⟨(1788980942517 : ℚ) / 4398046511104, (292443543802573606747446644583 : ℚ) / 42535295865117307932921825928971026432⟩, ⟨(38323387898057354623342442768921047605 : ℚ) / 85070591730234615865843651857942052864, (3070508161780253309776819857088723255160205 : ℚ) / 187072209578355573530071658587684226515959365500928⟩, ⟨(2084597349669 : ℚ) / 4398046511104, (-167020024252829949 : ℚ) / 9671406556917033397649408⟩,
  ⟨(2458686344131 : ℚ) / 4398046511104, (401919847488722494200411071169 : ℚ) / 42535295865117307932921825928971026432⟩, ⟨(60385795793505835565968755292696785461 : ℚ) / 85070591730234615865843651857942052864, (-4838170344771481051380982642806159147920781 : ℚ) / 187072209578355573530071658587684226515959365500928⟩, ⟨(2 : ℚ) / 1, (-3180467682015436632066926604086962022068896924220475805 : ℚ) / 411376139330301510538742295639337626245683966408394965837152256⟩,
  ⟨(4 : ℚ) / 1, (-25828014119937157088084887359121693166839186651632937035 : ℚ) / 411376139330301510538742295639337626245683966408394965837152256⟩, ⟨(8 : ℚ) / 1, (53510108181383575844826633879905976372925546668850749 : ℚ) / 25711008708143844408671393477458601640355247900524685364822016⟩, ⟨(16 : ℚ) / 1, (3217861506815477592045827474127143693567386365568702389 : ℚ) / 411376139330301510538742295639337626245683966408394965837152256⟩,
  ⟨(32 : ℚ) / 1, (10876995441109771141260916871458026925652495769681311331 : ℚ) / 411376139330301510538742295639337626245683966408394965837152256⟩
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
  ⟨(4 : ℚ) / 1, (-80121 : ℚ) / 2199023255552⟩, ⟨(8 : ℚ) / 1, (80121 : ℚ) / 2199023255552⟩
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
theorem value0 : rationalLogValue expression0 = rationalLogValue (sourceSum4 103 0) :=
  roles4_value parents parents_eq children 103 children_eq 0 summaries0 checked0
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
theorem value1 : rationalLogValue expression1 = rationalLogValue (sourceSum4 103 1) :=
  roles4_value parents parents_eq children 103 children_eq 1 summaries1 checked1

end MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4Node103
