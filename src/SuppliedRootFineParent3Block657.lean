import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block657
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node657, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,13792845716906351527638576099449896960),(9,3534306902854718349264556258471192821760),(11,63493240517168609215739608112525278208),(12,1909018265653628751100306631308870027264),(15,16257460228197639600547733801641127508992)] orbit.val

/-- Exact candidate at original node657, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,509068499234795843634845970626827517952),(3,7448280318948082317125975945411792207872),(6,13820722664757183500895152959594545807360)] orbit.val

/-- Exact candidate at original node657, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,510946914056283477617640509647607562240),(3,7457947353837535256773325625705868820480),(6,13809177215046242927265008740279689150464)] orbit.val

/-- Exact candidate at original node657, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,947204294894873347401517750303064064),(9,16127430775117553718470300452726597746688),(11,10676639276787441518122497061945785600),(12,541409499704238034925400353403158300160),(15,5097607364546587593394750054691160636672)] orbit.val

/-- Exact candidate at original node657, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,106166578140567039814339322473321857024),(3,16291788872728115583952415811617100398592),(6,5380116032071379037889219741542743277568)] orbit.val

/-- Exact candidate at original node657, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,2813643284787472314965547655660306432),(3,267711052352610224061837869687695736832),(6,21507546787302663965279171458289809489920)] orbit.val

/-- Exact candidate at original node657, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,19926391348780977139011936675384262656),(9,3484046371524319450576940611482041712640),(11,59552508567469079276011758310201760256),(12,1783266442893561482214464332983890856960),(15,16431279768605930672449546236181646940672)] orbit.val

/-- Exact candidate at original node657, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,662949312604044665041782158211579641856),(3,7245754468515036903423456465274978435072),(6,13869367701820980093190736252146607456256)] orbit.val

/-- Exact candidate at original node657, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,475576854002687764577255020456147156992),(3,7534277915046247150516237600912463364096),(6,13768216713891126746562482254264555012096)] orbit.val

/-- Exact candidate at original node657, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14349600633512277880027743921289297920),(9,3417773308000952969916405658147845308416),(11,71428537802598393186053446925519380480),(12,1466268102454145772907564563960268668928),(15,16808251934048852247765923462678242877440)] orbit.val

/-- Exact candidate at original node657, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,734784651357521754743268006021690294272),(3,7300364533022351173561660519910035423232),(6,13742922298560188733351046349701439815680)] orbit.val

/-- Exact candidate at original node657, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,739795080023238615882479576017956503552),(3,7307645958209265791463957294741438070784),(6,13730630444707557254309538004873770958848)] orbit.val

/-- Exact candidate at original node657, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,16899403033878364684712192075622252544),(9,3484547283327231704896460120080680747008),(11,60113211145778826754285739254531454976),(12,1796933589508750775911563495682296320000),(15,16419577995924421989408953328540034758656)] orbit.val

/-- Exact candidate at original node657, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,476741186900860600120086322360572968960),(3,7521704956339331696383703274050828632064),(6,13779625339699869365152185279221763932160)] orbit.val

/-- Exact candidate at original node657, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,666687761760318466085006583176328380416),(3,7253382150741448622564003558902359654400),(6,13858001570438294573006964733554477498368)] orbit.val

/-- Exact candidate at original node657, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(5,14349600504766513794348195331780378624),(9,3417773300741672579546935726139380858880),(11,71428541909223600877327138395281820160),(12,1466267995052645799643358346210911185920),(15,16808252044731753167794005469555811289600)] orbit.val

/-- Exact candidate at original node657, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,734784681493412198286943774475806572544),(3,7300364538078620166822775206288222584832),(6,13742922263368029296546255894869136375808)] orbit.val

/-- Exact candidate at original node657, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(2,739795110450734814969110563077903876096),(3,7307645963082867752639230226704917069824),(6,13730630409406459094047634085850344587264)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked65700 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 657 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked65701 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 657 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked65702 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 657 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked65710 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 657 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked65711 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 657 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked65712 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 657 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked65720 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 657 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked65721 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 657 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked65722 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 657 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked65730 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 657 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked65731 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 657 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked65732 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 657 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked65740 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 657 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked65741 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 657 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked65742 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 657 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked65750 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 657 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked65751 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 657 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked65752 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 657 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 657 1 :=
  RootFineParent3CacheTable.single 657 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 657 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 657 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 657 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 657 0 0) checked65700 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 657 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 657 0 1) checked65701 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 657 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 657 0 2) checked65702 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 657 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 657 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 657 1 0) checked65710 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 657 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 657 1 1) checked65711 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 657 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 657 1 2) checked65712 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 657 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 657 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 657 2 0) checked65720 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 657 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 657 2 1) checked65721 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 657 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 657 2 2) checked65722 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 657 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 657 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 657 3 0) checked65730 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 657 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 657 3 1) checked65731 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 657 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 657 3 2) checked65732 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 657 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 657 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 657 4 0) checked65740 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 657 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 657 4 1) checked65741 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 657 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 657 4 2) checked65742 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 657 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 657 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 657 5 0) checked65750 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 657 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 657 5 1) checked65751 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 657 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 657 5 2) checked65752 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block657
