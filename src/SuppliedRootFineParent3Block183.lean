import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block183
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node183, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,734600622455937150686394377412831870976),(3,7299588708273539563584077852824129503232),(6,13743882152210584947385502645396204158976)] orbit.val

/-- Exact candidate at original node183, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,736966265668319758448013129786499006464),(3,7305161407858613476406854067375466086400),(6,13735943809413128426801107678471200440320)] orbit.val

/-- Exact candidate at original node183, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14107755657278413932653146695203291136),(9,3409513460761486873863413254091943444480),(11,71148449487902641200787410543934778368),(12,1462491952293417163063849889385225758720),(15,16820809864739976569595271174916858260480)] orbit.val

/-- Exact candidate at original node183, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,646118390489040219794972470977243381760),(3,7211600923769664574223275799112016986112),(6,13920352168681356867637726605543905165312)] orbit.val

/-- Exact candidate at original node183, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,472683821296856580369434395412503986176),(3,7530979088226744428175032140492915605504),(6,13774408573416460653111508339727745941504)] orbit.val

/-- Exact candidate at original node183, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14372561004526513256477563954061639680),(9,3480240080806230163573329776043618205696),(11,58854102176948177264689983004777586176),(12,1779467034887478714912785760040863253504),(15,16445137704064878092648691792589844848128)] orbit.val

/-- Exact candidate at original node183, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,734600392894700755391632061489139941376),(3,7299588669835612734065435216386216427520),(6,13743882420209748172198907597757809164288)] orbit.val

/-- Exact candidate at original node183, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,736966034904742990872875503925495595008),(3,7305161370523991816025756318882934554624),(6,13735944077511326854757343052824735383552)] orbit.val

/-- Exact candidate at original node183, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14107756612968124260966718917327192064),(9,3409513515943902065048524387995304853504),(11,71148418252732947664334543505357704448),(12,1462492769102794681853087796272956106240),(15,16820809023027663842829061428942219676928)] orbit.val

/-- Exact candidate at original node183, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,472756346616191059187603579856765321216),(3,7524253548677157779218526532508015656960),(6,13781061587646712823249844763268384555008)] orbit.val

/-- Exact candidate at original node183, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,661282899091313366860319241493108752384),(3,7253661193610164108866723615753415688192),(6,13863127390238584185928932018386641092608)] orbit.val

/-- Exact candidate at original node183, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14492787265261830818015217100448071680),(9,3476478928645183165090804167308493193216),(11,59593809156238808221404467110098417664),(12,1788742833375801260773604439958146945024),(15,16438763124497576596752146584155978905600)] orbit.val

/-- Exact candidate at original node183, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,508325318063054450485989628943894839296),(3,7447733368157100046581929333323703779328),(6,13822012796719907164588055913365566914560)] orbit.val

/-- Exact candidate at original node183, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,509176747196986008179033570402937864192),(3,7454564444764653834186848095933422370816),(6,13814330290978421819290093209296805298176)] orbit.val

/-- Exact candidate at original node183, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13984853326704892693150680813192347648),(9,3525727148120845116040662558254238269440),(11,63596908224215590502724235441566140928),(12,1914096732157602034360697981681001786368),(15,16260665841110694028058739419443166988800)] orbit.val

/-- Exact candidate at original node183, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,508232752199140087020837358918116048896),(3,7447859171448370382436374764437790261248),(6,13821979559292551192198762752277259223040)] orbit.val

/-- Exact candidate at original node183, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,509243732482657050800075090371029237760),(3,7454634218364569883338075732620974489600),(6,13814193532092834727517824052641161805824)] orbit.val

/-- Exact candidate at original node183, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13728809866515087276694423476170129408),(9,3526009088925178280141138664999482294272),(11,62540124705767491156397118821827038720),(12,1891061566435364491103118622146405950464),(15,16284731893007236311978626046189280120320)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked18300 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 183 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked18301 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 183 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked18302 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 183 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked18310 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 183 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked18311 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 183 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked18312 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 183 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked18320 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 183 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked18321 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 183 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked18322 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 183 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked18330 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 183 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked18331 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 183 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked18332 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 183 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked18340 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 183 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked18341 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 183 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked18342 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 183 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked18350 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 183 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked18351 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 183 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked18352 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 183 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 183 1 :=
  RootFineParent3CacheTable.single 183 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 183 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 183 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 183 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 183 0 0) checked18300 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 183 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 183 0 1) checked18301 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 183 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 183 0 2) checked18302 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 183 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 183 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 183 1 0) checked18310 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 183 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 183 1 1) checked18311 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 183 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 183 1 2) checked18312 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 183 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 183 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 183 2 0) checked18320 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 183 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 183 2 1) checked18321 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 183 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 183 2 2) checked18322 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 183 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 183 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 183 3 0) checked18330 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 183 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 183 3 1) checked18331 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 183 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 183 3 2) checked18332 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 183 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 183 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 183 4 0) checked18340 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 183 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 183 4 1) checked18341 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 183 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 183 4 2) checked18342 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 183 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 183 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 183 5 0) checked18350 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 183 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 183 5 1) checked18351 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 183 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 183 5 2) checked18352 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block183
