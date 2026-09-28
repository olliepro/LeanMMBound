import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block362
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node362, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,655724246522611850282556505108462436352),(3,7239561717179361813782273220621493075968),(6,13882785519238087997591145149903210020864)] orbit.val

/-- Exact candidate at original node362, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,10956189588704871562328408838302072832),(9,3397746644984614403803300180090073120768),(11,57250042046237418633518960784817933056),(12,1749381621161879730831811523974977513984),(15,16562736985158625236825015801944994892544)] orbit.val

/-- Exact candidate at original node362, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,463974907768266025250070363992882151424),(3,7516145457533434964307484381273630179328),(6,13797951117638360672098420130366653202432)] orbit.val

/-- Exact candidate at original node362, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,733424813214882033053244529602593816576),(3,7297570770397057345299275765476289937408),(6,13747075899328122283303454580554281779200)] orbit.val

/-- Exact candidate at original node362, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,10960490400375275573347294578909118464),(9,3325746796112501222568386964084918059008),(11,70187434894361411318249948443505610240),(12,1421045573749329398741326183809537762304),(15,16950131187783494353454664484716294983168)] orbit.val

/-- Exact candidate at original node362, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,733156742528317771401004422153952559104),(3,7297991967185464183779145722168449433600),(6,13746922773226279706475824731310763540480)] orbit.val

/-- Exact candidate at original node362, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,501839842321841988575446077650627461120),(3,7447088156490420829664561922136415928320),(6,13829143484127798843415966875846122143744)] orbit.val

/-- Exact candidate at original node362, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,10668245438717034424482868686502232064),(9,3439721403441998070004393531620313792512),(11,60381206026015131030347460595002136064),(12,1864203645478411052017007120199879971840),(15,16403096982554920374179743894531467400704)] orbit.val

/-- Exact candidate at original node362, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,501884223697709615305944420854559408128),(3,7447085507969801653288333009555533332480),(6,13829101751272550393061697445223072792576)] orbit.val

/-- Exact candidate at original node362, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,501665435169548607739884444964576296960),(3,7443980429057237624473009504376569462784),(6,13832425618713275429443080926292019773440)] orbit.val

/-- Exact candidate at original node362, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,10665762205274630308774237537256341504),(9,3438640920467493267402865117823508676608),(11,60356515114463341420893032100032944128),(12,1863950225813731316772116625681585524736),(15,16404458059339099105751325862490782046208)] orbit.val

/-- Exact candidate at original node362, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,501398663753287689915701254492623208448),(3,7443246822850964561182296055222689071104),(6,13833425996335809410557977565917853253632)] orbit.val

/-- Exact candidate at original node362, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,733425282707979075810849914998816243712),(3,7297570858066109663791341464478705254400),(6,13747075342165972922053783496155644035072)] orbit.val

/-- Exact candidate at original node362, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,10960488875233147173758795903188074496),(9,3325746686114101091826637257648336011264),(11,70187502481734398412193619177292206592),(12,1421043917436301735615055491542732430336),(15,16950132888032691288628329711361616810496)] orbit.val

/-- Exact candidate at original node362, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,733157211222239307192369207523055501312),(3,7297992056277613789037283679747142844416),(6,13746922215440208565426321988362967187456)] orbit.val

/-- Exact candidate at original node362, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,464334997878197044537239739764922384384),(3,7523458109264504398038407440799386042368),(6,13790278375797360219080327695068857106432)] orbit.val

/-- Exact candidate at original node362, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,11286785130595028335182791464535982080),(9,3392676608356961760716089643865514967040),(11,57198640934406948861142985395175304704),(12,1749460730928806279465810941482840597504),(15,16567448717589291644277748513425098681856)] orbit.val

/-- Exact candidate at original node362, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,656794270583397704312519245041619697664),(3,7245787799887883375576699235073989279744),(6,13875489412468780581766756395517556555776)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked36200 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 362 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked36201 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 362 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked36202 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 362 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked36210 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 362 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked36211 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 362 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked36212 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 362 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked36220 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 362 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked36221 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 362 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked36222 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 362 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked36230 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 362 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked36231 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 362 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked36232 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 362 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked36240 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 362 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked36241 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 362 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked36242 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 362 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked36250 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 362 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked36251 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 362 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked36252 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 362 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 362 1 :=
  RootFineParent3CacheTable.single 362 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 362 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 362 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 362 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 362 0 0) checked36200 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 362 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 362 0 1) checked36201 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 362 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 362 0 2) checked36202 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 362 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 362 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 362 1 0) checked36210 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 362 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 362 1 1) checked36211 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 362 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 362 1 2) checked36212 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 362 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 362 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 362 2 0) checked36220 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 362 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 362 2 1) checked36221 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 362 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 362 2 2) checked36222 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 362 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 362 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 362 3 0) checked36230 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 362 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 362 3 1) checked36231 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 362 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 362 3 2) checked36232 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 362 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 362 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 362 4 0) checked36240 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 362 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 362 4 1) checked36241 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 362 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 362 4 2) checked36242 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 362 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 362 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 362 5 0) checked36250 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 362 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 362 5 1) checked36251 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 362 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 362 5 2) checked36252 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block362
