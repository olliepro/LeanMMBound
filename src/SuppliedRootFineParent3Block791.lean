import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block791
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node791, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,690850346505528883316360261093470240768),(3,7259290687250431525003949513954188853248),(6,13827930449184101253335665100585506439168)] orbit.val

/-- Exact candidate at original node791, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,995303791585445741018895876096),(9,576939167883930859640245544133553291264),(11,60324093418559090178410992537198341632),(12,1238991841343712845472154930852732183552),(15,19901816379298555074779717667090785840640)] orbit.val

/-- Exact candidate at original node791, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,693073320189691139872800671252573323264),(3,7256086546792440933577870458738610012160),(6,13828911615957929588205303745641982197760)] orbit.val

/-- Exact candidate at original node791, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,690887879577991488700171917787031142400),(3,7259342417146814513293079507806678155264),(6,13827841186215255659662723450039456235520)] orbit.val

/-- Exact candidate at original node791, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,1901475900342344102245054808064),(9,576940353830488495034548897494559883264),(11,60330071136296423696036370653003800576),(12,1239053538362717726314698507623355596800),(15,19901747517709083116268346997617191444480)] orbit.val

/-- Exact candidate at original node791, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,693108782166659053597849357099475140608),(3,7256088890360416199066725818138718371840),(6,13828873810412986408991399700394972020736)] orbit.val

/-- Exact candidate at original node791, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,690881208259060242279848509588629356544),(3,7259337418543644700833514032749722206208),(6,13827852856137356718542612333294813970432)] orbit.val

/-- Exact candidate at original node791, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,817040425928350981433421987840),(9,576940126445662079095900004023422418944),(11,60328977488056154490504952783073612800),(12,1239041532252740840596596237616278067200),(15,19901760845936562161544622699776969446400)] orbit.val

/-- Exact candidate at original node791, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,693102091570710858176471657601499660288),(3,7256083857089788183708483775377098932224),(6,13828885534279562619771019442654566940672)] orbit.val

/-- Exact candidate at original node791, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,690863045273107662043161874346299883520),(3,7259324452952905271954771881960245559296),(6,13827883984714048727658041119326620090368)] orbit.val

/-- Exact candidate at original node791, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,817040425928350981433421987840),(9,576939538661827906083062439720047869952),(11,60325995013782479641749133789811671040),(12,1239011086785976264610756879889633705984),(15,19901794861661434585392055440800250298368)] orbit.val

/-- Exact candidate at original node791, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,693083836903379897205738319477636857856),(3,7256069931951456335361708009730443575296),(6,13828917714085225429088528546425085100032)] orbit.val

/-- Exact candidate at original node791, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,690838066745539337771296467518543101952),(3,7259305385128217408253719478984427700224),(6,13827928031066304915630958929130194731008)] orbit.val

/-- Exact candidate at original node791, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,1089387234571134641911229317120),(9,576938729217402058787174373079086268416),(11,60321902705188136425404359839826813952),(12,1238969165416149107892552482639584999424),(15,19901841684511935123979709018163438134272)] orbit.val

/-- Exact candidate at original node791, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,693058839563397479089867667019420139520),(3,7256051981526787508608248966664694005760),(6,13828960661849876673957858241949051387904)] orbit.val

/-- Exact candidate at original node791, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,690879119463104848848381423235058630656),(3,7259336212453246812768266010893047824384),(6,13827856151023710000039327441505059078144)] orbit.val

/-- Exact candidate at original node791, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,1029966112685436388716071354368),(9,576940059096772181814071528411468136448),(11,60328632356495250985143470673093550592),(12,1239038057479387688434655190964827405312),(15,19901764732977440427736668296867705086464)] orbit.val

/-- Exact candidate at original node791, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,693099966856900965830045263018927849472),(3,7256081965331899415424315865249108459520),(6,13828889550751261280401613747365129224192)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked79100 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 791 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked79101 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 791 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked79102 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 791 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked79110 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 791 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked79111 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 791 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked79112 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 791 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked79120 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 791 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked79121 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 791 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked79122 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 791 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked79130 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 791 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked79131 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 791 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked79132 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 791 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked79140 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 791 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked79141 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 791 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked79142 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 791 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked79150 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 791 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked79151 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 791 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked79152 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 791 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 791 1 :=
  RootFineParent3CacheTable.single 791 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 791 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 791 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 791 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 791 0 0) checked79100 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 791 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 791 0 1) checked79101 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 791 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 791 0 2) checked79102 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 791 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 791 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 791 1 0) checked79110 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 791 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 791 1 1) checked79111 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 791 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 791 1 2) checked79112 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 791 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 791 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 791 2 0) checked79120 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 791 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 791 2 1) checked79121 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 791 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 791 2 2) checked79122 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 791 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 791 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 791 3 0) checked79130 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 791 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 791 3 1) checked79131 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 791 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 791 3 2) checked79132 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 791 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 791 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 791 4 0) checked79140 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 791 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 791 4 1) checked79141 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 791 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 791 4 2) checked79142 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 791 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 791 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 791 5 0) checked79150 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 791 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 791 5 1) checked79151 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 791 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 791 5 2) checked79152 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block791
