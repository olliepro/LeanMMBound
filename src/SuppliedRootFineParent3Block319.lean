import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block319
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node319, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13959930513719260246190837493542158336),(9,3535343753657041787681416196014213169152),(11,63021700347705267641989862559874783232),(12,1903765139257997327861990396088452960256),(15,16261980959163598018224387583477082462208)] orbit.val

/-- Exact candidate at original node319, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,508648676129476488732329423526556598272),(3,7445699068314767765110706023916332122112),(6,13823723738495817407812939428190276812800)] orbit.val

/-- Exact candidate at original node319, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,505285154364771251572390299906498101248),(3,7455197965005440159574167684348997795840),(6,13817588363569850250509416891377669636096)] orbit.val

/-- Exact candidate at original node319, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,12232106687049993961997905033175236608),(9,725684923033012473853552961099497734144),(11,75515730721942900287666335740369483264),(12,2234508950803548624048010896547387184128),(15,18730129771694507669504746777212735895040)] orbit.val

/-- Exact candidate at original node319, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,629344177992366828180490592453933400064),(3,7355407311855351518902213826679429660672),(6,13793319993092343314573270456499802472448)] orbit.val

/-- Exact candidate at original node319, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,633536281610098510737861804776824504320),(3,7485592321670628753872773671398135562240),(6,13658942879659334397045339399458205466624)] orbit.val

/-- Exact candidate at original node319, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13240903678440439348106724391558053888),(9,3486068806318119401957336089136593895424),(11,59442101931209578702118979264622331904),(12,1787307113374246146594660149345695363072),(15,16432012557638046095053752933494695888896)] orbit.val

/-- Exact candidate at original node319, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,659503013544421602439990825643887558656),(3,7245575443541602122208977860107649941504),(6,13872993025854037937007006189881628033024)] orbit.val

/-- Exact candidate at original node319, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,469307273380437854374161262399757221888),(3,7532189811125994788978282312761981534208),(6,13776574398433629018303531300471426777088)] orbit.val

/-- Exact candidate at original node319, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14353290046404319470294941382828097536),(9,3419735268443385319356351135863948705792),(11,70463412505018711738113118507868350464),(12,1465856521249095890677929662284319698944),(15,16807662990696157420413286017594200680448)] orbit.val

/-- Exact candidate at original node319, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,735626740575277652551604154076162424832),(3,7295726653833661064473631030644825915392),(6,13746718088531122944630739690912177192960)] orbit.val

/-- Exact candidate at original node319, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,726196261632472022618716701209575555072),(3,7310362921770178087894711866909672865792),(6,13741512299537411551142546307513917112320)] orbit.val

/-- Exact candidate at original node319, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,558672436209177835019775569297408),(9,3437015321371719249537234787396642406400),(11,59788987999096195852456776750954788864),(12,1799348450989098061268974576956847525888),(15,16481918163907711945819473714753151514624)] orbit.val

/-- Exact candidate at original node319, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,470708478291888855297550004074080894976),(3,7506634724294242886656956264903293796352),(6,13800728280353929919701468606655790841856)] orbit.val

/-- Exact candidate at original node319, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,657311783945282991409699406739171966976),(3,7236093542883407724187412974877028646912),(6,13884666156111370946058862494016964919296)] orbit.val

/-- Exact candidate at original node319, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14353304693710864294914353989265915904),(9,3419736109757339538015068999507964329984),(11,70462953978535629200725146919801702400),(12,1465868919943575321491624547605909893120),(15,16807650194566900308653641827610223691776)] orbit.val

/-- Exact candidate at original node319, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,735623238679008879091550968258326691840),(3,7295726156906304377355471110714014302208),(6,13746722087354748405208952796660824539136)] orbit.val

/-- Exact candidate at original node319, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,726192823634348501204135934584288182272),(3,7310362351090673436019452539589284069376),(6,13741516308215039724432386401459593281536)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked31900 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 319 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked31901 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 319 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked31902 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 319 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked31910 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 319 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked31911 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 319 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked31912 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 319 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked31920 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 319 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked31921 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 319 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked31922 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 319 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked31930 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 319 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked31931 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 319 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked31932 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 319 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked31940 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 319 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked31941 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 319 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked31942 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 319 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked31950 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 319 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked31951 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 319 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked31952 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 319 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 319 1 :=
  RootFineParent3CacheTable.single 319 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 319 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 319 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 319 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 319 0 0) checked31900 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 319 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 319 0 1) checked31901 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 319 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 319 0 2) checked31902 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 319 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 319 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 319 1 0) checked31910 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 319 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 319 1 1) checked31911 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 319 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 319 1 2) checked31912 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 319 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 319 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 319 2 0) checked31920 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 319 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 319 2 1) checked31921 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 319 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 319 2 2) checked31922 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 319 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 319 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 319 3 0) checked31930 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 319 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 319 3 1) checked31931 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 319 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 319 3 2) checked31932 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 319 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 319 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 319 4 0) checked31940 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 319 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 319 4 1) checked31941 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 319 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 319 4 2) checked31942 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 319 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 319 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 319 5 0) checked31950 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 319 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 319 5 1) checked31951 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 319 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 319 5 2) checked31952 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block319
