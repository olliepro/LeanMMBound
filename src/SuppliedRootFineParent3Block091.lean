import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block091
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node91, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,734480335713207763673200919280189702144),(3,7302043581704213359226834742651446624256),(6,13741547565522640538755939213701529206784)] orbit.val

/-- Exact candidate at original node91, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,744268476440949088932032954367018532864),(3,7307271655881295767416213579220161396736),(6,13726531350617816805307728342045985603584)] orbit.val

/-- Exact candidate at original node91, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14082694234622462780234683470411988992),(9,3407623177577167484755527193325234814976),(11,71669331558380034598129722571686027264),(12,1462020478074383154174459853653536391168),(15,16822675801495508525347623422612296310784)] orbit.val

/-- Exact candidate at original node91, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,648436864276760727373059118617621168128),(3,7257916327981879731880190842840138383360),(6,13871718290681421202402724914175405981696)] orbit.val

/-- Exact candidate at original node91, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,480593270004646754233858982333300867072),(3,7532256116975134796090701719694177468416),(6,13765222095960280111331414173605687197696)] orbit.val

/-- Exact candidate at original node91, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14588551875386710679594553448536735744),(9,3476235497847951935942731339905890254848),(11,61426187940316082822895897974093255680),(12,1836910270677233048737734674465065523200),(15,16388910974599173883473018409839579763712)] orbit.val

/-- Exact candidate at original node91, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,734482205222939721806091055363956670464),(3,7302043917485626184856073917365554774016),(6,13741545360231495754993809902903654088704)] orbit.val

/-- Exact candidate at original node91, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,744270379019985436228202885533350756352),(3,7307271959732309040024722811758898577408),(6,13726529144187767185403049178340916199424)] orbit.val

/-- Exact candidate at original node91, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14082686445503735596621993805122371584),(9,3407622726867957981734276708052087341056),(11,71669591169040116674610401040876363776),(12,1462013792359306247335312103215720448000),(15,16822682686098253580315153669519359008768)] orbit.val

/-- Exact candidate at original node91, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,472213799403165331942085427782001623040),(3,7525907274073234885469358289925175246848),(6,13779950409463661444244531157925988663296)] orbit.val

/-- Exact candidate at original node91, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,666912963937735302269739202970141065216),(3,7257537771022642897953160014892263014400),(6,13853620747979683461433075657770761453568)] orbit.val

/-- Exact candidate at original node91, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14472360204840468729476908436294729728),(9,3474813147318046865109670660503194566656),(11,59781498065367520523482313517563248128),(12,1789462492666484302089594385252675224576),(15,16439541984685322505203750607923437764096)] orbit.val

/-- Exact candidate at original node91, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,508587459370347333488421537738727096320),(3,7449526191409967270097264198836763492352),(6,13819957832159747058070289139057674944512)] orbit.val

/-- Exact candidate at original node91, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,512259350244978696832436329004761350144),(3,7459330922451444181201797014936711331840),(6,13806481210243638783621741531691692851200)] orbit.val

/-- Exact candidate at original node91, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13694694709960700609937232311208640512),(9,3524092436677187682576508243963468054528),(11,63362860274088250923287715208842618880),(12,1906655940265508621899701388422203748352),(15,16270265551013316405646540295727442470912)] orbit.val

/-- Exact candidate at original node91, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,509104814941791429540626871849010069504),(3,7449046167188058424915477849314158444544),(6,13819920500810211807199870154469997019136)] orbit.val

/-- Exact candidate at original node91, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,512448826108042016674510963542950150144),(3,7459249406918307326016467039556395335680),(6,13806373249913712318964996872533820047360)] orbit.val

/-- Exact candidate at original node91, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13680155094295773504325499898004766720),(9,3523969620680552501099426149546380492800),(11,63420334980659552160137603774036342016),(12,1907249235063989768816717484584935036416),(15,16269752137120564066075368137829808895232)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked09100 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 91 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked09101 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 91 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked09102 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 91 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked09110 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 91 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked09111 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 91 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked09112 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 91 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked09120 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 91 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked09121 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 91 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked09122 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 91 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked09130 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 91 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked09131 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 91 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked09132 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 91 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked09140 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 91 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked09141 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 91 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked09142 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 91 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked09150 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 91 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked09151 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 91 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked09152 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 91 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 91 1 :=
  RootFineParent3CacheTable.single 91 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 91 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 91 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 91 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 91 0 0) checked09100 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 91 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 91 0 1) checked09101 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 91 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 91 0 2) checked09102 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 91 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 91 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 91 1 0) checked09110 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 91 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 91 1 1) checked09111 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 91 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 91 1 2) checked09112 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 91 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 91 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 91 2 0) checked09120 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 91 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 91 2 1) checked09121 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 91 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 91 2 2) checked09122 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 91 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 91 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 91 3 0) checked09130 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 91 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 91 3 1) checked09131 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 91 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 91 3 2) checked09132 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 91 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 91 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 91 4 0) checked09140 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 91 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 91 4 1) checked09141 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 91 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 91 4 2) checked09142 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 91 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 91 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 91 5 0) checked09150 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 91 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 91 5 1) checked09151 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 91 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 91 5 2) checked09152 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block091
