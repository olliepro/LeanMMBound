import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block381
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node381, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(9,3746120166343323185406402173814827909120),(11,15364241873298799119945350025106850816),(12,1014422881516186861006931999978581325824),(15,17002164193207252816122695351814649447424)] orbit.val

/-- Exact candidate at original node381, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,7199350987924774872164327311278080),(3,3452877659665677609474039430682928742400),(6,18325186623923396127407063280622925512704)] orbit.val

/-- Exact candidate at original node381, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,98346252586737643998598030836986019840),(3,7085859135032641905344861569151842385920),(6,14593866095320682112312515275644337127424)] orbit.val

/-- Exact candidate at original node381, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,106413325776971288430328718295040),(9,3540569823975921358426040405852126445568),(11,63223134441700434053116985822413740032),(12,1907443904352535155762420588752262090752),(15,16266834513756578936443108464877644961792)] orbit.val

/-- Exact candidate at original node381, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,510238061697167888507011356865584955392),(3,7534833850013031366614830826339809886208),(6,13732999571229862406534132692427770691584)] orbit.val

/-- Exact candidate at original node381, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,509469017555894795297485510821130797056),(3,7412559212214948948588726939544209850368),(6,13856043253169217917769762425267824885760)] orbit.val

/-- Exact candidate at original node381, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13972315588829254133123008873367601152),(9,3536360742191755627414492923769919635456),(11,63265821367915958789213727828406089728),(12,1907639884071308886987868523303500156928),(15,16256832719720251934331276691857972049920)] orbit.val

/-- Exact candidate at original node381, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,511017763320157923901849159039398707200),(3,7563356870883216477728621808093365272576),(6,13703696848736687260025503908500401553408)] orbit.val

/-- Exact candidate at original node381, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,511430910889606877837715165594871922688),(3,7443799650874780002353657995687041695744),(6,13822840921175674781464601714351251914752)] orbit.val

/-- Exact candidate at original node381, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,224476350666519690777369939854491648),(9,3548620651437428241046461353461479899136),(11,51491488621249427740467263520389197824),(12,1594421206510368463445399130072580366336),(15,16583313660020349009732869758638861578240)] orbit.val

/-- Exact candidate at original node381, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,512052495756089919231067477157099864064),(3,7547192218101171806187403869713005019136),(6,13718826769082799936237503528763060649984)] orbit.val

/-- Exact candidate at original node381, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,515048024337336315708756533910846832640),(3,7485401641414328960778185245756529573888),(6,13777621817188396385169033095965789126656)] orbit.val

/-- Exact candidate at original node381, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13972439967140881213849988538176634880),(9,3536360718641184320049418574088980398080),(11,63265817735496155484200484690692474880),(12,1907639832445282361695533771546540503040),(15,16256832674150957943212972056768775522304)] orbit.val

/-- Exact candidate at original node381, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,511019074449681049544583330518097985536),(3,7563394136015346189591843228558435549184),(6,13703658272475034422519548316556631998464)] orbit.val

/-- Exact candidate at original node381, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,511429604140649508346447878832949035008),(3,7443761834628342064029342041856779747328),(6,13822880044171070089280184954943436750848)] orbit.val

/-- Exact candidate at original node381, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,799129909439970099616181458567168),(9,21770099981874087040746643045769453502464),(11,127110082237611506525107250481152),(12,6334134259885990880521151604420608),(15,7964240691723057336845167423398561792)] orbit.val

/-- Exact candidate at original node381, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,54242168224990482441366941294858862592),(3,21723753658405711065770429162329076662272),(6,75656309360113444178772009230008320)] orbit.val

/-- Exact candidate at original node381, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,400232280124121978794183307034624),(3,7895444583755505228872516866332950528),(6,21770175638124026032305123564583525548032)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked38100 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 381 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked38101 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 381 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked38102 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 381 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked38110 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 381 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked38111 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 381 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked38112 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 381 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked38120 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 381 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked38121 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 381 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked38122 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 381 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked38130 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 381 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked38131 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 381 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked38132 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 381 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked38140 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 381 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked38141 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 381 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked38142 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 381 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked38150 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 381 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked38151 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 381 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked38152 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 381 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 381 1 :=
  RootFineParent3CacheTable.single 381 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 381 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 381 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 381 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 381 0 0) checked38100 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 381 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 381 0 1) checked38101 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 381 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 381 0 2) checked38102 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 381 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 381 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 381 1 0) checked38110 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 381 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 381 1 1) checked38111 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 381 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 381 1 2) checked38112 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 381 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 381 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 381 2 0) checked38120 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 381 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 381 2 1) checked38121 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 381 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 381 2 2) checked38122 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 381 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 381 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 381 3 0) checked38130 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 381 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 381 3 1) checked38131 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 381 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 381 3 2) checked38132 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 381 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 381 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 381 4 0) checked38140 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 381 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 381 4 1) checked38141 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 381 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 381 4 2) checked38142 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 381 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 381 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 381 5 0) checked38150 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 381 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 381 5 1) checked38151 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 381 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 381 5 2) checked38152 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block381
