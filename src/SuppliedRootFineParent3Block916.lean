import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block916
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node916, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,7724360657621669190727239745459453952),(9,21565628919099484867678210546563284992),(11,23769509913410461333795690490456765440),(12,1079721462581376098316730183753350912000),(15,20645290520868553947947043551097335116800)] orbit.val

/-- Exact candidate at original node916, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,4381940986629374101737476896849920),(3,8412613062950874224430342902904380194816),(6,13365454038048200807851530235251888488448)] orbit.val

/-- Exact candidate at original node916, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,4376284577791253702137892483104768),(3,8391993479883686628944553547751271432192),(6,13386073626771797241457719189989410996224)] orbit.val

/-- Exact candidate at original node916, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,63647998825195984162505628063891456),(9,21459221293838324082138386894751436636160),(11,4830674195337508074696309754703505920),(12,29993632089146267890509691796363422720),(15,283962234818428607568219473702598076928)] orbit.val

/-- Exact candidate at original node916, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,8608991794007551462457605130320609280),(3,21460808897671015044771376858442894409728),(6,308653593475039065422140412059950514176)] orbit.val

/-- Exact candidate at original node916, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,5078509684222822755755468829149364224),(3,5118086546590430510957674143401639936),(6,21767874886709248408389261732660614529024)] orbit.val

/-- Exact candidate at original node916, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,2720118126598087380065295370316414976),(9,52652422277617108041528722442944512),(11,114582066817823051781223331181782312960),(12,5836784538053265692794648153824776794112),(15,15823932107520097212591996566533847066624)] orbit.val

/-- Exact candidate at original node916, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,4253695418695189852727941589917312745472),(3,3302469092079682986845233394611059163136),(6,14221906972165188822082799891104793624576)] orbit.val

/-- Exact candidate at original node916, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,113712919481372536480467916218855063552),(3,7442504237466656601888148969341180706816),(6,14221854325992032523287357990073129762816)] orbit.val

/-- Exact candidate at original node916, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14351040288453324577306156208410853376),(9,3418458849474244750349235153364922138624),(11,71092758319499018099872788536595800064),(12,1466157318765210640915531887891749879808),(15,16808011516092653927714028889631486861312)] orbit.val

/-- Exact candidate at original node916, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,734668853929893979041359338095459172352),(3,7299367358145187434742330776691115294720),(6,13744035270864980247872284760846591066112)] orbit.val

/-- Exact candidate at original node916, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,734980267951977958544350235303547502592),(3,7298885991053881843394681324515283173376),(6,13744205223934201859716943315814334857216)] orbit.val

/-- Exact candidate at original node916, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,4196045498125711286033981667478077440),(9,3150688412309603447398172056204223709184),(11,18860714469255695488998740059832586240),(12,3973293598328677824821129513653757009920),(15,14631032712334398982661640584047874150400)] orbit.val

/-- Exact candidate at original node916, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,76740572282354448077912635272266252288),(3,17499359223763129263628238438959058780160),(6,4201971686894577949949823801401840500736)] orbit.val

/-- Exact candidate at original node916, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,3971582841166685350043782878109018095616),(3,16730446184077292470665713668001005305856),(6,1076042457696083840946478329523142131712)] orbit.val

/-- Exact candidate at original node916, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14351040278549804263023114009217859584),(9,3418458848305629353263836173860148871168),(11,71092758969303281764318646046657983232),(12,1466157301651865175832297199685276047872),(15,16808011533734714046532499742031864771328)] orbit.val

/-- Exact candidate at original node916, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,734980271178822373974428146175999737856),(3,7298885803364068054128659411474128568320),(6,13744205408397171233552887317983037227008)] orbit.val

/-- Exact candidate at original node916, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,734668860336320954913892697921455915008),(3,7299367547392707787845579104121903906816),(6,13744035075211032918896503073589805711360)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked91600 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 916 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked91601 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 916 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked91602 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 916 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked91610 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 916 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked91611 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 916 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked91612 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 916 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked91620 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 916 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked91621 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 916 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked91622 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 916 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked91630 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 916 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked91631 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 916 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked91632 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 916 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked91640 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 916 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked91641 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 916 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked91642 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 916 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked91650 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 916 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked91651 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 916 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked91652 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 916 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 916 1 :=
  RootFineParent3CacheTable.single 916 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 916 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 916 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 916 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 916 0 0) checked91600 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 916 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 916 0 1) checked91601 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 916 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 916 0 2) checked91602 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 916 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 916 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 916 1 0) checked91610 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 916 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 916 1 1) checked91611 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 916 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 916 1 2) checked91612 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 916 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 916 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 916 2 0) checked91620 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 916 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 916 2 1) checked91621 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 916 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 916 2 2) checked91622 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 916 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 916 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 916 3 0) checked91630 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 916 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 916 3 1) checked91631 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 916 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 916 3 2) checked91632 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 916 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 916 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 916 4 0) checked91640 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 916 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 916 4 1) checked91641 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 916 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 916 4 2) checked91642 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 916 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 916 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 916 5 0) checked91650 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 916 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 916 5 1) checked91651 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 916 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 916 5 2) checked91652 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block916
