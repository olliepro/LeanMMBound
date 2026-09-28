import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block139
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node139, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,190282995075721744836744939800358813696),(3,4144573039588282984335353771844503076864),(6,17443215448276056932483876163988303642624)] orbit.val

/-- Exact candidate at original node139, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,5081808486688296882452775773400989696),(9,727698842869177887502812952410724499456),(11,154053786409479225819205956039212064768),(12,3474157439453056497931612370707651903488),(15,17417079605721659753519890820702176075776)] orbit.val

/-- Exact candidate at original node139, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,3511463810421547720026437692084788920320),(3,1511814734619984208437389476735710396416),(6,16754792937898529733192147706812666216448)] orbit.val

/-- Exact candidate at original node139, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,741954827333986172749990607908920885248),(3,7279837153099848067986014313368231346176),(6,13756279502506227420919969954356013301760)] orbit.val

/-- Exact candidate at original node139, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,5994345375025498197814948759829741568),(9,2559225997284265648686916361748146552832),(11,70203406299963291540382870054366873600),(12,1236777992227211141170452757468905205760),(15,17905869741753596082060407937601917159424)] orbit.val

/-- Exact candidate at original node139, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,742094904134186349088544000658836029440),(3,7279619382489535919181595297638508396544),(6,13756357196316339393385835577335821107200)] orbit.val

/-- Exact candidate at original node139, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,846560785245498290097533169869556547584),(3,1237492970067311915604349108310092283904),(6,19694017727627251455954092597453516701696)] orbit.val

/-- Exact candidate at original node139, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,493460146639779901492780810285088768),(9,39039677078903752349218781528064),(11,128573967461200036970448943783461076992),(12,2174296383345981423644287320366259208192),(15,19474707632946563342235993481454378631168)] orbit.val

/-- Exact candidate at original node139, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,261750733399316558402337882132174602240),(3,1822302982962948251224339426621429645312),(6,19694017766577796852029297566879561285632)] orbit.val

/-- Exact candidate at original node139, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,25942082551707887836176362745381257216),(3,11414100730805019726688667033700415832064),(6,10338028669583334047131131479187368443904)] orbit.val

/-- Exact candidate at original node139, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,8405644795697225315093103679171985408),(9,6090793158350291243908959820218508509184),(11,4943677493816182505842120756821194240),(12,1146627989395367065054011159669605209088),(15,14527301012904889944872068671309058635264)] orbit.val

/-- Exact candidate at original node139, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,1004876890642454654612565706984233369600),(3,5122943906951202572302852663792898146304),(6,15650250685346404434740556504856034017280)] orbit.val

/-- Exact candidate at original node139, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,740009600195351313639659843107881484288),(3,7278880556931247080756765133473197326336),(6,13759181325813463267259549899052086722560)] orbit.val

/-- Exact candidate at original node139, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,5997519988076322884124068870761742336),(9,2559471386334279181963772362178990964736),(11,69809760802215049717333945856900211456),(12,1241948469483098386718217820553621256704),(15,17900844346332392720372526678172891357952)] orbit.val

/-- Exact candidate at original node139, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,739871985507500448108556270057858007040),(3,7279093656330161574149775293115447377920),(6,13759105841102399639397643312459860148224)] orbit.val

/-- Exact candidate at original node139, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,940089683526701446071571530994939854848),(3,149258747407857462709336342909346119680),(6,20688723052005502752875067001728879558656)] orbit.val

/-- Exact candidate at original node139, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,3079500230985770671680072271605530624),(9,146085335338951061711646913870679769088),(11,170755810826910088500381303577664446464),(12,875458622241007525649075660905323380736),(15,20582692214302207215123190925007892406272)] orbit.val

/-- Exact candidate at original node139, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,173057351435192470202123070571915771904),(3,788745660372691050036342259163267596288),(6,20816268471132178141417509545897982164992)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked13900 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 139 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked13901 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 139 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked13902 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 139 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked13910 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 139 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked13911 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 139 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked13912 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 139 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked13920 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 139 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked13921 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 139 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked13922 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 139 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked13930 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 139 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked13931 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 139 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked13932 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 139 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked13940 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 139 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked13941 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 139 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked13942 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 139 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked13950 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 139 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked13951 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 139 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked13952 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 139 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 139 1 :=
  RootFineParent3CacheTable.single 139 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 139 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 139 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 139 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 139 0 0) checked13900 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 139 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 139 0 1) checked13901 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 139 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 139 0 2) checked13902 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 139 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 139 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 139 1 0) checked13910 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 139 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 139 1 1) checked13911 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 139 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 139 1 2) checked13912 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 139 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 139 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 139 2 0) checked13920 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 139 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 139 2 1) checked13921 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 139 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 139 2 2) checked13922 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 139 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 139 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 139 3 0) checked13930 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 139 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 139 3 1) checked13931 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 139 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 139 3 2) checked13932 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 139 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 139 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 139 4 0) checked13940 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 139 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 139 4 1) checked13941 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 139 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 139 4 2) checked13942 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 139 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 139 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 139 5 0) checked13950 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 139 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 139 5 1) checked13951 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 139 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 139 5 2) checked13952 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block139
