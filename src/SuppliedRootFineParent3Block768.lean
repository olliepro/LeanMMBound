import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block768
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node768, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14295394779700483433977497483015618560),(9,3542530510112587828438380029007332638720),(11,64024815200318331800106493729470958848),(12,1920741829900993748199747514443380516352),(15,16236478932946461269783763340969965800704)] orbit.val

/-- Exact candidate at original node768, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,508651883523502725541776353509611929600),(3,7445907260093732650591841722990531182592),(6,13823512339322826285522356799133022420992)] orbit.val

/-- Exact candidate at original node768, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,509510888023973748288787683315887898624),(3,7452669501277691717242907182139212562432),(6,13815891093638396196124280010178065072128)] orbit.val

/-- Exact candidate at original node768, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13957338118724191945649565739522195456),(9,3522292756596179295608551186339536568320),(11,63621881674442434538549434301463455744),(12,1911274074978049448398093071747803131904),(15,16266925431572666291165131617504840181760)] orbit.val

/-- Exact candidate at original node768, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,510576260746218089581952056512244350976),(3,7455698177722615086969874907465252864000),(6,13811797044471228485104147911655668318208)] orbit.val

/-- Exact candidate at original node768, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,511194294504177197326658013960494645248),(3,7447912771917009092523777652450457026560),(6,13818964416518875371805539209222213861376)] orbit.val

/-- Exact candidate at original node768, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14672668752247795812441053833170255872),(9,3484823466309034067507607474712474550272),(11,59567032790833691465562441527036897024),(12,1786658660635384238285801949329789497856),(15,16432349654452561868584561956230694332160)] orbit.val

/-- Exact candidate at original node768, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,660303167515900629504123250082198847488),(3,7247067440064709853352765492253738139648),(6,13870700875359451178799086133297228546048)] orbit.val

/-- Exact candidate at original node768, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,473255623689711431118752765864382038016),(3,7531898400125073390291215370204670328832),(6,13772917459125276840246006739564113166336)] orbit.val

/-- Exact candidate at original node768, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14345091991516318482226787016111030272),(9,3417835533898826876269982049558369140736),(11,71235060467388918632091466670687544320),(12,1466360937934113285282672730721076066304),(15,16808294858648216262989001841666921751552)] orbit.val

/-- Exact candidate at original node768, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,734747857529067505384136897881903726592),(3,7299710191433485241597274171865359712256),(6,13743613433977508914674563805885902094336)] orbit.val

/-- Exact candidate at original node768, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,737112102459359712206615535084350996480),(3,7304968788555869624085010495934925111296),(6,13735990591924832325364348844613889425408)] orbit.val

/-- Exact candidate at original node768, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14686395437447724994533865489478713344),(9,3328122273494988876022301854727625768960),(11,38087185808743467024826298743076004096),(12,1149844518240875926917624420857904676352),(15,17247331109958005666696688435815080370432)] orbit.val

/-- Exact candidate at original node768, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,385547510460357768823062883170642821120),(3,7339350524666855296241962808413926719488),(6,14053173447812848596590949184048595992576)] orbit.val

/-- Exact candidate at original node768, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,685706103457619988727227053782159327232),(3,7512512703887886454171196838821784190976),(6,13579852675594555218757550983029222014976)] orbit.val

/-- Exact candidate at original node768, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14345091976661038010802223717321539584),(9,3417835533071882930027348025925754159104),(11,71235060934495500829991920221730303488),(12,1466360925652065408010019560105933153280),(15,16808294871304956784777813145662426377728)] orbit.val

/-- Exact candidate at original node768, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,734747860978577984312187360325092245504),(3,7299710191920624087596732983601386225664),(6,13743613430040859589747054531706687062016)] orbit.val

/-- Exact candidate at original node768, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,737112105933951996684717979889194500096),(3,7304968789191238270034370563795174031360),(6,13735990587814871394936886331948797001728)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked76800 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 768 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked76801 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 768 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked76802 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 768 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked76810 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 768 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked76811 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 768 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked76812 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 768 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked76820 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 768 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked76821 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 768 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked76822 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 768 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked76830 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 768 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked76831 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 768 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked76832 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 768 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked76840 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 768 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked76841 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 768 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked76842 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 768 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked76850 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 768 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked76851 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 768 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked76852 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 768 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 768 1 :=
  RootFineParent3CacheTable.single 768 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 768 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 768 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 768 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 768 0 0) checked76800 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 768 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 768 0 1) checked76801 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 768 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 768 0 2) checked76802 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 768 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 768 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 768 1 0) checked76810 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 768 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 768 1 1) checked76811 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 768 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 768 1 2) checked76812 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 768 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 768 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 768 2 0) checked76820 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 768 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 768 2 1) checked76821 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 768 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 768 2 2) checked76822 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 768 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 768 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 768 3 0) checked76830 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 768 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 768 3 1) checked76831 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 768 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 768 3 2) checked76832 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 768 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 768 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 768 4 0) checked76840 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 768 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 768 4 1) checked76841 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 768 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 768 4 2) checked76842 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 768 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 768 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 768 5 0) checked76850 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 768 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 768 5 1) checked76851 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 768 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 768 5 2) checked76852 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block768
