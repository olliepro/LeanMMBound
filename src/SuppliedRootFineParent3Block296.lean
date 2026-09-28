import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block296
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node296, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,663684298323793605322282258522141884416),(3,7239553167928864357219143031886599684096),(6,13874834016687403699114549585224423964672)] orbit.val

/-- Exact candidate at original node296, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,8338453797624314101159273458789515264),(9,3488485678618031821485271447339823792128),(11,58768217719049908753373547138242167808),(12,1777097055473178750850741677325499529216),(15,16445382077332176866465428930370810528768)] orbit.val

/-- Exact candidate at original node296, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,464296730063517594312639711806647959552),(3,7555102346307825566385659719872235438080),(6,13758672406568718500957675443954282135552)] orbit.val

/-- Exact candidate at original node296, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,736865873892160263521964472622020296704),(3,7290458237490541742122756055790809776128),(6,13750747371557359656011254347220335460352)] orbit.val

/-- Exact candidate at original node296, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14374130593654083347269629653261746176),(9,3422448677682686263703696164020042072064),(11,69527072351997803277671241516055845376),(12,1465786530995744666191132021467515341824),(15,16805935071315978845136205818976290527744)] orbit.val

/-- Exact candidate at original node296, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,713766205301555810904452333227170856960),(3,7337001448841197094067512828537176326144),(6,13727303828797308756684009713868818350080)] orbit.val

/-- Exact candidate at original node296, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,508854494308300715567333301076510113792),(3,7442566002476694543410197785719466885120),(6,13826650986155066402678443788837188534272)] orbit.val

/-- Exact candidate at original node296, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13788023440325559100174212951351230464),(9,3538142895512736051811376438493491232768),(11,62627416939274587175879219908514580480),(12,1900106876917164141459899918137895350272),(15,16263406270130561322108645086141913139200)] orbit.val

/-- Exact candidate at original node296, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,500530223855194149579686982566912458752),(3,7476781566809577631464411660367507226624),(6,13800759692275289880611876232698745847808)] orbit.val

/-- Exact candidate at original node296, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,508836540224810856965644814607919874048),(3,7442482183246600359085811672670003003392),(6,13826752759468650445604518388355242655744)] orbit.val

/-- Exact candidate at original node296, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14944133513757308168048432237651165184),(9,3537307332547619177727542429148151545856),(11,62659670314123360266667279038014525440),(12,1900649354600007554635933638649500459008),(15,16262510991964554260857783096559847837696)] orbit.val

/-- Exact candidate at original node296, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,500583178700061263145541301558336028672),(3,7476474407038597697400328632122797457408),(6,13801013897201402701110104941952032047104)] orbit.val

/-- Exact candidate at original node296, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,736867936893025618645041188452125638656),(3,7290458400375191664313394903980410142720),(6,13750745145671844378697538783200629751808)] orbit.val

/-- Exact candidate at original node296, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14374120804024252678482415750987382784),(9,3422448109309751906685621310134935355392),(11,69527322115906490908677357567939616768),(12,1465778433103537477009233062342656442368),(15,16805943497606841534373960729836646735872)] orbit.val

/-- Exact candidate at original node296, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,713768176972942781486383463496614412288),(3,7337001720673688039908829334651774435328),(6,13727301585293430840260762077484776685568)] orbit.val

/-- Exact candidate at original node296, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,474439423875510763525482187979935973376),(3,7519406138379555939397859250967488233472),(6,13784225920684994958732633436685741326336)] orbit.val

/-- Exact candidate at original node296, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,21759398300789054943557777399146872832),(9,3487845292473393981811859143159380443136),(11,58444350020073669419211260002716007424),(12,1770822594132119042642875692173198788608),(15,16439199848013685912838471002898723421184)] orbit.val

/-- Exact candidate at original node296, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,644818972945562761919072881954833563648),(3,7280879483048061773311126564709643321344),(6,13852373026946437126425775428968688648192)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked29600 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 296 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked29601 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 296 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked29602 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 296 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked29610 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 296 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked29611 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 296 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked29612 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 296 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked29620 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 296 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked29621 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 296 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked29622 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 296 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked29630 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 296 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked29631 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 296 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked29632 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 296 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked29640 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 296 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked29641 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 296 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked29642 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 296 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked29650 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 296 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked29651 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 296 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked29652 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 296 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 296 1 :=
  RootFineParent3CacheTable.single 296 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 296 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 296 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 296 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 296 0 0) checked29600 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 296 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 296 0 1) checked29601 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 296 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 296 0 2) checked29602 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 296 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 296 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 296 1 0) checked29610 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 296 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 296 1 1) checked29611 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 296 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 296 1 2) checked29612 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 296 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 296 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 296 2 0) checked29620 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 296 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 296 2 1) checked29621 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 296 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 296 2 2) checked29622 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 296 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 296 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 296 3 0) checked29630 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 296 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 296 3 1) checked29631 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 296 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 296 3 2) checked29632 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 296 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 296 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 296 4 0) checked29640 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 296 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 296 4 1) checked29641 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 296 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 296 4 2) checked29642 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 296 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 296 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 296 5 0) checked29650 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 296 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 296 5 1) checked29651 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 296 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 296 5 2) checked29652 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block296
