import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block420
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node420, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13989467322349955433954552733438574592),(9,3540009968821702167652989033858738421760),(11,62591615967924638838458079856477582336),(12,1898117163243691647230249290260555536384),(15,16263363267584393252500323918923955418112)] orbit.val

/-- Exact candidate at original node420, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,509643058954311293054102429383276888064),(3,7454928730416684484078235866325686681600),(6,13813499693569065884523636579924201963520)] orbit.val

/-- Exact candidate at original node420, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,501913022344961088497486824402027806720),(3,7480458637339876351920019878082785574912),(6,13795699823255224221238468173148352151552)] orbit.val

/-- Exact candidate at original node420, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14159331769920034916809988222677417984),(9,3539185998273736372869955656884387053568),(11,62108812229389731636765593172021531648),(12,1894863882324085220419342684667135547392),(15,16267753458342930301813100952686943982592)] orbit.val

/-- Exact candidate at original node420, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,501148544120664593707216106509396082688),(3,7473511613221379389421667016046991638528),(6,13803411325598017678527091753076777811968)] orbit.val

/-- Exact candidate at original node420, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,503307967221374105867783197957451415552),(3,7479344046109823891021290684205034897408),(6,13795419469608863664766900993470679220224)] orbit.val

/-- Exact candidate at original node420, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,7568637951787890492263184090898890752),(9,3488846047142753368310738390460873572352),(11,59120851689395342443331848966889063680),(12,1785202105714875955016118800586497226240),(15,16437333840441249105393522651528006780160)] orbit.val

/-- Exact candidate at original node420, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,661687187858894422862784781547475042304),(3,7246218382035953849497822705319795490816),(6,13870165913045213389295367388765895000064)] orbit.val

/-- Exact candidate at original node420, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,465543047870622696212934167768200118272),(3,7550329597045257644943855024435682607104),(6,13762198838024181320499185683429282807808)] orbit.val

/-- Exact candidate at original node420, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14371516049435832152704479404111167488),(9,3421988686804813013557514427406049345536),(11,69722541294704185897005359016557102592),(12,1465755858131807445497046842425447904256),(15,16806232880659301184551703767381000013312)] orbit.val

/-- Exact candidate at original node420, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,737238021347357415405320199230988484608),(3,7295410791726470896043546233564563505152),(6,13745422669866233350207108442837613543424)] orbit.val

/-- Exact candidate at original node420, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,715962216779476144521425888114309595136),(3,7331719114379269033276861248942762885120),(6,13730390151781316483857687738576093052928)] orbit.val

/-- Exact candidate at original node420, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,8217165805234903040375050329521127424),(9,3490141378206054022743719865573810634752),(11,59097453477110541213662828734938587136),(12,1787479906475743763355208253155415998464),(15,16433135578975918431303008877839479185408)] orbit.val

/-- Exact candidate at original node420, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,475447641219204689553898980739542679552),(3,7522957254839327129193152154572821626880),(6,13779666586881529842908923740320801226752)] orbit.val

/-- Exact candidate at original node420, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,642501756768928842061035093989919817728),(3,7279065129377443122972554026492423569408),(6,13856504596793689696622385755150822146048)] orbit.val

/-- Exact candidate at original node420, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14371515791944303981345382225093328896),(9,3421988671830690298361554622226242732032),(11,69722542853299630215539705152979522560),(12,1465755675274733582255550532510364620800),(15,16806233077189393846841984633518485328896)] orbit.val

/-- Exact candidate at original node420, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,737238043558490775731384477979584233472),(3,7295410785083671469770424291947353997312),(6,13745422654297899416154166105706227302400)] orbit.val

/-- Exact candidate at original node420, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,715962237752500560283684358464414416896),(3,7331719109618307371995942858671588900864),(6,13730390135569253729376347658497162215424)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked42000 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 420 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked42001 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 420 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked42002 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 420 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked42010 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 420 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked42011 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 420 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked42012 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 420 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked42020 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 420 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked42021 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 420 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked42022 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 420 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked42030 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 420 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked42031 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 420 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked42032 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 420 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked42040 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 420 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked42041 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 420 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked42042 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 420 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked42050 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 420 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked42051 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 420 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked42052 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 420 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 420 1 :=
  RootFineParent3CacheTable.single 420 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 420 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 420 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 420 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 420 0 0) checked42000 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 420 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 420 0 1) checked42001 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 420 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 420 0 2) checked42002 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 420 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 420 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 420 1 0) checked42010 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 420 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 420 1 1) checked42011 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 420 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 420 1 2) checked42012 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 420 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 420 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 420 2 0) checked42020 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 420 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 420 2 1) checked42021 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 420 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 420 2 2) checked42022 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 420 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 420 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 420 3 0) checked42030 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 420 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 420 3 1) checked42031 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 420 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 420 3 2) checked42032 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 420 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 420 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 420 4 0) checked42040 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 420 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 420 4 1) checked42041 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 420 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 420 4 2) checked42042 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 420 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 420 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 420 5 0) checked42050 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 420 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 420 5 1) checked42051 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 420 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 420 5 2) checked42052 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block420
