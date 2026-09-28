import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block629
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node629, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,218706008657689018573891778237169664),(3,4310518532332604361860508282669087326208),(6,17467334244598799610776892701185841037312)] orbit.val

/-- Exact candidate at original node629, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(9,3282209187189778433499914552442529775616),(11,1426524391244219560885969187637248),(12,8995631844696553911254065841053626368),(15,18486865237381195430025245371380394493952)] orbit.val

/-- Exact candidate at original node629, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,29843015997348673781683712656670720),(3,7582561287907261352371480421828013326336),(6,14195480352016802960610712770092495536128)] orbit.val

/-- Exact candidate at original node629, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,717387105223851953579612839280392536064),(3,7292416335424243201534315947875501080576),(6,13768268042291966506542046088477271916544)] orbit.val

/-- Exact candidate at original node629, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,5387515050969974956360988622848),(9,2729317113497786022498765645283915202560),(11,65637120248426586570385736036207363584),(12,1264919464725457137333450811013996082176),(15,17718197779080876864283397726938058262016)] orbit.val

/-- Exact candidate at original node629, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,717386314661750851156150006490482081792),(3,7292398376235640970416682538322651774976),(6,13768286792042669840083142330820031676416)] orbit.val

/-- Exact candidate at original node629, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,474880999832883777061850204978311856128),(3,7439136869290423357399803589066380804096),(6,13864053613816754527194321081588472872960)] orbit.val

/-- Exact candidate at original node629, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,202195222496559731059823757754368),(9,2826864157025104316713701943473208295424),(11,49075542397618035379221115803452748288),(12,1698029334657577559603512575315939073024),(15,17204102246664539253399808181216807662080)] orbit.val

/-- Exact candidate at original node629, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,474863380675876090242171491738500202496),(3,7439199632500927107167655949561602506752),(6,13864008469763258464246147434333062823936)] orbit.val

/-- Exact candidate at original node629, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,474926132937454460930736546210159525888),(3,7438570531218113706229589963661016825856),(6,13864574818784493494495648365761989181440)] orbit.val

/-- Exact candidate at original node629, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,160303331567142462557237394014208),(9,2826774581511061124582231528595467010048),(11,49090510675586879215209032196936399872),(12,1698197470014693759674355604453620516864),(15,17204008760435388331041716153149747592192)] orbit.val

/-- Exact candidate at original node629, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,474972332029250260113768283082047094784),(3,7438413038177370211732120418377212624896),(6,13864686112733441189810086174173905813504)] orbit.val

/-- Exact candidate at original node629, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,717388104217333678818770560883347161088),(3,7292416611949708594222436750234585399296),(6,13768266766773019388614767564515232972800)] orbit.val

/-- Exact candidate at original node629, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,4105009170270320991565495926784),(9,2729316922651997806107400945735328333824),(11,65637289896326822155608938159141603328),(12,1264915961674389688935955114847157776384),(15,17718201304612338174186688885326041892864)] orbit.val

/-- Exact candidate at original node629, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,717387313346475175489987878214483050496),(3,7292398653213464808567227302448988160000),(6,13768285516380121677598759694969694322688)] orbit.val

/-- Exact candidate at original node629, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,654517287865963759552502634695700250624),(3,7242141179165283980480464374125964558336),(6,13881413015908813921623007866811500724224)] orbit.val

/-- Exact candidate at original node629, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,74296209397751382578345839427584),(9,2690849322404241573062252463095273226240),(11,64688425361087122151895300070503990272),(12,1275826423745860518853419819677616207872),(15,17746707237132663049837024714443932681216)] orbit.val

/-- Exact candidate at original node629, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,717967884195051539440866848807386611712),(3,7398905555357538402668097276649825894400),(6,13661198043387471719547010750175953027072)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked62900 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 629 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked62901 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 629 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked62902 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 629 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked62910 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 629 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked62911 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 629 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked62912 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 629 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked62920 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 629 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked62921 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 629 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked62922 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 629 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked62930 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 629 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked62931 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 629 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked62932 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 629 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked62940 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 629 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked62941 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 629 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked62942 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 629 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked62950 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 629 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked62951 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 629 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked62952 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 629 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 629 1 :=
  RootFineParent3CacheTable.single 629 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 629 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 629 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 629 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 629 0 0) checked62900 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 629 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 629 0 1) checked62901 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 629 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 629 0 2) checked62902 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 629 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 629 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 629 1 0) checked62910 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 629 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 629 1 1) checked62911 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 629 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 629 1 2) checked62912 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 629 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 629 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 629 2 0) checked62920 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 629 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 629 2 1) checked62921 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 629 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 629 2 2) checked62922 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 629 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 629 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 629 3 0) checked62930 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 629 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 629 3 1) checked62931 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 629 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 629 3 2) checked62932 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 629 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 629 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 629 4 0) checked62940 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 629 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 629 4 1) checked62941 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 629 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 629 4 2) checked62942 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 629 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 629 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 629 5 0) checked62950 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 629 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 629 5 1) checked62951 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 629 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 629 5 2) checked62952 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block629
