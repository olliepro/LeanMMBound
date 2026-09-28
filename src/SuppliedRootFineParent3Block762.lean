import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block762
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node762, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,690414149810773521696038184932333322240),(3,7258974773716955301538191161073262919680),(6,13828682559412332838421745529627569291264)] orbit.val

/-- Exact candidate at original node762, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,692633965431471545366157628377869058048),(3,7255728503940235131588931197495238721536),(6,13829709013568354984700886049760057753600)] orbit.val

/-- Exact candidate at original node762, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,1440962205728182639982580596736),(9,576949353377275530949222232550264537088),(11,60252521241542503722698698362092988416),(12,1238259264239797849560976238425087258624),(15,19902610342640483571694895066313140152320)] orbit.val

/-- Exact candidate at original node762, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,690914093488495766864058132387128672256),(3,7259348594947597209160956333109586952192),(6,13827808794503968685630960410136449908736)] orbit.val

/-- Exact candidate at original node762, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,693135211682173079328311445744764583936),(3,7256100970302358730845958166780858859520),(6,13828835300955529851481705263107542089728)] orbit.val

/-- Exact candidate at original node762, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,1886620619870919538946265317376),(9,576965531475907094455609089348729831424),(11,60334468383187018007347216576319170560),(12,1239096276788944189203211473015565234176),(15,19901675204405402740118887557746285979648)] orbit.val

/-- Exact candidate at original node762, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,9092474717886646855809259012096),(3,7255888840120810107742457409372508127232),(6,14522182633726776836026870610451398393856)] orbit.val

/-- Exact candidate at original node762, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,9427491323961938605083505721344),(3,7255888697734649873748349875973554962432),(6,14522182775777920463945686394576104849408)] orbit.val

/-- Exact candidate at original node762, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,1005207311899728783218088869888),(9,243136375475805827511287594090496),(11,22902518188032727879252334175853836288),(12,1107615191402913958737297131376484356096),(15,20647553529207532187333869115575144380416)] orbit.val

/-- Exact candidate at original node762, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,289491585862236124313841012942164721664),(3,14751929914717109708774651739100980183040),(6,6736649982360715828567482123590020628480)] orbit.val

/-- Exact candidate at original node762, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,291962217576298184777241477515095048192),(3,14749458576159092256987680391526503940096),(6,6736650689204671219891053006591566544896)] orbit.val

/-- Exact candidate at original node762, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(9,706883569472580703051798317891584),(11,5619196261917926460930017916801804288),(12,570617219026687299038793635334749892608),(15,21201834360767886963575548170583295944704)] orbit.val

/-- Exact candidate at original node762, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,690420046893403982165241757352134180864),(3,7258978532125924613049536423958321037312),(6,13828672903920733066441196694322710315008)] orbit.val

/-- Exact candidate at original node762, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,692639951513657198673679582135016488960),(3,7255733932660515481072989554682332446720),(6,13829697598765888981909305738815816597504)] orbit.val

/-- Exact candidate at original node762, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,2787840968470676379072827752448),(9,576949559756735360293538621533062168576),(11,60253492356892973703355247869665509376),(12,1238270154778093643301965143119812296704),(15,19902598273260498715886439484037797806080)] orbit.val

/-- Exact candidate at original node762, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,690747091610440722170513649521437704192),(3,7259225554748583360096986446476848660480),(6,13828098836581037579388474779634879168512)] orbit.val

/-- Exact candidate at original node762, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,692967726207946422913073022308093788160),(3,7255977266148907116584733473629330735104),(6,13829126490583208122158168379695741009920)] orbit.val

/-- Exact candidate at original node762, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,1787585416728089116954335379456),(9,576960143188381539966575436823053467648),(11,60307075350441330047686335273190961152),(12,1238816455981628290252257861214176780288),(15,19901987806632025084661366125368408944640)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked76200 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 762 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked76201 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 762 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked76202 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 762 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked76210 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 762 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked76211 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 762 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked76212 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 762 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked76220 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 762 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked76221 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 762 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked76222 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 762 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked76230 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 762 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked76231 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 762 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked76232 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 762 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked76240 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 762 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked76241 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 762 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked76242 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 762 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked76250 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 762 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked76251 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 762 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked76252 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 762 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 762 1 :=
  RootFineParent3CacheTable.single 762 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 762 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 762 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 762 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 762 0 0) checked76200 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 762 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 762 0 1) checked76201 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 762 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 762 0 2) checked76202 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 762 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 762 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 762 1 0) checked76210 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 762 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 762 1 1) checked76211 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 762 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 762 1 2) checked76212 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 762 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 762 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 762 2 0) checked76220 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 762 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 762 2 1) checked76221 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 762 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 762 2 2) checked76222 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 762 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 762 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 762 3 0) checked76230 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 762 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 762 3 1) checked76231 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 762 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 762 3 2) checked76232 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 762 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 762 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 762 4 0) checked76240 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 762 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 762 4 1) checked76241 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 762 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 762 4 2) checked76242 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 762 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 762 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 762 5 0) checked76250 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 762 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 762 5 1) checked76251 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 762 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 762 5 2) checked76252 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block762
