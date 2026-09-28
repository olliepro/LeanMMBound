import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block215
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node215, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,649055796974623775471680492520582676480),(3,7240216053415745785257528021975495081984),(6,13888799632549692100926766361137087774720)] orbit.val

/-- Exact candidate at original node215, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,195579670926618658870762837901312),(9,3091587808831818198394798010131887947776),(11,51153541011552046705551459687054572032),(12,1648373482678974594101180764798665362432),(15,16986956454838045895835785770252719749632)] orbit.val

/-- Exact candidate at original node215, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,441446317734975870767476722490398474240),(3,7518428853471131583067805152117327396864),(6,13818196311733954207820693001025439662080)] orbit.val

/-- Exact candidate at original node215, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,723087226852328043742210178792449638400),(3,7295900369049745559278370302214335889408),(6,13759083887037988058635394394626380005376)] orbit.val

/-- Exact candidate at original node215, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,44521275572859416206472103591936),(9,3029669759207979088171605598938375127040),(11,67184201175988218668295994206552432640),(12,1319347615713133156681123996028425256960),(15,17361869862321685625275533079987709124608)] orbit.val

/-- Exact candidate at original node215, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,723090038078624641228035757543465680896),(3,7296072818793321737090783400107209392128),(6,13758908626068115283337155717982490460160)] orbit.val

/-- Exact candidate at original node215, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,484316061840920392117617942759814987776),(3,7443814513778794908569465669952028540928),(6,13849940907320346360968891262921322004480)] orbit.val

/-- Exact candidate at original node215, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,177332434747552153618749746839552),(9,3135763608922550450700341865616347496448),(11,53191941299300365514643181847658225664),(12,1757349061004362510076547585095816724480),(15,16831766694381413587812288624323596247040)] orbit.val

/-- Exact candidate at original node215, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,484426920737326639485288718629110546432),(3,7443833021201057233725808604435019988992),(6,13849811541001677788444877552569034997760)] orbit.val

/-- Exact candidate at original node215, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,484160385997209302672535154289803264000),(3,7440612697298999733548411857237289467904),(6,13853298399643852625435027864106072801280)] orbit.val

/-- Exact candidate at original node215, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,192935431002705086603578308558848),(9,3134918189974016802132911219403586011136),(11,53180184592500501184230477408720796672),(12,1757180504170069239946450420252920743936),(15,16832792411268044115687296154989629422592)] orbit.val

/-- Exact candidate at original node215, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,484156675426478949617729280172017844224),(3,7440675973360183166317460548053693890560),(6,13853238834153399545720785047407453798400)] orbit.val

/-- Exact candidate at original node215, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,723086190968775246280815294769006641152),(3,7295900083977000036881889052378284425216),(6,13759085207994286378493270528485874466816)] orbit.val

/-- Exact candidate at original node215, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,39896331586089235499448975491072),(9,3029669944037378713636022162477218267136),(11,67184032050758615833750233719071628800),(12,1319350739813227648066738690409867133952),(15,17361866727142365098030228289578033012224)] orbit.val

/-- Exact candidate at original node215, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,723089000365687783430876219323518550016),(3,7296072536401663022058408433598259527680),(6,13758909946172710856166690222711387455488)] orbit.val

/-- Exact candidate at original node215, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,441584041466082422947601743329273839616),(3,7517604378467546938109840145944043061248),(6,13818883063006432300598532986359848632320)] orbit.val

/-- Exact candidate at original node215, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,187978719085406423982882215165952),(9,3093339232410676710482928184723899416576),(11,51174302054088649558536461921440094208),(12,1648521948212616542616676410793209909248),(15,16985035812283960673591409835312400947200)] orbit.val

/-- Exact candidate at original node215, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,649016574092753826634784917564216573952),(3,7239695445218854427343447811176641069056),(6,13889359463628453407677742146892307890176)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked21500 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 215 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked21501 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 215 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked21502 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 215 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked21510 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 215 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked21511 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 215 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked21512 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 215 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked21520 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 215 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked21521 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 215 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked21522 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 215 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked21530 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 215 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked21531 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 215 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked21532 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 215 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked21540 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 215 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked21541 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 215 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked21542 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 215 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked21550 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 215 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked21551 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 215 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked21552 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 215 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 215 1 :=
  RootFineParent3CacheTable.single 215 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 215 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 215 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 215 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 215 0 0) checked21500 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 215 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 215 0 1) checked21501 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 215 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 215 0 2) checked21502 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 215 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 215 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 215 1 0) checked21510 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 215 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 215 1 1) checked21511 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 215 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 215 1 2) checked21512 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 215 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 215 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 215 2 0) checked21520 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 215 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 215 2 1) checked21521 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 215 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 215 2 2) checked21522 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 215 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 215 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 215 3 0) checked21530 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 215 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 215 3 1) checked21531 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 215 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 215 3 2) checked21532 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 215 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 215 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 215 4 0) checked21540 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 215 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 215 4 1) checked21541 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 215 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 215 4 2) checked21542 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 215 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 215 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 215 5 0) checked21550 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 215 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 215 5 1) checked21551 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 215 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 215 5 2) checked21552 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block215
