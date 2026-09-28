import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block281
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node281, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,732294808730636393481598377387062460416),(3,7297566498747533164469136261127583301632),(6,13748210175461892103705240237118519771136)] orbit.val

/-- Exact candidate at original node281, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,732077978964302841050532462183449624576),(3,7297907036669129410565140785049129451520),(6,13748086467306629410040301628400586457088)] orbit.val

/-- Exact candidate at original node281, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,10083574964321702432611683414218637312),(9,3299911638970940410555465709943152181248),(11,69851382581696473609095692703972008960),(12,1410951994025932224896886105722604337152),(15,16987272892397170850161915683849218368512)] orbit.val

/-- Exact candidate at original node281, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,655732273963814314786401917319077953536),(3,7245175316695609223254351055302942523392),(6,13877163892280638123615221903011145056256)] orbit.val

/-- Exact candidate at original node281, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,463023161880940744428868841253210423296),(3,7522069311578520459395294833415785807872),(6,13792979009480600457831811200964169302016)] orbit.val

/-- Exact candidate at original node281, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,4912064436214678138541355873387675648),(9,3366915222137129470356046969267189448704),(11,56729556474201847758546874355430632448),(12,1742673361318800916763652451021319481344),(15,16606841278573714748639187225115838295040)] orbit.val

/-- Exact candidate at original node281, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,732078060481187158372917693197485867008),(3,7297906447086797690051266172135722188800),(6,13748086975372076813231791010299957477376)] orbit.val

/-- Exact candidate at original node281, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,732294920313730894165385018249740025856),(3,7297567126199786836685949171743277973504),(6,13748209436426543930804640685640147533824)] orbit.val

/-- Exact candidate at original node281, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,10083574662264332846978896338832326656),(9,3299911616707826744047186846157302136832),(11,69851396669348033329056645342043054848),(12,1410951655813261916720807503484888267264),(15,16987273239087360634711944984310099747584)] orbit.val

/-- Exact candidate at original node281, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,462833358134685905096820697917925883904),(3,7522324978201352942699619641995827347456),(6,13792913146604022813859534535719412301824)] orbit.val

/-- Exact candidate at original node281, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,654748094244102479525057301595629289472),(3,7246382373025592411280958999823975972864),(6,13876941015670366770849958574213560270848)] orbit.val

/-- Exact candidate at original node281, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,10142672404501208815997124052758036480),(9,3366001022695319508774975606756927864832),(11,56605843859079926600063178797124235520),(12,1739555279017880583253399764509183548928),(15,16605766664963280434211539201517171847424)] orbit.val

/-- Exact candidate at original node281, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,500107640910869553557867538299567996928),(3,7446816023548842521346603999385834487808),(6,13831147818480349586751503337947763048448)] orbit.val

/-- Exact candidate at original node281, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,500103065841965879225097189252323606528),(3,7446828241966557873359965883801020661760),(6,13831140175131537909070911802579821264896)] orbit.val

/-- Exact candidate at original node281, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,9812963509929509332486271876468834304),(9,3413395749044439263876270961331777044480),(11,59649129327802709611670289967335054336),(12,1853549622873397278227174484387754461184),(15,16441664018184492900608372868069830138880)] orbit.val

/-- Exact candidate at original node281, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,500243353241524691286617979096817205248),(3,7446594239361657458226769332008994734080),(6,13831233890336879512142587564527353593856)] orbit.val

/-- Exact candidate at original node281, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,500243846830361445646130273736380645376),(3,7446636449980196859573729928140101255168),(6,13831191186129503356436114673756683632640)] orbit.val

/-- Exact candidate at original node281, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,9797243533292404088206986447106867200),(9,3413610409887376533558245162505975365632),(11,59671289693491115541799439448567002112),(12,1853753275939367396498910892126353856512),(15,16441239263886534211968812395105162441728)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked28100 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 281 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked28101 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 281 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked28102 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 281 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked28110 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 281 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked28111 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 281 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked28112 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 281 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked28120 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 281 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked28121 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 281 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked28122 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 281 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked28130 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 281 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked28131 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 281 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked28132 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 281 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked28140 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 281 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked28141 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 281 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked28142 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 281 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked28150 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 281 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked28151 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 281 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked28152 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 281 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 281 1 :=
  RootFineParent3CacheTable.single 281 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 281 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 281 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 281 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 281 0 0) checked28100 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 281 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 281 0 1) checked28101 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 281 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 281 0 2) checked28102 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 281 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 281 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 281 1 0) checked28110 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 281 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 281 1 1) checked28111 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 281 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 281 1 2) checked28112 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 281 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 281 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 281 2 0) checked28120 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 281 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 281 2 1) checked28121 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 281 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 281 2 2) checked28122 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 281 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 281 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 281 3 0) checked28130 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 281 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 281 3 1) checked28131 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 281 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 281 3 2) checked28132 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 281 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 281 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 281 4 0) checked28140 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 281 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 281 4 1) checked28141 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 281 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 281 4 2) checked28142 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 281 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 281 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 281 5 0) checked28150 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 281 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 281 5 1) checked28151 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 281 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 281 5 2) checked28152 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block281
