import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block933
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node933, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13959047852567729455771792218777452544),(9,3534786784096488329715511923983022817280),(11,63345064059180677690647855217645578240),(12,1907419058645306576444905535921694453760),(15,16258561528286518348349137768292025231360)] orbit.val

/-- Exact candidate at original node933, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,508690100447619050910271688889906233344),(3,7447538164072741324903422926484165099520),(6,13821843218419701285842280260259094200320)] orbit.val

/-- Exact candidate at original node933, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,508691280471735967821918669625249234944),(3,7447576207881663555837294858524069724160),(6,13821803994586662137996761347483846574080)] orbit.val

/-- Exact candidate at original node933, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13958594429793660320967744366749679616),(9,3534786861596486549137458653767795736576),(11,63345064651184477050253957813405103872),(12,1907419097351082321296019563385721688576),(15,16258561864911514653851274956299493324544)] orbit.val

/-- Exact candidate at original node933, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,508690075156156265364103468967518011392),(3,7447538305448317474318270284247230054400),(6,13821843102335587921973601122418417467392)] orbit.val

/-- Exact candidate at original node933, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,508691344378202497511606246848998670336),(3,7447576127208537134066416838066581798912),(6,13821804011353322030077951790717585063936)] orbit.val

/-- Exact candidate at original node933, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,5508467883473149893289585563223982080),(9,3564424708754027821754074045157688213504),(11,49923244089880220374442367271388944896),(12,1768942739821595315465962303404502207488),(15,16389272322391085154168206574236362185216)] orbit.val

/-- Exact candidate at original node933, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,509752546347439389941384499338057613312),(3,8566178537668276074281373495062085763072),(6,12702140398924346197433216881233022156800)] orbit.val

/-- Exact candidate at original node933, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,435600484819489043055984709311846678528),(3,8694561108609173139836076469155864248320),(6,12647909889511399478763913697165454606336)] orbit.val

/-- Exact candidate at original node933, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,4669455477664969611583907401778069504),(9,13619025686446352408717460414714412531712),(11,76813415703340713747129353228737339392),(12,720515211634274257863258985957817794560),(15,7357047713678429311716542214330419798016)] orbit.val

/-- Exact candidate at original node933, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,152992777530545758228318532802464186368),(3,7344738675582781090001180873879208329216),(6,14280340029826734813426475468951493017600)] orbit.val

/-- Exact candidate at original node933, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,141928427304032285194100128958818287616),(3,6310913310370283439097552667531194400768),(6,15325229745265745937364322079143152844800)] orbit.val

/-- Exact candidate at original node933, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13973067370008071515997870713122848768),(9,3534771513323725639721460709549473267712),(11,63343153894777073191388303861278478336),(12,1907399584930087291560263941977011314688),(15,16258584163421463585666864049532279623680)] orbit.val

/-- Exact candidate at original node933, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,508720696261139165973294439074990391296),(3,7447482172825487379020958981991784513536),(6,13821868613853435116661721454566390628352)] orbit.val

/-- Exact candidate at original node933, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,508689804353573229614643726554878705664),(3,7447597735949560472191460252525164232704),(6,13821783942636927959849870896553122594816)] orbit.val

/-- Exact candidate at original node933, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,7046396288494184199220009494388932608),(9,13232140684921241847779957807083885166592),(11,136083120163214212572297057613397936128),(12,1099111197399717159522512653758749372416),(15,7303690084167394257581987347682744125440)] orbit.val

/-- Exact candidate at original node933, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,391873579039410287125396242269873373184),(3,7241227691446165059417381069583147859968),(6,14144970212454486315113197563780144300032)] orbit.val

/-- Exact candidate at original node933, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,450093345342708697805807548779231969280),(3,7418419281426467508806639082080703610880),(6,13909558856170885455043528244773229953024)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked93300 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 933 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked93301 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 933 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked93302 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 933 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked93310 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 933 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked93311 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 933 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked93312 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 933 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked93320 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 933 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked93321 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 933 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked93322 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 933 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked93330 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 933 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked93331 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 933 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked93332 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 933 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked93340 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 933 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked93341 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 933 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked93342 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 933 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked93350 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 933 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked93351 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 933 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked93352 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 933 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 933 1 :=
  RootFineParent3CacheTable.single 933 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 933 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 933 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 933 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 933 0 0) checked93300 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 933 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 933 0 1) checked93301 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 933 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 933 0 2) checked93302 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 933 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 933 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 933 1 0) checked93310 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 933 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 933 1 1) checked93311 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 933 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 933 1 2) checked93312 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 933 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 933 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 933 2 0) checked93320 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 933 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 933 2 1) checked93321 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 933 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 933 2 2) checked93322 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 933 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 933 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 933 3 0) checked93330 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 933 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 933 3 1) checked93331 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 933 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 933 3 2) checked93332 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 933 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 933 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 933 4 0) checked93340 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 933 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 933 4 1) checked93341 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 933 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 933 4 2) checked93342 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 933 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 933 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 933 5 0) checked93350 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 933 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 933 5 1) checked93351 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 933 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 933 5 2) checked93352 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block933
