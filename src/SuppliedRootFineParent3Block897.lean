import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block897
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node897, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,659524178656218231649673194731556831232),(3,7247476019289748695005244138101275623424),(6,13871071284994094735001057542800333078528)] orbit.val

/-- Exact candidate at original node897, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14739362865947738660440145043071696896),(9,3485443052337543826364564868827881406464),(11,59755481567086243745998848793530063104),(12,1791882706763911953162332931477198097920),(15,16426250879405571899722638081491484268800)] orbit.val

/-- Exact candidate at original node897, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,473478582004114385948586050235324694528),(3,7524111179194543313960030336410714112000),(6,13780481721741403961747358488987126726656)] orbit.val

/-- Exact candidate at original node897, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,842670577264672180350984085878438100992),(3,7008159435573822313024854055157862760448),(6,13927241470101567168280136734596864671744)] orbit.val

/-- Exact candidate at original node897, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,2412023595787668436172886508627296256),(9,2209401105714189591823462967541760),(11,62754105917929630642140754735954412544),(12,1349517806735906287342754147468495517696),(15,20363385337289332361045315263457120764928)] orbit.val

/-- Exact candidate at original node897, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,584259706666959114354068280982946971648),(3,7266571906030772789718680407585939521536),(6,13927239870242329757583226187064279040000)] orbit.val

/-- Exact candidate at original node897, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,508697748795814762824065068673599012864),(3,7447511097793230195085959167005614407680),(6,13821862636351016703745950639953952112640)] orbit.val

/-- Exact candidate at original node897, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13683103362389815251705157453063651328),(9,3534871755206445883489304836858932363264),(11,63350835865385445044959756946960855040),(12,1907566536001652708558000782766317150208),(15,16258599252504187809312004341607891513344)] orbit.val

/-- Exact candidate at original node897, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,508698720847019414696060731062352871424),(3,7447550216781772771411214110826206068736),(6,13821822545311269475548700033744606593024)] orbit.val

/-- Exact candidate at original node897, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,580234900996839061447650776169398140928),(3,7435271586514349225802722384130756050944),(6,13762564995428873374405601715333011341312)] orbit.val

/-- Exact candidate at original node897, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(9,3195899273383998579160632878978304049152),(11,59172955273523459097705003461201987584),(12,1799254633223114644970204837002121900032),(15,16723744621059424978427432156191537596416)] orbit.val

/-- Exact candidate at original node897, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,536146892345868878367388574676120764416),(3,7474687471352465601048491823056358998016),(6,13767237119241727182240094477900685770752)] orbit.val

/-- Exact candidate at original node897, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,638191002385358111714732244031017844736),(3,7117269971965708339294735996648559738880),(6,14022610508588995210646506634953587949568)] orbit.val

/-- Exact candidate at original node897, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14837817475212144239083147291730640896),(9,3449117653016865540356925900283080343552),(11,58581963689857266818489709987817529344),(12,1763439624249147520090822765074507743232),(15,16492094424508979190150653352996029276160)] orbit.val

/-- Exact candidate at original node897, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,487507553713384644957964468842139746304),(3,7683295728292252666958078531171944235008),(6,13607268200934424349739931875619081551872)] orbit.val

/-- Exact candidate at original node897, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,12577762632875148606098573650558976),(3,1377033843514763046373558319272951808),(6,21776681871333914023460995218740242022400)] orbit.val

/-- Exact candidate at original node897, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,530491969154885438441971905462272),(9,21768351181574351697050721241114813136896),(11,16669208211094251129707399291143424),(12,1736674130861706874392475101930845696),(15,7966427534668008594293010045224944896)] orbit.val

/-- Exact candidate at original node897, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,1386798800392813810229120224420954112),(3,21768353992953999596178713701099524587520),(6,8330691185669251667032054309219991552)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked89700 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 897 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked89701 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 897 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked89702 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 897 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked89710 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 897 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked89711 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 897 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked89712 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 897 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked89720 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 897 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked89721 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 897 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked89722 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 897 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked89730 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 897 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked89731 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 897 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked89732 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 897 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked89740 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 897 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked89741 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 897 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked89742 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 897 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked89750 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 897 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked89751 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 897 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked89752 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 897 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 897 1 :=
  RootFineParent3CacheTable.single 897 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 897 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 897 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 897 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 897 0 0) checked89700 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 897 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 897 0 1) checked89701 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 897 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 897 0 2) checked89702 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 897 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 897 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 897 1 0) checked89710 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 897 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 897 1 1) checked89711 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 897 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 897 1 2) checked89712 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 897 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 897 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 897 2 0) checked89720 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 897 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 897 2 1) checked89721 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 897 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 897 2 2) checked89722 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 897 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 897 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 897 3 0) checked89730 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 897 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 897 3 1) checked89731 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 897 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 897 3 2) checked89732 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 897 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 897 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 897 4 0) checked89740 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 897 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 897 4 1) checked89741 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 897 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 897 4 2) checked89742 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 897 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 897 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 897 5 0) checked89750 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 897 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 897 5 1) checked89751 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 897 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 897 5 2) checked89752 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block897
