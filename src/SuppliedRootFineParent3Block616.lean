import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block616
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node616, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,648492332660372418610694786888950087680),(3,7235113243217186881303312926701606928384),(6,13894465907062502361741967162042608517120)] orbit.val

/-- Exact candidate at original node616, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,151712027694501923449437471899648),(9,3090761696845654846189549901656488935424),(11,51110839398785284253815824112185911808),(12,1647728868519345492225463680345718369280),(15,16988469926464248344485222020081300417024)] orbit.val

/-- Exact candidate at original node616, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,441014325236376681590805702249763831808),(3,7513527754892655753661028346299479490560),(6,13823529402811029226404140827083922210816)] orbit.val

/-- Exact candidate at original node616, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,723079928460590202993174996596123762688),(3,7295899243442731188828871076555387830272),(6,13759092311036740269833928802481653940224)] orbit.val

/-- Exact candidate at original node616, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,43322949614831168100369751343104),(9,3029589498306366450398371523142646497280),(11,67183200386172007452907952583339866624),(12,1319328183252671593681290064601590926336),(15,17361970557671901995292237234935836899840)] orbit.val

/-- Exact candidate at original node616, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,723081099403677663095195147528122138624),(3,7295931004710407135227066549782821470208),(6,13759059378825976863333713178322221924352)] orbit.val

/-- Exact candidate at original node616, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,485584267763188560802277711194439548928),(3,7444288445528308328564097551388295299072),(6,13848198769648564772289599613050430685184)] orbit.val

/-- Exact candidate at original node616, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,128206022228551122789652901134336),(9,3137983858077021857450948185211078180864),(11,53366981601380763465833955953309273088),(12,1759183329475702421404231930075675846656),(15,16827537185579934390783838014740201098240)] orbit.val

/-- Exact candidate at original node616, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,485554177567542255051885450122462494720),(3,7444458476744316229471038639513926631424),(6,13848058828628203177133050785996776407040)] orbit.val

/-- Exact candidate at original node616, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,484411867887459110200660678821701222400),(3,7444235252048865894459534545745218633728),(6,13849424363003736656995779651066245677056)] orbit.val

/-- Exact candidate at original node616, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,146819688659246100603036132966400),(9,3135890002427249882526455827713740505088),(11,53194646391828433805712088661170316288),(12,1757371361264255813353327981654319314944),(15,16831615326037038872724378374567802430464)] orbit.val

/-- Exact candidate at original node616, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,484404573732735299008478046240529973248),(3,7444086966261953017500447945138431328256),(6,13849579942945373345147048884254204231680)] orbit.val

/-- Exact candidate at original node616, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,723081334851483503253563409427593166848),(3,7295923429288327404820538440394387488768),(6,13759066718800250753581873025811184877568)] orbit.val

/-- Exact candidate at original node616, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,38410803538946779169570026422272),(9,3029589426134462160060701496523704238080),(11,67183256862708083917289802239367069696),(12,1319326983265831152786908257704909438976),(15,17361971778266256725944296149595158364160)] orbit.val

/-- Exact candidate at original node616, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,723080387897979036668205325883237466112),(3,7295906999871711641379960296883590529024),(6,13759084095170370983607809252866337538048)] orbit.val

/-- Exact candidate at original node616, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,440928045868597811058226634478376189952),(3,7518601877081752569786247210305922793472),(6,13818541559989711280811501030848866549760)] orbit.val

/-- Exact candidate at original node616, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,209221770159543549500151186849792),(9,3093409394321242862052417660954121076736),(11,51087711829260101339132942206959590400),(12,1647569874831337187674898426489488852992),(15,16986004292736451351045976345831409163264)] orbit.val

/-- Exact candidate at original node616, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,648742458286885958037194063211455840256),(3,7240315843574430431709924852471521345536),(6,13889013181078745271908855959950188347392)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked61600 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 616 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked61601 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 616 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked61602 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 616 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked61610 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 616 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked61611 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 616 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked61612 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 616 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked61620 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 616 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked61621 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 616 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked61622 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 616 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked61630 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 616 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked61631 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 616 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked61632 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 616 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked61640 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 616 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked61641 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 616 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked61642 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 616 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked61650 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 616 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked61651 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 616 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked61652 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 616 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 616 1 :=
  RootFineParent3CacheTable.single 616 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 616 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 616 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 616 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 616 0 0) checked61600 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 616 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 616 0 1) checked61601 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 616 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 616 0 2) checked61602 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 616 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 616 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 616 1 0) checked61610 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 616 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 616 1 1) checked61611 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 616 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 616 1 2) checked61612 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 616 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 616 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 616 2 0) checked61620 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 616 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 616 2 1) checked61621 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 616 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 616 2 2) checked61622 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 616 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 616 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 616 3 0) checked61630 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 616 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 616 3 1) checked61631 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 616 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 616 3 2) checked61632 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 616 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 616 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 616 4 0) checked61640 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 616 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 616 4 1) checked61641 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 616 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 616 4 2) checked61642 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 616 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 616 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 616 5 0) checked61650 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 616 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 616 5 1) checked61651 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 616 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 616 5 2) checked61652 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block616
