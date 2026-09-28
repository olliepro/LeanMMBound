import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block601
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node601, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,757960020945561627622910202319107784704),(3,7181651290668448030711984068921466552320),(6,13838460171326052003321080604392591196160)] orbit.val

/-- Exact candidate at original node601, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(10,11308780329278234472047483646115840),(13,757959601501270840976777495764338212864),(16,21020100572658461542444725332385181204480)] orbit.val

/-- Exact candidate at original node601, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(1,21778071482940061661655974875633165533184)] orbit.val

/-- Exact candidate at original node601, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,757959974554131529054564754031705587712),(3,7181651315227567596443362989087913934848),(6,13838460193158362536158047132513546010624)] orbit.val

/-- Exact candidate at original node601, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(10,11865174955815127207361444826841088),(13,757959598281968926377619126580655685632),(16,21020100019483136920151148387607683006464)] orbit.val

/-- Exact candidate at original node601, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(1,21778071482940061661655974875633165533184)] orbit.val

/-- Exact candidate at original node601, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,757961045778091773331646144109049020416),(3,7181668492715410945499706899781388337152),(6,13838441944446558942824621831742728175616)] orbit.val

/-- Exact candidate at original node601, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(10,12068375385623586667204486673465344),(13,757960564175090488292977770206374920192),(16,21020098850389585549776329900940117147648)] orbit.val

/-- Exact candidate at original node601, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(1,21778071482940061661655974875633165533184)] orbit.val

/-- Exact candidate at original node601, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,757959188689334022949269418015174164480),(3,7181671494864042713758847259867994914816),(6,13838440799386684924947858197749996453888)] orbit.val

/-- Exact candidate at original node601, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(10,12071945604696885703917295747727360),(13,757958726186194078981162612150438461440),(16,21020100684808262885789108346186979344384)] orbit.val

/-- Exact candidate at original node601, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(1,21778071482940061661655974875633165533184)] orbit.val

/-- Exact candidate at original node601, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,757959129008339567082079640722169921536),(3,7181671510127748560066592773780422000640),(6,13838440843803973534507302461130573611008)] orbit.val

/-- Exact candidate at original node601, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(10,12964520180062273448203962699218944),(13,757958678974287843601852886102650650624),(16,21020099839445593755780673785567815663616)] orbit.val

/-- Exact candidate at original node601, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(1,21778071482940061661655974875633165533184)] orbit.val

/-- Exact candidate at original node601, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,757960012501728866654475068121016172544),(3,7181651306426030543778445867223584079872),(6,13838460164012302251223053940288565280768)] orbit.val

/-- Exact candidate at original node601, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(10,12072505153594642695801550151876608),(13,757959532354716173157821687788965199872),(16,21020099878080191893855457386294048456704)] orbit.val

/-- Exact candidate at original node601, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(1,21778071482940061661655974875633165533184)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked60100 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 601 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked60101 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 601 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked60102 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 601 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked60110 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 601 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked60111 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 601 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked60112 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 601 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked60120 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 601 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked60121 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 601 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked60122 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 601 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked60130 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 601 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked60131 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 601 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked60132 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 601 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked60140 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 601 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked60141 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 601 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked60142 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 601 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked60150 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 601 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked60151 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 601 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked60152 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 601 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 601 1 :=
  RootFineParent3CacheTable.single 601 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 601 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 601 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 601 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 601 0 0) checked60100 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 601 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 601 0 1) checked60101 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 601 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 601 0 2) checked60102 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 601 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 601 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 601 1 0) checked60110 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 601 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 601 1 1) checked60111 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 601 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 601 1 2) checked60112 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 601 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 601 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 601 2 0) checked60120 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 601 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 601 2 1) checked60121 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 601 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 601 2 2) checked60122 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 601 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 601 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 601 3 0) checked60130 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 601 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 601 3 1) checked60131 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 601 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 601 3 2) checked60132 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 601 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 601 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 601 4 0) checked60140 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 601 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 601 4 1) checked60141 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 601 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 601 4 2) checked60142 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 601 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 601 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 601 5 0) checked60150 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 601 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 601 5 1) checked60151 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 601 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 601 5 2) checked60152 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block601
