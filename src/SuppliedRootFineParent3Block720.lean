import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block720
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node720, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13969820966338488591915848652178849792),(9,3535256829176737444720379914312208089088),(11,63178929674831518882423070214408128512),(12,1904974103800695187204448861619409088512),(15,16260691799321459022256807180834961377280)] orbit.val

/-- Exact candidate at original node720, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,507613713235607249449317016732642050048),(3,7453574008452931148087229787232607928320),(6,13816883761251523264119428071667915554816)] orbit.val

/-- Exact candidate at original node720, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,508760296782002033988681494840385470464),(3,7446804658534219050836512481780074283008),(6,13822506527623840576830780899012705779712)] orbit.val

/-- Exact candidate at original node720, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13967248482371012157430918375672905728),(9,3548807016382830195205859398277903941632),(11,63329208032199194853406831453866947584),(12,1906266858560363743547674339187895834624),(15,16245701151482297515891603388337825903616)] orbit.val

/-- Exact candidate at original node720, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,507643721984998739706080486798343012352),(3,7440366142390017081928850018528636436480),(6,13830061618565045840021044370306186084352)] orbit.val

/-- Exact candidate at original node720, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,507846870677043158647363112647648083968),(3,7436656579906256693545055510528910163968),(6,13833568032356761809463556252456607285248)] orbit.val

/-- Exact candidate at original node720, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14060762839368881411869359589694636032),(9,3484427174046878339646216923801936986112),(11,57406277714510230585114968628452163584),(12,1719130769108451218233863050457890357248),(15,16503046499230852991778910573155191390208)] orbit.val

/-- Exact candidate at original node720, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,674248622313861412578155591100738306048),(3,7242729419920305508751041886801079828480),(6,13861093440705894740326777397731347398656)] orbit.val

/-- Exact candidate at original node720, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,466588834235603928530009477690305806336),(3,7530906332815332515529794447530405134336),(6,13780576315889125217596170950412454592512)] orbit.val

/-- Exact candidate at original node720, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14354404241957277883957561590594666496),(9,3419033229047176945960570003109865062400),(11,70875455394768501311096065545881986560),(12,1466101507404104752401354307688198157312),(15,16807706886852054184098996937698625660416)] orbit.val

/-- Exact candidate at original node720, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,731791040172262533949590916844784451584),(3,7306608055169298540519622345432919703552),(6,13739672387598500587186761613355461378048)] orbit.val

/-- Exact candidate at original node720, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,735317474438048386441503133614645182464),(3,7297649286213613345249930332849295065088),(6,13745104722288399929964541409169225285632)] orbit.val

/-- Exact candidate at original node720, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13971778565488451978018236533682733056),(9,3312886997444792391593655963064461164544),(11,51772091546921843653961193408377678336),(12,1582059989333111093799740436252385553408),(15,16817380626049747880630599046374258403840)] orbit.val

/-- Exact candidate at original node720, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,468367153875473059742874250131489685504),(3,7249774370272539899937029309331624951808),(6,14059929958792048701976071316170050895872)] orbit.val

/-- Exact candidate at original node720, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,664026212374677245733504809242902659072),(3,7516289139583493675699653114501659623424),(6,13597756130981890740222816951888603250688)] orbit.val

/-- Exact candidate at original node720, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14354405895845170369225608855824629760),(9,3419033323650554748149330610900938260480),(11,70875402794024552053219915877976778752),(12,1466102904658914469665687197557614948352),(15,16807705445940722721418511542440810915840)] orbit.val

/-- Exact candidate at original node720, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,731790648385691838737030066780552298496),(3,7306607990398630987126796291600541548544),(6,13739672844155738835792148517252071686144)] orbit.val

/-- Exact candidate at original node720, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,735317079458639993059936485235683753984),(3,7297649225690508403497254071545700024320),(6,13745105177790913265098784318851781754880)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked72000 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 720 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked72001 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 720 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked72002 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 720 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked72010 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 720 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked72011 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 720 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked72012 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 720 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked72020 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 720 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked72021 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 720 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked72022 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 720 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked72030 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 720 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked72031 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 720 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked72032 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 720 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked72040 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 720 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked72041 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 720 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked72042 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 720 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked72050 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 720 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked72051 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 720 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked72052 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 720 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 720 1 :=
  RootFineParent3CacheTable.single 720 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 720 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 720 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 720 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 720 0 0) checked72000 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 720 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 720 0 1) checked72001 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 720 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 720 0 2) checked72002 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 720 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 720 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 720 1 0) checked72010 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 720 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 720 1 1) checked72011 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 720 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 720 1 2) checked72012 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 720 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 720 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 720 2 0) checked72020 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 720 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 720 2 1) checked72021 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 720 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 720 2 2) checked72022 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 720 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 720 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 720 3 0) checked72030 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 720 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 720 3 1) checked72031 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 720 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 720 3 2) checked72032 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 720 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 720 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 720 4 0) checked72040 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 720 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 720 4 1) checked72041 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 720 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 720 4 2) checked72042 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 720 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 720 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 720 5 0) checked72050 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 720 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 720 5 1) checked72051 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 720 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 720 5 2) checked72052 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block720
