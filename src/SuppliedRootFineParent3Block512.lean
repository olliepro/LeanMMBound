import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block512
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node512, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,647124136170739191387912804267058003968),(3,7239830704522368957326395855741569204224),(6,13891116642246953512941666215624538324992)] orbit.val

/-- Exact candidate at original node512, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,52931548045915018444391877376475136),(9,3014697947097962934214425849341042229248),(11,50339911517603514423283073051374507008),(12,1634278302451473042532776204594071230464),(15,17078702390324976255467045356769301091328)] orbit.val

/-- Exact candidate at original node512, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,438755586079236893496588877269051637760),(3,7517567870375234428604628385018645839872),(6,13821748026485590339554757613345468055552)] orbit.val

/-- Exact candidate at original node512, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,725175104314327103834511007438793080832),(3,7293423610392285237653657197053323771904),(6,13759472768233449320167806671141048680448)] orbit.val

/-- Exact candidate at original node512, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,41783823715747811946108769791901696),(9,2952820147084086564331414216735495028736),(11,67419712815615611827695963050529573632),(12,1301316317670710402136644832059940825600),(15,17456473521545933335548273755017408203520)] orbit.val

/-- Exact candidate at original node512, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,725175196828261812299310992237527040000),(3,7293404375864062827367884023176135442432),(6,13759491910247737021988779860219503050752)] orbit.val

/-- Exact candidate at original node512, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,482670241317872851158410959726758068224),(3,7441961504160517703268573929467239464960),(6,13853439737461671107228989986439168000000)] orbit.val

/-- Exact candidate at original node512, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,45639625652589671605294872819400704),(9,3058474085580568694224811271072195280896),(11,52208719289429921969429274561220409344),(12,1742927600498428693136799904468147179520),(15,16924415437945981762653329130658783262720)] orbit.val

/-- Exact candidate at original node512, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,482673305142694851044684543710724096000),(3,7442000296757167115046087295437306331136),(6,13853397881040199695565203036485135106048)] orbit.val

/-- Exact candidate at original node512, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,482663778582935954537197558579744210944),(3,7442126958891993407820443930664766537728),(6,13853280745465132299298333386388654784512)] orbit.val

/-- Exact candidate at original node512, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,44790740457090743501669945760022528),(9,3057931958510090174925656788273941446656),(11,52206754867806345498722689322816258048),(12,1742965005623039422508836169700456235008),(15,16924922973198668627979257558390191570944)] orbit.val

/-- Exact candidate at original node512, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,482661043723488921804122075062970875904),(3,7442091041693194877682300350714192330752),(6,13853319397523377862169552449856002326528)] orbit.val

/-- Exact candidate at original node512, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,725177070523929933011985080061291134976),(3,7293424111085219814339155169110824845312),(6,13759470301330911914304834626461049552896)] orbit.val

/-- Exact candidate at original node512, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,41780624878686298523478430454906880),(9,2952819731646264660629218523888194945024),(11,67420039488805812789415593447591936000),(12,1301309328356484663935704561521855234048),(15,17456480602823627838003112718345068511232)] orbit.val

/-- Exact candidate at original node512, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,725177163099842819283590697077337751552),(3,7293404876371225222318038335526411436032),(6,13759489443468993620054345843029416345600)] orbit.val

/-- Exact candidate at original node512, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,438830117384741208465595424981964029952),(3,7516942623715952649653687425339228160000),(6,13822298741839367803536692025311973343232)] orbit.val

/-- Exact candidate at original node512, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,51138233442685116587525308850110464),(9,3014648698738446543259356632732407955456),(11,50351567100671267038240456883857514240),(12,1634386567691362642883226089779142607360),(15,17078633511176138523358564170928907345664)] orbit.val

/-- Exact candidate at original node512, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,649249395632405831391180195964800466944),(3,7237389501623612577439820633364416692224),(6,13891432585684043252824974046303948374016)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked51200 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 512 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked51201 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 512 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked51202 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 512 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked51210 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 512 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked51211 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 512 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked51212 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 512 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked51220 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 512 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked51221 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 512 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked51222 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 512 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked51230 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 512 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked51231 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 512 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked51232 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 512 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked51240 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 512 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked51241 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 512 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked51242 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 512 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked51250 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 512 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked51251 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 512 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked51252 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 512 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 512 1 :=
  RootFineParent3CacheTable.single 512 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 512 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 512 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 512 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 512 0 0) checked51200 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 512 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 512 0 1) checked51201 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 512 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 512 0 2) checked51202 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 512 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 512 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 512 1 0) checked51210 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 512 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 512 1 1) checked51211 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 512 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 512 1 2) checked51212 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 512 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 512 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 512 2 0) checked51220 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 512 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 512 2 1) checked51221 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 512 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 512 2 2) checked51222 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 512 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 512 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 512 3 0) checked51230 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 512 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 512 3 1) checked51231 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 512 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 512 3 2) checked51232 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 512 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 512 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 512 4 0) checked51240 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 512 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 512 4 1) checked51241 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 512 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 512 4 2) checked51242 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 512 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 512 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 512 5 0) checked51250 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 512 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 512 5 1) checked51251 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 512 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 512 5 2) checked51252 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block512
