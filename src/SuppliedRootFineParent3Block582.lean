import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block582
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node582, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,658029653076645887469182050217014329344),(3,7246288192936028162215905853999151054848),(6,13873753636927387611970886971417000148992)] orbit.val

/-- Exact candidate at original node582, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,12773938632623147626494851880214069248),(9,3436784280423094805760520471384887918592),(11,58251405171982699083800401180364376064),(12,1767343934111455806558153521961322409984),(15,16502917924600905202627005629226376759296)] orbit.val

/-- Exact candidate at original node582, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,467669593330758167234053865790800658432),(3,7525354126410125552946371311075602726912),(6,13785047763199177941475549698766762147840)] orbit.val

/-- Exact candidate at original node582, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,734251705680258523526508319152640360448),(3,7297723405232190521866571276678158352384),(6,13746096372027612616262895279802366820352)] orbit.val

/-- Exact candidate at original node582, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,12425565429969626078834330898719047680),(9,3370610484231483802002203554873193005056),(11,70484730340427593227786475065525179392),(12,1440610275107972262628814980543424681984),(15,16883940427830208377718335534252303619072)] orbit.val

/-- Exact candidate at original node582, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,732537667293860748852179674370278424576),(3,7300212262559479410757044846842190233600),(6,13745321553086721502046750354420696875008)] orbit.val

/-- Exact candidate at original node582, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,504915385213749573141277476826766114816),(3,7446921132210368123431838358677382758400),(6,13826234965515943965082859040129016659968)] orbit.val

/-- Exact candidate at original node582, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,12089513994172489363758722955836653568),(9,3485908968080625019012148131343550644224),(11,61653073539755310237977763994688162048),(12,1882805107848851148871979694713315520000),(15,16335614819476657694170110562625774553344)] orbit.val

/-- Exact candidate at original node582, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,504381936810039605600267295172088299520),(3,7448317930366461484230908372120942673920),(6,13825371615763560571824799208340134559744)] orbit.val

/-- Exact candidate at original node582, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,504951183496358634953624886277149032448),(3,7446872318270751856545554349731277176832),(6,13826247981172951170156795639624739323904)] orbit.val

/-- Exact candidate at original node582, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,12090083015787426967372840888084463616),(9,3485970764685652101981552793235776077824),(11,61659240451722224864340875265173227520),(12,1882863124698542062735366360101359448064),(15,16335488270088357845107342006142772316160)] orbit.val

/-- Exact candidate at original node582, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,504420030163086328100949441854392238080),(3,7448277535920566217751088200747338170368),(6,13825373916856409115803937233031435124736)] orbit.val

/-- Exact candidate at original node582, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,734251803209558969164379492925082435584),(3,7297723422346041234369196600763812413440),(6,13746096257384461458122398781944270684160)] orbit.val

/-- Exact candidate at original node582, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,12425565073442894764644811727771271168),(9,3370610461136474429094149146355131482112),(11,70484743924580571385744678309576976640),(12,1440609930683019970576300617906946551296),(15,16883940782122543795835135621333739251968)] orbit.val

/-- Exact candidate at original node582, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,732537764367585910765722652509493788672),(3,7300212279752571635041242762991737241600),(6,13745321438819904115849009460131934502912)] orbit.val

/-- Exact candidate at original node582, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,466894132168409754308821531575197892608),(3,7522022987322436992795044511416424857600),(6,13789154363449214914552108832641542782976)] orbit.val

/-- Exact candidate at original node582, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,11661792113065998968164136044464177152),(9,3438805692321895576102619363191883300864),(11,58197270062657444866573457714985219840),(12,1767007897618082039290909382304621302272),(15,16502398830824360602427708536377211533056)] orbit.val

/-- Exact candidate at original node582, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,655100581898989225719190871216318578688),(3,7246860649070071196979843626225448779776),(6,13876110251971001238956940378191398174720)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked58200 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 582 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked58201 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 582 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked58202 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 582 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked58210 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 582 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked58211 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 582 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked58212 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 582 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked58220 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 582 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked58221 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 582 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked58222 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 582 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked58230 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 582 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked58231 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 582 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked58232 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 582 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked58240 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 582 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked58241 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 582 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked58242 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 582 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked58250 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 582 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked58251 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 582 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked58252 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 582 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 582 1 :=
  RootFineParent3CacheTable.single 582 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 582 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 582 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 582 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 582 0 0) checked58200 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 582 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 582 0 1) checked58201 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 582 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 582 0 2) checked58202 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 582 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 582 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 582 1 0) checked58210 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 582 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 582 1 1) checked58211 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 582 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 582 1 2) checked58212 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 582 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 582 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 582 2 0) checked58220 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 582 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 582 2 1) checked58221 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 582 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 582 2 2) checked58222 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 582 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 582 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 582 3 0) checked58230 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 582 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 582 3 1) checked58231 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 582 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 582 3 2) checked58232 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 582 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 582 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 582 4 0) checked58240 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 582 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 582 4 1) checked58241 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 582 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 582 4 2) checked58242 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 582 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 582 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 582 5 0) checked58250 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 582 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 582 5 1) checked58251 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 582 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 582 5 2) checked58252 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block582
