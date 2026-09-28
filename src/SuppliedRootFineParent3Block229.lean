import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block229
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node229, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,653687721296399705774753303708783607808),(3,7243216626712522618602341823858113249280),(6,13881167134931139337278879748066268676096)] orbit.val

/-- Exact candidate at original node229, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,6569173844822979316603561325602275328),(9,3277674807841046354257484525818855030784),(11,54521056087452080495410656747467086080),(12,1703935766835982084602299163237563682304),(15,16735370678330758162984176968503677458688)] orbit.val

/-- Exact candidate at original node229, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,454706682637954358621598429423530409984),(3,7520999554795064349576830902610652299264),(6,13802365245507042953457545543598982823936)] orbit.val

/-- Exact candidate at original node229, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,729867024855345482448292463500595298304),(3,7296902934305406791998944056005128880128),(6,13751301523779309387208738356127441354752)] orbit.val

/-- Exact candidate at original node229, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,6324936158274143957667554673830133760),(9,3212538414483884627367082772066847424512),(11,69005896174275572016662215696078056960),(12,1373353631125438003677428826215048324096),(15,17116848604998189314637133506981361593856)] orbit.val

/-- Exact candidate at original node229, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,730002085224948439598685633769080094720),(3,7296706895708177922658338354157460652032),(6,13751362502006935299398950887706624786432)] orbit.val

/-- Exact candidate at original node229, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,494279946755190548393806964840680390656),(3,7445742156384746244361834149111782178816),(6,13838049379800124868900333761680702963712)] orbit.val

/-- Exact candidate at original node229, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,6191963814354576106601964065012056064),(9,3324176635116054103816332514684578037760),(11,57178028267246026527195897540289919488),(12,1816307487059381764433720135453238299648),(15,16574217368683025190772124363890047220224)] orbit.val

/-- Exact candidate at original node229, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,494281586434692386289335491978690822144),(3,7445799245412603811306322381159169785856),(6,13837990651092765464060317002495304925184)] orbit.val

/-- Exact candidate at original node229, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,494351345858171199359674310818306981888),(3,7446572937751901019191326971831993237504),(6,13837147199329989443104973592982865313792)] orbit.val

/-- Exact candidate at original node229, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,6162302498666489752431720570797686784),(9,3324471340825211875501258258458538409984),(11,57189587802032187067389564763021772800),(12,1816529800147445202444796185604061655040),(15,16573718451666705906890099146236746008576)] orbit.val

/-- Exact candidate at original node229, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,494373830360787781636564265975465115648),(3,7447117970162959569620255372335940370432),(6,13836579682416314310399155237321760047104)] orbit.val

/-- Exact candidate at original node229, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,730001678511663555147378193305213861888),(3,7296685166726488662396402943588340596736),(6,13751384637701909444112193738739611074560)] orbit.val

/-- Exact candidate at original node229, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,6324936589077277628979890338725363712),(9,3212538415731728186966746089165164642304),(11,69005895917236026807765975346808386304),(12,1373353653125040833427682727682238781952),(15,17116848581576979336824800193100228358912)] orbit.val

/-- Exact candidate at original node229, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,729867425547408030120602673568574078976),(3,7296924663455337883298598757247077056512),(6,13751279393937315748236773444817514397696)] orbit.val

/-- Exact candidate at original node229, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,454669287178876836259011133064844673024),(3,7521119981289228658450951895435746213888),(6,13802282214471956166946011847132574646272)] orbit.val

/-- Exact candidate at original node229, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,6531284768637709282380086985285959680),(9,3277795649803639610795755702793665511424),(11,54519251462471266674963097378609806336),(12,1703925948562733725384782591714660747264),(15,16735299348342579349518093396760943508480)] orbit.val

/-- Exact candidate at original node229, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,653647980810605230316509950575871262720),(3,7243334133214995677964111474286951137280),(6,13881089368914460753375353450770343133184)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked22900 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 229 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked22901 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 229 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked22902 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 229 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked22910 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 229 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked22911 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 229 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked22912 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 229 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked22920 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 229 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked22921 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 229 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked22922 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 229 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked22930 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 229 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked22931 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 229 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked22932 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 229 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked22940 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 229 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked22941 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 229 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked22942 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 229 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked22950 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 229 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked22951 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 229 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked22952 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 229 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 229 1 :=
  RootFineParent3CacheTable.single 229 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 229 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 229 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 229 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 229 0 0) checked22900 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 229 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 229 0 1) checked22901 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 229 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 229 0 2) checked22902 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 229 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 229 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 229 1 0) checked22910 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 229 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 229 1 1) checked22911 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 229 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 229 1 2) checked22912 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 229 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 229 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 229 2 0) checked22920 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 229 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 229 2 1) checked22921 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 229 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 229 2 2) checked22922 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 229 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 229 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 229 3 0) checked22930 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 229 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 229 3 1) checked22931 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 229 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 229 3 2) checked22932 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 229 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 229 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 229 4 0) checked22940 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 229 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 229 4 1) checked22941 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 229 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 229 4 2) checked22942 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 229 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 229 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 229 5 0) checked22950 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 229 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 229 5 1) checked22951 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 229 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 229 5 2) checked22952 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block229
