import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block783
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node783, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,11569340220582726469917387553605943296),(9,3460720361822075521423605813937407262720),(11,60938224204395733393935106877573459456),(12,1872102232866473330519701122330946380800),(15,16372741323826534349848815444933632486912)] orbit.val

/-- Exact candidate at original node783, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,503157962094239144772107658547846709248),(3,7447062126205620898189782866397774217216),(6,13827851394640201618694084350687544606720)] orbit.val

/-- Exact candidate at original node783, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,503168464051684902057413051544351277056),(3,7446997214149112144842106431906288500736),(6,13827905804739264614756455392182525755392)] orbit.val

/-- Exact candidate at original node783, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,11238295341120630204013864242454200320),(9,3522876655863640713751360236055007592448),(11,57924560628489553619275610379918331904),(12,1796220478222921443888207197087644082176),(15,16389811492883889320193117967868141326336)] orbit.val

/-- Exact candidate at original node783, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,505532490970914912200739515946181328896),(3,7500566900506163697980746692034492891136),(6,13771972091462983051474488667652491313152)] orbit.val

/-- Exact candidate at original node783, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,504300805032126344614112429272490573824),(3,7470250178452129463185450156012530040832),(6,13803520499455805853856412290348144918528)] orbit.val

/-- Exact candidate at original node783, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13400724495642589469423453804125224960),(9,3412198858284767921040078031733219393536),(11,57712597905266156840961475426803360768),(12,1757633484718153227414754578611513899008),(15,16537125817536231766890757336057503654912)] orbit.val

/-- Exact candidate at original node783, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,657093743890673825299081974624058081280),(3,7246231625359613132939364088750440185856),(6,13874746113689774703417528812258667266048)] orbit.val

/-- Exact candidate at original node783, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,466279502954890669994103823444815642624),(3,7523052206740314880605580843416534646784),(6,13788739773244856111056290208771815243776)] orbit.val

/-- Exact candidate at original node783, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,11544040360771688638974936558296104960),(9,3345915919515637654615429364101228265472),(11,70329447103172065157464267536667981824),(12,1429004717764358556595882830519027208192),(15,16921277358196121696648223476917945972736)] orbit.val

/-- Exact candidate at original node783, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,733340898770222012707977828136262828032),(3,7298349708346450613390436678599270465536),(6,13746380875823389035557560368897632239616)] orbit.val

/-- Exact candidate at original node783, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,733622186781571320239002084450953592832),(3,7297908159251951824128313206647877009408),(6,13746541136906538517288659584534334930944)] orbit.val

/-- Exact candidate at original node783, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13575661927410217454956525012100579328),(9,3412185570196772150511075095737027002368),(11,57692768689175298797857004888969333760),(12,1757168650615220837546970515482993715200),(15,16537448831511483157345115734512074902528)] orbit.val

/-- Exact candidate at original node783, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,466339621831944416928757491654209830912),(3,7523070223825941057617494823357349101568),(6,13788661637282176187109722560621606600704)] orbit.val

/-- Exact candidate at original node783, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,657403300706824268633993244357269913600),(3,7245913012170276090333683344992125321216),(6,13874755170062961302688298286283770298368)] orbit.val

/-- Exact candidate at original node783, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,11544043346683063395312159614983733248),(9,3345916125711882358145509472398955511808),(11,70329322730509660393561978739426958336),(12,1429007806406618486736151287553964427264),(15,16921274184744368092985439977325834902528)] orbit.val

/-- Exact candidate at original node783, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,733340025699220080930679235438132068352),(3,7298349546266846975204173963948514607104),(6,13746381910973994605521121676246518857728)] orbit.val

/-- Exact candidate at original node783, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,733621312152742532793416745493280587776),(3,7297908000280075970795633342430366924800),(6,13746542170507243158066924787709518020608)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked78300 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 783 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked78301 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 783 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked78302 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 783 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked78310 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 783 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked78311 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 783 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked78312 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 783 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked78320 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 783 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked78321 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 783 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked78322 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 783 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked78330 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 783 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked78331 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 783 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked78332 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 783 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked78340 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 783 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked78341 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 783 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked78342 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 783 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked78350 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 783 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked78351 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 783 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked78352 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 783 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 783 1 :=
  RootFineParent3CacheTable.single 783 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 783 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 783 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 783 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 783 0 0) checked78300 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 783 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 783 0 1) checked78301 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 783 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 783 0 2) checked78302 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 783 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 783 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 783 1 0) checked78310 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 783 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 783 1 1) checked78311 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 783 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 783 1 2) checked78312 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 783 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 783 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 783 2 0) checked78320 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 783 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 783 2 1) checked78321 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 783 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 783 2 2) checked78322 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 783 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 783 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 783 3 0) checked78330 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 783 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 783 3 1) checked78331 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 783 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 783 3 2) checked78332 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 783 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 783 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 783 4 0) checked78340 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 783 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 783 4 1) checked78341 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 783 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 783 4 2) checked78342 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 783 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 783 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 783 5 0) checked78350 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 783 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 783 5 1) checked78351 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 783 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 783 5 2) checked78352 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block783
