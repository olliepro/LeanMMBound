import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block600
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node600, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,654406128964317482517407997067349983232),(3,7246122868826192648657878062777164103680),(6,13877542485149551530480688815788651446272)] orbit.val

/-- Exact candidate at original node600, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,7243794245750505224638544165950455808),(9,3298723144519778480182421199256257822720),(11,54933663413703470859338877999842873344),(12,1711166629952144668584390566776294825984),(15,16706004250808684536805185687434819555328)] orbit.val

/-- Exact candidate at original node600, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,456111023897527157422615551721183641600),(3,7524622804992245378543803187858832883712),(6,13797337654050289125689556136053149007872)] orbit.val

/-- Exact candidate at original node600, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,730042353877801960132222662001215668224),(3,7296950178082928985819391641658622738432),(6,13751078950979330715704360571973327126528)] orbit.val

/-- Exact candidate at original node600, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,7013483374740110079512110462505320448),(9,3233562345570883054591221497237893808128),(11,69052848477747608560388886644401041408),(12,1381367513434716372376233776802442125312),(15,17087075292081974516048618604485923237888)] orbit.val

/-- Exact candidate at original node600, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,729340943954852208661222338627580723200),(3,7298028414101623356532555105078461071360),(6,13750702124883586096462197431927123738624)] orbit.val

/-- Exact candidate at original node600, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,495375585071625013550580733512068890624),(3,7445972706782650965069426719362002190336),(6,13836723191085785683035967422759094452224)] orbit.val

/-- Exact candidate at original node600, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,6826712850470725086686882095406514176),(9,3345498121754167700970761744505074876416),(11,57660449128097138325521614397147054080),(12,1823661447508044892889519964842727571456),(15,16544424751699281204383484669792809517056)] orbit.val

/-- Exact candidate at original node600, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,495177942919788545710407359801933692928),(3,7446559644849765375358687502992614096896),(6,13836333895170507740586880012838617743360)] orbit.val

/-- Exact candidate at original node600, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,495169477298800931416653445218982428672),(3,7446327850775774633777339250669978124288),(6,13836574154865486096461982179744204980224)] orbit.val

/-- Exact candidate at original node600, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,6826726319258352511624272997878071296),(9,3344944530086323038664890773220207099904),(11,57615503365652588769741998853968166912),(12,1823218757300355797385173723510502981632),(15,16545465965868471884324544107050609213440)] orbit.val

/-- Exact candidate at original node600, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,494850082538528490199091697502964940800),(3,7447003492091819813289666609893116739584),(6,13836217908309713358167216568237083852800)] orbit.val

/-- Exact candidate at original node600, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,730046652384979686944019339492481564672),(3,7296950986529023485501107343118062059520),(6,13751073844026058489210848193022621908992)] orbit.val

/-- Exact candidate at original node600, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,7013473139451865267987997596546236416),(9,3233561228339901119849806442977474641920),(11,69053483082605664416187778158106918912),(12,1381350628234173426921494616219037958144),(15,17087092670143929585200498040681999777792)] orbit.val

/-- Exact candidate at original node600, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,729345233139949427677565343203464314880),(3,7298029235479631518565893361059128934400),(6,13750697014320480715412516171370572283904)] orbit.val

/-- Exact candidate at original node600, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,456224506350687849551646533593235193856),(3,7521280836308550842898413882807957848064),(6,13800566140280822969205914459231972491264)] orbit.val

/-- Exact candidate at original node600, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,7230501983420922225333321209911181312),(9,3298802255464226304665927273558319300608),(11,54918551256898820292293117160432055296),(12,1710989894754283136550190778525912438784),(15,16706130279481232477922230385178590557184)] orbit.val

/-- Exact candidate at original node600, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,653534390577745810052004663121833623552),(3,7244541882109381971611712182449780817920),(6,13879995210252933879992258030061551091712)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked60000 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 600 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked60001 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 600 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked60002 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 600 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked60010 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 600 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked60011 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 600 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked60012 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 600 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked60020 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 600 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked60021 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 600 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked60022 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 600 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked60030 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 600 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked60031 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 600 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked60032 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 600 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked60040 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 600 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked60041 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 600 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked60042 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 600 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked60050 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 600 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked60051 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 600 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked60052 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 600 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 600 1 :=
  RootFineParent3CacheTable.single 600 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 600 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 600 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 600 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 600 0 0) checked60000 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 600 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 600 0 1) checked60001 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 600 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 600 0 2) checked60002 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 600 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 600 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 600 1 0) checked60010 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 600 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 600 1 1) checked60011 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 600 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 600 1 2) checked60012 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 600 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 600 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 600 2 0) checked60020 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 600 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 600 2 1) checked60021 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 600 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 600 2 2) checked60022 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 600 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 600 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 600 3 0) checked60030 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 600 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 600 3 1) checked60031 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 600 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 600 3 2) checked60032 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 600 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 600 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 600 4 0) checked60040 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 600 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 600 4 1) checked60041 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 600 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 600 4 2) checked60042 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 600 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 600 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 600 5 0) checked60050 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 600 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 600 5 1) checked60051 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 600 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 600 5 2) checked60052 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block600
