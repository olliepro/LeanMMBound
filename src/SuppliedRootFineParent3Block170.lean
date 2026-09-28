import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block170
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node170, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,732291901175780322387090219660142968832),(3,7297565576601180181996942948724610433024),(6,13748214005163101157271941707248412131328)] orbit.val

/-- Exact candidate at original node170, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,732075297640467218804930918097201659904),(3,7297911295663365179356496829376060456960),(6,13748084889636229263494547128159903416320)] orbit.val

/-- Exact candidate at original node170, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,10080863811262785406969880037413617664),(9,3299840377120938792982752859243478515712),(11,69850475412862617807481973565213907968),(12,1410922686915090249522371933138547886080),(15,16987377079679907215936398229648511605760)] orbit.val

/-- Exact candidate at original node170, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,657450744031641483511467561013064237056),(3,7244711372062827203672106397742080720896),(6,13875909366845592974472400916878020575232)] orbit.val

/-- Exact candidate at original node170, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,460998797000276294132979495437590331392),(3,7523655738378869013552040565305444925440),(6,13793416947560916353970954814890130276352)] orbit.val

/-- Exact candidate at original node170, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,12602792065409660746713266666805919744),(9,3365075318249780521912375583052637667328),(11,56340506442607286652456622325558196224),(12,1729615638027335501075846624709299834880),(15,16614437228154928691268582778878863915008)] orbit.val

/-- Exact candidate at original node170, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,732075155790402820735672374208761954304),(3,7297905421783422751377441669767105609728),(6,13748090905366236089542860831657297969152)] orbit.val

/-- Exact candidate at original node170, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,732292114164175000936284613213941661696),(3,7297571464305093105730281285544900034560),(6,13748207904470793554989408976874323836928)] orbit.val

/-- Exact candidate at original node170, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,10080863548819497078469261758799282176),(9,3299840369000052135270658255905223606272),(11,69850480554063415524295910522604980224),(12,1410922561835656371876513116018033881088),(15,16987377208001470241906038331428503783424)] orbit.val

/-- Exact candidate at original node170, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,462358136543831520263185588384897695744),(3,7522356349741066938089230555050495967232),(6,13793356996655163203303558732197771870208)] orbit.val

/-- Exact candidate at original node170, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,656094574246176701143796155294907629568),(3,7245203459755340152336454946847446794240),(6,13876773448938544808175723773490811109376)] orbit.val

/-- Exact candidate at original node170, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(9,3367504225921597117678740016931889217536),(11,56694129671203282053236844925397908480),(12,1741200052700737964815593229314965080064),(15,16612673074646523297108404784460913327104)] orbit.val

/-- Exact candidate at original node170, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,500432167888909994068433685885866737664),(3,7446318226867096577329103519193732481024),(6,13831321088184055090258437670553566314496)] orbit.val

/-- Exact candidate at original node170, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,500430642486966374973140385967112192000),(3,7446339761905983831796989473991145029632),(6,13831301078547111454885845015674908311552)] orbit.val

/-- Exact candidate at original node170, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,9809563329348246378466501846313730048),(9,3413881726363476380153861692393760227328),(11,59702149499841737359381304364989751296),(12,1854043536349911449665029533101245448192),(15,16440634507397483848099235843926856376320)] orbit.val

/-- Exact candidate at original node170, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,500236958345507556539815241937487659008),(3,7446703040079390548214702804545312915456),(6,13831131484515163556901456829150364958720)] orbit.val

/-- Exact candidate at original node170, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,500223549366343063054858103547353890816),(3,7446553258623035318501791670202303250432),(6,13831294674950683280099325101883508391936)] orbit.val

/-- Exact candidate at original node170, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,9809227857501120354695046382842019840),(9,3413535908100704098288276845818382647296),(11,59667848457971805104267233496272206848),(12,1853707229706711904156805633184926009344),(15,16441351268817172733751930116750742649856)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked17000 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 170 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked17001 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 170 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked17002 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 170 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked17010 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 170 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked17011 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 170 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked17012 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 170 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked17020 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 170 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked17021 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 170 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked17022 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 170 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked17030 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 170 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked17031 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 170 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked17032 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 170 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked17040 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 170 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked17041 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 170 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked17042 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 170 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked17050 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 170 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked17051 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 170 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked17052 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 170 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 170 1 :=
  RootFineParent3CacheTable.single 170 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 170 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 170 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 170 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 170 0 0) checked17000 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 170 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 170 0 1) checked17001 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 170 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 170 0 2) checked17002 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 170 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 170 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 170 1 0) checked17010 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 170 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 170 1 1) checked17011 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 170 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 170 1 2) checked17012 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 170 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 170 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 170 2 0) checked17020 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 170 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 170 2 1) checked17021 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 170 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 170 2 2) checked17022 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 170 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 170 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 170 3 0) checked17030 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 170 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 170 3 1) checked17031 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 170 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 170 3 2) checked17032 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 170 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 170 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 170 4 0) checked17040 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 170 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 170 4 1) checked17041 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 170 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 170 4 2) checked17042 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 170 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 170 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 170 5 0) checked17050 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 170 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 170 5 1) checked17051 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 170 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 170 5 2) checked17052 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block170
