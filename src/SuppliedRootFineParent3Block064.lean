import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block064
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node64, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,737167470203616788240292428049247371264),(3,7292017953798451400771771226949007966208),(6,13748886058937993472643911220634910195712)] orbit.val

/-- Exact candidate at original node64, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,736910212577929705706037701691589001216),(3,7292419497906191819418689421162540171264),(6,13748741772455940136531247752779036360704)] orbit.val

/-- Exact candidate at original node64, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,11596523556645935435532886570457628672),(9,3124002220032173960047419415494846840832),(11,70316641893150548479003423604166836480),(12,1384156582375637396131490797255212498432),(15,17187999515082453821562528352708481728768)] orbit.val

/-- Exact candidate at original node64, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,752248754617332880686032104432653565952),(3,6926830214388919423274566570962596134912),(6,14098992513933809357695376200237915832320)] orbit.val

/-- Exact candidate at original node64, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,944517038400659339308726897021366042624),(3,7026454782274799127005437592498050433024),(6,13807099662264603195341810386113749057536)] orbit.val

/-- Exact candidate at original node64, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,11517907179147325775729676667716632576),(9,3475576017894411524221053751218889818112),(11,118399899136839895920182499078511415552),(12,2163121140998671516792301880710277062144),(15,16009456517730991398946707067957770604800)] orbit.val

/-- Exact candidate at original node64, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,737168517617413405942577860472312168448),(3,7292018110865650686644502623676637642752),(6,13748884854456997569068894391484215721984)] orbit.val

/-- Exact candidate at original node64, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,736911088201048382372111475301580537856),(3,7292420064914022043891948240697164824576),(6,13748740329824991235391915159634420170752)] orbit.val

/-- Exact candidate at original node64, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,11596520184497268422157017745243242496),(9,3124001971196322543371701118571684823040),(11,70316821790263580911466266992865280000),(12,1384152953552780470816894247337790341120),(15,17188003216216197798133756224985581846528)] orbit.val

/-- Exact candidate at original node64, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,58116779152679005692782725945291177984),(3,5516762268448453118781881051736136744960),(6,16203192435338929537181311097951737610240)] orbit.val

/-- Exact candidate at original node64, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,347529877215248192346521218636968886272),(3,11018346594200331555474491412297403072512),(6,10412195011524481913834962244698793574400)] orbit.val

/-- Exact candidate at original node64, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,4664561811557991674809851370983653376),(9,5791077499856950074712317238912250544128),(11,30208369695244421089798234098006523904),(12,1201716173783703833908696236822679191552),(15,14750404877792605340270353314429245620224)] orbit.val

/-- Exact candidate at original node64, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,9653823655950631244150621255505429921792),(3,5161107261239160435209947845168147202048),(6,6963140565750269982295405774959588409344)] orbit.val

/-- Exact candidate at original node64, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,8531185489914458153636289887295009456128),(3,6283745837305833337827933865466493140992),(6,6963140155719770170191751122871662936064)] orbit.val

/-- Exact candidate at original node64, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,2059359683054463446196522963378896896),(9,2433656419710814799381989118967808),(11,5570504033112536530455862709659480117760),(12,7586644920865583015328824296303072599040),(15,8618860735622467941610291964718114951680)] orbit.val

/-- Exact candidate at original node64, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,1318913984555376617441907855891852427264),(3,10518934129433753463909298654123359469568),(6,9940223368950931580304768365617953636352)] orbit.val

/-- Exact candidate at original node64, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,2047864412615647950171308517623228006400),(3,10591639670410229892135423610738641469440),(6,9138567399914183819349242747271296057344)] orbit.val

/-- Exact candidate at original node64, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,6025864987265356622023448827399241728),(9,801805666955805386193833879341830766592),(11,242153925810906249028786786754772197376),(12,3594632595031292804180296214658844737536),(15,17133453430154791865631034546050318589952)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked06400 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 64 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked06401 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 64 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked06402 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 64 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked06410 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 64 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked06411 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 64 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked06412 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 64 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked06420 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 64 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked06421 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 64 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked06422 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 64 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked06430 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 64 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked06431 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 64 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked06432 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 64 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked06440 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 64 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked06441 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 64 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked06442 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 64 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked06450 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 64 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked06451 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 64 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked06452 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 64 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 64 1 :=
  RootFineParent3CacheTable.single 64 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 64 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 64 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 64 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 64 0 0) checked06400 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 64 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 64 0 1) checked06401 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 64 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 64 0 2) checked06402 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 64 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 64 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 64 1 0) checked06410 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 64 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 64 1 1) checked06411 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 64 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 64 1 2) checked06412 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 64 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 64 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 64 2 0) checked06420 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 64 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 64 2 1) checked06421 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 64 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 64 2 2) checked06422 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 64 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 64 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 64 3 0) checked06430 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 64 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 64 3 1) checked06431 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 64 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 64 3 2) checked06432 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 64 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 64 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 64 4 0) checked06440 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 64 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 64 4 1) checked06441 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 64 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 64 4 2) checked06442 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 64 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 64 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 64 5 0) checked06450 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 64 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 64 5 1) checked06451 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 64 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 64 5 2) checked06452 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block064
