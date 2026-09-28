import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block804
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node804, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,5829048726277675549106133146796032),(3,132383297309178904559288484651597824),(6,21777933270594026205075866481015367139328)] orbit.val

/-- Exact candidate at original node804, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(9,141227116268408738116419753810591744),(11,454005204647142634043944960),(12,6288812551645229304858133252382720),(15,21777923967010787602483906455112058613760)] orbit.val

/-- Exact candidate at original node804, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,128214389385322444816586165452800),(3,2886555843566835563208549846745088),(6,21778068468169828709497966850497153335296)] orbit.val

/-- Exact candidate at original node804, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,675223943300693227589313124174137393152),(3,7255986442059776465900226891088350150656),(6,13846861097579591968166434860370677989376)] orbit.val

/-- Exact candidate at original node804, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,1871765339399494975647475826688),(9,478526899966868881530191528913583210496),(11,57515956867741642658492872918485697280),(12,1215259951530680631650975661406469224960),(15,20026768672703005166416819836747151573760)] orbit.val

/-- Exact candidate at original node804, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,675248100062208948268729058656931282944),(3,7256275251004283508364688587130750894080),(6,13846548131873569205022557229845483356160)] orbit.val

/-- Exact candidate at original node804, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,675174922653350439433668096167530987520),(3,7255868123370027227634569054042537852928),(6,13847028436916683994587737725423096692736)] orbit.val

/-- Exact candidate at original node804, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,1604370290913852836269264994304),(9,478525673544623721661094707450810990592),(11,57508714157449486692658463978189646848),(12,1215183716665205865464970651886547576832),(15,20026853376968412296923398216048352324608)] orbit.val

/-- Exact candidate at original node804, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,675206526664570413723565556656557260800),(3,7256326091403178686352363055592819916800),(6,13846538864872312561580046263383788355584)] orbit.val

/-- Exact candidate at original node804, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,673637563332839687529443965058758475776),(3,7251822301520812562546886076934918242304),(6,13852611618086409411579644833639488815104)] orbit.val

/-- Exact candidate at original node804, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,1406299884628191992285405118464),(9,478403629888875530018483080398133788672),(11,57284738440436043661709050829276006400),(12,1212557565314420392019648023289906163712),(15,20029825547890029811327942728830444455936)] orbit.val

/-- Exact candidate at original node804, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,673664658057816507032736180835738189824),(3,7252178374298852723531913425163137318912),(6,13852228450583392431091325269634290024448)] orbit.val

/-- Exact candidate at original node804, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,674700121960500992574575804048813850624),(3,7255595593956891664089276159402312728576),(6,13847775767022669004992122912182038953984)] orbit.val

/-- Exact candidate at original node804, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,1109194275199700726309615304704),(9,478512785217177197324231662979409510400),(11,57432229022292673904643737925662892544),(12,1214379925605981960237827485725896293376),(15,20027746541985415554989571262692581532160)] orbit.val

/-- Exact candidate at original node804, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,674724272864129456389388362852698423296),(3,7255884430700535219712421223435700535296),(6,13847462779375396985554165289344766574592)] orbit.val

/-- Exact candidate at original node804, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,675628845196590038626325927242699374592),(3,7256278644378423892847708265726047420416),(6,13846163993365047730181940682664418738176)] orbit.val

/-- Exact candidate at original node804, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,1218132998656814190500738236416),(9,478538334685314236344969702434934882304),(11,57580779995863712302128012607100389376),(12,1215942008668629957608302844020083978240),(15,20026010358372120756743760126070308046848)] orbit.val

/-- Exact candidate at original node804, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,675655749634022340158542915672020615168),(3,7256629735899976855556297239214514241536),(6,13845785997406062465941134720746630676480)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked80400 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 804 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked80401 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 804 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked80402 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 804 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked80410 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 804 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked80411 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 804 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked80412 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 804 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked80420 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 804 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked80421 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 804 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked80422 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 804 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked80430 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 804 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked80431 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 804 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked80432 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 804 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked80440 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 804 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked80441 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 804 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked80442 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 804 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked80450 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 804 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked80451 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 804 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked80452 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 804 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 804 1 :=
  RootFineParent3CacheTable.single 804 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 804 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 804 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 804 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 804 0 0) checked80400 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 804 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 804 0 1) checked80401 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 804 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 804 0 2) checked80402 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 804 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 804 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 804 1 0) checked80410 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 804 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 804 1 1) checked80411 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 804 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 804 1 2) checked80412 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 804 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 804 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 804 2 0) checked80420 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 804 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 804 2 1) checked80421 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 804 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 804 2 2) checked80422 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 804 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 804 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 804 3 0) checked80430 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 804 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 804 3 1) checked80431 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 804 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 804 3 2) checked80432 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 804 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 804 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 804 4 0) checked80440 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 804 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 804 4 1) checked80441 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 804 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 804 4 2) checked80442 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 804 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 804 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 804 5 0) checked80450 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 804 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 804 5 1) checked80451 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 804 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 804 5 2) checked80452 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block804
