import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block330
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node330, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,654293929612340685546885151698049826816),(3,7244285261147699898366464478287675523072),(6,13879492292180021077742625245647440183296)] orbit.val

/-- Exact candidate at original node330, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,7151557343837975339813376856197955584),(9,3290948566126265017383888201493545746432),(11,55081744739825498415902585291513726976),(12,1712764732694153505904478359115814531072),(15,16712124882035979664611892352876093573120)] orbit.val

/-- Exact candidate at original node330, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,457739125211414163434242797613527072768),(3,7520622046808552706574396339289220710400),(6,13799710310920094791647335738730417750016)] orbit.val

/-- Exact candidate at original node330, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,729316921190535251050701780270685618176),(3,7297960188297680854032826785476256989184),(6,13750794373451845556572446309886222925824)] orbit.val

/-- Exact candidate at original node330, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,6914087529953274883396975812119887872),(9,3232198609699397449314663611114079649792),(11,69041704014878464415402599731447979008),(12,1380767861628615303953820456051389515776),(15,17089149220067217169088691232924128500736)] orbit.val

/-- Exact candidate at original node330, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,730020322883667669336399944993740947456),(3,7297082950815621767821502182275873243136),(6,13750968209240772224498072748363551342592)] orbit.val

/-- Exact candidate at original node330, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,495078723959127356661084534149717426176),(3,7446738243665161482618961237634252275712),(6,13836254515315772822375929103849195831296)] orbit.val

/-- Exact candidate at original node330, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,6731200686030416456994724276326105088),(9,3344172127153778435211164030865741185024),(11,57621073100449851479358579543318319360),(12,1823069378776830182314159476249863151104),(15,16546477703222972776194298064697916772608)] orbit.val

/-- Exact candidate at original node330, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,495283237129757050499721385120804896768),(3,7445899285991665304003787093817329451008),(6,13836888959818639307152466396695031185408)] orbit.val

/-- Exact candidate at original node330, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,496610528993427535334045155310065156096),(3,7444551098863795318878680484816344842240),(6,13836909855082838807443249235506755534848)] orbit.val

/-- Exact candidate at original node330, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,6776578923119591099125734748863856640),(9,3346759520341249686001982434767013937152),(11,57863489279107992881555868513969652736),(12,1825468313965598499205308868446144919552),(15,16541203580430985892468001969157173167104)] orbit.val

/-- Exact candidate at original node330, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,496666708051077950321214442126398455808),(3,7444162754110626519113731344320576880640),(6,13837242020778357192221029089186190196736)] orbit.val

/-- Exact candidate at original node330, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,729313737863378433881497714491110981632),(3,7297959419941968906611098613665834729472),(6,13750798325134714321163378547476219822080)] orbit.val

/-- Exact candidate at original node330, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,6914092952130646953362579870283988992),(9,3232199212254332171080658615513804439552),(11,69041210094288696226647179242311294464),(12,1380777467636952063375091960272245408768),(15,17089139500002358084020214540734520401408)] orbit.val

/-- Exact candidate at original node330, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,730017133446916860851631064377328664576),(3,7297082191070142691071806980598519562240),(6,13750972158423002109732536830657317306368)] orbit.val

/-- Exact candidate at original node330, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,457744248793159186356742289748062633984),(3,7517418865740702840439790304034761474048),(6,13802908368406199634859442281850341425152)] orbit.val

/-- Exact candidate at original node330, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,6907360316191790269907118991261827072),(9,3295604496366236770644740671023702081536),(11,55164280040688509716038427928535220224),(12,1713077557930419400367753466913470578688),(15,16707317788286525190657535190776195825664)] orbit.val

/-- Exact candidate at original node330, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,654517984356428952931187097702777225216),(3,7241787176013713664828081777749149089792),(6,13881766322569919043896706000181239218176)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked33000 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 330 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked33001 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 330 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked33002 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 330 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked33010 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 330 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked33011 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 330 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked33012 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 330 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked33020 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 330 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked33021 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 330 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked33022 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 330 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked33030 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 330 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked33031 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 330 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked33032 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 330 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked33040 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 330 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked33041 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 330 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked33042 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 330 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked33050 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 330 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked33051 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 330 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked33052 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 330 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 330 1 :=
  RootFineParent3CacheTable.single 330 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 330 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 330 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 330 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 330 0 0) checked33000 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 330 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 330 0 1) checked33001 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 330 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 330 0 2) checked33002 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 330 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 330 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 330 1 0) checked33010 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 330 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 330 1 1) checked33011 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 330 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 330 1 2) checked33012 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 330 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 330 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 330 2 0) checked33020 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 330 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 330 2 1) checked33021 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 330 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 330 2 2) checked33022 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 330 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 330 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 330 3 0) checked33030 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 330 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 330 3 1) checked33031 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 330 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 330 3 2) checked33032 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 330 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 330 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 330 4 0) checked33040 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 330 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 330 4 1) checked33041 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 330 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 330 4 2) checked33042 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 330 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 330 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 330 5 0) checked33050 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 330 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 330 5 1) checked33051 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 330 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 330 5 2) checked33052 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block330
