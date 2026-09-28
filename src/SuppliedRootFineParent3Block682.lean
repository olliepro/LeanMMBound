import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block682
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node682, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,653658456057366808696735424812316360704),(3,7246558401975763010383250896103088848896),(6,13877854624906931842575988554717760323584)] orbit.val

/-- Exact candidate at original node682, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,5349815325141353856762841752976490496),(9,3340042586919123793709797443996965928960),(11,55812940137399035358350827689696238592),(12,1727285069811695423939718938625931593728),(15,16649581070746702054791344823567595281408)] orbit.val

/-- Exact candidate at original node682, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,459376659457477390261631033376812040192),(3,7522172458272103111015962567922197463040),(6,13796522365210481160378381274334156029952)] orbit.val

/-- Exact candidate at original node682, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,726955534837371579389695835458905309184),(3,7300268619819622351795956128107932418048),(6,13750847328283067730470322912066327805952)] orbit.val

/-- Exact candidate at original node682, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,8583106783345768762328382169159827456),(9,3274668773027994450235397272385217363968),(11,68939828961055909330982471014868648192),(12,1402021371475941745085920104149987753472),(15,17023858402691723788241346645913931940096)] orbit.val

/-- Exact candidate at original node682, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,729127934487227251547388557932200198144),(3,7298355710698754675981802725081043959808),(6,13750587837754079734126783592619921375232)] orbit.val

/-- Exact candidate at original node682, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,497258017278992541989066211648730038272),(3,7446452782495734390984169870508045631488),(6,13834360683165334728682738793476389863424)] orbit.val

/-- Exact candidate at original node682, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,4440112398466726833907263236072275968),(9,3386862504040986038344255179038029512704),(11,58701408952578403117973625778800924672),(12,1839804383400570374384379319953790652416),(15,16488263074147460118975459487626472167424)] orbit.val

/-- Exact candidate at original node682, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,498002013608525966224371931884424265728),(3,7446061760475067861997949120924411232256),(6,13834007708856467833433653822824330035200)] orbit.val

/-- Exact candidate at original node682, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,497155594042991195635344848767097503744),(3,7447514628202664508117256260619878793216),(6,13833401260694405957903373766246189236224)] orbit.val

/-- Exact candidate at original node682, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,7847299126140817249050690482704744448),(9,3386648486629763587631532659432637857792),(11,58696325393069119361883656857301634048),(12,1839478600589958200763835294970067904512),(15,16485400771201129936649672573890453392384)] orbit.val

/-- Exact candidate at original node682, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,497884641501313860426795670889941696512),(3,7446790412770938385164924846750635655168),(6,13833396428667809416064254357992588181504)] orbit.val

/-- Exact candidate at original node682, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,726956051970431379307682085756880289792),(3,7300268746672874508447071922533571756032),(6,13750846684296755773901220867342713487360)] orbit.val

/-- Exact candidate at original node682, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,8583105788041977176882641150263951360),(9,3274668682970332472302553034023728316416),(11,68939907549993475944483779935429257216),(12,1402019922635684081493348755344477532160),(15,17023859863996009654738706665179266476032)] orbit.val

/-- Exact candidate at original node682, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,729128453961957321212457638816510902272),(3,7298355834799340469843089437653838331904),(6,13750587194178763870600427799162816299008)] orbit.val

/-- Exact candidate at original node682, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,458206087436662935390946027628581093376),(3,7523990792584437243727031357892244537344),(6,13795874602918961482537997490112339902464)] orbit.val

/-- Exact candidate at original node682, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,8404043158777918204376481391443968),(9,3340605281863227263730925744684955336704),(11,55811549428947130838390956452345440256),(12,1727385374626957603453269685022906593280),(15,16654260872977770885715184112991566718976)] orbit.val

/-- Exact candidate at original node682, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,655428980352331404245779311208595193856),(3,7245929895163665182904428283753259859968),(6,13876712607424065074505767280671310479360)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked68200 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 682 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked68201 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 682 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked68202 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 682 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked68210 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 682 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked68211 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 682 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked68212 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 682 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked68220 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 682 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked68221 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 682 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked68222 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 682 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked68230 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 682 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked68231 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 682 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked68232 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 682 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked68240 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 682 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked68241 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 682 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked68242 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 682 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked68250 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 682 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked68251 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 682 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked68252 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 682 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 682 1 :=
  RootFineParent3CacheTable.single 682 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 682 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 682 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 682 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 682 0 0) checked68200 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 682 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 682 0 1) checked68201 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 682 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 682 0 2) checked68202 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 682 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 682 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 682 1 0) checked68210 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 682 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 682 1 1) checked68211 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 682 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 682 1 2) checked68212 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 682 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 682 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 682 2 0) checked68220 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 682 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 682 2 1) checked68221 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 682 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 682 2 2) checked68222 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 682 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 682 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 682 3 0) checked68230 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 682 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 682 3 1) checked68231 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 682 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 682 3 2) checked68232 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 682 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 682 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 682 4 0) checked68240 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 682 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 682 4 1) checked68241 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 682 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 682 4 2) checked68242 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 682 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 682 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 682 5 0) checked68250 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 682 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 682 5 1) checked68251 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 682 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 682 5 2) checked68252 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block682
