import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block108
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node108, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(1,21778071482940061661655974875633165533184)] orbit.val

/-- Exact candidate at original node108, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(4,544048147446074712882414580233597353984),(7,1847393008039550580592758626006054469632),(8,19386630327454436368180801669393513709568)] orbit.val

/-- Exact candidate at original node108, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14592610659875914084486654211164995584),(9,3430771631129091722258461482452896448512),(11,5748028541342795930857814952364720128),(12,1779294503567701225153609063454780456960),(15,16547664709042050004228559860561958912000)] orbit.val

/-- Exact candidate at original node108, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(1,21778071482940061661655974875633165533184)] orbit.val

/-- Exact candidate at original node108, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(4,529602216404418479836323617869291061248),(7,1415483829138846057681569296380831203328),(8,19832985437396797124138081961383043268608)] orbit.val

/-- Exact candidate at original node108, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,15119259345143634917034779793543921664),(9,3554573593110606454401197403976601960448),(11,59683382605141313668420388581583193600),(12,2063866965299171829163373019158608671744),(15,16084828282579998429505949284122827785728)] orbit.val

/-- Exact candidate at original node108, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(1,21778071482940061661655974875633165533184)] orbit.val

/-- Exact candidate at original node108, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(4,544048147282666627696744383946912956416),(7,1847392837880132198746839590275546873856),(8,19386630497777262835212390901410705702912)] orbit.val

/-- Exact candidate at original node108, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14592610664827674241628175310761492480),(9,3430771631287548047286990157639984349184),(11,5748079103801840853043473996872990720),(12,1779294774108316934467076544983506780160),(15,16547664387775567164807236523702039920640)] orbit.val

/-- Exact candidate at original node108, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(1,21778071482940061661655974875633165533184)] orbit.val

/-- Exact candidate at original node108, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(4,543987589508995658393088419106280964096),(7,1864206595614513645772846560656245129216),(8,19369877297816552357490039895870639439872)] orbit.val

/-- Exact candidate at original node108, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14596218106282074511155090051890675712),(9,3432136511530613008597640244912617160704),(11,145518443724609546672181049749929984),(12,1747865958144333219819937476456805826560),(15,16583327276715108749180569883162101940224)] orbit.val

/-- Exact candidate at original node108, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(1,21778071482940061661655974875633165533184)] orbit.val

/-- Exact candidate at original node108, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(4,529594960015856042137039931569195712512),(7,1415714516202738980152415086831627927552),(8,19832762006721466639366519857232341893120)] orbit.val

/-- Exact candidate at original node108, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,15119065736273250840701306670111784960),(9,3554600398597659112525903877183161499648),(11,59692808125206502826541545945929881600),(12,2064073823101603812013254784149665337344),(15,16084585387379318983449573361684297029632)] orbit.val

/-- Exact candidate at original node108, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(1,21778071482940061661655974875633165533184)] orbit.val

/-- Exact candidate at original node108, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(4,529717036590905758456483828739384279040),(7,1415634834254281375703781323072228818944),(8,19832719612094874527495709723821552435200)] orbit.val

/-- Exact candidate at original node108, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13254831548703793033060291553938898944),(9,3554880029915910266292363695421042720768),(11,59689747097661148931197515321015214080),(12,2064070854169017341956033071165374840832),(15,16086176020208769111443320302171793858560)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked10800 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 108 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked10801 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 108 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked10802 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 108 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked10810 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 108 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked10811 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 108 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked10812 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 108 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked10820 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 108 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked10821 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 108 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked10822 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 108 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked10830 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 108 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked10831 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 108 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked10832 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 108 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked10840 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 108 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked10841 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 108 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked10842 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 108 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked10850 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 108 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked10851 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 108 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked10852 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 108 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 108 1 :=
  RootFineParent3CacheTable.single 108 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 108 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 108 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 108 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 108 0 0) checked10800 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 108 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 108 0 1) checked10801 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 108 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 108 0 2) checked10802 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 108 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 108 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 108 1 0) checked10810 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 108 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 108 1 1) checked10811 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 108 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 108 1 2) checked10812 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 108 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 108 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 108 2 0) checked10820 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 108 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 108 2 1) checked10821 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 108 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 108 2 2) checked10822 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 108 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 108 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 108 3 0) checked10830 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 108 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 108 3 1) checked10831 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 108 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 108 3 2) checked10832 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 108 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 108 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 108 4 0) checked10840 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 108 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 108 4 1) checked10841 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 108 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 108 4 2) checked10842 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 108 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 108 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 108 5 0) checked10850 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 108 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 108 5 1) checked10851 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 108 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 108 5 2) checked10852 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block108
