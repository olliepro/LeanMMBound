import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block329
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node329, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,380246624599219623958451352852831928320),(3,7692182033151355831790833889179615625216),(6,13705642825189486205906689633600717979648)] orbit.val

/-- Exact candidate at original node329, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(4,573478637032506321332261227729019469824),(7,1417020754631920184728544854745246859264),(8,19787572091275635155595168793158899204096)] orbit.val

/-- Exact candidate at original node329, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(4,573940592308296230619853821970506317824),(7,863269701604842883437675484600070045696),(8,20340861189026922547598445569062589169664)] orbit.val

/-- Exact candidate at original node329, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,377955149881911651621871726449076994048),(3,7675097375613527651793440352953671090176),(6,13725018957444622358240662796230417448960)] orbit.val

/-- Exact candidate at original node329, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(4,571748478079540951035255753050628816896),(7,888196607449674378193211007661076643840),(8,20318126397410846332427508114921460072448)] orbit.val

/-- Exact candidate at original node329, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(4,575760905680633004306419944253493870592),(7,1402596298359439169646019134288465756160),(8,19799714278899989487703535797091205906432)] orbit.val

/-- Exact candidate at original node329, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,377527552521159454664103869016067538944),(3,7672120238853411590531465413284960665600),(6,13728423691565490616460405593332137328640)] orbit.val

/-- Exact candidate at original node329, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(4,572857688279601317128697224657666834432),(7,1394016288189553676279209747393506443264),(8,19811197506470906668248067903581992255488)] orbit.val

/-- Exact candidate at original node329, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(4,574946181762382566485679730000849272832),(7,895783707027615868939199627757124321280),(8,20307341594150063226231095517875191939072)] orbit.val

/-- Exact candidate at original node329, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,376889340700466302936636855031527636992),(3,7668156256727384362185108892740606754816),(6,13733025885512210996534229127861031141376)] orbit.val

/-- Exact candidate at original node329, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(4,573562484865382788494841823737187139584),(7,1387305807899063562769607613818064601088),(8,19817203190175615310391525438077913792512)] orbit.val

/-- Exact candidate at original node329, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(4,576873203917169607623815630626312159232),(7,925203989105320609666704104346789871616),(8,20275994289917571444365455140660063502336)] orbit.val

/-- Exact candidate at original node329, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,377955375702232236840672886520497045504),(3,7675099076027908194626346935919543582720),(6,13725017031209921230188955053193124904960)] orbit.val

/-- Exact candidate at original node329, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(4,571748350195383132698331834871499980800),(7,888193631891473442077697001159460388864),(8,20318129500853205086879946039602205163520)] orbit.val

/-- Exact candidate at original node329, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(4,575760922467099937016176471885618348032),(7,1402598226000830237441667986423988355072),(8,19799712334472131487198130417323558830080)] orbit.val

/-- Exact candidate at original node329, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,377955270662604615263724497897984622592),(3,7675098285185184665845014943344644587520),(6,13725017927092272380547235434390536323072)] orbit.val

/-- Exact candidate at original node329, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(4,571748409670974380125141762125024198656),(7,888195015638663281949545109025246412800),(8,20318128057630423999581288004482894921728)] orbit.val

/-- Exact candidate at original node329, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(4,575760914658174169203997697821942743040),(7,1402597329425856050586191273721113608192),(8,19799713238856031441865785904090109181952)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked32900 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 329 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked32901 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 329 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked32902 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 329 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked32910 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 329 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked32911 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 329 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked32912 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 329 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked32920 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 329 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked32921 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 329 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked32922 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 329 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked32930 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 329 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked32931 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 329 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked32932 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 329 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked32940 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 329 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked32941 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 329 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked32942 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 329 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked32950 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 329 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked32951 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 329 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked32952 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 329 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 329 1 :=
  RootFineParent3CacheTable.single 329 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 329 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 329 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 329 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 329 0 0) checked32900 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 329 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 329 0 1) checked32901 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 329 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 329 0 2) checked32902 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 329 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 329 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 329 1 0) checked32910 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 329 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 329 1 1) checked32911 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 329 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 329 1 2) checked32912 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 329 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 329 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 329 2 0) checked32920 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 329 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 329 2 1) checked32921 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 329 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 329 2 2) checked32922 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 329 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 329 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 329 3 0) checked32930 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 329 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 329 3 1) checked32931 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 329 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 329 3 2) checked32932 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 329 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 329 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 329 4 0) checked32940 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 329 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 329 4 1) checked32941 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 329 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 329 4 2) checked32942 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 329 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 329 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 329 5 0) checked32950 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 329 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 329 5 1) checked32951 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 329 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 329 5 2) checked32952 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block329
