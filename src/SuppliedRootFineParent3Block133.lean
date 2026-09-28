import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block133
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node133, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,734159925161464301192564163929062768640),(3,7394443434330720440860016281553840635904),(6,13649468123447876919603394430150262128640)] orbit.val

/-- Exact candidate at original node133, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,769042623536125803234866275303817216),(9,2800926544672971742130118506578993741824),(11,67966943687488963824516974001723437056),(12,1263997858484003424173066905364225794048),(15,17644411093472061405725037623412918743040)] orbit.val

/-- Exact candidate at original node133, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,670148653056583752994724405025873854464),(3,7239717691027130103668750898021510676480),(6,13868205138856347804992499572585781002240)] orbit.val

/-- Exact candidate at original node133, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,728216327862663771585939721664925270016),(3,7289790814616149734372531722156727336960),(6,13760064340461248155697503431811512926208)] orbit.val

/-- Exact candidate at original node133, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,925441502122882490688114030708523008),(9,2851882153754636410048992011304417886208),(11,67782249878713006602884168303125760000),(12,1263095416141284642684601148866163568640),(15,17594386221663304719828809433128749795328)] orbit.val

/-- Exact candidate at original node133, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,728197226393565996893665976975892676608),(3,7289840503241435696483458744096191938560),(6,13760033753305059968278850154561080918016)] orbit.val

/-- Exact candidate at original node133, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,478598711966398343773511036867469901824),(3,7446774260335899056590310773622413721600),(6,13852698510637764261292153065143281909760)] orbit.val

/-- Exact candidate at original node133, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,900822321166565647519055769055002624),(9,2955981388664226194005457595565892173824),(11,50086168801695163851918359392597554432),(12,1705590888774356483302093277914308056576),(15,17065512214378617254848986586991312745728)] orbit.val

/-- Exact candidate at original node133, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,478020886816181129097711860870027411456),(3,7433453959109051293001577366504811266048),(6,13866596637014829239556685648258326855680)] orbit.val

/-- Exact candidate at original node133, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,478315641517450078775031246370824519680),(3,7440147975290597735385777432408478449664),(6,13859607866132013847495166196853862563840)] orbit.val

/-- Exact candidate at original node133, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,898640773711735378983417536382500864),(9,2955875398570341613759977170459783331840),(11,50392639153184153583022574197736742912),(12,1713870123490617517411986719735263248384),(15,17057034680952206641522004993703999709184)] orbit.val

/-- Exact candidate at original node133, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,478314101873473390209393961142174351360),(3,7440098595643207086847182610987388764160),(6,13859658785423381184599398303503602417664)] orbit.val

/-- Exact candidate at original node133, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,728216429587957887366541482093002620928),(3,7289790823052663834519349864451916431360),(6,13760064230299439939770083529088246480896)] orbit.val

/-- Exact candidate at original node133, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,925345972765930916463060615090405376),(9,2851882179984109962427629275867061944320),(11,67782271606101177530231120178722749952),(12,1263095627011496219654625664380628141056),(15,17594386058365588371127025754591662292480)] orbit.val

/-- Exact candidate at original node133, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,728197311560324488839494738747448098816),(3,7289840652263222076388728866641360715776),(6,13760033519116515096427751270244356718592)] orbit.val

/-- Exact candidate at original node133, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,670547532253897281519283961766493552640),(3,7238497995137123026310210634908956622848),(6,13869025955549041353826480278957715357696)] orbit.val

/-- Exact candidate at original node133, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,912270206342178301601833117491920896),(9,2799122386824191975541744548034042134528),(11,68020610122235277812949562383534714880),(12,1267121104206939798096687616540745277440),(15,17642895111580352431902991315557351485440)] orbit.val

/-- Exact candidate at original node133, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,734108646238438945334010271406384742400),(3,7393085884470543031451468557329914396672),(6,13650876952231079684870496046896866394112)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked13300 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 133 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked13301 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 133 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked13302 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 133 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked13310 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 133 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked13311 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 133 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked13312 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 133 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked13320 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 133 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked13321 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 133 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked13322 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 133 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked13330 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 133 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked13331 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 133 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked13332 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 133 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked13340 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 133 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked13341 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 133 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked13342 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 133 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked13350 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 133 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked13351 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 133 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked13352 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 133 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 133 1 :=
  RootFineParent3CacheTable.single 133 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 133 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 133 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 133 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 133 0 0) checked13300 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 133 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 133 0 1) checked13301 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 133 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 133 0 2) checked13302 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 133 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 133 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 133 1 0) checked13310 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 133 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 133 1 1) checked13311 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 133 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 133 1 2) checked13312 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 133 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 133 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 133 2 0) checked13320 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 133 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 133 2 1) checked13321 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 133 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 133 2 2) checked13322 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 133 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 133 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 133 3 0) checked13330 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 133 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 133 3 1) checked13331 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 133 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 133 3 2) checked13332 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 133 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 133 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 133 4 0) checked13340 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 133 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 133 4 1) checked13341 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 133 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 133 4 2) checked13342 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 133 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 133 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 133 5 0) checked13350 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 133 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 133 5 1) checked13351 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 133 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 133 5 2) checked13352 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block133
