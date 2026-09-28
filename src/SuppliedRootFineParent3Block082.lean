import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block082
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node82, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,627417707711581460805252500264547516416),(3,7121348177704270161289559254507582390272),(6,14029305597524210039561163120861035626496)] orbit.val

/-- Exact candidate at original node82, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,1011753538827469874111755438784512),(9,333399767510030447584111938253497565184),(11,50945527389991609632048511551479496704),(12,1161522431018436824912304983525585551360),(15,20232202745268063952057635330547164135424)] orbit.val

/-- Exact candidate at original node82, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,629196269016145146376747300417622245376),(3,7452953966218250370919194153146392772608),(6,13695921247705666144360033422069150515200)] orbit.val

/-- Exact candidate at original node82, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,635816802026475291996958789081143181312),(3,7264394312702684506332638643737740705792),(6,13877860368210901863326377442814281646080)] orbit.val

/-- Exact candidate at original node82, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,1871765339399494975647475826688),(9,365353663257897191989230879048372060160),(11,51279397910096521643952718880091755520),(12,1158639368689520945467006588074410727424),(15,20202799051210781663156289713982815163392)] orbit.val

/-- Exact candidate at original node82, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,640818742341715404519401398474211590144),(3,7333634186581027333007866299863537811456),(6,13803618554017318924128707177295416131584)] orbit.val

/-- Exact candidate at original node82, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,633611920686787066178543509568126713856),(3,7229243919399531490944488244453358698496),(6,13915215642853743104532943121611680120832)] orbit.val

/-- Exact candidate at original node82, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,974338039080108540683204308238336),(9,174600577760448099634538819631448064000),(11,51143358341033255583371886325942187008),(12,1172608126547757832869605683560285476864),(15,20379718445952783393459917802911181566976)] orbit.val

/-- Exact candidate at original node82, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,634666841867267029638476702671020490752),(3,7402757002726781771964884277672137457664),(6,13740647638346012860052613895290007584768)] orbit.val

/-- Exact candidate at original node82, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,628861114260120001254885916686982053888),(3,7133720903901366254055878132399077326848),(6,14015489464778575406345210826547106152448)] orbit.val

/-- Exact candidate at original node82, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,501583593357493238262527556583424),(9,341080468122012828040548432116491223040),(11,51127315497504164952613089252646475776),(12,1164596124100701740098344045768941981696),(15,20221267073636249571071231045967529269248)] orbit.val

/-- Exact candidate at original node82, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,631100418148948920947405757521502142464),(3,7472556029175836439204717541976486969344),(6,13674415035615276301503851576135176421376)] orbit.val

/-- Exact candidate at original node82, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,404613481947973953953638290468896768),(3,9189716848383885668341688404816166912),(6,21768477152609729802033679548937880469504)] orbit.val

/-- Exact candidate at original node82, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(9,9594314053896223098115472321599766528),(11,158388398900025532014224384),(12,2346990287864707295591367171192832),(15,21768474821895719185451663786412380349440)] orbit.val

/-- Exact candidate at original node82, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,418235657515140168148802600960),(3,33575597821261402180581148590080),(6,21778071448946228182879432526903214342144)] orbit.val

/-- Exact candidate at original node82, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,654382910643108677358780104359052050432),(3,7075986695198276385211969243021104381952),(6,14047701877098676599085225528253009100800)] orbit.val

/-- Exact candidate at original node82, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,307850928969488366761914212024320),(9,9422956942792614717998253364740096),(11,74459941610368438196398894141739614720),(12,1394505258441079294656813217671546960896),(15,20309096552080742166699678003652302193152)] orbit.val

/-- Exact candidate at original node82, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,879592977053070183558819176100279615488),(3,6850782397890955318469643988274146967552),(6,14047696107996036159627511711258738950144)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked08200 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 82 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked08201 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 82 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked08202 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 82 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked08210 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 82 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked08211 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 82 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked08212 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 82 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked08220 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 82 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked08221 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 82 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked08222 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 82 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked08230 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 82 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked08231 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 82 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked08232 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 82 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked08240 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 82 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked08241 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 82 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked08242 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 82 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked08250 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 82 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked08251 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 82 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked08252 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 82 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 82 1 :=
  RootFineParent3CacheTable.single 82 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 82 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 82 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 82 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 82 0 0) checked08200 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 82 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 82 0 1) checked08201 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 82 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 82 0 2) checked08202 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 82 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 82 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 82 1 0) checked08210 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 82 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 82 1 1) checked08211 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 82 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 82 1 2) checked08212 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 82 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 82 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 82 2 0) checked08220 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 82 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 82 2 1) checked08221 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 82 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 82 2 2) checked08222 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 82 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 82 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 82 3 0) checked08230 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 82 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 82 3 1) checked08231 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 82 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 82 3 2) checked08232 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 82 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 82 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 82 4 0) checked08240 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 82 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 82 4 1) checked08241 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 82 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 82 4 2) checked08242 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 82 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 82 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 82 5 0) checked08250 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 82 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 82 5 1) checked08251 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 82 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 82 5 2) checked08252 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block082
