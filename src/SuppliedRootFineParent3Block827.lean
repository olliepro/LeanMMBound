import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block827
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node827, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,74334131066542154595076389741126483968),(3,13415071094434794417764969915527871856640),(6,8288666257438725089295928570364167192576)] orbit.val

/-- Exact candidate at original node827, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,71120749540168055956197180573267001344),(3,13337719506985220924282160799944408039424),(6,8369231226414672681417616895115490492416)] orbit.val

/-- Exact candidate at original node827, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,29710560942849126597578981376),(9,3385733230254555124821348672448499810304),(11,161609371618340671873330943038464),(12,2762806698235304030176084779346810880),(15,18389575284348189053520929118476796892160)] orbit.val

/-- Exact candidate at original node827, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,637097301085096424533139146353762369536),(3,7265162717111141854692436563872110870528),(6,13875811464743823382430399165407292293120)] orbit.val

/-- Exact candidate at original node827, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,637098103083809562616733619162196213760),(3,7265180917373189503424665286230199500800),(6,13875792462483062595614575970240769818624)] orbit.val

/-- Exact candidate at original node827, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,1544949169028154583074107031552),(9,370316935415604840411325350868250787840),(11,51315162232759741388948768390346427392),(12,1155948354819801144970245568056557332480),(15,20200491028926946765857300605243903953920)] orbit.val

/-- Exact candidate at original node827, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,25455349912441344554767739837424336896),(3,21752615693643086293462615405299782123520),(6,439384534023638591730495959072768)] orbit.val

/-- Exact candidate at original node827, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,181402545030011415651097373102284210176),(3,21596668498441336299694879913341781803008),(6,439468713946309997589189099520000)] orbit.val

/-- Exact candidate at original node827, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(9,153519420151858578650790193266688),(11,212032764345335366869202100009851904),(12,206433822942876617286815926776394893312),(15,21571425473713419557143711095966567521280)] orbit.val

/-- Exact candidate at original node827, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,9957979790273570731410208331923456),(3,229635500424780326980495884966428672),(6,21777831889459846607758262969539867181056)] orbit.val

/-- Exact candidate at original node827, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,9941510785924347354813383430897664),(3,229250995698644858544531783934803968),(6,21777832290433577092450075530465799831552)] orbit.val

/-- Exact candidate at original node827, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(9,471872972993522225966695380049461248),(11,15179615794566850677841920),(12,1149762768501958882228876234178560),(15,21777598460204284457855331384526204051456)] orbit.val

/-- Exact candidate at original node827, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,38900527763307279246340766649026609152),(3,883247147866182468826416648149794816000),(6,20855923807310571913583217460834344108032)] orbit.val

/-- Exact candidate at original node827, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,38616763613930555307969360088998608896),(3,878313369261495519833612050787916054528),(6,20861141350064635586514393464756250869760)] orbit.val

/-- Exact candidate at original node827, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,9903520314283042199192993792),(9,1839077806524211760357730385837137330176),(11,100286708162868826760116224),(12,775319283488147532283217163128832),(15,19938992901086562606128266295552911964160)] orbit.val

/-- Exact candidate at original node827, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,59682887577086234433870806825327132672),(3,1355570174159633835007383795660180422656),(6,20362818421203341592214720273147657977856)] orbit.val

/-- Exact candidate at original node827, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,59691233157136831325999383659799379968),(3,1355561149282269600969966212879474491392),(6,20362819100500655229360009279093891661824)] orbit.val

/-- Exact candidate at original node827, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,103986963299971943091526434816),(9,2830469237658525026820451156578145402880),(11,473331809136762437368865824768),(12,964187804755716529359370303684608),(15,18947601280516413106682259979224324186112)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked82700 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 827 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked82701 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 827 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked82702 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 827 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked82710 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 827 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked82711 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 827 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked82712 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 827 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked82720 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 827 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked82721 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 827 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked82722 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 827 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked82730 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 827 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked82731 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 827 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked82732 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 827 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked82740 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 827 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked82741 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 827 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked82742 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 827 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked82750 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 827 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked82751 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 827 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked82752 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 827 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 827 1 :=
  RootFineParent3CacheTable.single 827 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 827 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 827 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 827 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 827 0 0) checked82700 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 827 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 827 0 1) checked82701 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 827 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 827 0 2) checked82702 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 827 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 827 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 827 1 0) checked82710 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 827 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 827 1 1) checked82711 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 827 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 827 1 2) checked82712 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 827 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 827 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 827 2 0) checked82720 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 827 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 827 2 1) checked82721 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 827 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 827 2 2) checked82722 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 827 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 827 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 827 3 0) checked82730 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 827 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 827 3 1) checked82731 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 827 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 827 3 2) checked82732 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 827 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 827 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 827 4 0) checked82740 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 827 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 827 4 1) checked82741 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 827 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 827 4 2) checked82742 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 827 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 827 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 827 5 0) checked82750 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 827 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 827 5 1) checked82751 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 827 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 827 5 2) checked82752 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block827
