import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block831
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node831, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14649906976526422753836454217502425088),(9,3535262036413056373643977602291168444416),(11,64087070762460455023482228433779451904),(12,1916068837916224194965185362454749589504),(15,16248003630871794215269493228235965622272)] orbit.val

/-- Exact candidate at original node831, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,510371606794921066233462999707753119744),(3,7450628104394135236344818504832013828096),(6,13817071771751005359077693371093398585344)] orbit.val

/-- Exact candidate at original node831, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,517909568150481456531156769655532552192),(3,7485460210388064633374933468456694054912),(6,13774701704401515571749884637520938926080)] orbit.val

/-- Exact candidate at original node831, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13997968444766614111680086804151664640),(9,3536766591519374483754417413305747374080),(11,64111925708923946001817466235786633216),(12,1916613468653276537151110693740598509568),(15,16246581528613720080636949215546881351680)] orbit.val

/-- Exact candidate at original node831, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,510307823439557118649047011737613631488),(3,7449679144319153980365064280326463815680),(6,13818084515181350562641863583569088086016)] orbit.val

/-- Exact candidate at original node831, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,517874488133309265221935298050816737280),(3,7485832736613220943765761713548765954048),(6,13774364258193531452668277864033582841856)] orbit.val

/-- Exact candidate at original node831, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(9,3442621318732058406415921858694606749696),(11,60699129393688455811259615536049909760),(12,1806560818474047611566450095960103919616),(15,16468190216340267187862343305442404954112)] orbit.val

/-- Exact candidate at original node831, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,655399216603840882688791562723371515904),(3,7238908341019723735732959922789864701952),(6,13883763925316497043234223390119929315328)] orbit.val

/-- Exact candidate at original node831, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,486326088056582661649078110903938842624),(3,7536264818383111798412987152647231373312),(6,13755480576500367201593909612081995317248)] orbit.val

/-- Exact candidate at original node831, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14396564072628798080166847120781869056),(9,3418461615463095647560081613673333784576),(11,72435320815655870340994739157127360000),(12,1469763872574861735678708100110674371584),(15,16803014110013819609996023575571248147968)] orbit.val

/-- Exact candidate at original node831, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,734724293287476696168421936222154260480),(3,7303721345158088199385770368906806951936),(6,13739625844494496766101782570504204320768)] orbit.val

/-- Exact candidate at original node831, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,754074338835594532803725950295281238016),(3,7330450695479278792386287128984103682048),(6,13693546448625188336465961796353780613120)] orbit.val

/-- Exact candidate at original node831, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,29165867325563559276623366717440),(9,3483651718482942622530411828796643606528),(11,60254219259999499686628182083894323200),(12,1797577147850879094854248727958353981440),(15,16436588368180373119021126860170906904576)] orbit.val

/-- Exact candidate at original node831, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,471420837469686758406996633750599630848),(3,7536369559283855980607047075216385638400),(6,13770281086186518922641931166666180263936)] orbit.val

/-- Exact candidate at original node831, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,675930232389182898867695914092893044736),(3,7276419248298019978816170558274934931456),(6,13825722002252858783972108403265337556992)] orbit.val

/-- Exact candidate at original node831, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14396531257314236703306520094796939264),(9,3418459756116770722176040883985521311744),(11,72436399581010366858702559370258077696),(12,1469736179631533574718175225732316942336),(15,16803042616353432761199749686450272262144)] orbit.val

/-- Exact candidate at original node831, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,734731977483446174432460382027338743808),(3,7303722774671736179934174209354563059712),(6,13739616730784879307289340284251263729664)] orbit.val

/-- Exact candidate at original node831, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,754082271818030968986479620267339415552),(3,7330451917573464167776243011294121164800),(6,13693537293548566524893252244071704952832)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked83100 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 831 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked83101 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 831 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked83102 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 831 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked83110 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 831 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked83111 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 831 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked83112 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 831 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked83120 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 831 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked83121 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 831 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked83122 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 831 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked83130 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 831 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked83131 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 831 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked83132 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 831 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked83140 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 831 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked83141 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 831 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked83142 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 831 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked83150 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 831 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked83151 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 831 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked83152 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 831 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 831 1 :=
  RootFineParent3CacheTable.single 831 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 831 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 831 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 831 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 831 0 0) checked83100 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 831 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 831 0 1) checked83101 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 831 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 831 0 2) checked83102 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 831 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 831 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 831 1 0) checked83110 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 831 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 831 1 1) checked83111 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 831 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 831 1 2) checked83112 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 831 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 831 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 831 2 0) checked83120 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 831 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 831 2 1) checked83121 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 831 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 831 2 2) checked83122 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 831 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 831 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 831 3 0) checked83130 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 831 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 831 3 1) checked83131 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 831 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 831 3 2) checked83132 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 831 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 831 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 831 4 0) checked83140 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 831 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 831 4 1) checked83141 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 831 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 831 4 2) checked83142 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 831 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 831 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 831 5 0) checked83150 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 831 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 831 5 1) checked83151 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 831 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 831 5 2) checked83152 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block831
