import SuppliedPairedFineBlocks
import PairedFine4Children102
import PairedFine4Parent102

namespace MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4Node102
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete parent4 integer lookup through the checked single-parent table. -/
def parents : ParentValues4 := parent4Window PairedFine4Parent102.table
/-- Every parent4 value equals the complete original integer hierarchy. -/
theorem parents_eq : ∀ source axis orbit, parents source axis orbit =
    SuppliedRootFineParent4Integers.numerator source axis orbit :=
  parent4Window_eq PairedFine4Parent102.table
/-- Complete literal child numerators of this parent. -/
def children : ChildValues4 := PairedFine4Children102.numerator
/-- Every child value equals the complete original integer child hierarchy. -/
theorem children_eq : ∀ column axis orbit, children column axis orbit =
    SuppliedRootFineChild3Integers.numerator 102 (shapeColumnEquiv 8 column) axis orbit :=
  PairedFine4Children102.numerator_eq
/-- One physical role of this source evaluated from checked integer caches. -/
def roleExpression (role : Fin 6) (axis : Fin 2) : RationalLogExpression :=
  cachedRole4 parents children 102 role axis

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
  ⟨(1042290730349 : ℚ) / 2199023255552, (-20838518571867557 : ℚ) / 1208925819614629174706176⟩, ⟨(1156732525203 : ℚ) / 2199023255552, (-23126553376383579 : ℚ) / 1208925819614629174706176⟩, ⟨(2 : ℚ) / 1, (-195614681486910030893188130760475841154239118855976507 : ℚ) / 25711008708143844408671393477458601640355247900524685364822016⟩,
  ⟨(4 : ℚ) / 1, (-493495292486879923337294870065083981877863876814096837 : ℚ) / 12855504354071922204335696738729300820177623950262342682411008⟩, ⟨(8 : ℚ) / 1, (296232713615541551439207202660189883148342687033903557 : ℚ) / 25711008708143844408671393477458601640355247900524685364822016⟩, ⟨(16 : ℚ) / 1, (20838518571867557 : ℚ) / 1208925819614629174706176⟩
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
  ⟨(30514576710002351704947283529064491027597 : ℚ) / 23384026197294446691258957323460528314494920687616, (610077932163077017637011039596586369114746821 : ℚ) / 12855504354071922204335696738729300820177623950262342682411008⟩, ⟨(370916613602266859939307727088854452379618675853 : ℚ) / 23384026197294446691258957323460528314494920687616, (-7415735855750121330766579387687467066425716186329029 : ℚ) / 12855504354071922204335696738729300820177623950262342682411008⟩, ⟨(549049361906330590276614359091019084964015076211 : ℚ) / 23384026197294446691258957323460528314494920687616, (10977143892593267491400350881306744565685553418686523 : ℚ) / 12855504354071922204335696738729300820177623950262342682411008⟩,
  ⟨(9398679027 : ℚ) / 274877906944, (191692263220193706483914619 : ℚ) / 332306998946228968225951765070086144⟩, ⟨(68296234537 : ℚ) / 1099511627776, (-1365446617098241 : ℚ) / 604462909807314587353088⟩, ⟨(4961769279420662265058702699960520865059404477299 : ℚ) / 23384026197294446691258957323460528314494920687616, (-99200653203457300665318643080310693655132673714638907 : ℚ) / 12855504354071922204335696738729300820177623950262342682411008⟩,
  ⟨(1789027076461 : ℚ) / 4398046511104, (36488388236669125716386623717 : ℚ) / 5316911983139663491615228241121378304⟩, ⟨(4790529945146350823603138132156874017 : ℚ) / 10633823966279326983230456482242756608, (95777065193310992016297540676212382221881 : ℚ) / 5846006549323611672814739330865132078623730171904⟩, ⟨(1042290730349 : ℚ) / 2199023255552, (-20838518571867557 : ℚ) / 1208925819614629174706176⟩,
  ⟨(2458640570211 : ℚ) / 4398046511104, (50145597481816649504726767467 : ℚ) / 5316911983139663491615228241121378304⟩, ⟨(7548278532803646419987902414843804961 : ℚ) / 10633823966279326983230456482242756608, (-150912732706343302874818132979972192585273 : ℚ) / 5846006549323611672814739330865132078623730171904⟩, ⟨(2 : ℚ) / 1, (-99200653203457300665318643080310693655132673714638907 : ℚ) / 12855504354071922204335696738729300820177623950262342682411008⟩,
  ⟨(4 : ℚ) / 1, (-1611174494415213915550054996425538175092048109834468565 : ℚ) / 25711008708143844408671393477458601640355247900524685364822016⟩, ⟨(8 : ℚ) / 1, (26627971541542865726691486897596007186045694761278795 : ℚ) / 12855504354071922204335696738729300820177623950262342682411008⟩, ⟨(16 : ℚ) / 1, (200813172788520348817065979057432651841059664243852075 : ℚ) / 25711008708143844408671393477458601640355247900524685364822016⟩,
  ⟨(32 : ℚ) / 1, (339276344635901958819901510893228377219724264017014725 : ℚ) / 12855504354071922204335696738729300820177623950262342682411008⟩
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
theorem value0 : rationalLogValue expression0 = rationalLogValue (sourceSum4 102 0) :=
  roles4_value parents parents_eq children 102 children_eq 0 summaries0 checked0
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
theorem value1 : rationalLogValue expression1 = rationalLogValue (sourceSum4 102 1) :=
  roles4_value parents parents_eq children 102 children_eq 1 summaries1 checked1

end MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4Node102
