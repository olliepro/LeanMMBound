import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block337
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node337, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13472592619350806821413654700492849152),(9,3524752704341878611899937793162405216256),(11,63226037594862943666550584348725081600),(12,1907873665594087496670540049107317429248),(15,16268746482789881802597532794314224956928)] orbit.val

/-- Exact candidate at original node337, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,507347206323844726620724916521235644416),(3,7449605023184514699787253426760542322688),(6,13821119253431702235247996532351387566080)] orbit.val

/-- Exact candidate at original node337, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,507972879768625057799111595354310574080),(3,7447335631024544054089266183210457366528),(6,13822762972146892549767597097068397592576)] orbit.val

/-- Exact candidate at original node337, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,71080348184817707398466089676439552),(9,658839601820410494452031067214839808),(11,38427043549435590029013250625651681280),(12,1751793954200013632546657055200548597760),(15,19987120565240607210878454072650073974784)] orbit.val

/-- Exact candidate at original node337, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,42712459234903971391582341800394752),(3,733634966222715903778760988548923392),(6,21777295135514604041780804532302816215040)] orbit.val

/-- Exact candidate at original node337, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,46427774521904232899261076739194880),(3,71080237282191119196852971062165504),(6,21777953974928257566303878761585364172800)] orbit.val

/-- Exact candidate at original node337, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14348335463743888378528318115928866816),(9,3476136133803368829909464706864207888384),(11,59373433987521442429862400756769812992),(12,1785416948193455073082715073390366039040),(15,16442796631491972427855404376505892925952)] orbit.val

/-- Exact candidate at original node337, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,658499694280730684733892748502833823744),(3,7249207677318722348288665439209871376384),(6,13870364111340608628633416687920460333056)] orbit.val

/-- Exact candidate at original node337, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,472551871840714712025439333507965911040),(3,7523806717909326965296318093963259019264),(6,13781712893190019984334217448161940602880)] orbit.val

/-- Exact candidate at original node337, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13982868527536386128672892848131014656),(9,3409210938431526005801789657869421903872),(11,70889313597774353005199417346966785536),(12,1460595506917147327315402378733767943168),(15,16823392855466077589404910528834877885952)] orbit.val

/-- Exact candidate at original node337, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,733063070356630542600308028397284491264),(3,7301783688480385549131168314025048014848),(6,13743224724103045569924498533210833027072)] orbit.val

/-- Exact candidate at original node337, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,735088646533144718404213551058267406336),(3,7298234137151836258213723091126924083200),(6,13744748699255080685038038233447974043648)] orbit.val

/-- Exact candidate at original node337, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,3826522773243900701906720892932587520),(9,3477843160252233382276463897336401100800),(11,59477062328302147887723456831074981888),(12,1787786630973419191550355680772578103296),(15,16449138106612863039239525119800178759680)] orbit.val

/-- Exact candidate at original node337, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,471547154157673009581174673404676014080),(3,7526208966127636009013227702171255963648),(6,13780315362654752643061572500057233555456)] orbit.val

/-- Exact candidate at original node337, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,659014620791815242990702253055055757312),(3,7247323030298247385398595329402844741632),(6,13871733831849999033266677293175265034240)] orbit.val

/-- Exact candidate at original node337, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13982867467859712500387377534480678912),(9,3409210876336453635247115068929350828032),(11,70889348613835147209321406179417564160),(12,1460594588982030872112028899018442455040),(15,16823393801539882294587122123971474007040)] orbit.val

/-- Exact candidate at original node337, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,733063328418824347137351845841001775104),(3,7301783731807073709012806223522114306048),(6,13743224422714163605505816806270049452032)] orbit.val

/-- Exact candidate at original node337, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,735088905937349058406989690079362940928),(3,7298234178482881541886947893899874533376),(6,13744748398519831061362037291653928058880)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked33700 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 337 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked33701 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 337 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked33702 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 337 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked33710 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 337 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked33711 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 337 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked33712 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 337 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked33720 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 337 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked33721 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 337 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked33722 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 337 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked33730 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 337 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked33731 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 337 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked33732 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 337 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked33740 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 337 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked33741 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 337 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked33742 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 337 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked33750 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 337 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked33751 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 337 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked33752 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 337 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 337 1 :=
  RootFineParent3CacheTable.single 337 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 337 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 337 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 337 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 337 0 0) checked33700 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 337 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 337 0 1) checked33701 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 337 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 337 0 2) checked33702 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 337 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 337 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 337 1 0) checked33710 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 337 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 337 1 1) checked33711 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 337 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 337 1 2) checked33712 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 337 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 337 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 337 2 0) checked33720 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 337 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 337 2 1) checked33721 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 337 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 337 2 2) checked33722 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 337 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 337 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 337 3 0) checked33730 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 337 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 337 3 1) checked33731 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 337 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 337 3 2) checked33732 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 337 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 337 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 337 4 0) checked33740 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 337 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 337 4 1) checked33741 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 337 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 337 4 2) checked33742 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 337 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 337 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 337 5 0) checked33750 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 337 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 337 5 1) checked33751 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 337 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 337 5 2) checked33752 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block337
