import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block258
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node258, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,811666521095511316677121527133922918400),(3,12068741695563969324711774678569493463040),(6,8897663266280581020267078669929749151744)] orbit.val

/-- Exact candidate at original node258, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,4467098208817267424246099348662779904),(9,1119958373617654404943263053137674502144),(11,2586816721717741522261799552380457984),(12,882949603412631426248483554995058464768),(15,19768109590979240821517720368599389328384)] orbit.val

/-- Exact candidate at original node258, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,41221613453065916378656887281660461056),(3,13922597685664517222386325714271171772416),(6,7814252183822478522890992274080333299712)] orbit.val

/-- Exact candidate at original node258, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,742375772316979950604107309572524343296),(3,7279684767235021193414338957880695193600),(6,13756010943388060517637528608179945996288)] orbit.val

/-- Exact candidate at original node258, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,5993702889096869242593797213953982464),(9,2559163103577161669756379915455261835264),(11,70257042911322482225518601890172854272),(12,1235406611559905840190953271101881663488),(15,17907251022002574800240529289971895197696)] orbit.val

/-- Exact candidate at original node258, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,742235535870683673126252450423618142208),(3,7279902059115461744830300801128625864704),(6,13755933887953916243699421624080921526272)] orbit.val

/-- Exact candidate at original node258, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,258842398410169375653584378638607843328),(3,7698195764582734144982812584098251407360),(6,13821033319947158141019577912896306282496)] orbit.val

/-- Exact candidate at original node258, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,5869835604069765677733131862996418560),(9,2715618463792229012170218559752653242368),(11,38547463773078971809024222361639792128),(12,1637741326664139517805184310871371129856),(15,17380294393106544394193814650784504950272)] orbit.val

/-- Exact candidate at original node258, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,610424434211637615096782013326155579392),(3,7156699360039833051174969795646781915136),(6,14010947688688590995384223066660228038656)] orbit.val

/-- Exact candidate at original node258, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,328151582977489383014756264813657063424),(3,7532958395767878776733673674866832703488),(6,13916961504194693501907544935952675766272)] orbit.val

/-- Exact candidate at original node258, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,1308041082815680260811244214081814528),(9,1008544030326676998932124783371165368320),(11,23234782426860087246048016834683400192),(12,1356855674492770577938350290825415106560),(15,19388128954610938317278640540387819843584)] orbit.val

/-- Exact candidate at original node258, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,206365031038597146369444450637973553152),(3,8663288978033448012311110272413681582080),(6,12908417473868016502975420152581510397952)] orbit.val

/-- Exact candidate at original node258, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,739957634583684277853619219618533998592),(3,7278870944127294837700245306590762106880),(6,13759242904229082546102110349423869427712)] orbit.val

/-- Exact candidate at original node258, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,5997892335681339140803153029345837056),(9,2559482399563851721049416059146123345920),(11,69800320402998725617507798059273870336),(12,1242156023146911857782438281684368115712),(15,17900634847490618018065809583714054364160)] orbit.val

/-- Exact candidate at original node258, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,739820069665745986200091921844971503616),(3,7279083959628765754196315772537494568960),(6,13759167453645549921259567181250699460608)] orbit.val

/-- Exact candidate at original node258, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,3077881492215826280072514321028476829696),(3,291841718007386504912389940066958442496),(6,18408348272716848876671070614537730260992)] orbit.val

/-- Exact candidate at original node258, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,4497872284047866621037844167659618304),(9,275923852370580554034958458222739980288),(11,150965496116719200051018311750251041280),(12,3017016135892615214025844028832322706432),(15,18329668126276098826923116232660192186880)] orbit.val

/-- Exact candidate at original node258, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,153009501543762400454739325219481059328),(3,2967538514495988040849063207215319482368),(6,18657523466900311220352172343198364991488)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked25800 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 258 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked25801 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 258 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked25802 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 258 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked25810 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 258 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked25811 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 258 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked25812 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 258 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked25820 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 258 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked25821 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 258 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked25822 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 258 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked25830 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 258 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked25831 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 258 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked25832 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 258 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked25840 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 258 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked25841 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 258 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked25842 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 258 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked25850 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 258 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked25851 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 258 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked25852 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 258 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 258 1 :=
  RootFineParent3CacheTable.single 258 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 258 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 258 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 258 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 258 0 0) checked25800 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 258 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 258 0 1) checked25801 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 258 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 258 0 2) checked25802 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 258 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 258 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 258 1 0) checked25810 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 258 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 258 1 1) checked25811 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 258 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 258 1 2) checked25812 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 258 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 258 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 258 2 0) checked25820 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 258 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 258 2 1) checked25821 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 258 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 258 2 2) checked25822 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 258 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 258 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 258 3 0) checked25830 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 258 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 258 3 1) checked25831 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 258 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 258 3 2) checked25832 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 258 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 258 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 258 4 0) checked25840 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 258 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 258 4 1) checked25841 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 258 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 258 4 2) checked25842 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 258 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 258 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 258 5 0) checked25850 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 258 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 258 5 1) checked25851 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 258 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 258 5 2) checked25852 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block258
