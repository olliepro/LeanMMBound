import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block777
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node777, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,653020864880314102095311305247738036224),(3,7486025354913283034821890272235930779648),(6,13639025263146464524738773298149496717312)] orbit.val

/-- Exact candidate at original node777, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14732944216168686163696088478321213440),(9,3299979551861367830646053044838834634752),(11,72524046172699427517127148080561749504),(12,1734136031564624650261779610489933071360),(15,16656698909125201067067318983745514864128)] orbit.val

/-- Exact candidate at original node777, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,710357273208645848232402921995104157696),(3,6982819656457346190532226125858382807040),(6,14084894553274069622891345827779678568448)] orbit.val

/-- Exact candidate at original node777, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,710418895428588588980560358938997948416),(3,7328176896804977518574655678237833691136),(6,13739475690706495554100758838456333893632)] orbit.val

/-- Exact candidate at original node777, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14376389358856804080685294993706844160),(9,3422899856769662356270260098978702950400),(11,69296056144588234257698719011655206912),(12,1465691794298029532658348370188454162432),(15,16805807386368924734388982392460646369280)] orbit.val

/-- Exact candidate at original node777, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,736694139775417037573454196737805647872),(3,7289913462281532359022499901129237725184),(6,13751463880883112265060020777766122160128)] orbit.val

/-- Exact candidate at original node777, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,498924846566223239133036466331824685056),(3,7467432517232472649430273281025661468672),(6,13811714119141365773092665128275679379456)] orbit.val

/-- Exact candidate at original node777, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13775084788140557734032233280751796224),(9,3538490606437275596309155972841912401920),(11,62510820859974403828705008928527535872),(12,1898704822206616311486355476920368783872),(15,16264590148648054792297726183661605015296)] orbit.val

/-- Exact candidate at original node777, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,508440903498956324062016257342006362112),(3,7441049379548519010567077000400380887040),(6,13828581199892586327026881617890778284032)] orbit.val

/-- Exact candidate at original node777, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,498459519790263872466304908803138650112),(3,7467449969072552459038941989150977425408),(6,13812161994077245330150727977679049457664)] orbit.val

/-- Exact candidate at original node777, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,18276246481894972053262849504930955264),(9,3537258713428072995374125422664763834368),(11,62544906980975422441148947344694849536),(12,1899553220094712866541543955321485762560),(15,16260438395954405405245893700797290131456)] orbit.val

/-- Exact candidate at original node777, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,508177243661969689546080901561434767360),(3,7441941959625512660264346601581306707968),(6,13827952279652579311845547372490424057856)] orbit.val

/-- Exact candidate at original node777, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,710409920189758004100330973861228052480),(3,7328175380903067732585518502305121435648),(6,13739486181847235924970125399466816045056)] orbit.val

/-- Exact candidate at original node777, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14376428482713805655843502905628819456),(9,3422902133925702300627285128220537520128),(11,69294884103966272687872924547476692992),(12,1465725269470079900857748899146737500160),(15,16805772766957599381827224420812785000448)] orbit.val

/-- Exact candidate at original node777, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,736684716658619825595442833547509891072),(3,7289912434436171115177446905435027144704),(6,13751474331845270720883085136650628497408)] orbit.val

/-- Exact candidate at original node777, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,464188312695711216910230672338914902016),(3,7550191543808200824032754441520085467136),(6,13763691626436149620712989761774165164032)] orbit.val

/-- Exact candidate at original node777, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,22708772080651015762749534765056),(9,3492374486943004241624659246482278318080),(11,59125655887912382708229182074838323200),(12,1788679800055200531787954280699200004096),(15,16437891517345172424884116403627314122752)] orbit.val

/-- Exact candidate at original node777, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,661395065651777639636141207450407665664),(3,7246986226149909658854802395759598632960),(6,13869690191138374363165031272423159234560)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked77700 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 777 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked77701 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 777 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked77702 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 777 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked77710 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 777 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked77711 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 777 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked77712 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 777 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked77720 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 777 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked77721 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 777 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked77722 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 777 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked77730 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 777 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked77731 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 777 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked77732 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 777 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked77740 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 777 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked77741 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 777 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked77742 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 777 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked77750 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 777 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked77751 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 777 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked77752 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 777 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 777 1 :=
  RootFineParent3CacheTable.single 777 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 777 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 777 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 777 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 777 0 0) checked77700 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 777 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 777 0 1) checked77701 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 777 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 777 0 2) checked77702 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 777 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 777 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 777 1 0) checked77710 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 777 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 777 1 1) checked77711 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 777 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 777 1 2) checked77712 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 777 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 777 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 777 2 0) checked77720 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 777 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 777 2 1) checked77721 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 777 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 777 2 2) checked77722 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 777 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 777 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 777 3 0) checked77730 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 777 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 777 3 1) checked77731 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 777 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 777 3 2) checked77732 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 777 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 777 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 777 4 0) checked77740 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 777 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 777 4 1) checked77741 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 777 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 777 4 2) checked77742 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 777 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 777 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 777 5 0) checked77750 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 777 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 777 5 1) checked77751 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 777 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 777 5 2) checked77752 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block777
