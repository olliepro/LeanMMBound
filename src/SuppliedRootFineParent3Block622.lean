import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block622
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node622, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13968439454965207050378187827123847168),(9,3535267717186199130011238044683126964224),(11,63399244095329534018044938645869507328),(12,1910778053353616262735576886709998426624),(15,16254658028849951527840736817767046787840)] orbit.val

/-- Exact candidate at original node622, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,506567291094851054450480308592146644992),(3,7455627182374435364781140111689162686464),(6,13815877009470775242424354455351856201728)] orbit.val

/-- Exact candidate at original node622, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,508738075358405246487991953860186865664),(3,7446116806558533470051946765271414341632),(6,13823216601023122945116036156501564325888)] orbit.val

/-- Exact candidate at original node622, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14122487614163124886368950735136096256),(9,3890054905035946346317232165530573471744),(11,62339917332453081070087624973593946112),(12,1855285056124193477643828878246014201856),(15,15956269116833305631738457256147847817216)] orbit.val

/-- Exact candidate at original node622, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,457676692855989733827902625881549438976),(3,6735925899968546492295963311698788483072),(6,14584468890115525435532108938052827611136)] orbit.val

/-- Exact candidate at original node622, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,457417615750051080997747551491841851392),(3,6764690861857707623288097118373290180608),(6,14555963005332302957370130205768033501184)] orbit.val

/-- Exact candidate at original node622, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,18344652156637950396605452945195008),(9,3489516021960757789072206407054921826304),(11,59985167261287721581122366346494477312),(12,1806000339448955099893069113771303106560),(15,16422551609616904413159180383007500928000)] orbit.val

/-- Exact candidate at original node622, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,650540999985143172642939238666645536768),(3,7260045651701662389415911067017048752128),(6,13867484831253256099597124569949471244288)] orbit.val

/-- Exact candidate at original node622, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,473790517656383260067514024913507713024),(3,7523974234170801435997996605905672601600),(6,13780306731112876965590464244813985218560)] orbit.val

/-- Exact candidate at original node622, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14357098989834794299739962004205469696),(9,3419503048490570980497746048125476274176),(11,70685325030563710216559229901726883072),(12,1466053620169144425785315237921186760192),(15,16807472390259947750856614397680570146048)] orbit.val

/-- Exact candidate at original node622, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,729209163317440844429212554142343495680),(3,7309769925754165787993712647400589361152),(6,13739092393868455029233049674090232676352)] orbit.val

/-- Exact candidate at original node622, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,735513152589572747446811864526418345984),(3,7296630784594315351452092467591272988672),(6,13745927545756173562757070543515474198528)] orbit.val

/-- Exact candidate at original node622, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,2095917884565818868077100952417468416),(9,3488435659403156487838188093245728227328),(11,59935656730797251552385804883509421056),(12,1800183477566287199995767239273682483200),(15,16427420771355254903401556637277827933184)] orbit.val

/-- Exact candidate at original node622, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,471761105255596667025070566404752670720),(3,7532883536003004285136601430820263034880),(6,13773426841681460709494302878408149827584)] orbit.val

/-- Exact candidate at original node622, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,657925253377241809613657609564500000768),(3,7247187834477266184377235805036431278080),(6,13872958395085553667665081461032234254336)] orbit.val

/-- Exact candidate at original node622, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14357102030215530784633917156454563840),(9,3419503222639023947007901599834675609600),(11,70685228916958961924780100598476238848),(12,1466056191261122042889002365797907177472),(15,16807469738092741179049656892245651943424)] orbit.val

/-- Exact candidate at original node622, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,729208445469862503902585290506649993216),(3,7309769806635435327831877572837991514112),(6,13739093230834763829921512012288524025856)] orbit.val

/-- Exact candidate at original node622, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,735512425311683887305127779265243250688),(3,7296630676950972355804762428787509952512),(6,13745928380677405418546084667580412329984)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked62200 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 622 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked62201 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 622 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked62202 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 622 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked62210 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 622 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked62211 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 622 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked62212 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 622 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked62220 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 622 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked62221 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 622 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked62222 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 622 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked62230 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 622 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked62231 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 622 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked62232 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 622 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked62240 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 622 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked62241 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 622 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked62242 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 622 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked62250 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 622 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked62251 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 622 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked62252 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 622 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 622 1 :=
  RootFineParent3CacheTable.single 622 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 622 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 622 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 622 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 622 0 0) checked62200 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 622 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 622 0 1) checked62201 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 622 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 622 0 2) checked62202 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 622 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 622 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 622 1 0) checked62210 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 622 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 622 1 1) checked62211 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 622 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 622 1 2) checked62212 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 622 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 622 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 622 2 0) checked62220 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 622 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 622 2 1) checked62221 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 622 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 622 2 2) checked62222 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 622 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 622 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 622 3 0) checked62230 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 622 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 622 3 1) checked62231 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 622 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 622 3 2) checked62232 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 622 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 622 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 622 4 0) checked62240 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 622 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 622 4 1) checked62241 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 622 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 622 4 2) checked62242 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 622 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 622 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 622 5 0) checked62250 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 622 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 622 5 1) checked62251 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 622 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 622 5 2) checked62252 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block622
