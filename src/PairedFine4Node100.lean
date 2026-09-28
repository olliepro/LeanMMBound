import SuppliedPairedFineBlocks
import PairedFine4Children100
import PairedFine4Parent100

namespace MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4Node100
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete parent4 integer lookup through the checked single-parent table. -/
def parents : ParentValues4 := parent4Window PairedFine4Parent100.table
/-- Every parent4 value equals the complete original integer hierarchy. -/
theorem parents_eq : ∀ source axis orbit, parents source axis orbit =
    SuppliedRootFineParent4Integers.numerator source axis orbit :=
  parent4Window_eq PairedFine4Parent100.table
/-- Complete literal child numerators of this parent. -/
def children : ChildValues4 := PairedFine4Children100.numerator
/-- Every child value equals the complete original integer child hierarchy. -/
theorem children_eq : ∀ column axis orbit, children column axis orbit =
    SuppliedRootFineChild3Integers.numerator 100 (shapeColumnEquiv 8 column) axis orbit :=
  PairedFine4Children100.numerator_eq
/-- One physical role of this source evaluated from checked integer caches. -/
def roleExpression (role : Fin 6) (axis : Fin 2) : RationalLogExpression :=
  cachedRole4 parents children 100 role axis

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

]
/-- Physical role 4, fine axis 0: the cached expression normalizes to its summary. -/
theorem checked40 : mergeNormalizeLogExpression (roleExpression 4 0) = summary40 := by decide +kernel
/-- Exact summary of physical role 5 on fine axis 0. -/
def summary50 : RationalLogExpression := [
  ⟨(2114802269099 : ℚ) / 4398046511104, (-13655986710332391165 : ℚ) / 19342813113834066795298816⟩, ⟨(2283244242005 : ℚ) / 4398046511104, (-14743672957447356675 : ℚ) / 19342813113834066795298816⟩, ⟨(2 : ℚ) / 1, (-448940370747687835006934773726657084921956975751388452575 : ℚ) / 1645504557321206042154969182557350504982735865633579863348609024⟩,
  ⟨(4 : ℚ) / 1, (-1339908990744061118663054550980096208412384099122524727585 : ℚ) / 822752278660603021077484591278675252491367932816789931674304512⟩, ⟨(8 : ℚ) / 1, (805312612019417007256307670885052027727090752208524814625 : ℚ) / 1645504557321206042154969182557350504982735865633579863348609024⟩, ⟨(16 : ℚ) / 1, (13655986710332391165 : ℚ) / 19342813113834066795298816⟩
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

]
/-- Physical role 4, fine axis 1: the cached expression normalizes to its summary. -/
theorem checked41 : mergeNormalizeLogExpression (roleExpression 4 1) = summary41 := by decide +kernel
/-- Exact summary of physical role 5 on fine axis 1. -/
def summary51 : RationalLogExpression := [
  ⟨(4177866396275877579499235512757989061215 : ℚ) / 11692013098647223345629478661730264157247460343808, (26977882905996093949815695949775109294600762025 : ℚ) / 51422017416287688817342786954917203280710495801049370729644032⟩, ⟨(83331164360209183671053158622133280486002637741724838924437703463906051631630887255 : ℚ) / 248661618204893321077691124073410420050228075398673858720231988446579748506266687766528, (-538097244213931369040520048031253006747081842781960762756133937897101783912737235352765425 : ℚ) / 1093625362391505962186251113558810682676584715446606218212885303204976499599687961611756588511526912⟩, ⟨(952574553299484931488854458486475609042380329239955633289117209463364125701252732585 : ℚ) / 124330809102446660538845562036705210025114037699336929360115994223289874253133343883264, (-6151093003130129530075582004690765976915678983312688909284981675770112386635098813966760975 : ℚ) / 546812681195752981093125556779405341338292357723303109106442651602488249799843980805878294255763456⟩,
  ⟨(45280855665 : ℚ) / 4398046511104, (-292393654115552775 : ℚ) / 19342813113834066795298816⟩, ⟨(1358718525358527941940119138445760328645053592649008327213189285109918383 : ℚ) / 113078212145816597093331040047546785012958969400039613319782796882727665664, (-8773700688946010027967899216855653771771207140688184186605179632365254821689305 : ℚ) / 497323236409786642155382248146820840100456150797347717440463976893159497012533375533056⟩, ⟨(144869013027 : ℚ) / 4398046511104, (635368920925215533897550741885 : ℚ) / 42535295865117307932921825928971026432⟩,
  ⟨(9054313345 : ℚ) / 274877906944, (39710557692963944593588602975 : ℚ) / 2658455991569831745807614120560689152⟩, ⟨(11613597169722979404523692859588072929019290358847102390013364272110312413725120899415 : ℚ) / 248661618204893321077691124073410420050228075398673858720231988446579748506266687766528, (-74992887479953135213110000231468148907108779309345953911616947582047444210081703563023959025 : ℚ) / 1093625362391505962186251113558810682676584715446606218212885303204976499599687961611756588511526912⟩, ⟨(668942843563444943804232359106942337023046929825 : ℚ) / 11692013098647223345629478661730264157247460343808, (4319588036741757756200102760593827495840716746601516375 : ℚ) / 51422017416287688817342786954917203280710495801049370729644032⟩,
  ⟨(21342429984962568870749185967657882860513103445142972220850816337015903569 : ℚ) / 113078212145816597093331040047546785012958969400039613319782796882727665664, (-137815220126948269658999194770466115021091380834942294525727706111584589672728615 : ℚ) / 497323236409786642155382248146820840100456150797347717440463976893159497012533375533056⟩, ⟨(68754571768988078292850918636177917634359642264485767268509639 : ℚ) / 205688069665150755269371147819668813122841983204197482918576128, (-443971302693898632543166486691543933767467720581943201984801689752065 : ℚ) / 904625697166532776746648320380374280103671755200316906558262375061821325312⟩, ⟨(1656025520211 : ℚ) / 4398046511104, (7263024202456464064428084713805 : ℚ) / 42535295865117307932921825928971026432⟩,
  ⟨(1656025523595 : ℚ) / 4398046511104, (7263024217298067409997962216725 : ℚ) / 42535295865117307932921825928971026432⟩, ⟨(1759134129295 : ℚ) / 4398046511104, (-11359318382791128825 : ℚ) / 19342813113834066795298816⟩, ⟨(5364821163528019161080839411719728887 : ℚ) / 10633823966279326983230456482242756608, (34642447467990201609517942162677215532536145 : ℚ) / 46768052394588893382517914646921056628989841375232⟩,
  ⟨(617616590119 : ℚ) / 1099511627776, (-3988157223956072865 : ℚ) / 4835703278458516698824704⟩, ⟨(2597151973989 : ℚ) / 4398046511104, (11390632218117184951195508307195 : ℚ) / 42535295865117307932921825928971026432⟩, ⟨(1298575988933 : ℚ) / 2199023255552, (5695316117560497938182626357915 : ℚ) / 21267647932558653966460912964485513216⟩,
  ⟨(2 : ℚ) / 1, (-749451443269306660507598725835693178183955530897705144063375974724285 : ℚ) / 1809251394333065553493296640760748560207343510400633813116524750123642650624⟩, ⟨(4 : ℚ) / 1, (-2612767629125094326603104937920504454093059176928884996485227768462905548482467297536017873935 : ℚ) / 1093625362391505962186251113558810682676584715446606218212885303204976499599687961611756588511526912⟩, ⟨(8 : ℚ) / 1, (-46131347744844851978041375541843308689184174670969371102561217416515 : ℚ) / 1809251394333065553493296640760748560207343510400633813116524750123642650624⟩,
  ⟨(16 : ℚ) / 1, (855310775465949161536453464186797191308809912456225802844989837252614958439650292570409057295 : ℚ) / 1093625362391505962186251113558810682676584715446606218212885303204976499599687961611756588511526912⟩, ⟨(32 : ℚ) / 1, (288692642964966374340593322318916525397851573070994331753390327992079159205443545 : ℚ) / 497323236409786642155382248146820840100456150797347717440463976893159497012533375533056⟩, ⟨(64 : ℚ) / 1, (40169847927876575751373612171721526020550487215348718965 : ℚ) / 1645504557321206042154969182557350504982735865633579863348609024⟩
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
theorem value0 : rationalLogValue expression0 = rationalLogValue (sourceSum4 100 0) :=
  roles4_value parents parents_eq children 100 children_eq 0 summaries0 checked0
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
theorem value1 : rationalLogValue expression1 = rationalLogValue (sourceSum4 100 1) :=
  roles4_value parents parents_eq children 100 children_eq 1 summaries1 checked1

end MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4Node100
