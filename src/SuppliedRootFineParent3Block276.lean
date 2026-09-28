import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block276
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node276, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,56613473876599010731686749011968),(9,21732858121697204388353803261089819918336),(11,1051237402455019210762831259303213056),(12,13256459907404108164827028357265100800),(15,30905607319524269327571023240028289024)] orbit.val

/-- Exact candidate at original node276, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,4296475350430221496050177570882191360),(3,40916452826338988680110629561634390016),(6,21732858554763292451479814068500648951808)] orbit.val

/-- Exact candidate at original node276, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,11494195605783765512352328865309261824),(3,21766576853267934281275024477238534864896),(6,434066343614868598069529321406464)] orbit.val

/-- Exact candidate at original node276, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,9220177412597512287448677220352),(9,6647950670962557930187265133396487045120),(11,188531275333601444179269954738688),(12,17583863255431961214450236647154568192),(15,15112536750970619024055303038870891960832)] orbit.val

/-- Exact candidate at original node276, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,1152907741496770598317420808503296),(3,107522047313252917188236735654152634368),(6,21670548282719067247697139822558204395520)] orbit.val

/-- Exact candidate at original node276, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,80249550170943542243266903995859337216),(3,6675224321012608801902833282475588845568),(6,15022597611756509317509874689161717350400)] orbit.val

/-- Exact candidate at original node276, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,5609660063436910847589457535998885888),(9,5192867311317389369501325509046631923712),(11,114599114841807583958164885654601921792),(12,2468080394932347297333157734728129451520),(15,13996915001785080500015737288667803350272)] orbit.val

/-- Exact candidate at original node276, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,1430402445336348703649694878093111459840),(3,12317460936227370876910341301151440306176),(6,8030208101376342081095938696388613767168)] orbit.val

/-- Exact candidate at original node276, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,1052881124778756861636517509014199730176),(3,17445326541147179063496737005959173373952),(6,3279863817014125736522720360659792429056)] orbit.val

/-- Exact candidate at original node276, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,12686291457779150331878647368276508672),(9,3282500229279762822144756506553103679488),(11,695007589650410882684735050439569129472),(12,4023442666633690701103928258818406449152),(15,13764434705918418105390676412453809766400)] orbit.val

/-- Exact candidate at original node276, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,1727371804154667922267901938285615775744),(3,6659087767344021607910555954269487366144),(6,13391611911441372131477516983078062391296)] orbit.val

/-- Exact candidate at original node276, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,3214889519596379228915403581838407499776),(3,7023979114054998332890870252553845604352),(6,11539202849288684099849701041240912429056)] orbit.val

/-- Exact candidate at original node276, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,5608551646588055818081960557344194560),(9,5093077331849334115228373823936289308672),(11,249068025216519512331143355081890643968),(12,3388692076600504565539082543887101362176),(15,13041625497627115412739293192170540023808)] orbit.val

/-- Exact candidate at original node276, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,1831368729271194623174592178191979249664),(3,12167802792573235070915403140154955661312),(6,7778899961095631967565979557286230622208)] orbit.val

/-- Exact candidate at original node276, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,2044162885570312665970066410693065703424),(3,16544371440182624689579901884853148188672),(6,3189537157187124306106006580086951641088)] orbit.val

/-- Exact candidate at original node276, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13048324090826146765492405286459146240),(9,3295670934107506337647626351724573229056),(11,117954987973224761851536441719051713536),(12,2249043808120385950745311362439110592512),(15,16102353428648118464646008314463970851840)] orbit.val

/-- Exact candidate at original node276, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,874969661844497127005077585803624841216),(3,7567367380784139791330141082174206509056),(6,13335734440311424743320756207655334182912)] orbit.val

/-- Exact candidate at original node276, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,1107875443651213595005368236638786813952),(3,9208591948842676270298195806885332910080),(6,11461604090446171796352410832109045809152)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked27600 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 276 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked27601 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 276 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked27602 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 276 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked27610 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 276 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked27611 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 276 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked27612 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 276 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked27620 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 276 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked27621 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 276 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked27622 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 276 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked27630 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 276 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked27631 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 276 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked27632 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 276 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked27640 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 276 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked27641 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 276 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked27642 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 276 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked27650 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 276 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked27651 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 276 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked27652 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 276 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 276 1 :=
  RootFineParent3CacheTable.single 276 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 276 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 276 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 276 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 276 0 0) checked27600 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 276 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 276 0 1) checked27601 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 276 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 276 0 2) checked27602 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 276 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 276 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 276 1 0) checked27610 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 276 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 276 1 1) checked27611 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 276 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 276 1 2) checked27612 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 276 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 276 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 276 2 0) checked27620 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 276 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 276 2 1) checked27621 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 276 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 276 2 2) checked27622 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 276 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 276 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 276 3 0) checked27630 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 276 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 276 3 1) checked27631 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 276 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 276 3 2) checked27632 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 276 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 276 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 276 4 0) checked27640 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 276 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 276 4 1) checked27641 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 276 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 276 4 2) checked27642 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 276 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 276 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 276 5 0) checked27650 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 276 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 276 5 1) checked27651 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 276 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 276 5 2) checked27652 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block276
