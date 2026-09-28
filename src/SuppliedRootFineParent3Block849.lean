import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block849
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node849, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,747218952175037207001295853292284280832),(3,7298414412072738571019747699640835768320),(6,13732438118692285883634931322700045484032)] orbit.val

/-- Exact candidate at original node849, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,30408739317965452506537689052348416),(9,3418673326933696360452116952082454413312),(11,73334203312834939168469359353648218112),(12,1413557900029028735250270014138901397504),(15,16872475643925183661332612012369109155840)] orbit.val

/-- Exact candidate at original node849, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,752749226701208351969296362117477171200),(3,7293210464240398993162101385596657205248),(6,13732111791998454316524577127919031156736)] orbit.val

/-- Exact candidate at original node849, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,734668816475859844019056292035725099008),(3,7299367276484630989725343771957116534784),(6,13744035389979570827911574811640323899392)] orbit.val

/-- Exact candidate at original node849, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14350994157855700646895592367445770240),(9,3418454082934676286706732287274992533504),(11,71092712689065664058245950527575909376),(12,1466154697257755415127000817892815616000),(15,16808018995900708595117100227570335704064)] orbit.val

/-- Exact candidate at original node849, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,734980231533157311282632955470645559296),(3,7298885941044680707908289331990928293888),(6,13744205310362223642465052588171591680000)] orbit.val

/-- Exact candidate at original node849, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,39190216800489038419536897946446462976),(3,6310720477990780625452242593148659826688),(6,15428160788148791997784195384538059243520)] orbit.val

/-- Exact candidate at original node849, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,15157219647447005274897750729871589376),(9,1740348621124174811527177601609642278912),(11,26702045108088799847638079960134891520),(12,1253236512415317517486603036477756706816),(15,18742627084645033527519658406855760066560)] orbit.val

/-- Exact candidate at original node849, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,1685243821593484547138221898995859456),(3,5447956177926146265000968410917704302592),(6,16328430061192321912107868242816465371136)] orbit.val

/-- Exact candidate at original node849, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,457530264041665069155003346940311109632),(3,7282152606727589829358514333656186617856),(6,14038388612170806763142457195036667805696)] orbit.val

/-- Exact candidate at original node849, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14622385014344867665300559294210506752),(9,3918062770067017547879382003052758171648),(11,56367795786409806459948005106745729024),(12,1807370060368183415613225729757137354752),(15,15981648471704106024038118578422313771008)] orbit.val

/-- Exact candidate at original node849, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,465129937672199116507780219443446022144),(3,7790141635421642155124776581382291849216),(6,13522799909846220390023418074807427661824)] orbit.val

/-- Exact candidate at original node849, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,955965323598793857534083619560750055424),(3,11080858031740186895751530738777916964864),(6,9741248127601080908370360517294498512896)] orbit.val

/-- Exact candidate at original node849, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,10406710719149206761061692714650697728),(9,2451482058771588540385874418630855229440),(11,77446062042222418374536160651083348992),(12,1783198213332941178098267919556340418560),(15,17455538438074160318036234684080235838464)] orbit.val

/-- Exact candidate at original node849, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,972438126475190793222039810836833239040),(3,11067733343301274382217118198960534585344),(6,9737900013163596486216816865835797708800)] orbit.val

/-- Exact candidate at original node849, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,733903924470212444455092170217681321984),(3,7299624540550692121881881228153026772992),(6,13744543017919157095319001477262457438208)] orbit.val

/-- Exact candidate at original node849, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,15083195799713177147404445996562776064),(9,3418132839554413955896268741971007242240),(11,71093630363470532550172702514300736000),(12,1465761825461711993035267501633935989760),(15,16807999991760752003026861483517358789120)] orbit.val

/-- Exact candidate at original node849, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,734798795846562381353618145810680119296),(3,7298308312107478318641887327400291729408),(6,13744964374986020961660469402422193684480)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked84900 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 849 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked84901 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 849 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked84902 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 849 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked84910 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 849 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked84911 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 849 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked84912 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 849 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked84920 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 849 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked84921 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 849 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked84922 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 849 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked84930 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 849 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked84931 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 849 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked84932 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 849 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked84940 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 849 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked84941 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 849 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked84942 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 849 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked84950 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 849 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked84951 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 849 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked84952 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 849 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 849 1 :=
  RootFineParent3CacheTable.single 849 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 849 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 849 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 849 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 849 0 0) checked84900 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 849 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 849 0 1) checked84901 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 849 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 849 0 2) checked84902 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 849 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 849 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 849 1 0) checked84910 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 849 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 849 1 1) checked84911 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 849 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 849 1 2) checked84912 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 849 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 849 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 849 2 0) checked84920 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 849 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 849 2 1) checked84921 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 849 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 849 2 2) checked84922 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 849 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 849 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 849 3 0) checked84930 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 849 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 849 3 1) checked84931 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 849 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 849 3 2) checked84932 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 849 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 849 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 849 4 0) checked84940 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 849 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 849 4 1) checked84941 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 849 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 849 4 2) checked84942 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 849 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 849 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 849 5 0) checked84950 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 849 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 849 5 1) checked84951 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 849 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 849 5 2) checked84952 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block849
