import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block449
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node449, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,657170205166529084690533037775674933248),(3,7248011124434701885473646978123490656256),(6,13872890153338830691491794859733999943680)] orbit.val

/-- Exact candidate at original node449, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,11651746922893620107046283594895982592),(9,3437635518719779208300679532197573558272),(11,58408484996511723449097288889676300800),(12,1769085181807390317364916611438446443520),(15,16501290550493486792434235159512573248000)] orbit.val

/-- Exact candidate at original node449, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,468090582021073989890533636885599748096),(3,7524943581789118047371958528226986295296),(6,13785037319129869624393482710520579489792)] orbit.val

/-- Exact candidate at original node449, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,734200462278689138225662140531406274560),(3,7298092714033774506435337532766827839488),(6,13745778306627598016994975202334931419136)] orbit.val

/-- Exact candidate at original node449, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,12486099737249210688821804751552249856),(9,3370807350112207717856896895701970059264),(11,70566071028687289987947641799270429184),(12,1440873023906255955785018850569057541120),(15,16883338938155661487337289682811315253760)] orbit.val

/-- Exact candidate at original node449, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,733565685090149751402774897327526117376),(3,7299175115242602767641130466620387360768),(6,13745330682607309142612069511685252055040)] orbit.val

/-- Exact candidate at original node449, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,505264212450942743577377650870868508672),(3,7446489227649034217525265249138819203072),(6,13826318042840084700553331975623477821440)] orbit.val

/-- Exact candidate at original node449, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,12148327619266829023720819121559961600),(9,3489582821982703972863058776434698878976),(11,61895304313619025301427697018084128256),(12,1885091185641806219398625416143438615552),(15,16329353843382665615069142166915383948800)] orbit.val

/-- Exact candidate at original node449, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,506699459794585645592807296792321327104),(3,7444140830478278342902708679977358852096),(6,13827231192667197673160458898863485353984)] orbit.val

/-- Exact candidate at original node449, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,505099748190497786975282448960166297600),(3,7447443993612937065723216385690369523712),(6,13825527741136626808957476040982629711872)] orbit.val

/-- Exact candidate at original node449, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,12148080110487134461930176890259111936),(9,3484879153041190216854099287578706444288),(11,61718461434947599553905101345437106176),(12,1883643192148655254409805070207909396480),(15,16335682596204781456376235239610853474304)] orbit.val

/-- Exact candidate at original node449, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,504971112738164905251568307465181200384),(3,7447745785081514003141681934155185651712),(6,13825354585120382753262724634012798681088)] orbit.val

/-- Exact candidate at original node449, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,734199895995035877190287117651571376128),(3,7298092615182148179750173894546410176512),(6,13745778971762877604715513863435183980544)] orbit.val

/-- Exact candidate at original node449, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,12486101821940236845402187681677443072),(9,3370807484374232618592099990161386897408),(11,70565991959707910482145572655251262464),(12,1440875025855284239271601883983142053888),(15,16883336878928896656464725241151707876352)] orbit.val

/-- Exact candidate at original node449, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,733565120246445877075537286503749124096),(3,7299175014049806705648072576217349357568),(6,13745331348643809078932365012912067051520)] orbit.val

/-- Exact candidate at original node449, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,469285961034754895984864897733633245184),(3,7522923005230822008397080621388635570176),(6,13785862516674484757274029356510896717824)] orbit.val

/-- Exact candidate at original node449, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,3890973808917300640828990284091097088),(9,3439029355737145337712736291275245879296),(11,58357180207989192802388575497048944640),(12,1768931742023881964607298293743462129664),(15,16507862231162127865892722724833317482496)] orbit.val

/-- Exact candidate at original node449, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,659175118720553821204646663087372369920),(3,7245417255395678074395237110611324174336),(6,13873479108823829766056091101934468988928)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked44900 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 449 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked44901 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 449 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked44902 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 449 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked44910 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 449 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked44911 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 449 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked44912 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 449 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked44920 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 449 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked44921 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 449 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked44922 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 449 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked44930 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 449 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked44931 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 449 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked44932 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 449 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked44940 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 449 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked44941 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 449 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked44942 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 449 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked44950 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 449 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked44951 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 449 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked44952 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 449 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 449 1 :=
  RootFineParent3CacheTable.single 449 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 449 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 449 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 449 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 449 0 0) checked44900 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 449 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 449 0 1) checked44901 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 449 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 449 0 2) checked44902 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 449 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 449 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 449 1 0) checked44910 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 449 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 449 1 1) checked44911 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 449 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 449 1 2) checked44912 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 449 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 449 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 449 2 0) checked44920 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 449 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 449 2 1) checked44921 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 449 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 449 2 2) checked44922 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 449 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 449 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 449 3 0) checked44930 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 449 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 449 3 1) checked44931 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 449 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 449 3 2) checked44932 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 449 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 449 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 449 4 0) checked44940 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 449 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 449 4 1) checked44941 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 449 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 449 4 2) checked44942 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 449 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 449 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 449 5 0) checked44950 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 449 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 449 5 1) checked44951 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 449 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 449 5 2) checked44952 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block449
