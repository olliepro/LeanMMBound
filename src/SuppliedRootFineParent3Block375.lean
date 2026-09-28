import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block375
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node375, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,654853142991698339768037982850173108224),(3,7245003183583993721901871133821048455168),(6,13878215156364369599986065758961943969792)] orbit.val

/-- Exact candidate at original node375, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,8199131816607003834729191361598193664),(9,3328419456668788468753064148620913147904),(11,55966679665898570596869197038130225664),(12,1728640318828269476780677608860647308288),(15,16656845895960498141690634729751876657664)] orbit.val

/-- Exact candidate at original node375, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,459696019115028883411674670740646395904),(3,7522056974053449418386493706100654735360),(6,13796318489771583359857806498791864401920)] orbit.val

/-- Exact candidate at original node375, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,732178039472153598052483485599109480448),(3,7296837500275303882910640335523919429632),(6,13749055943192604180692851054510136623104)] orbit.val

/-- Exact candidate at original node375, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,9030910849633956810941254147466330112),(9,3262596119069055325279745158259012534272),(11,69668698086846242321763317391379759104),(12,1398083372564988723985938355156006797312),(15,17038692382369537413257586790679300112384)] orbit.val

/-- Exact candidate at original node375, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,731983741169998559472119545476314824704),(3,7297144220141229601072626884172903874560),(6,13748943521628833501111228445983946833920)] orbit.val

/-- Exact candidate at original node375, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,498043282549057896373349917733171494912),(3,7446838364683114628848583312907597512704),(6,13833189835707889136434041644992396525568)] orbit.val

/-- Exact candidate at original node375, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,8732540852815180871826372264592408576),(9,3374647417014109834404438049427160039424),(11,58757176447060827216391219671859995648),(12,1840939093389743520529785567232278378496),(15,16494995255236332298633533667037274711040)] orbit.val

/-- Exact candidate at original node375, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,498027400938034138485374173764466507776),(3,7446951656230562440168495677252011294720),(6,13833092425771465083002105024616687730688)] orbit.val

/-- Exact candidate at original node375, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,498437694230478676564701423602283577344),(3,7445922324930808254398634167842291843072),(6,13833711463778774730692639284188590112768)] orbit.val

/-- Exact candidate at original node375, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,8769706674911898815478039540572094464),(9,3376324710500268586736598206343425294336),(11,58832294353081449332368693024524566016),(12,1841640741264460634389480651135666160640),(15,16492504030147339092382049285588977417728)] orbit.val

/-- Exact candidate at original node375, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,498425461663862698408774301085029367808),(3,7445957784104775076802034551297570504704),(6,13833688237171423886445166023250565660672)] orbit.val

/-- Exact candidate at original node375, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,732177482564953211439248360244078706688),(3,7296837386946911719947570067194305839104),(6,13749056613428196730269156448194780987392)] orbit.val

/-- Exact candidate at original node375, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,9030912305451443010548457428836417536),(9,3262596244264407378288823119357243555840),(11,69668615021465656627783304483019563008),(12,1398085295350528159182878892581515935744),(15,17038690415998209024545941101782550061056)] orbit.val

/-- Exact candidate at original node375, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,731983185014474234578281615523206660096),(3,7297144105570937120833148831581314482176),(6,13748944192354650306244544428528644390912)] orbit.val

/-- Exact candidate at original node375, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,460006469429409123226056884857591562240),(3,7520714647628504169398735363168962347008),(6,13797350365882148369031182627606611623936)] orbit.val

/-- Exact candidate at original node375, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(9,3329869644330505576418195670064735191040),(11,56006801173647289553777935362162552832),(12,1730127953383881803618167174928936476672),(15,16662067084052026992065834095277331312640)] orbit.val

/-- Exact candidate at original node375, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,655414137957207291967289841340779593728),(3,7245289935448889412384817095051552227328),(6,13877367409533964957303867939240833712128)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked37500 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 375 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked37501 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 375 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked37502 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 375 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked37510 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 375 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked37511 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 375 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked37512 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 375 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked37520 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 375 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked37521 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 375 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked37522 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 375 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked37530 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 375 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked37531 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 375 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked37532 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 375 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked37540 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 375 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked37541 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 375 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked37542 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 375 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked37550 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 375 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked37551 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 375 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked37552 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 375 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 375 1 :=
  RootFineParent3CacheTable.single 375 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 375 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 375 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 375 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 375 0 0) checked37500 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 375 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 375 0 1) checked37501 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 375 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 375 0 2) checked37502 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 375 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 375 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 375 1 0) checked37510 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 375 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 375 1 1) checked37511 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 375 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 375 1 2) checked37512 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 375 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 375 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 375 2 0) checked37520 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 375 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 375 2 1) checked37521 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 375 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 375 2 2) checked37522 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 375 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 375 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 375 3 0) checked37530 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 375 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 375 3 1) checked37531 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 375 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 375 3 2) checked37532 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 375 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 375 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 375 4 0) checked37540 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 375 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 375 4 1) checked37541 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 375 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 375 4 2) checked37542 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 375 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 375 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 375 5 0) checked37550 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 375 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 375 5 1) checked37551 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 375 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 375 5 2) checked37552 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block375
