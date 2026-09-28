import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block598
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node598, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,735103754733858951795828670374938148864),(3,7297869133062413141628143240507576811520),(6,13745098595143789568232002964750650572800)] orbit.val

/-- Exact candidate at original node598, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,733087450033831525378786588141409009664),(3,7301578468412795931059844501786173898752),(6,13743405564493434205217343785705582624768)] orbit.val

/-- Exact candidate at original node598, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13757607109959272749715829580869140480),(9,3400384592251334361882603511001053659136),(11,70820903191245166082838521948321449216),(12,1455441524019077233570753886660181423616),(15,16837666856368445627370063126442739860736)] orbit.val

/-- Exact candidate at original node598, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,675401005914751130110146809361581735936),(3,7720172651708480760766154143953753997312),(6,13382497825316829770779673922317829799936)] orbit.val

/-- Exact candidate at original node598, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,637156516592549168606764944927750094848),(3,6914617844627894648880509932652124438528),(6,14226297121719617844168699998053290999808)] orbit.val

/-- Exact candidate at original node598, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,10489934159828659163539235102542266368),(9,3237284367224714586874476357292948193280),(11,73805855018832521873019976874979481600),(12,1923080965039654993896182804502323679232),(15,16533410361497030899848756501860371912704)] orbit.val

/-- Exact candidate at original node598, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,735106168076283949295921031083408228352),(3,7297869528789152408470130906597041373184),(6,13745095786074625303889922937952715931648)] orbit.val

/-- Exact candidate at original node598, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,733089850941767630778571594497538392064),(3,7301578881550543047929368227322458537984),(6,13743402750447750982948035053813168603136)] orbit.val

/-- Exact candidate at original node598, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13757597404509364752334474371735224320),(9,3400384018208634624937486998077957996544),(11,70821232062156659049609742665848954880),(12,1455433004107680103068593848402515640320),(15,16837675631157080909847949812115107717120)] orbit.val

/-- Exact candidate at original node598, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,471470636124717674778072426213294473216),(3,7523441141108088803325042570284375212032),(6,13783159705707255183552859879135495847936)] orbit.val

/-- Exact candidate at original node598, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,657042811882763186154486774991712944128),(3,7250121611906820561833219235102167400448),(6,13870907059150477913668268865539285188608)] orbit.val

/-- Exact candidate at original node598, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,11138753018316586604563082428094087168),(9,3467736981943756534528215195896432820224),(11,59188387615377550067900703451008199680),(12,1782800401611023370750636258015717107712),(15,16457206958751587619704659635841913318400)] orbit.val

/-- Exact candidate at original node598, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,507271590895050230069305277547292917760),(3,7447040805092399618968303349928327905280),(6,13823759086952611812618366248157544710144)] orbit.val

/-- Exact candidate at original node598, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,506647503393980224000894426900603076608),(3,7449378643745553262346452050372645093376),(6,13822045335800528175308628398359917363200)] orbit.val

/-- Exact candidate at original node598, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13147186972715508662550069266287165440),(9,3516454911140406560570927522601630695424),(11,63227091760793048154569477950183014400),(12,1909987873162128027567672356314699857920),(15,16275254419904018516700255449500364800000)] orbit.val

/-- Exact candidate at original node598, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,507265221464036653816315107453352017920),(3,7447099691158523783194543455609573867520),(6,13823706570317501224645116312570239647744)] orbit.val

/-- Exact candidate at original node598, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,506643434551011176785837127363637280768),(3,7449508274722401918269079816352754040832),(6,13821919773666648566601057931916774211584)] orbit.val

/-- Exact candidate at original node598, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13403627405613591800469839055272542208),(9,3516316932576871642956313282133643755520),(11,62672078259120388259130192023899215872),(12,1897909347883594001432329517900041015296),(15,16287769496814862037207732044520309004288)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked59800 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 598 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked59801 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 598 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked59802 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 598 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked59810 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 598 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked59811 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 598 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked59812 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 598 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked59820 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 598 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked59821 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 598 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked59822 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 598 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked59830 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 598 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked59831 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 598 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked59832 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 598 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked59840 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 598 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked59841 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 598 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked59842 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 598 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked59850 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 598 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked59851 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 598 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked59852 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 598 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 598 1 :=
  RootFineParent3CacheTable.single 598 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 598 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 598 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 598 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 598 0 0) checked59800 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 598 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 598 0 1) checked59801 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 598 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 598 0 2) checked59802 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 598 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 598 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 598 1 0) checked59810 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 598 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 598 1 1) checked59811 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 598 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 598 1 2) checked59812 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 598 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 598 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 598 2 0) checked59820 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 598 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 598 2 1) checked59821 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 598 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 598 2 2) checked59822 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 598 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 598 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 598 3 0) checked59830 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 598 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 598 3 1) checked59831 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 598 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 598 3 2) checked59832 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 598 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 598 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 598 4 0) checked59840 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 598 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 598 4 1) checked59841 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 598 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 598 4 2) checked59842 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 598 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 598 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 598 5 0) checked59850 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 598 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 598 5 1) checked59851 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 598 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 598 5 2) checked59852 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block598
