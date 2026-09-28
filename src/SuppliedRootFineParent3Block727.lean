import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block727
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node727, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,745381673773175266294061492896194887680),(3,8116478023150778189198074120433318232064),(6,12916211786016108206163839262303652413440)] orbit.val

/-- Exact candidate at original node727, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(9,1717541062894109828932381362212074160128),(11,63384185767768691275153106736196600832),(12,1229880093007452962129631015805681956864),(15,18767266141270730179318809390879212815360)] orbit.val

/-- Exact candidate at original node727, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,672892121701382598413736670622254104576),(3,6471426512328461028146017580495184855040),(6,14633752848910218035096220624515726573568)] orbit.val

/-- Exact candidate at original node727, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,703662274162178782251365506405151801344),(3,7284993143190089224234250983257059360768),(6,13789416065587793655170358385970954371072)] orbit.val

/-- Exact candidate at original node727, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,2599674082499298577288160870400),(9,2005826226620198619568395139492635213824),(11,62613917809765587136844566253063300608),(12,1199672855309715047383188663885057111040),(15,18509958480600708325068247928714249037312)] orbit.val

/-- Exact candidate at original node727, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,703656920389454372279738586280203649024),(3,7284964985148523834290617571452613820416),(6,13789449577402083455085618717900348063744)] orbit.val

/-- Exact candidate at original node727, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,703625401308878336532471015827943981056),(3,7284989548808519783400253889079859478528),(6,13789456532822663541723249970725362073600)] orbit.val

/-- Exact candidate at original node727, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,1648936132328126526165633466368),(9,2005829267907107213219248652967888289792),(11,62607323754862531954498101308844103680),(12,1199760015994666785798859333221026451456),(15,18509874873634488998355242261969773221888)] orbit.val

/-- Exact candidate at original node727, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,703619156553508600682192645057106935808),(3,7284941152138399022164861529605766381568),(6,13789511174248154038808920700970292215808)] orbit.val

/-- Exact candidate at original node727, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,703635198713946156526594937632036225024),(3,7284981416720006891356807930374445334528),(6,13789454867506108613772572007626683973632)] orbit.val

/-- Exact candidate at original node727, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,1698453733899541737161598435328),(9,2005827474557841662217401138702186446848),(11,62609146399512875889691775548944763392),(12,1199715446598872645937284829111242025984),(15,18509919413685380743712055395109193861632)] orbit.val

/-- Exact candidate at original node727, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,703629909027092802919142789267561906176),(3,7284954713955994741253343299301458051072),(6,13789486859956974117483488787064145575936)] orbit.val

/-- Exact candidate at original node727, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,704013992322512647042321928591094317056),(3,7285002211933644343313020730199785865216),(6,13789055278683904671300632216842285350912)] orbit.val

/-- Exact candidate at original node727, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,1584563250285286751870879006720),(9,2005753202503129957371162716694470721536),(11,62677167285420472224538306531669696512),(12,1198188836802788255139532459831361028096),(15,18511452274764159726635454640704785080320)] orbit.val

/-- Exact candidate at original node727, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,704008626932550989303454367179211800576),(3,7284973868305467942975550168251785805824),(6,13789088987702042729376970340202167926784)] orbit.val

/-- Exact candidate at original node727, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,703690642092458128147326978856648179712),(3,7285158005642406343559597386579459440640),(6,13789222835205197189949050510197057912832)] orbit.val

/-- Exact candidate at original node727, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,1129001315828266810708001292288),(9,2005827151792211099418772824803325771776),(11,62617713182908128242906180787476796416),(12,1199676764442023194761053981846530086912),(15,18509949852393917923404975077487831585792)] orbit.val

/-- Exact candidate at original node727, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,703671647539548157457590220976216342528),(3,7284820042086464275189411084234955685888),(6,13789579793314049229008973570421993504768)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked72700 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 727 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked72701 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 727 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked72702 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 727 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked72710 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 727 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked72711 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 727 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked72712 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 727 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked72720 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 727 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked72721 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 727 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked72722 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 727 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked72730 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 727 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked72731 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 727 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked72732 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 727 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked72740 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 727 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked72741 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 727 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked72742 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 727 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked72750 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 727 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked72751 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 727 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked72752 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 727 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 727 1 :=
  RootFineParent3CacheTable.single 727 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 727 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 727 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 727 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 727 0 0) checked72700 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 727 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 727 0 1) checked72701 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 727 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 727 0 2) checked72702 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 727 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 727 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 727 1 0) checked72710 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 727 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 727 1 1) checked72711 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 727 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 727 1 2) checked72712 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 727 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 727 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 727 2 0) checked72720 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 727 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 727 2 1) checked72721 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 727 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 727 2 2) checked72722 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 727 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 727 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 727 3 0) checked72730 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 727 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 727 3 1) checked72731 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 727 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 727 3 2) checked72732 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 727 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 727 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 727 4 0) checked72740 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 727 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 727 4 1) checked72741 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 727 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 727 4 2) checked72742 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 727 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 727 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 727 5 0) checked72750 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 727 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 727 5 1) checked72751 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 727 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 727 5 2) checked72752 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block727
