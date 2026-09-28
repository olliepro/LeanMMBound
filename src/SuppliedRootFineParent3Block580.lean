import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block580
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node580, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,734285320034282079178979465134690271232),(3,7297889080645487802843371724010116087808),(6,13745897082260291779633623686488359174144)] orbit.val

/-- Exact candidate at original node580, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,732917489324730098489745188907846205440),(3,7299869830467371491288375967318051651584),(6,13745284163147960071877853719407267676160)] orbit.val

/-- Exact candidate at original node580, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,12559865063488754771781541750951116800),(9,3373581077306483460986889514140754247680),(11,70540241708011124089400984147352113152),(12,1442164749519469006593204475827798892544),(15,16879225549342609315214698359766309163008)] orbit.val

/-- Exact candidate at original node580, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,664866189877116984233563911287142875136),(3,7357458217688596833318753267505248075776),(6,13755747075374347844103657696840774582272)] orbit.val

/-- Exact candidate at original node580, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,465071599797779599175151945410452389888),(3,7412157381787908692904875878262425780224),(6,13900842501354373369575947051960287363072)] orbit.val

/-- Exact candidate at original node580, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,12894968395672123914095252151765827584),(9,3421340883359214669713948784437747515392),(11,58120742731257902964737147015330758656),(12,1767609099376939893607564764623141928960),(15,16518105789076977071455628927405179502592)] orbit.val

/-- Exact candidate at original node580, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,734285326942136447261814920273893261312),(3,7297889082111059860486848448288589348864),(6,13745897073886865353907311507070682923008)] orbit.val

/-- Exact candidate at original node580, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,732917496182180808654685290084949819392),(3,7299869831408943028621331598005430648832),(6,13745284155348937824379957987542785064960)] orbit.val

/-- Exact candidate at original node580, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,12559865033778193828932415153372135424),(9,3373581075672402609130187551273910272000),(11,70540242667347248243471313150487250944),(12,1442164725164961508221662274136915931136),(15,16879225574401572102231721321918479943680)] orbit.val

/-- Exact candidate at original node580, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,469130053715355600720510774218074357760),(3,7523132315986154913795415365028935630848),(6,13785809113238551147140048736386155544576)] orbit.val

/-- Exact candidate at original node580, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,657340341395837345249313051097601933312),(3,7247563874490752125983413730012213280768),(6,13873167267053472190423248094523350319104)] orbit.val

/-- Exact candidate at original node580, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,12855448952455115034049735664846503936),(9,3440322970188607596366022732569393496064),(11,58416166427313177624247283534591306752),(12,1769713554611235312422291569035360577536),(15,16496763342760450460209363554828973648896)] orbit.val

/-- Exact candidate at original node580, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,505184413833061416247136009211296612352),(3,7447014036802662841672132946512570220544),(6,13825873032304337403736705919909298700288)] orbit.val

/-- Exact candidate at original node580, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,504780914660152423767085066313005006848),(3,7447985085352986557077814574026600742912),(6,13825305482926922680811075235293559783424)] orbit.val

/-- Exact candidate at original node580, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,12079287252665709065911274900306264064),(9,3489026334852335584566989153691815116800),(11,61644363696157376768693415243195986944),(12,1881670725402644555490269932904143165440),(15,16333650771736258435764111098893704999936)] orbit.val

/-- Exact candidate at original node580, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,505165862410269336960060381419863539712),(3,7446995578844316847587633006580150042624),(6,13825910041685475477108281487633151950848)] orbit.val

/-- Exact candidate at original node580, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,504762943116242325946401073850392510464),(3,7448039460083556291005061121609916481536),(6,13825269079740263044704512680172856541184)] orbit.val

/-- Exact candidate at original node580, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,12487706365542756198191695432549138432),(9,3488955559899006698405762984116488241152),(11,61769473138197304946166588428088296960),(12,1884430995369670883527171097146989900800),(15,16330427748167644018578682510509049955840)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked58000 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 580 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked58001 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 580 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked58002 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 580 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked58010 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 580 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked58011 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 580 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked58012 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 580 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked58020 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 580 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked58021 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 580 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked58022 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 580 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked58030 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 580 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked58031 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 580 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked58032 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 580 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked58040 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 580 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked58041 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 580 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked58042 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 580 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked58050 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 580 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked58051 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 580 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked58052 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 580 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 580 1 :=
  RootFineParent3CacheTable.single 580 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 580 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 580 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 580 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 580 0 0) checked58000 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 580 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 580 0 1) checked58001 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 580 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 580 0 2) checked58002 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 580 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 580 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 580 1 0) checked58010 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 580 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 580 1 1) checked58011 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 580 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 580 1 2) checked58012 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 580 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 580 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 580 2 0) checked58020 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 580 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 580 2 1) checked58021 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 580 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 580 2 2) checked58022 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 580 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 580 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 580 3 0) checked58030 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 580 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 580 3 1) checked58031 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 580 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 580 3 2) checked58032 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 580 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 580 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 580 4 0) checked58040 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 580 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 580 4 1) checked58041 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 580 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 580 4 2) checked58042 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 580 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 580 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 580 5 0) checked58050 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 580 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 580 5 1) checked58051 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 580 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 580 5 2) checked58052 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block580
