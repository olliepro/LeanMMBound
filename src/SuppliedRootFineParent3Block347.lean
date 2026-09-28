import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block347
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node347, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,656416074800134456811132674470605488128),(3,7245682689415718191608382055626586456064),(6,13875972718724209013236460145535973588992)] orbit.val

/-- Exact candidate at original node347, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,11010164244834929070758515116135677952),(9,3391764224978141190945023079470086488064),(11,57154737842432427894440107552249718784),(12,1748414552637049163015713445093057802240),(15,16569727803237603950730039728401635846144)] orbit.val

/-- Exact candidate at original node347, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,464446787787730524056508184682095968256),(3,7522424499718779774051228759717228576768),(6,13791200195433551363548237931233840988160)] orbit.val

/-- Exact candidate at original node347, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,732496148411146649704460639808035749888),(3,7298514041031394477050091531488408371200),(6,13747061293497520534901422704336721412096)] orbit.val

/-- Exact candidate at original node347, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,10690421381597736384009217239815290880),(9,3325477233148756462771080702209017511936),(11,70088987686146499077562681174388533248),(12,1419645993667792472490599343802112225280),(15,16952168847055768490932722931207831971840)] orbit.val

/-- Exact candidate at original node347, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,733128994633364671249549328965380866048),(3,7297607750893505015726251729501527474176),(6,13747334737413191974680173817166257192960)] orbit.val

/-- Exact candidate at original node347, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,501583246732393341902533472371513229312),(3,7447153877690286417323349107559295352832),(6,13829334358517381902430092295702356951040)] orbit.val

/-- Exact candidate at original node347, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,10402796531008352045727221269328297984),(9,3439189079767243456345881607974684721152),(11,60279892150703708414011331323532214272),(12,1862592542426877612107649709903804497920),(15,16405607172064228532742705005161815801856)] orbit.val

/-- Exact candidate at original node347, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,501524259506779595000254654423532306432),(3,7447309380856593687170203703631838969856),(6,13829237842576688379485516517577794256896)] orbit.val

/-- Exact candidate at original node347, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,501154239254228248336776009388061097984),(3,7442076632370704735583875030779269480448),(6,13834840611315128677735323835465834954752)] orbit.val

/-- Exact candidate at original node347, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,10406757963892866048314503964827582464),(9,3438667028603114755444296655955006849024),(11,60271174857843403919638184407292239104),(12,1862400757804473426161945039379023414784),(15,16406325763710737210081780491927015447808)] orbit.val

/-- Exact candidate at original node347, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,501275636459698237735231580106949394432),(3,7441115212610258029347692506412761481216),(6,13835680633870105394573050789113454657536)] orbit.val

/-- Exact candidate at original node347, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,732496812602113710434349719903176491008),(3,7298514167973244202506745491726383710208),(6,13747060502364703748714879664003605331968)] orbit.val

/-- Exact candidate at original node347, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,10690419277099669598862749911304110080),(9,3325477077178215033127449107118558281728),(11,70089083512381101593713570115673487104),(12,1419643645540174430318369954908824474112),(15,16952171257432191427017579493578805180160)] orbit.val

/-- Exact candidate at original node347, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,733129660372903254631859445772922650624),(3,7297607875425176951187859981697311309824),(6,13747333947141981455836255448162931572736)] orbit.val

/-- Exact candidate at original node347, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,464186613227093387936421650064759324672),(3,7523099396061946609231632576682408280064),(6,13790785473651021664487920648885997928448)] orbit.val

/-- Exact candidate at original node347, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,11003988280821178079963549775698067456),(9,3391852665370493000582762707245265321984),(11,57144405128104314835407563241717917184),(12,1748237836787939613457727248915695350784),(15,16569832587372703554700113806454788875776)] orbit.val

/-- Exact candidate at original node347, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,656782579131070831004219160585694085120),(3,7245382379600544225783806359132037971968),(6,13875906524208446604867949355915433476096)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked34700 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 347 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked34701 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 347 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked34702 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 347 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked34710 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 347 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked34711 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 347 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked34712 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 347 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked34720 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 347 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked34721 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 347 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked34722 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 347 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked34730 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 347 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked34731 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 347 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked34732 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 347 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked34740 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 347 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked34741 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 347 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked34742 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 347 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked34750 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 347 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked34751 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 347 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked34752 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 347 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 347 1 :=
  RootFineParent3CacheTable.single 347 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 347 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 347 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 347 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 347 0 0) checked34700 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 347 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 347 0 1) checked34701 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 347 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 347 0 2) checked34702 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 347 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 347 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 347 1 0) checked34710 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 347 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 347 1 1) checked34711 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 347 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 347 1 2) checked34712 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 347 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 347 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 347 2 0) checked34720 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 347 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 347 2 1) checked34721 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 347 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 347 2 2) checked34722 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 347 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 347 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 347 3 0) checked34730 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 347 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 347 3 1) checked34731 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 347 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 347 3 2) checked34732 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 347 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 347 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 347 4 0) checked34740 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 347 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 347 4 1) checked34741 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 347 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 347 4 2) checked34742 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 347 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 347 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 347 5 0) checked34750 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 347 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 347 5 1) checked34751 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 347 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 347 5 2) checked34752 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block347
