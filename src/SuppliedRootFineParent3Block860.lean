import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block860
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node860, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,639315877770290526353168620662202302464),(3,7373378431178263863684701503278242856960),(6,13765377173991507271618104751692720373760)] orbit.val

/-- Exact candidate at original node860, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,49027377315858200407104915767296),(9,361655300613968706022496259996240576512),(11,50623785961263484367312938742740164096),(12,1154049987405057906011402866500610016256),(15,20211742359932394249396562403288659009024)] orbit.val

/-- Exact candidate at original node860, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,624920706349452658053825808734042980352),(3,7152535693371448163602029031953423925248),(6,14000615083219160840000120034945698627584)] orbit.val

/-- Exact candidate at original node860, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,637086998936067294102033287623252901888),(3,7265178573842657896896279162877451960320),(6,13875805910161336470657662425132460670976)] orbit.val

/-- Exact candidate at original node860, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,1539997408871013061974510534656),(9,370304175858681202539718501403751088128),(11,51313441461774923461909901823424200192),(12,1155929848506934031756549475341887603712),(15,20200524015572674095026783935089592106496)] orbit.val

/-- Exact candidate at original node860, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,637085929806389929984624761591052632064),(3,7265154297170093485223712475858044190720),(6,13875831255963578246447637638184068710400)] orbit.val

/-- Exact candidate at original node860, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,628682428541310785663732205455897788416),(3,7270367990725090628663754528525402505216),(6,13879021063673660247328488141651865239552)] orbit.val

/-- Exact candidate at original node860, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,163096124295770280457409818263552),(9,353114996404714614582957412082161549312),(11,51169735900732399881956985752378061824),(12,1161519471060239227920760256033674401792),(15,20212267116478251123500019764355133256704)] orbit.val

/-- Exact candidate at original node860, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,628684520598345406295052194766712209408),(3,7273863982549414512122454426942772871168),(6,13875522979792301743238468253923680452608)] orbit.val

/-- Exact candidate at original node860, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,632921207222076738351726461630294261760),(3,7169443363842725325414459230207936036864),(6,13975706911875259597889789183794935234560)] orbit.val

/-- Exact candidate at original node860, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,336482006198080641759781157076992),(9,252204940069223586205662064254763663360),(11,51536717659007613871844637773708909568),(12,1169375756315542246041378334602276390912),(15,20304953732414282017456448079221259492352)] orbit.val

/-- Exact candidate at original node860, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,632933042332607454021682326732611256320),(3,7363181681454568624397986519696267018240),(6,13781956759152885583236306029204287258624)] orbit.val

/-- Exact candidate at original node860, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,5527904546061684420797970513920),(3,22458434105696034416685785584500736),(6,21778049018978051419559873769049610518528)] orbit.val

/-- Exact candidate at original node860, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,44565841414273689896368472064),(9,147918979414131518287146555277312),(11,16806763269891839015886336),(12,1209907781588826613510846183425024),(15,21778070125068718010520299495905042472448)] orbit.val

/-- Exact candidate at original node860, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,737153503114551843622859309056),(3,22349502732970069375689627547992064),(6,21778049132700175188472047342382758232064)] orbit.val

/-- Exact candidate at original node860, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,646119154219409119177897052081762598912),(3,7289593112964342881565145572623851192320),(6,13842359215756309660912932250927551741952)] orbit.val

/-- Exact candidate at original node860, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,408743042171246859166192836280320),(9,364976064519208213326964484562372001792),(11,51241238453715090312991841126766034944),(12,1159000062938989651578417028940089098240),(15,20202853708285106535190742354811102117888)] orbit.val

/-- Exact candidate at original node860, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,639703354722671066466810588576876593152),(3,7226621304372187849299391564473717227520),(6,13911746823845202745889772722582571712512)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked86000 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 860 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked86001 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 860 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked86002 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 860 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked86010 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 860 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked86011 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 860 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked86012 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 860 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked86020 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 860 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked86021 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 860 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked86022 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 860 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked86030 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 860 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked86031 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 860 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked86032 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 860 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked86040 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 860 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked86041 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 860 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked86042 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 860 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked86050 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 860 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked86051 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 860 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked86052 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 860 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 860 1 :=
  RootFineParent3CacheTable.single 860 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 860 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 860 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 860 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 860 0 0) checked86000 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 860 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 860 0 1) checked86001 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 860 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 860 0 2) checked86002 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 860 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 860 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 860 1 0) checked86010 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 860 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 860 1 1) checked86011 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 860 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 860 1 2) checked86012 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 860 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 860 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 860 2 0) checked86020 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 860 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 860 2 1) checked86021 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 860 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 860 2 2) checked86022 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 860 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 860 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 860 3 0) checked86030 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 860 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 860 3 1) checked86031 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 860 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 860 3 2) checked86032 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 860 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 860 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 860 4 0) checked86040 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 860 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 860 4 1) checked86041 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 860 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 860 4 2) checked86042 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 860 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 860 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 860 5 0) checked86050 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 860 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 860 5 1) checked86051 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 860 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 860 5 2) checked86052 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block860
