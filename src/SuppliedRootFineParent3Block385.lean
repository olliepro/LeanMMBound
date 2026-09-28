import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block385
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node385, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,734702969808787487118263238527897567232),(3,7393439309626263360253437445294748860416),(6,13649929203505010814284274191810519105536)] orbit.val

/-- Exact candidate at original node385, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,952677510058882970663549455497691136),(9,2798843102767928881953017923398891732992),(11,68125038632496049867373881337345387520),(12,1265066105691081987650431829347786205184),(15,17645084558338495859214487692093644516352)] orbit.val

/-- Exact candidate at original node385, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,671196037896065168812900039713598996480),(3,7238432594207933502388069486523026767872),(6,13868442850836062990455005349396539768832)] orbit.val

/-- Exact candidate at original node385, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,728115349710785983391967165492389478400),(3,7289790691670740092073343512334452129792),(6,13760165441558535586190664197806323924992)] orbit.val

/-- Exact candidate at original node385, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,921028325110992624272436246393913344),(9,2851859553460765521532531990630110330880),(11,67766964078321411180885676588768345600),(12,1262957166949579444970915299385827558400),(15,17594566770126284291347369472782065384960)] orbit.val

/-- Exact candidate at original node385, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,728134394177870129389890744457659154432),(3,7289743622934924050550983695377245405184),(6,13760193465827267481715100435798260973568)] orbit.val

/-- Exact candidate at original node385, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,478311185103643677259469996471303012352),(3,7440048132285038249328265771334229819392),(6,13859712165551379735068239107827632701440)] orbit.val

/-- Exact candidate at original node385, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,911541128983681412601212927674941440),(9,2955870836380011315033767042518087630848),(11,50336035119802799213147325519903953920),(12,1712347938479300234823553630006185089024),(15,17058605131831963631172905664661313917952)] orbit.val

/-- Exact candidate at original node385, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,478316316311166329424060615751379189760),(3,7440194465081447348182615752936716763136),(6,13859560701547447984049298506945069580288)] orbit.val

/-- Exact candidate at original node385, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,478494965677105767609124705582203273216),(3,7444360399212584997063425451886725038080),(6,13855216118050370896983424718164237221888)] orbit.val

/-- Exact candidate at original node385, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,903041229651781548831390457296584704),(9,2955993423228993464629818732007684833280),(11,50262891833838224263837865064686450688),(12,1710371010865983923848420154422949515264),(15,17060541115781594267365066733680548149248)] orbit.val

/-- Exact candidate at original node385, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,478127365843506156524544492031956746240),(3,7435869013195316121335387416371014926336),(6,13864075103901239383796042967230193860608)] orbit.val

/-- Exact candidate at original node385, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,728115689434722497287967398212564680704),(3,7289790870693197640323093673343291752448),(6,13760164922812141524044913804077309100032)] orbit.val

/-- Exact candidate at original node385, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,921066359580759628296002247086571520),(9,2851859596828280977777973780896230146048),(11,67767026925557374541056932514335961600),(12,1262957707199409834742452800097695800320),(15,17594566085627232714966195359877817053696)] orbit.val

/-- Exact candidate at original node385, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,728134737842348436719730604541000810496),(3,7289743797571181391224157330059233853440),(6,13760192947526531833712086941032930869248)] orbit.val

/-- Exact candidate at original node385, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,670499679478708714053719317374201495552),(3,7238190527147521354974077490554380222464),(6,13869381276313831592628178067704583815168)] orbit.val

/-- Exact candidate at original node385, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,880825846001427957089483617885749248),(9,2800811958511621250175386983738940325888),(11,68014504815862301934155941417628539904),(12,1266767407093196858977617153227047159808),(15,17641596786673379822611725313631663758336)] orbit.val

/-- Exact candidate at original node385, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,734111850587969934949385198494313086976),(3,7393275240000620908995453972953027313664),(6,13650684392351470817711135704185825132544)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked38500 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 385 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked38501 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 385 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked38502 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 385 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked38510 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 385 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked38511 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 385 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked38512 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 385 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked38520 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 385 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked38521 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 385 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked38522 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 385 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked38530 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 385 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked38531 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 385 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked38532 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 385 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked38540 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 385 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked38541 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 385 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked38542 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 385 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked38550 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 385 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked38551 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 385 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked38552 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 385 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 385 1 :=
  RootFineParent3CacheTable.single 385 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 385 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 385 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 385 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 385 0 0) checked38500 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 385 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 385 0 1) checked38501 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 385 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 385 0 2) checked38502 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 385 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 385 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 385 1 0) checked38510 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 385 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 385 1 1) checked38511 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 385 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 385 1 2) checked38512 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 385 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 385 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 385 2 0) checked38520 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 385 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 385 2 1) checked38521 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 385 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 385 2 2) checked38522 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 385 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 385 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 385 3 0) checked38530 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 385 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 385 3 1) checked38531 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 385 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 385 3 2) checked38532 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 385 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 385 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 385 4 0) checked38540 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 385 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 385 4 1) checked38541 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 385 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 385 4 2) checked38542 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 385 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 385 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 385 5 0) checked38550 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 385 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 385 5 1) checked38551 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 385 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 385 5 2) checked38552 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block385
