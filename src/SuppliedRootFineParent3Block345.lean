import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block345
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node345, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,735164872857029864671987899356330065920),(3,7299535481882653449532468253867827527680),(6,13743371128200378347451518722409007939584)] orbit.val

/-- Exact candidate at original node345, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,737351235289112682623964013456030433280),(3,7299329758546333978323573911820487884800),(6,13741390489104615000708436950356647215104)] orbit.val

/-- Exact candidate at original node345, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14348429170853102124673606880036126720),(9,3417893950155072125637158945304409538560),(11,71308132023410658506170244979980701696),(12,1466192218681152610820487751664674660352),(15,16808328752909573164567484326804064505856)] orbit.val

/-- Exact candidate at original node345, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,668510126407983774485395805645578436608),(3,6619109870906537975377339589424643571712),(6,14490451485625539911793239480562943524864)] orbit.val

/-- Exact candidate at original node345, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,511426972878810705564706608324599087104),(3,8238644019600061108309057284431987867648),(6,13028000490461189847782210982876578578432)] orbit.val

/-- Exact candidate at original node345, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,10828170485518732217677223505732567040),(9,2102768734959342465479765619421661364224),(11,64039540655790160994881209134156942848),(12,1936973288025682291077027333181266584576),(15,17663461748813728011886623490390348074496)] orbit.val

/-- Exact candidate at original node345, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,735164872681018831204293122706708103168),(3,7299535481677378950900265905848519229440),(6,13743371128581663879551415847077938200576)] orbit.val

/-- Exact candidate at original node345, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,737351235126896903966543560777324822528),(3,7299329758688742716352428280100807507968),(6,13741390489124422041337003034755033202688)] orbit.val

/-- Exact candidate at original node345, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14348429170853102124673606880036126720),(9,3417893950189734446737149593001585016832),(11,71308131999767544366818984769110956544),(12,1466192219213565984539683399610338855936),(15,16808328752366140583887649291372094577152)] orbit.val

/-- Exact candidate at original node345, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,472846804507011073750458827493888491520),(3,7524371261248298345488826780725486288896),(6,13780853417184752242416689267413790752768)] orbit.val

/-- Exact candidate at original node345, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,662133057509048484360963360073518678016),(3,7246838812910148037956336200973077708800),(6,13869099612520865139338675314586569146368)] orbit.val

/-- Exact candidate at original node345, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,65166574919627203004203284152975360),(9,3487325313566421682908297640178092081152),(11,59942104480160170394369550706663631872),(12,1794581634584629457876713084875292518400),(15,16436157263733930723273590396588964326400)] orbit.val

/-- Exact candidate at original node345, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,509009046581197051004701034788832673792),(3,7447687679936738441512424508814769782784),(6,13821374756422126169138849332029563076608)] orbit.val

/-- Exact candidate at original node345, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,509732942637232272458438162063636299776),(3,7448914477984342598124138156413998333952),(6,13819424062318486791073398557155530899456)] orbit.val

/-- Exact candidate at original node345, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13967407790398787714447734594171043840),(9,3534351640086455181936780926177207386112),(11,62694990265978325137770647349696029440),(12,1892061442584616348582239009908642232832),(15,16274996002212613018284736557603448840960)] orbit.val

/-- Exact candidate at original node345, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,508988996314850186162062424902329171968),(3,7447636096337246603054153097515980816384),(6,13821446390287964872439759353214855544832)] orbit.val

/-- Exact candidate at original node345, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,509702067251621516118169871979584159744),(3,7448554348146683248019367624663617241088),(6,13819815067541756897518437378989964132352)] orbit.val

/-- Exact candidate at original node345, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14004767226317649891574396093179363328),(9,3535043771015540875305983287440598630400),(11,63769614833504867104688484671368707840),(12,1915466453208208320181528027792321053184),(15,16249786876656489949172200679635697778432)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked34500 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 345 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked34501 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 345 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked34502 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 345 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked34510 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 345 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked34511 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 345 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked34512 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 345 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked34520 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 345 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked34521 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 345 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked34522 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 345 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked34530 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 345 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked34531 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 345 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked34532 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 345 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked34540 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 345 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked34541 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 345 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked34542 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 345 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked34550 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 345 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked34551 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 345 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked34552 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 345 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 345 1 :=
  RootFineParent3CacheTable.single 345 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 345 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 345 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 345 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 345 0 0) checked34500 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 345 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 345 0 1) checked34501 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 345 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 345 0 2) checked34502 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 345 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 345 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 345 1 0) checked34510 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 345 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 345 1 1) checked34511 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 345 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 345 1 2) checked34512 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 345 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 345 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 345 2 0) checked34520 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 345 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 345 2 1) checked34521 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 345 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 345 2 2) checked34522 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 345 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 345 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 345 3 0) checked34530 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 345 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 345 3 1) checked34531 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 345 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 345 3 2) checked34532 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 345 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 345 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 345 4 0) checked34540 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 345 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 345 4 1) checked34541 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 345 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 345 4 2) checked34542 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 345 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 345 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 345 5 0) checked34550 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 345 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 345 5 1) checked34551 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 345 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 345 5 2) checked34552 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block345
