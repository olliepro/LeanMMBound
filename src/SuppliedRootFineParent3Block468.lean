import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block468
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node468, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,658543382035232084588233661473838071808),(3,7246706111124428980484614793094875840512),(6,13872821989780400596583126421064451620864)] orbit.val

/-- Exact candidate at original node468, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13316243708975795849049822973338320896),(9,3450259016471250753175040339624220164096),(11,58744933646730255998178968971634306560),(12,1774940702677561103325528691924779082752),(15,16480810586435543753308177052139193658880)] orbit.val

/-- Exact candidate at original node468, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,470002319413217414575174180730071678976),(3,7523663218773881358620782879703098720256),(6,13784405944752962888460017815199995133952)] orbit.val

/-- Exact candidate at original node468, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,734387545142997948166401273194224812032),(3,7298378397350859884222424082899361857536),(6,13745305540446203829267149519539578863616)] orbit.val

/-- Exact candidate at original node468, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,12952348996232267289275688390076923904),(9,3383347415082387407013834154199222321152),(11,70719841405594154374781057410813947392),(12,1447819471036338331582274537486252188672),(15,16863232406419509501395809438146800152064)] orbit.val

/-- Exact candidate at original node468, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,734069034230298200838273935968131088384),(3,7298882755239993868235417883849514811392),(6,13745119693469769592582283055815519633408)] orbit.val

/-- Exact candidate at original node468, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,506039115221026863547120795647941279744),(3,7447731582553036395747051221783232380928),(6,13824300785165998402361802858201991872512)] orbit.val

/-- Exact candidate at original node468, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,12600571923936165717162178179036610560),(9,3499149696427141814293275761222346604544),(11,62157393036146387264898085332875417856),(12,1890056819959695408113142366339347893760),(15,16314107001593141886267496484559559006464)] orbit.val

/-- Exact candidate at original node468, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,506025459924667332232854954957200162816),(3,7447787057291122485192224440641367572480),(6,13824258965724271844230895480034597797888)] orbit.val

/-- Exact candidate at original node468, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,505965131683489148617200669756653305856),(3,7447415275302307716453455254523062779904),(6,13824691075954264796585318951353449447424)] orbit.val

/-- Exact candidate at original node468, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,12600015256962820181643203740048556032),(9,3498855086103739949625470958975705939968),(11,62151103452851363547265131912588254464),(12,1890013084986971367818745975626189325824),(15,16314452193139536160482849605378633456896)] orbit.val

/-- Exact candidate at original node468, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,505985044832422395282619266753053589504),(3,7447452171330715999345965242528424787968),(6,13824634266776923267027390366351687155712)] orbit.val

/-- Exact candidate at original node468, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,734379704054851307910301396426022715392),(3,7298377062703641337311388379868903243776),(6,13745314716181569016434285099338239574016)] orbit.val

/-- Exact candidate at original node468, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,12952378944477697681195298749690150912),(9,3383349283866767191909614099717957877760),(11,70718757507098354610707154989132762112),(12,1447847226695494631667809881304554629120),(15,16863203835926223785786648440871830113280)] orbit.val

/-- Exact candidate at original node468, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,734061209012551305820735964691969343488),(3,7298881391194166826775184631229386326016),(6,13745128882733343529060054279711809863680)] orbit.val

/-- Exact candidate at original node468, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,471293230991082809099153273014294937600),(3,7518212511295805094858772414687556403200),(6,13788565740653173757698049187931314192384)] orbit.val

/-- Exact candidate at original node468, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13315317214843354041886004070383091712),(9,3448283229238835137780011500809027059712),(11,58913478341404755005337869096281349120),(12,1776472067151610185435618748812377114624),(15,16481087390993368229393120752845096918016)] orbit.val

/-- Exact candidate at original node468, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,658776800982774244915491897011542687744),(3,7242672332345345826739236905129764454400),(6,13876622349611941590001246073491858391040)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked46800 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 468 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked46801 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 468 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked46802 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 468 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked46810 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 468 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked46811 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 468 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked46812 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 468 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked46820 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 468 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked46821 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 468 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked46822 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 468 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked46830 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 468 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked46831 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 468 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked46832 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 468 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked46840 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 468 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked46841 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 468 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked46842 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 468 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked46850 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 468 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked46851 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 468 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked46852 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 468 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 468 1 :=
  RootFineParent3CacheTable.single 468 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 468 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 468 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 468 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 468 0 0) checked46800 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 468 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 468 0 1) checked46801 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 468 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 468 0 2) checked46802 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 468 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 468 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 468 1 0) checked46810 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 468 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 468 1 1) checked46811 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 468 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 468 1 2) checked46812 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 468 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 468 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 468 2 0) checked46820 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 468 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 468 2 1) checked46821 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 468 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 468 2 2) checked46822 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 468 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 468 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 468 3 0) checked46830 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 468 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 468 3 1) checked46831 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 468 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 468 3 2) checked46832 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 468 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 468 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 468 4 0) checked46840 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 468 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 468 4 1) checked46841 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 468 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 468 4 2) checked46842 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 468 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 468 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 468 5 0) checked46850 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 468 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 468 5 1) checked46851 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 468 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 468 5 2) checked46852 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block468
