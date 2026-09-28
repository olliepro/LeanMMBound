import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block073
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node73, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,625568973602367942084488552028540239872),(3,7485697681502654105343868200167929806848),(6,13666804827835039614227618123436695486464)] orbit.val

/-- Exact candidate at original node73, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,1685129824870794446395027958077063168),(9,3402913083731801597780082499114116317184),(11,122726069297439685519810216688331884288),(12,2500089206232771528689680809682128400896),(15,15750657993853178055220006322190511867648)] orbit.val

/-- Exact candidate at original node73, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,1435441110114249031615959811668234469376),(3,9857959937193514363371658456966484721664),(6,10484670435632298266668356606998446342144)] orbit.val

/-- Exact candidate at original node73, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,1448722952459989793157667050437744787456),(3,5652950181757041660774918093918089248768),(6,14676398348723030207723389731277331496960)] orbit.val

/-- Exact candidate at original node73, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,2305939586819947844603286455358324736),(9,1705653593168025508840411741814784),(11,53658737498240002016921235577925892096),(12,1651480434432422875118074178221198086144),(15,20070624665768985668650867334966941415424)] orbit.val

/-- Exact candidate at original node73, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,263148788571816171760759395210705764352),(3,6838524513599016292097938405259109990400),(6,14676398180769229197797277075163349778432)] orbit.val

/-- Exact candidate at original node73, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,36411026449387903498952575549440),(3,9232481245886231193731693446194127699968),(6,12545590200642804018536377930486462283776)] orbit.val

/-- Exact candidate at original node73, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(11,362342623219120922976256),(12,171256152638996615141402133610496),(15,21778071311683908660316736515110108946432)] orbit.val

/-- Exact candidate at original node73, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(3,9232481282297257643119596945146703249408),(6,12545590200642804018536377930486462283776)] orbit.val

/-- Exact candidate at original node73, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,853403617834594945755211867442026381312),(3,8473079714267357908188986766998775005184),(6,12451588150838108807711776241192364146688)] orbit.val

/-- Exact candidate at original node73, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,1845934507298567016539036198612500480),(9,3877262188051253197500215200038233571328),(11,60440242162521395729904856236432434176),(12,1916882616082710457320786562045492574208),(15,15921640502136278044088529221114394452992)] orbit.val

/-- Exact candidate at original node73, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,510997837703827838374039905903744909312),(3,12438437805631985399072887618786469871616),(6,8828635839604248424209047350942950752256)] orbit.val

/-- Exact candidate at original node73, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,753289411153520226808860871170367422464),(3,3531849301739996795211279695774994137088),(6,17492932770046544639635834308687803973632)] orbit.val

/-- Exact candidate at original node73, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,12928970934345256711238075193598410752),(9,1573810343607859277274710595707170979840),(11,114079382547568733440175634702585907200),(12,2028747984078662206434549392121191034880),(15,18048504801771626187795301177908619200512)] orbit.val

/-- Exact candidate at original node73, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,587576977571034813878328969329769447424),(3,4453659121822949678439939958898402787328),(6,16736835383546077169337705947404993298432)] orbit.val

/-- Exact candidate at original node73, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,202884734692504679109738641383099465728),(3,3244215418628045122606672877600112640000),(6,18330971329619511859939563356649953427456)] orbit.val

/-- Exact candidate at original node73, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,10303375526328158413543379569142136832),(9,1475596731608059220893519819951623372800),(11,17204274462097518313844671295443118080),(12,1145348449536867976231688267433328619520),(15,19129618651806708787803378737383628285952)] orbit.val

/-- Exact candidate at original node73, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,162887494252556829552585134806384246784),(3,4225127835207928742186576094860375228416),(6,17390056153479576089916813645966406057984)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked07300 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 73 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked07301 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 73 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked07302 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 73 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked07310 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 73 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked07311 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 73 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked07312 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 73 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked07320 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 73 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked07321 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 73 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked07322 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 73 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked07330 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 73 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked07331 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 73 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked07332 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 73 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked07340 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 73 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked07341 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 73 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked07342 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 73 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked07350 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 73 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked07351 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 73 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked07352 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 73 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 73 1 :=
  RootFineParent3CacheTable.single 73 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 73 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 73 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 73 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 73 0 0) checked07300 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 73 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 73 0 1) checked07301 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 73 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 73 0 2) checked07302 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 73 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 73 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 73 1 0) checked07310 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 73 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 73 1 1) checked07311 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 73 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 73 1 2) checked07312 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 73 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 73 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 73 2 0) checked07320 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 73 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 73 2 1) checked07321 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 73 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 73 2 2) checked07322 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 73 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 73 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 73 3 0) checked07330 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 73 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 73 3 1) checked07331 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 73 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 73 3 2) checked07332 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 73 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 73 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 73 4 0) checked07340 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 73 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 73 4 1) checked07341 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 73 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 73 4 2) checked07342 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 73 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 73 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 73 5 0) checked07350 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 73 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 73 5 1) checked07351 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 73 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 73 5 2) checked07352 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block073
