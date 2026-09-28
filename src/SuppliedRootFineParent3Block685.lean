import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block685
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node685, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(4,575943599470282616256339085820663169024),(7,1402676190690169222123838374504126480384),(8,19799451692779609823275797415308375883776)] orbit.val

/-- Exact candidate at original node685, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(4,573074925592672989744080841283551100928),(7,891743981593251857978812273924788715520),(8,20313252575754136813933081760424825716736)] orbit.val

/-- Exact candidate at original node685, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,379021191887308849577259397500937175040),(3,7674461418043332558653345181696203423744),(6,13724588873009420253425370296436024934400)] orbit.val

/-- Exact candidate at original node685, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(4,575943874164225573525080564836731977728),(7,1402706444644616904653929375972387192832),(8,19799421164131219183476964934824046362624)] orbit.val

/-- Exact candidate at original node685, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(4,573072927834748151940242335674457391104),(7,891697619326329830632364828596149157888),(8,20313300935778983679083367711362558984192)] orbit.val

/-- Exact candidate at original node685, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,379024741616517206356280909632030900224),(3,7674487986607950150190910110421636612096),(6,13724558754715594305108783855579498020864)] orbit.val

/-- Exact candidate at original node685, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(4,573026624306804253676337133500913156096),(7,903219555383498749132348782922315071488),(8,20301825303249758658847288959209937305600)] orbit.val

/-- Exact candidate at original node685, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(4,574817007710657375452647274781343744000),(7,1469938701890477269994688640746795302912),(8,19733315773338927016208638960105026486272)] orbit.val

/-- Exact candidate at original node685, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,385902745813959319866116002978650390528),(3,7712680823072970973836979222964808450048),(6,13679487914053131367952879649689706692608)] orbit.val

/-- Exact candidate at original node685, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(4,576885708631756758207039089357099106304),(7,946997141854164063975856512494372651008),(8,20254188632454140839473079273781693775872)] orbit.val

/-- Exact candidate at original node685, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(4,574164990619222673760258662269569728512),(7,1351628243036911171827587672417545224192),(8,19852278249283927816068128540946050580480)] orbit.val

/-- Exact candidate at original node685, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,373572624131519854261354337626100858880),(3,7641465105885805938865316276023569940480),(6,13763033752922735868529304261983494733824)] orbit.val

/-- Exact candidate at original node685, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(4,575943888558992350335482401363748454400),(7,1402708107268870993197662404864120979456),(8,19799419487112198318122830069405296099328)] orbit.val

/-- Exact candidate at original node685, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(4,573072816608311502227395396537944113152),(7,891695031940308622742345434429632020480),(8,20313303634391441536686234044665589399552)] orbit.val

/-- Exact candidate at original node685, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,379024937143349567021606943633533042688),(3,7674489452980958209048612480797229711360),(6,13724557092815753885585755451202402779136)] orbit.val

/-- Exact candidate at original node685, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(4,576214539236276748153596442805350170624),(7,940199782188881313794268492247030824960),(8,20261657161514903599708109940580784537600)] orbit.val

/-- Exact candidate at original node685, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(4,574102011944866158438361668000394772480),(7,1393452918939408289752949907724489981952),(8,19810516552055787213464663299908280778752)] orbit.val

/-- Exact candidate at original node685, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,378178310376956096440998932621920567296),(3,7662825118747495589762546111722096164864),(6,13737068053815609975452429831289148801024)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked68500 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 685 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked68501 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 685 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked68502 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 685 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked68510 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 685 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked68511 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 685 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked68512 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 685 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked68520 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 685 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked68521 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 685 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked68522 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 685 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked68530 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 685 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked68531 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 685 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked68532 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 685 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked68540 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 685 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked68541 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 685 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked68542 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 685 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked68550 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 685 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked68551 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 685 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked68552 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 685 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 685 1 :=
  RootFineParent3CacheTable.single 685 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 685 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 685 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 685 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 685 0 0) checked68500 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 685 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 685 0 1) checked68501 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 685 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 685 0 2) checked68502 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 685 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 685 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 685 1 0) checked68510 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 685 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 685 1 1) checked68511 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 685 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 685 1 2) checked68512 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 685 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 685 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 685 2 0) checked68520 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 685 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 685 2 1) checked68521 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 685 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 685 2 2) checked68522 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 685 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 685 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 685 3 0) checked68530 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 685 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 685 3 1) checked68531 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 685 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 685 3 2) checked68532 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 685 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 685 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 685 4 0) checked68540 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 685 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 685 4 1) checked68541 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 685 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 685 4 2) checked68542 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 685 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 685 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 685 5 0) checked68550 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 685 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 685 5 1) checked68551 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 685 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 685 5 2) checked68552 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block685
