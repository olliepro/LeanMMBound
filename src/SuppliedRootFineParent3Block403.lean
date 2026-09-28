import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block403
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node403, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,726290167661806927219943986665705439232),(3,7293704726621059643562516689616449306624),(6,13758076588657195090873514199351010787328)] orbit.val

/-- Exact candidate at original node403, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,729672444827637786130771784721145790464),(3,7335125854761878400536233135902931550208),(6,13713273183350545474988969955009088192512)] orbit.val

/-- Exact candidate at original node403, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(9,3007330910761567485641956111579042807808),(11,67839864794677349865031445225430451200),(12,1317142997248074665354879313394757007360),(15,17385757710135742160794108005433935266816)] orbit.val

/-- Exact candidate at original node403, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,650240652669994203479266098864287907840),(3,7238613444742624264793191620786354388992),(6,13889217385527443193383517155982523236352)] orbit.val

/-- Exact candidate at original node403, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,444396965333846384925964228057028886528),(3,7560412294472662410833968771028817543168),(6,13773262223133552865896041876547319103488)] orbit.val

/-- Exact candidate at original node403, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(9,3069534606453216064565900866787725017088),(11,51331098889985607275289213185922530304),(12,1651097449617444471786528630174329407488),(15,17006108327979415518028256165485188578304)] orbit.val

/-- Exact candidate at original node403, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,726291442619307435330248268365728579584),(3,7293728692988613355713233940581546196992),(6,13758051347332140870612492666685890756608)] orbit.val

/-- Exact candidate at original node403, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,729671615091722330252693968557671710720),(3,7335102070734063151483965976763319713792),(6,13713297797114276179919314930312174108672)] orbit.val

/-- Exact candidate at original node403, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(9,3007330933821914537450019872399928852480),(11,67839901361924945741799994994938319360),(12,1317142235491518686529664110229527256064),(15,17385758412264703491934490898008771105280)] orbit.val

/-- Exact candidate at original node403, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,646206633185596708034022081514941972480),(3,5792694538833349809672287111701132738560),(6,15339170310921115143949665682417090822144)] orbit.val

/-- Exact candidate at original node403, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,776076640850652158559295017720383275008),(3,8969715405397708513708251759470849294336),(6,12032279436691700989388428098441932963840)] orbit.val

/-- Exact candidate at original node403, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,5496453774427088420552111554560),(9,3920509618277844357276606104314843234304),(11,65684111290956841387949588102431334400),(12,1152134136358011398038265350888184954880),(15,16639743611516795290526065411775594455040)] orbit.val

/-- Exact candidate at original node403, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,6343680791091925927838733679198208),(3,7626476088088091026543270923725365575680),(6,14151589051171179543186776113174120759296)] orbit.val

/-- Exact candidate at original node403, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,143539159654907819255262085120),(3,7625728871571254964262247763303393656832),(6,14152342611225267537738819293074509791232)] orbit.val

/-- Exact candidate at original node403, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,228295950284852688775796892893184),(9,753560054087994552043179900389031936),(11,41969450546492406814208360131435056128),(12,1457410254756431667571577036659226273792),(15,20277937989287099307865457523145222278144)] orbit.val

/-- Exact candidate at original node403, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,176784301114283723784658977030144),(3,4787397972358184267005708390093310394368),(6,16990673333797576280366542700880878108672)] orbit.val

/-- Exact candidate at original node403, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,731464020390877773372567060480),(3,4776697800235836602907196823042577661952),(6,17001373681972761038357900279218020810752)] orbit.val

/-- Exact candidate at original node403, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,424073691617757008490543590670336),(9,10703784766058456406981993700339482624),(11,67399133711561755270348392444635033600),(12,2005441483691190948803005937894364979200),(15,19694526656697558883418630061050235367424)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked40300 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 403 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked40301 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 403 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked40302 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 403 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked40310 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 403 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked40311 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 403 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked40312 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 403 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked40320 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 403 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked40321 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 403 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked40322 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 403 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked40330 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 403 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked40331 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 403 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked40332 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 403 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked40340 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 403 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked40341 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 403 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked40342 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 403 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked40350 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 403 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked40351 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 403 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked40352 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 403 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 403 1 :=
  RootFineParent3CacheTable.single 403 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 403 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 403 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 403 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 403 0 0) checked40300 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 403 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 403 0 1) checked40301 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 403 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 403 0 2) checked40302 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 403 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 403 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 403 1 0) checked40310 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 403 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 403 1 1) checked40311 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 403 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 403 1 2) checked40312 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 403 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 403 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 403 2 0) checked40320 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 403 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 403 2 1) checked40321 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 403 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 403 2 2) checked40322 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 403 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 403 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 403 3 0) checked40330 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 403 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 403 3 1) checked40331 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 403 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 403 3 2) checked40332 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 403 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 403 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 403 4 0) checked40340 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 403 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 403 4 1) checked40341 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 403 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 403 4 2) checked40342 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 403 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 403 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 403 5 0) checked40350 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 403 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 403 5 1) checked40351 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 403 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 403 5 2) checked40352 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block403
