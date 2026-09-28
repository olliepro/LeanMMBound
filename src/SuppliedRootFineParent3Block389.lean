import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block389
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node389, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,4364859721932302466537882636093751296),(9,8092303339531826816783005181955169845248),(11,433066568661781786972299634708110774272),(12,3976022751592272404152798801070839816192),(15,9272313963432248351281333375262951346176)] orbit.val

/-- Exact candidate at original node389, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,2596541175594813544963806166572133777408),(3,18772288723194368528309907251272750202880),(6,409241584150879588382261457788281552896)] orbit.val

/-- Exact candidate at original node389, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,2212265018021749050974111034740366639104),(3,11090967030413429349917961505216005144576),(6,8474839434504883260763902335676793749504)] orbit.val

/-- Exact candidate at original node389, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,11186368039745144428897597132227215360),(9,8151538280291363669226311359111903576064),(11,6755388688085156386134929767680),(12,1318299459497047312281220385672924628480),(15,12297047368356516847634389147581180345600)] orbit.val

/-- Exact candidate at original node389, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,10192341395751150998437266378981376),(3,21778061290598665910504976438366786551808)] orbit.val

/-- Exact candidate at original node389, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,1318309413072759092754879934466191523840),(3,12308223789575938899674783582055070433280),(6,8151538280291363669226311359111903576064)] orbit.val

/-- Exact candidate at original node389, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,6596656118646874915847842982971572224),(9,4859356119235930041366590676125226106880),(11,1124652063019249945216018265724980905472),(12,6408830983817118056334875200055851447296),(15,9378635660749116743822642890744135501312)] orbit.val

/-- Exact candidate at original node389, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,3302405447116369245000916227763887669248),(3,16304557479970890485335973288863906922496),(6,2171108555852801931319085359005370941440)] orbit.val

/-- Exact candidate at original node389, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,5411233316235877219917550437276734980096),(3,9831048865590739535034297835120538681344),(6,6535789301113444906704126603235891871744)] orbit.val

/-- Exact candidate at original node389, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,12666115629861120975554847831989682176),(9,4330269828405882590041751191130338230272),(11,1007287103296668719005304424406263600640),(12,5204109841568567136958348884997551543296),(15,11223738594039082094675015527267022476800)] orbit.val

/-- Exact candidate at original node389, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,3483348297609876817093452287602579210240),(3,12696077921564971948893130758121720905728),(6,5598645263765212895669391829908865417216)] orbit.val

/-- Exact candidate at original node389, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,3825366714628461525738168599419398651904),(3,9436451502861683790450812810717084778496),(6,8516253265449916345466993465496682102784)] orbit.val

/-- Exact candidate at original node389, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,6421642741733716850805667263523323904),(9,5074551174409664189518318991276320489472),(11,781683682560128723116881563202811325952),(12,5398534685467133615902051224345051669504),(15,10516880297761401416267917429545458724352)] orbit.val

/-- Exact candidate at original node389, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,3690760647110381745035043887484181151744),(3,16040162301236436566041182309622080339968),(6,2047148534593243350579748678526904041472)] orbit.val

/-- Exact candidate at original node389, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,3151146695709938978367207032062365138944),(3,11939972757864702223913453440679846871040),(6,6686952029365420459375314402890953523200)] orbit.val

/-- Exact candidate at original node389, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,12991072468762816455512050238102700032),(9,4326127724649537171744456566722778890240),(11,291332273412915561689494327080614717440),(12,3407691951523687361828036680821450289152),(15,13739928460885158749938475250770218936320)] orbit.val

/-- Exact candidate at original node389, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,2560606629815291770067080954377075163136),(3,13294621652381675351958757730042710589440),(6,5922843200743094539630136191213379780608)] orbit.val

/-- Exact candidate at original node389, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,1514032650356140530666384595605811888128),(3,11506763615909504626757578997467933835264),(6,8757275216674416504232011282559419809792)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked38900 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 389 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked38901 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 389 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked38902 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 389 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked38910 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 389 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked38911 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 389 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked38912 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 389 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked38920 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 389 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked38921 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 389 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked38922 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 389 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked38930 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 389 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked38931 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 389 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked38932 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 389 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked38940 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 389 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked38941 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 389 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked38942 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 389 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked38950 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 389 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked38951 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 389 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked38952 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 389 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 389 1 :=
  RootFineParent3CacheTable.single 389 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 389 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 389 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 389 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 389 0 0) checked38900 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 389 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 389 0 1) checked38901 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 389 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 389 0 2) checked38902 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 389 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 389 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 389 1 0) checked38910 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 389 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 389 1 1) checked38911 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 389 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 389 1 2) checked38912 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 389 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 389 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 389 2 0) checked38920 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 389 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 389 2 1) checked38921 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 389 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 389 2 2) checked38922 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 389 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 389 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 389 3 0) checked38930 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 389 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 389 3 1) checked38931 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 389 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 389 3 2) checked38932 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 389 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 389 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 389 4 0) checked38940 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 389 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 389 4 1) checked38941 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 389 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 389 4 2) checked38942 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 389 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 389 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 389 5 0) checked38950 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 389 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 389 5 1) checked38951 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 389 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 389 5 2) checked38952 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block389
