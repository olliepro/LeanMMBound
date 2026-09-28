import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block011
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node11, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(1,21778071482940061661655974875633165533184)] orbit.val

/-- Exact candidate at original node11, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,694003697106510610691307480289210531840),(3,7189165106706455795983237546860492095488),(6,13894902679127095254981429848483462905856)] orbit.val

/-- Exact candidate at original node11, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(10,1249304328846020065822698184376320),(13,694003737405982756615497854813028220928),(16,21084066496229750059020411198121952935936)] orbit.val

/-- Exact candidate at original node11, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(1,21778071482940061661655974875633165533184)] orbit.val

/-- Exact candidate at original node11, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,694002969644684982243890414418109923328),(3,7189185284107774498097117380218206552064),(6,13894883229187602181314967080996849057792)] orbit.val

/-- Exact candidate at original node11, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(10,1403670499984749844581519378612224),(13,694002939307731762723030182023231700992),(16,21084067139961829914183100112090555219968)] orbit.val

/-- Exact candidate at original node11, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(1,21778071482940061661655974875633165533184)] orbit.val

/-- Exact candidate at original node11, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,694003717980265504519089739400216576000),(3,7189165098241811855952107163338307272704),(6,13894902666717984301184777972894641684480)] orbit.val

/-- Exact candidate at original node11, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(10,1234959079670781079197167132868608),(13,694003711734796455462330873292601163776),(16,21084066536246185535412564805173431500800)] orbit.val

/-- Exact candidate at original node11, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(1,21778071482940061661655974875633165533184)] orbit.val

/-- Exact candidate at original node11, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,694003722899890930991036143753171566592),(3,7189165101675805814577906854004642545664),(6,13894902658364364916087031877875351420928)] orbit.val

/-- Exact candidate at original node11, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(10,1391934828412324439575475680968704),(13,694003687919021440180367594589452763136),(16,21084066403086211809151167705568031801344)] orbit.val

/-- Exact candidate at original node11, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(1,21778071482940061661655974875633165533184)] orbit.val

/-- Exact candidate at original node11, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,694003753765101012311507431433019850752),(3,7189165041951737537436650597876410351616),(6,13894902687223223111907816846323735330816)] orbit.val

/-- Exact candidate at original node11, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(13,694003773024407744847742810505909108736),(16,21084067709915653916808232065127256424448)] orbit.val

/-- Exact candidate at original node11, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(1,21778071482940061661655974875633165533184)] orbit.val

/-- Exact candidate at original node11, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,694003759978572342982438697308426076160),(3,7189165039189643036293359538419762462720),(6,13894902683771846282380176639904976994304)] orbit.val

/-- Exact candidate at original node11, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(13,694003768515095764633840650647043571712),(16,21084067714424965897022134224986121961472)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked01100 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 11 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked01101 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 11 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked01102 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 11 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked01110 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 11 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked01111 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 11 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked01112 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 11 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked01120 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 11 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked01121 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 11 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked01122 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 11 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked01130 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 11 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked01131 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 11 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked01132 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 11 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked01140 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 11 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked01141 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 11 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked01142 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 11 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked01150 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 11 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked01151 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 11 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked01152 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 11 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 11 1 :=
  RootFineParent3CacheTable.single 11 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 11 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 11 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 11 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 11 0 0) checked01100 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 11 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 11 0 1) checked01101 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 11 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 11 0 2) checked01102 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 11 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 11 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 11 1 0) checked01110 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 11 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 11 1 1) checked01111 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 11 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 11 1 2) checked01112 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 11 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 11 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 11 2 0) checked01120 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 11 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 11 2 1) checked01121 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 11 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 11 2 2) checked01122 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 11 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 11 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 11 3 0) checked01130 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 11 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 11 3 1) checked01131 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 11 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 11 3 2) checked01132 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 11 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 11 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 11 4 0) checked01140 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 11 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 11 4 1) checked01141 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 11 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 11 4 2) checked01142 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 11 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 11 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 11 5 0) checked01150 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 11 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 11 5 1) checked01151 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 11 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 11 5 2) checked01152 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block011
