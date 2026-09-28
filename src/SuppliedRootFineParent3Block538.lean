import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block538
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node538, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,16083038072601289221030444946327339008),(9,3533315692217789357647727415657010036736),(11,63664023767078369582441011968360151040),(12,1910822192868220726920019228630917124096),(15,16254186536014371918284756774430550882304)] orbit.val

/-- Exact candidate at original node538, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,509363881347124586637922790680846925824),(3,7452769348197941168660887456972045025280),(6,13815938253394995906357164627980273582080)] orbit.val

/-- Exact candidate at original node538, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,513020050319475789957915096215178969088),(3,7461441322765586518648160927534779727872),(6,13803610109854999353049898851883206836224)] orbit.val

/-- Exact candidate at original node538, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,21374411808292429774594445417585311744),(9,1815732878191484338351722244211216482304),(11,62667909606625385805203724383760242944),(12,2214571565356924765870621502846283894272),(15,17663724717976734741853832958774319601920)] orbit.val

/-- Exact candidate at original node538, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,377416082223163294863995562617087197184),(3,8839614333022525636053091857087890194432),(6,12561041067694372730738887455928188141568)] orbit.val

/-- Exact candidate at original node538, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,1050997090391100309982707882355448610816),(3,9844067211888605347982795483314584027136),(6,10883007180660356003690471509963132895232)] orbit.val

/-- Exact candidate at original node538, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,16692244483912936349959483163555135488),(9,3487046462249430482074241430380401917952),(11,63041176923343245085049990877686275584),(12,1877955549974052887617590917571250996224),(15,16333336049309322110529133053640271207936)] orbit.val

/-- Exact candidate at original node538, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,640603420984294685245341565187509977088),(3,7268005617954195729625311324436445528064),(6,13869462444001571246785321986009210028032)] orbit.val

/-- Exact candidate at original node538, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,484666109208780603477481266862740209664),(3,7532392018061979200750765804674133000192),(6,13761013355669301857427727804096292323328)] orbit.val

/-- Exact candidate at original node538, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14348151476143489628170341508490199040),(9,3417013876530956169048539701390367260672),(11,71783422107879314986311655095075366912),(12,1466395424094221933201641126944497938432),(15,16808530608730860754791312050694734768128)] orbit.val

/-- Exact candidate at original node538, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,734945146430755824279121868554495852544),(3,7305203298009167049723655145558003154944),(6,13737923038500138787653197861520666525696)] orbit.val

/-- Exact candidate at original node538, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,744641511657567351845206196867993436160),(3,7309321668819664951564657196071731068928),(6,13724108302462829358246111482693441028096)] orbit.val

/-- Exact candidate at original node538, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,1667863042154602119462256072997208064),(9,3509812265420554469692187628564228603904),(11,25438435029040958251028707574234189824),(12,826170666764230027093149685800974737408),(15,17414982252684081604500146597620730793984)] orbit.val

/-- Exact candidate at original node538, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,317502821546749344816243633794446262272),(3,8238849806638191963570001538234089209856),(6,13221718854755120353269729703604630061056)] orbit.val

/-- Exact candidate at original node538, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,637839830722683622249551731270875086848),(3,8199836084082467344669215445645856342016),(6,12940395568134910694737207698716434104320)] orbit.val

/-- Exact candidate at original node538, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14348152134727590527992647754824286208),(9,3417013913778096071067061412555216912384),(11,71783400841978005195442675257586272768),(12,1466395975656043615063120919148717566976),(15,16808530040529216379802357220916820494848)] orbit.val

/-- Exact candidate at original node538, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,734944992320570812119963661660051210240),(3,7305203270771039826888886121929941975040),(6,13737923219848451022647125092043172347904)] orbit.val

/-- Exact candidate at original node538, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,744641354839147433613424301109103558656),(3,7309321644359097277002493156702466080768),(6,13724108483741816951040057417821595893760)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked53800 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 538 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked53801 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 538 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked53802 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 538 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked53810 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 538 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked53811 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 538 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked53812 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 538 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked53820 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 538 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked53821 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 538 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked53822 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 538 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked53830 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 538 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked53831 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 538 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked53832 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 538 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked53840 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 538 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked53841 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 538 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked53842 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 538 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked53850 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 538 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked53851 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 538 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked53852 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 538 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 538 1 :=
  RootFineParent3CacheTable.single 538 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 538 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 538 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 538 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 538 0 0) checked53800 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 538 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 538 0 1) checked53801 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 538 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 538 0 2) checked53802 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 538 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 538 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 538 1 0) checked53810 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 538 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 538 1 1) checked53811 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 538 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 538 1 2) checked53812 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 538 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 538 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 538 2 0) checked53820 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 538 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 538 2 1) checked53821 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 538 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 538 2 2) checked53822 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 538 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 538 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 538 3 0) checked53830 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 538 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 538 3 1) checked53831 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 538 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 538 3 2) checked53832 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 538 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 538 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 538 4 0) checked53840 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 538 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 538 4 1) checked53841 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 538 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 538 4 2) checked53842 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 538 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 538 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 538 5 0) checked53850 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 538 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 538 5 1) checked53851 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 538 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 538 5 2) checked53852 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block538
