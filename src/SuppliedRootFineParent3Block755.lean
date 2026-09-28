import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block755
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node755, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13964045109497194793167251808286932992),(9,3533648144961892291762343891845773262848),(11,63599378812370992160684031323926636544),(12,1909588949211581650615931297726811713536),(15,16257270964844719532323848402928366987264)] orbit.val

/-- Exact candidate at original node755, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,509217208205481030970102710021314838528),(3,7449634823879669637491603106922313547776),(6,13819219450854910993194269058689537146880)] orbit.val

/-- Exact candidate at original node755, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,512904647069208089569938588280425545728),(3,7458431291841447398672262471608122212352),(6,13806735544029406173413773815744617775104)] orbit.val

/-- Exact candidate at original node755, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13975749367103183292363439665754144768),(9,3529528156563642052798064962428387459072),(11,66795827087108450181457690028280494080),(12,1943239658619652066495794920012949262336),(15,16224532091302555908888293863497794172928)] orbit.val

/-- Exact candidate at original node755, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,515361678707725410913621246628121804800),(3,7487369133836140627035883488280181735424),(6,13775340670396195623706470140724861992960)] orbit.val

/-- Exact candidate at original node755, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,546487657235487283423370822523432206336),(3,7419224823878676630122603231162270744576),(6,13812359001825897748110000821947462582272)] orbit.val

/-- Exact candidate at original node755, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,217113127878691663175959845338611712),(9,3491634083240284797008591668912878256128),(11,60214701826876299417417381360063031296),(12,1797446206681097526807161029684042248192),(15,16428559378063924346759628835830843385856)] orbit.val

/-- Exact candidate at original node755, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,658987745993448516734364972531499139072),(3,7249190735577130705048598237035838308352),(6,13869893001369482439873011666065828085760)] orbit.val

/-- Exact candidate at original node755, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,477556820724421954321834425372616163328),(3,7533925325488420684700401927333773049856),(6,13766589336727219022633738522926776320000)] orbit.val

/-- Exact candidate at original node755, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14348041165782468986504805797328846848),(9,3416992138754476492070790892832275038208),(11,71766666878482214500434085626814254080),(12,1466386177535516265243044800514182375424),(15,16808578458605804220855200290862565018624)] orbit.val

/-- Exact candidate at original node755, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,734627946150578920301871348088024596480),(3,7302196358160138823693096751276039864320),(6,13741247178629343917661006776269101072384)] orbit.val

/-- Exact candidate at original node755, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,744428373821467243440752609172259864576),(3,7306464847827825040737333412097429602304),(6,13727178261290769377477888854363476066304)] orbit.val

/-- Exact candidate at original node755, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,7898057450640726153856412549120),(9,3487780982765907226849090577351839842304),(11,60134569777595904791336603285311565824),(12,1795474297329232441683836618021834891264),(15,16434681625169268637690984923117766684672)] orbit.val

/-- Exact candidate at original node755, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,472950866666629203146454283339580833792),(3,7526285109147263697365482271940552949760),(6,13778835507126168761144038320353031749632)] orbit.val

/-- Exact candidate at original node755, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,667864623636102419231461000522198155264),(3,7255515804147569262015788178950171131904),(6,13854691055156389980408725696160796246016)] orbit.val

/-- Exact candidate at original node755, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14348042279928504343347053206540648448),(9,3416992202156813544110827052065821294592),(11,71766630751721718604403478389865225216),(12,1466387115112440875421074694311695796224),(15,16808577492639157019176322597659242568704)] orbit.val

/-- Exact candidate at original node755, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,734627684218993317992824731537091067904),(3,7302196311963496887713851424335357542400),(6,13741247486757571455949298719760716922880)] orbit.val

/-- Exact candidate at original node755, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,744428107225127602297324007083315560448),(3,7306464805998831534163978804718968242176),(6,13727178569716102525194672063830881730560)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked75500 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 755 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked75501 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 755 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked75502 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 755 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked75510 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 755 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked75511 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 755 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked75512 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 755 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked75520 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 755 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked75521 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 755 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked75522 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 755 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked75530 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 755 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked75531 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 755 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked75532 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 755 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked75540 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 755 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked75541 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 755 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked75542 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 755 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked75550 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 755 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked75551 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 755 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked75552 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 755 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 755 1 :=
  RootFineParent3CacheTable.single 755 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 755 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 755 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 755 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 755 0 0) checked75500 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 755 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 755 0 1) checked75501 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 755 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 755 0 2) checked75502 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 755 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 755 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 755 1 0) checked75510 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 755 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 755 1 1) checked75511 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 755 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 755 1 2) checked75512 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 755 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 755 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 755 2 0) checked75520 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 755 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 755 2 1) checked75521 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 755 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 755 2 2) checked75522 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 755 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 755 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 755 3 0) checked75530 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 755 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 755 3 1) checked75531 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 755 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 755 3 2) checked75532 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 755 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 755 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 755 4 0) checked75540 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 755 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 755 4 1) checked75541 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 755 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 755 4 2) checked75542 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 755 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 755 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 755 5 0) checked75550 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 755 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 755 5 1) checked75551 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 755 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 755 5 2) checked75552 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block755
