import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block172
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node172, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,1699752037366709654130669326227776471040),(3,5151603881688050017108678919105846181888),(6,14926715563885301990416626630299542880256)] orbit.val

/-- Exact candidate at original node172, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,7017322107959690272348066256408018944),(9,2973220205225543829626684867518297800704),(11,319880966644734841064799679610444054016),(12,2682716878671483679503934499136913015808),(15,15795236110290339621188207763111102643712)] orbit.val

/-- Exact candidate at original node172, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,1031993631545531013696652804620606767104),(3,5926346905124713273946037581062604849152),(6,14819730946269817374013284489949953916928)] orbit.val

/-- Exact candidate at original node172, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,736615815940584549896280371465610592256),(3,7297195834752204925762432051110064685056),(6,13744259832247272185997262453057490255872)] orbit.val

/-- Exact candidate at original node172, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14352586698391599088637954696408989696),(9,3418267460948356335488115483504011116544),(11,71456543377581361002453752920191175680),(12,1467520758347421370708247718176736602112),(15,16806474133568310995368519966335817649152)] orbit.val

/-- Exact candidate at original node172, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,741185497039151147600945335424195231744),(3,7366095484745679719680484007848594898944),(6,13670790501155230794374545532360375402496)] orbit.val

/-- Exact candidate at original node172, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,883065037629381512891114376796970156032),(3,7033366790623819993170196671835863515136),(6,13861639654686860155594663827000331862016)] orbit.val

/-- Exact candidate at original node172, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,5891773585164356044321518207054643200),(9,3221280723569974838017610375249340137472),(11,85389160856090832210484962564358712832),(12,2188893848001901105340135856964186055680),(15,16276615976926930530043422162648225984000)] orbit.val

/-- Exact candidate at original node172, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,459683705574061725903971869620436992000),(3,7490769549598755745932462097802161291264),(6,13827618227767244189819540908210567249920)] orbit.val

/-- Exact candidate at original node172, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,578512897281360858059765526711477731328),(3,6110602196950502294566578753039014821888),(6,15088956388708198509029630595882672979968)] orbit.val

/-- Exact candidate at original node172, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,6098920265760687710848151386318700544),(9,3300370117977402482252425317754712621056),(11,106651736889762604856741979471819235328),(12,2214630936916686874705053696766499241984),(15,16150319770890449012130905730253815734272)] orbit.val

/-- Exact candidate at original node172, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,704103313159822188686724292292475092992),(3,5804120950435219456175169603222982623232),(6,15269847219345020016794080980117707816960)] orbit.val

/-- Exact candidate at original node172, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,192322676216675319409849485230080),(3,2338529399425782724789045020400279355392),(6,19439541891191602720191610445383400947712)] orbit.val

/-- Exact candidate at original node172, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,284939134722394548634081220886528),(11,43887199916859709316520423221349939200),(12,1759544805436483194717655123913880178688),(15,19974639192647584035227250694416714528768)] orbit.val

/-- Exact candidate at original node172, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,192031293654691038956294296829952),(3,2338529399717165286773325473955467755520),(6,19439541891191602720191610445383400947712)] orbit.val

/-- Exact candidate at original node172, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,572561602623925443381528738493636804608),(3,6976606637812518732824996892436932329472),(6,14228903242503617485449449244702596399104)] orbit.val

/-- Exact candidate at original node172, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,7942667372623918717573609629199368192),(9,3342467797497868344159395454940511993856),(11,74209933541967741582779833760807179776),(12,1690815741588658392389049188274447733760),(15,16662635342938943264807176789028199257600)] orbit.val

/-- Exact candidate at original node172, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,786307880907906170158794284558903672832),(3,6975366819475882669585572876352086867968),(6,14016396782556272821911607714722174992384)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked17200 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 172 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked17201 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 172 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked17202 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 172 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked17210 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 172 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked17211 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 172 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked17212 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 172 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked17220 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 172 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked17221 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 172 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked17222 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 172 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked17230 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 172 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked17231 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 172 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked17232 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 172 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked17240 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 172 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked17241 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 172 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked17242 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 172 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked17250 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 172 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked17251 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 172 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked17252 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 172 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 172 1 :=
  RootFineParent3CacheTable.single 172 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 172 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 172 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 172 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 172 0 0) checked17200 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 172 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 172 0 1) checked17201 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 172 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 172 0 2) checked17202 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 172 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 172 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 172 1 0) checked17210 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 172 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 172 1 1) checked17211 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 172 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 172 1 2) checked17212 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 172 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 172 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 172 2 0) checked17220 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 172 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 172 2 1) checked17221 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 172 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 172 2 2) checked17222 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 172 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 172 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 172 3 0) checked17230 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 172 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 172 3 1) checked17231 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 172 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 172 3 2) checked17232 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 172 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 172 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 172 4 0) checked17240 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 172 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 172 4 1) checked17241 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 172 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 172 4 2) checked17242 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 172 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 172 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 172 5 0) checked17250 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 172 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 172 5 1) checked17251 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 172 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 172 5 2) checked17252 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block172
