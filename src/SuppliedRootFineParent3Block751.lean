import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block751
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node751, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,675090025419921954460300429059959029760),(3,7255860830772975236510411126604656803840),(6,13847120626747164470685263319968549699584)] orbit.val

/-- Exact candidate at original node751, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,675114155357120693611652641274783072256),(3,7256149051399490219283194905341007495168),(6,13846808276183450748761127329017374965760)] orbit.val

/-- Exact candidate at original node751, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,366430251628472561370140770304),(9,478646064832669796278106046849649475584),(11,57494749827268322796503483618913097728),(12,1215028894885261126063801576575034052608),(15,20026901773028432164889091207219428136960)] orbit.val

/-- Exact candidate at original node751, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,7214395255754310260428358997031941832704),(3,13993555357527221032944422250243971612672),(6,570120869658530368283193628357252087808)] orbit.val

/-- Exact candidate at original node751, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,270039261803935701221865684992),(3,21207950593263872524888459400863218139136),(6,570120889406149874963579773548081709056)] orbit.val

/-- Exact candidate at original node751, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(9,19747619506680386145190829621248),(11,4320449526486632631947229987840),(12,7214493446488170608537707787376178624512),(15,14563578012383822019951248311118927299584)] orbit.val

/-- Exact candidate at original node751, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,675257381030305838945706692411738030080),(3,7255985335951841321663237819150266007552),(6,13846828765957914501047030364071161495552)] orbit.val

/-- Exact candidate at original node751, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,675281513345781272722106393659770404864),(3,7256273558879492958309711547972097933312),(6,13846516410714787430624156934001297195008)] orbit.val

/-- Exact candidate at original node751, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,381285532099897124668930260992),(9,478650565234936854192415894026256908288),(11,57521509604613698453158200509898974720),(12,1215309850707665433259962275714020357120),(15,20026589557011560143650541380714059032064)] orbit.val

/-- Exact candidate at original node751, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,894154600997733152691656293076697088),(3,12412478923150187699007702804028247244800),(6,9364698405188876229495580415311841591296)] orbit.val

/-- Exact candidate at original node751, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,123714957299224093258544913265459200),(3,2839522857342939547391932410946912256),(6,21775108245125419498015324398308953161728)] orbit.val

/-- Exact candidate at original node751, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(9,12416276760290855720269760149414490406912),(11,271780143264837162976606480004960256),(12,100369155540950572841492838514494758912),(15,9261153786964990531381745281224175407104)] orbit.val

/-- Exact candidate at original node751, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,666142091790675836409576932281122029568),(3,7264597986878152119974252358770056232960),(6,13847331404271233705272145584581987270656)] orbit.val

/-- Exact candidate at original node751, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,666175784122382014674122417117717331968),(3,7268137724945145608156062500714836918272),(6,13843757973872534038825789957800611282944)] orbit.val

/-- Exact candidate at original node751, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,4700705917174445979846954503372800),(9,454574631848242168777331095165097476096),(11,57591064398441875151211747604644956160),(12,1217754820862154047524779057146693808128),(15,20048146265125306395756673128762225920000)] orbit.val

/-- Exact candidate at original node751, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,665805982043292206102191964113275453440),(3,7266450384957256768169171758449455792128),(6,13845815115939512687384611153070434287616)] orbit.val

/-- Exact candidate at original node751, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,665825656764182868328747619699560284160),(3,7264221041775217511965785430481568792576),(6,13848024784400661281361441825452036456448)] orbit.val

/-- Exact candidate at original node751, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,3845507227475162436820041910452224),(9,459258801174204954676088145382419202048),(11,57559984420645341940914065426229313536),(12,1217073892049886760451325677769117237248),(15,20044174959788097129425210167013489328128)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked75100 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 751 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked75101 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 751 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked75102 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 751 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked75110 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 751 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked75111 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 751 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked75112 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 751 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked75120 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 751 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked75121 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 751 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked75122 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 751 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked75130 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 751 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked75131 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 751 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked75132 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 751 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked75140 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 751 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked75141 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 751 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked75142 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 751 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked75150 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 751 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked75151 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 751 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked75152 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 751 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 751 1 :=
  RootFineParent3CacheTable.single 751 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 751 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 751 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 751 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 751 0 0) checked75100 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 751 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 751 0 1) checked75101 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 751 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 751 0 2) checked75102 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 751 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 751 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 751 1 0) checked75110 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 751 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 751 1 1) checked75111 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 751 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 751 1 2) checked75112 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 751 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 751 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 751 2 0) checked75120 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 751 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 751 2 1) checked75121 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 751 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 751 2 2) checked75122 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 751 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 751 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 751 3 0) checked75130 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 751 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 751 3 1) checked75131 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 751 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 751 3 2) checked75132 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 751 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 751 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 751 4 0) checked75140 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 751 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 751 4 1) checked75141 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 751 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 751 4 2) checked75142 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 751 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 751 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 751 5 0) checked75150 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 751 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 751 5 1) checked75151 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 751 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 751 5 2) checked75152 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block751
