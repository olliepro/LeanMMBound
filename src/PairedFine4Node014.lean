import SuppliedPairedFineBlocks
import PairedFine4Children014
import PairedFine4Parent014

namespace MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4Node014
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete parent4 integer lookup through the checked single-parent table. -/
def parents : ParentValues4 := parent4Window PairedFine4Parent014.table
/-- Every parent4 value equals the complete original integer hierarchy. -/
theorem parents_eq : ∀ source axis orbit, parents source axis orbit =
    SuppliedRootFineParent4Integers.numerator source axis orbit :=
  parent4Window_eq PairedFine4Parent014.table
/-- Complete literal child numerators of this parent. -/
def children : ChildValues4 := PairedFine4Children014.numerator
/-- Every child value equals the complete original integer child hierarchy. -/
theorem children_eq : ∀ column axis orbit, children column axis orbit =
    SuppliedRootFineChild3Integers.numerator 14 (shapeColumnEquiv 8 column) axis orbit :=
  PairedFine4Children014.numerator_eq
/-- One physical role of this source evaluated from checked integer caches. -/
def roleExpression (role : Fin 6) (axis : Fin 2) : RationalLogExpression :=
  cachedRole4 parents children 14 role axis

/-- Exact summary of physical role 0 on fine axis 0. -/
def summary00 : RationalLogExpression := [

]
/-- Physical role 0, fine axis 0: the cached expression normalizes to its summary. -/
theorem checked00 : mergeNormalizeLogExpression (roleExpression 0 0) = summary00 := by decide +kernel
/-- Exact summary of physical role 1 on fine axis 0. -/
def summary10 : RationalLogExpression := [
  ⟨(482585594395426508390094986879680611515 : ℚ) / 93536104789177786765035829293842113257979682750464, (19291359135957174672894047100515232445312125 : ℚ) / 102844034832575377634685573909834406561420991602098741459288064⟩, ⟨(986778576932778713472669995632518502054725 : ℚ) / 93536104789177786765035829293842113257979682750464, (39446473612887829071069983075409927119637631875 : ℚ) / 102844034832575377634685573909834406561420991602098741459288064⟩, ⟨(1474629127343492355776503430314391628539404715195 : ℚ) / 93536104789177786765035829293842113257979682750464, (-58948299365556106922165724626817805350862703489920125 : ℚ) / 102844034832575377634685573909834406561420991602098741459288064⟩,
  ⟨(1109484767 : ℚ) / 34359738368, (47618056994338393469638875 : ℚ) / 83076749736557242056487941267521536⟩, ⟨(37911191451 : ℚ) / 1099511627776, (-1515499878253725 : ℚ) / 1208925819614629174706176⟩, ⟨(18415613249507127051744060352420504018711588928325 : ℚ) / 93536104789177786765035829293842113257979682750464, (-736164139649047403893468812588009648147995767409791875 : ℚ) / 102844034832575377634685573909834406561420991602098741459288064⟩,
  ⟨(1773514191645 : ℚ) / 4398046511104, (76117583918139179134754660625 : ℚ) / 10633823966279326983230456482242756608⟩, ⟨(20301307737186713459181887146733416045 : ℚ) / 42535295865117307932921825928971026432, (811544776794038870530795938690668306398875 : ℚ) / 46768052394588893382517914646921056628989841375232⟩, ⟨(1049553033815 : ℚ) / 2199023255552, (-41955882526754625 : ℚ) / 2417851639229258349412352⟩,
  ⟨(2482518269283 : ℚ) / 4398046511104, (106547381227996798162337067375 : ℚ) / 10633823966279326983230456482242756608⟩, ⟨(32023642653435847701201885090034822765 : ℚ) / 42535295865117307932921825928971026432, (-1280145115071098011855545356474142040030875 : ℚ) / 46768052394588893382517914646921056628989841375232⟩, ⟨(2 : ℚ) / 1, (-736164139649047403893468812588009648147995767409791875 : ℚ) / 102844034832575377634685573909834406561420991602098741459288064⟩,
  ⟨(4 : ℚ) / 1, (-6608561605232060720657621348389647968253677275350061875 : ℚ) / 102844034832575377634685573909834406561420991602098741459288064⟩, ⟨(8 : ℚ) / 1, (29950437050779215200350326968750456973687126896317275 : ℚ) / 25711008708143844408671393477458601640355247900524685364822016⟩, ⟨(16 : ℚ) / 1, (740725501252560426064176506984682151707680462594616525 : ℚ) / 102844034832575377634685573909834406561420991602098741459288064⟩,
  ⟨(32 : ℚ) / 1, (2874017177888191716896021766764981994325624152585088125 : ℚ) / 102844034832575377634685573909834406561420991602098741459288064⟩
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

]
/-- Physical role 0, fine axis 1: the cached expression normalizes to its summary. -/
theorem checked01 : mergeNormalizeLogExpression (roleExpression 0 1) = summary01 := by decide +kernel
/-- Exact summary of physical role 1 on fine axis 1. -/
def summary11 : RationalLogExpression := [
  ⟨(4 : ℚ) / 1, (-39975 : ℚ) / 1099511627776⟩, ⟨(8 : ℚ) / 1, (39975 : ℚ) / 1099511627776⟩
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
theorem value0 : rationalLogValue expression0 = rationalLogValue (sourceSum4 14 0) :=
  roles4_value parents parents_eq children 14 children_eq 0 summaries0 checked0
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
theorem value1 : rationalLogValue expression1 = rationalLogValue (sourceSum4 14 1) :=
  roles4_value parents parents_eq children 14 children_eq 1 summaries1 checked1

end MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4Node014
