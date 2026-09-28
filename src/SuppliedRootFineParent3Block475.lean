import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block475
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node475, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13908821718490709335946249285866094592),(9,3532304873289029227135732561359839166464),(11,63157766957259979365841621321478396928),(12,1904091853267200497131636090058567403520),(15,16264608167708081248686818353607414471680)] orbit.val

/-- Exact candidate at original node475, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,508371411000134943347985566935789076480),(3,7448150896634356577043696455204992974848),(6,13821549175305570141264292853492383481856)] orbit.val

/-- Exact candidate at original node475, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,508499451078075662736441077573984714752),(3,7447446822120094425818979172971381260288),(6,13822125209741891573100554625087799558144)] orbit.val

/-- Exact candidate at original node475, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,163408085185670196286684397568),(9,21778071447931117350665420701485932478464),(11,47991537794646678948065230848),(12,2523584804169472126763051155456),(15,32273959883840765172149432270848)] orbit.val

/-- Exact candidate at original node475, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,2903941321941591979029041258692608),(3,21778068553794280520213653449645737639936),(6,25204459199850342396946169200640)] orbit.val

/-- Exact candidate at original node475, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,89461804008773752566149283840),(3,10437980290074100105176003117056),(6,21778071472412619567573101017891013132288)] orbit.val

/-- Exact candidate at original node475, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14637741393137154321968543551998394368),(9,3483012872672433344555684933899296702464),(11,59665787984454167171101349488807405568),(12,1790476511383713243975023226604823719936),(15,16430278569506323751632196822088239310848)] orbit.val

/-- Exact candidate at original node475, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,659166605956417674847012258292632125440),(3,7248144792506966477613765684204970967040),(6,13870760084476677509195196933135562440704)] orbit.val

/-- Exact candidate at original node475, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,473266326416595057540696869871147810816),(3,7524022644305457933767592898929176346624),(6,13780782512218008670347685106832841375744)] orbit.val

/-- Exact candidate at original node475, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14268579181153584426284938900409417728),(9,3416034478010872908787519637844547076096),(11,71041211937119493741952458384224448512),(12,1464812954536713062120127388870326296576),(15,16811914259274202612580090451633658294272)] orbit.val

/-- Exact candidate at original node475, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,734304103158288848788184200784612687872),(3,7300051101197176898327628456140879167488),(6,13743716278584595914540162218707673677824)] orbit.val

/-- Exact candidate at original node475, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,734974947225551165580021038038663561216),(3,7298731853466612310097028930528348209152),(6,13744364682247898185978924907066153762816)] orbit.val

/-- Exact candidate at original node475, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14654095066328609595269028743454130176),(9,3482811470236641463496436197739888377856),(11,59919737169517458488844768394863368704),(12,1793563512123428209680977526644759743488),(15,16427122668344145920394447354110199912960)] orbit.val

/-- Exact candidate at original node475, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,474880544511397736572516049014359064576),(3,7523396174393667247186813444044447809536),(6,13779794764034996677896645382574358659072)] orbit.val

/-- Exact candidate at original node475, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,660042066381979177629661198027438686208),(3,7247418215391350908874930431945229729792),(6,13870611201166731575151383245660497117184)] orbit.val

/-- Exact candidate at original node475, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14268578992986698454907137115742535680),(9,3416034467131855843547597782031043395584),(11,71041218030257578757290008011520753664),(12,1464812793945354747792999412786585632768),(15,16811914424839606793103180535688273215488)] orbit.val

/-- Exact candidate at original node475, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,734304148352354532473914762168337694720),(3,7300051108759163928827663689858232090624),(6,13743716225828543200354396423606595747840)] orbit.val

/-- Exact candidate at original node475, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,734974992534758748192003545724537012224),(3,7298731860571785990828047262071394402304),(6,13744364629833516922635924067837234118656)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked47500 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 475 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked47501 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 475 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked47502 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 475 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked47510 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 475 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked47511 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 475 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked47512 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 475 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked47520 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 475 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked47521 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 475 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked47522 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 475 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked47530 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 475 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked47531 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 475 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked47532 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 475 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked47540 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 475 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked47541 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 475 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked47542 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 475 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked47550 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 475 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked47551 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 475 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked47552 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 475 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 475 1 :=
  RootFineParent3CacheTable.single 475 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 475 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 475 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 475 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 475 0 0) checked47500 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 475 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 475 0 1) checked47501 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 475 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 475 0 2) checked47502 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 475 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 475 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 475 1 0) checked47510 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 475 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 475 1 1) checked47511 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 475 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 475 1 2) checked47512 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 475 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 475 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 475 2 0) checked47520 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 475 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 475 2 1) checked47521 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 475 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 475 2 2) checked47522 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 475 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 475 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 475 3 0) checked47530 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 475 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 475 3 1) checked47531 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 475 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 475 3 2) checked47532 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 475 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 475 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 475 4 0) checked47540 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 475 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 475 4 1) checked47541 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 475 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 475 4 2) checked47542 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 475 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 475 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 475 5 0) checked47550 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 475 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 475 5 1) checked47551 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 475 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 475 5 2) checked47552 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block475
