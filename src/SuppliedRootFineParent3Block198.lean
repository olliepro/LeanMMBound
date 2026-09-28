import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block198
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node198, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,735280440048686811925258669271478697984),(3,7297618334683988702152434285447642873856),(6,13745172708207386147578281920914043961344)] orbit.val

/-- Exact candidate at original node198, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,731761779906345632628433471214937178112),(3,7306597616233201208409235317023817334784),(6,13739712086800514820618306087394411020288)] orbit.val

/-- Exact candidate at original node198, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14291399149960324212045500974108770304),(9,3416692845165256726409443556409993068544),(11,70852740680588959531113035127127142400),(12,1465028129547367885851178435399419437056),(15,16811206368396887765652194347722517114880)] orbit.val

/-- Exact candidate at original node198, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,24787387253404138078322309777193959424),(3,21743475393295088998609752045354590666752),(6,9808702391568524967900520501380907008)] orbit.val

/-- Exact candidate at original node198, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,21198260949500322585996909533190334447616),(3,552045061891374344610582304450693562368),(6,27765471548364731048483037992137523200)] orbit.val

/-- Exact candidate at original node198, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,56962751231043145063967887517024256),(9,17956770384832725051679750190687846400),(11,23371202764077077599989483859332518912),(12,21175940270148260850867596759249650800640),(15,560746276891659964991644914445977342976)] orbit.val

/-- Exact candidate at original node198, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,735280524568520677812611058769177083904),(3,7297618347416724322524556292025143525376),(6,13745172610954816661318807524838844923904)] orbit.val

/-- Exact candidate at original node198, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,731761863768361370494275207139554230272),(3,7306597630411084821788369832010242326528),(6,13739711988760615469373329836483368976384)] orbit.val

/-- Exact candidate at original node198, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14291398793433592897855981803160993792),(9,3416692824927412964172046822359110254592),(11,70852751958094985972965231691787244288),(12,1465027830559084776646536936175306070528),(15,16811206676702035341966569903603800969984)] orbit.val

/-- Exact candidate at original node198, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,474563536126837268580409587692652724224),(3,7522373922397522186812871809412846583808),(6,13781134024415702206262693478527666225152)] orbit.val

/-- Exact candidate at original node198, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,654684301753930968566789812374711828480),(3,7256188497554566858743201973254129451008),(6,13867198683631563834345983090004324253696)] orbit.val

/-- Exact candidate at original node198, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14718617352878910643538400228606476288),(9,3483896043053075175094477048968550285312),(11,59931363641888696187718741275681446656),(12,1800199283967733939240828416012536334848),(15,16419326174924484940489412269147790990080)] orbit.val

/-- Exact candidate at original node198, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,508578685753551812526263839371735072768),(3,7446715555715780549826431428254612062208),(6,13822777241470729299303279608006818398208)] orbit.val

/-- Exact candidate at original node198, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,507444872450864003018963982575109931008),(3,7453624217691297684382915293295578972160),(6,13817002392797899974254095599762476630016)] orbit.val

/-- Exact candidate at original node198, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13911873612069559583937958096815521792),(9,3534372113609242098484211712355291103232),(11,63501305672075041391677872236989054976),(12,1912361204307469393699935623131940388864),(15,16253924985739205568496211709812129464320)] orbit.val

/-- Exact candidate at original node198, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,508558417609143393107222565785880756224),(3,7446050509538990877365640608413491658752),(6,13823462555791927391183111701433793118208)] orbit.val

/-- Exact candidate at original node198, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,507419343898556934213268606233597706240),(3,7452916676909766700936501054813419601920),(6,13817735462131738026506205214586148225024)] orbit.val

/-- Exact candidate at original node198, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13931824545896532043797977259002822656),(9,3532340693500013802813874539885366345728),(11,63479200063059298335431957055407013888),(12,1912046455761580742601319315405174702080),(15,16256273309069511285861551086028214648832)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked19800 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 198 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked19801 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 198 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked19802 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 198 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked19810 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 198 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked19811 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 198 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked19812 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 198 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked19820 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 198 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked19821 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 198 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked19822 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 198 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked19830 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 198 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked19831 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 198 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked19832 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 198 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked19840 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 198 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked19841 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 198 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked19842 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 198 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked19850 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 198 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked19851 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 198 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked19852 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 198 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 198 1 :=
  RootFineParent3CacheTable.single 198 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 198 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 198 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 198 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 198 0 0) checked19800 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 198 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 198 0 1) checked19801 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 198 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 198 0 2) checked19802 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 198 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 198 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 198 1 0) checked19810 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 198 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 198 1 1) checked19811 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 198 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 198 1 2) checked19812 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 198 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 198 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 198 2 0) checked19820 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 198 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 198 2 1) checked19821 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 198 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 198 2 2) checked19822 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 198 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 198 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 198 3 0) checked19830 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 198 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 198 3 1) checked19831 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 198 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 198 3 2) checked19832 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 198 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 198 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 198 4 0) checked19840 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 198 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 198 4 1) checked19841 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 198 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 198 4 2) checked19842 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 198 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 198 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 198 5 0) checked19850 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 198 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 198 5 1) checked19851 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 198 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 198 5 2) checked19852 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block198
