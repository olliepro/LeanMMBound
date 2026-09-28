import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block570
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node570, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13981802235311187902085390136875417600),(9,3534872441901689195404026365602332409856),(11,63322553460154452993311297596931768832),(12,1907154269015074129360279115122547227648),(15,16258740416327832695996272707174478709248)] orbit.val

/-- Exact candidate at original node570, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,508502175442079521126268519321849298944),(3,7447983709877102876121154939956962000896),(6,13821585597620879264408551416354354233344)] orbit.val

/-- Exact candidate at original node570, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,508670545475692583515899431299313565696),(3,7447968543925651345223828153668649091072),(6,13821432393538717732916247290665202876416)] orbit.val

/-- Exact candidate at original node570, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13960810332560460837376771599917645824),(9,3394423328159811800930496889753194987520),(11,63212783246918888450357608943435243520),(12,1916530962823087064443087268769087897600),(15,16389943598377683446994656336567529758720)] orbit.val

/-- Exact candidate at original node570, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,510297140603762397801633376603689975808),(3,7461349729636724653719058276684864159744),(6,13806424612699574610135283222344611397632)] orbit.val

/-- Exact candidate at original node570, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,511359754062977208256187759243850416128),(3,7461473331264146799195404965069725892608),(6,13805238397612937654204382151319589224448)] orbit.val

/-- Exact candidate at original node570, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14738612822836736434239189161686859776),(9,3486149985528604941782799606202268385280),(11,60483500325069357243419838344088256512),(12,1813622235249849290730030557793883783168),(15,16403077149013701335465485684131238248448)] orbit.val

/-- Exact candidate at original node570, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,653999715066594979545176611993577062400),(3,7251909906816318765617160858195967606784),(6,13872161861057147916493637405443620864000)] orbit.val

/-- Exact candidate at original node570, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,475358624959642675348649298241974697984),(3,7522781077905026735964937293915911880704),(6,13779931780075392250342388283475278954496)] orbit.val

/-- Exact candidate at original node570, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14351594301283225884969821263676571648),(9,3418568205428060944400852607197866098688),(11,71050661973367082048416032807420852224),(12,1466146309337424422337594512897622085632),(15,16807954711899925986984141901466579924992)] orbit.val

/-- Exact candidate at original node570, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,734193598778159231079180527404991905792),(3,7299949447675817075893620535889605165056),(6,13743928436486085354683173812338568462336)] orbit.val

/-- Exact candidate at original node570, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,734953662108009935329057143293210525696),(3,7299283176041147122080496107416006426624),(6,13743834644790904604246421624923948580864)] orbit.val

/-- Exact candidate at original node570, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14741800483775575188456406709388181504),(9,3483951113187104797021620018979392192512),(11,57395472000764561318343828682388158976),(12,1717500317928207177536736531820163861504),(15,16504482779340209550590818089441833138688)] orbit.val

/-- Exact candidate at original node570, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,466533469219720707866115692011014062080),(3,7531879580714094989852352347068122005504),(6,13779658433006245963937506836554029465600)] orbit.val

/-- Exact candidate at original node570, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,677401774324778741943498590060011323392),(3,7235440782938112084774006602390613000192),(6,13865228925677170834938469683182541209600)] orbit.val

/-- Exact candidate at original node570, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14351594019032896927903118586676248576),(9,3418568189260564031333786217015303733248),(11,71050670991944030829152050370789322240),(12,1466146070841493333489886780796851561472),(15,16807954957827027369075246708863544667648)] orbit.val

/-- Exact candidate at original node570, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,734193665840924165867508365330007195648),(3,7299949458667647498127089790904170446848),(6,13743928358431489997661376719398987890688)] orbit.val

/-- Exact candidate at original node570, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,734953729367306651010979448570278576128),(3,7299283186673037678234700698791834550272),(6,13743834566899717332410294728271052406784)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked57000 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 570 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked57001 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 570 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked57002 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 570 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked57010 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 570 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked57011 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 570 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked57012 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 570 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked57020 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 570 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked57021 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 570 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked57022 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 570 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked57030 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 570 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked57031 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 570 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked57032 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 570 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked57040 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 570 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked57041 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 570 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked57042 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 570 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked57050 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 570 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked57051 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 570 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked57052 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 570 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 570 1 :=
  RootFineParent3CacheTable.single 570 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 570 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 570 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 570 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 570 0 0) checked57000 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 570 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 570 0 1) checked57001 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 570 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 570 0 2) checked57002 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 570 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 570 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 570 1 0) checked57010 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 570 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 570 1 1) checked57011 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 570 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 570 1 2) checked57012 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 570 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 570 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 570 2 0) checked57020 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 570 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 570 2 1) checked57021 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 570 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 570 2 2) checked57022 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 570 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 570 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 570 3 0) checked57030 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 570 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 570 3 1) checked57031 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 570 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 570 3 2) checked57032 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 570 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 570 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 570 4 0) checked57040 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 570 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 570 4 1) checked57041 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 570 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 570 4 2) checked57042 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 570 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 570 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 570 5 0) checked57050 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 570 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 570 5 1) checked57051 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 570 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 570 5 2) checked57052 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block570
