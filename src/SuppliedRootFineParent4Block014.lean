import SuppliedRootFineParent3Block054
import SuppliedRootFineParent3Block055
import RootFineParent4FromWindow
import RootFineParent4CacheTable
import RootFineSparseLookup
namespace MatrixBounds.Numeric.SuppliedRootFineParent4Block014
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option exponentiation.threshold 1000
set_option Elab.async false

/-- Complete original parent3 source window for parent14. -/
def window : RootFineParent3CacheTable 54 2 :=
  (SuppliedRootFineParent3Block054.table).append (SuppliedRootFineParent3Block055.table)

/-- The actual complete integer parent law evaluated from independently checked original children. -/
def source (axis : Fin 3) (orbit : Fin 231) : ℤ :=
  RootFineParent4FromWindow.numerator window 14 axis orbit

/-- Exact candidate for parent14, physical axis0, retaining all231 original orbit positions. -/
def row0 (orbit : Fin 231) : ℤ := sparseIntegerLookup [(2,2809008620318823738695901550178018527531427603657582161320280116239222767768935489660375851613957567991306084279425957888),(3,34418377426986899711041832358581515853190899966686598708732199131240291114790924097746750642758772902554985530997109424128),(6,49159166380848668773736816943118811959589680707907588380060574322751092924989630631669690017101345878816146818479809363968),(21,78877439769407757514504276156314413616789162462818535571049145248370841001528346237220486098454744862535364572499494830080)] orbit.val

/-- Independent kernel check of all nonzero orbit values and the complete exact denominator total. -/
theorem checked0 : sparseIntegerVectorCheck ((2:ℤ)^406) row0 (source 0) = true := by decide +kernel

/-- Exact candidate for parent14, physical axis1, retaining all231 original orbit positions. -/
def row1 (orbit : Fin 231) : ℤ := sparseIntegerLookup [(1,165263992197562149737978827008192759957101170741070304821162198818601447809077836456297302609928821211897803006255839576064)] orbit.val

/-- Independent kernel check of all nonzero orbit values and the complete exact denominator total. -/
theorem checked1 : sparseIntegerVectorCheck ((2:ℤ)^406) row1 (source 1) = true := by decide +kernel

/-- Exact candidate for parent14, physical axis2, retaining all231 original orbit positions. -/
def row2 (orbit : Fin 231) : ℤ := sparseIntegerLookup [(175,46427580223352338637453187771522821912580937012419533559004854517146980928083488771790298705283214223114317266327437312),(202,201606713209751287099919331466975696918128250916791673624199085798134022790110654369284416760554674721159641607662731264),(208,2605444145283559792981425860406804357478041918425530582970474707730979159070401144289959759794041740945826739128704696320),(220,5450272745694243966945085821486640166622265481732419875385223247097286494782285083550343031503884099087511707821631602688),(223,32537572215985591651531864967088205020856573276903018359491170792625794918744660682892355752020791373359749504135541555200),(226,124422668797165650700783077839972611893313580876080124796132126130832106232762295402423569351144266109560441096295971553280)] orbit.val

/-- Independent kernel check of all nonzero orbit values and the complete exact denominator total. -/
theorem checked2 : sparseIntegerVectorCheck ((2:ℤ)^406) row2 (source 2) = true := by decide +kernel

/-- Complete original physical-axis and orbit lookup for this parent. -/
def value (axis : Fin 3) (orbit : Fin 231) : ℤ :=
  if axis = 0 then row0 orbit else if axis = 1 then row1 orbit else row2 orbit

/-- This complete original parent law is independently verified at all axes and orbit coordinates. -/
def table : RootFineParent4CacheTable 14 1 :=
  RootFineParent4CacheTable.single 14 value (by
    intro axis orbit
    have checked : value axis orbit = source axis orbit :=
      finThreeCases (predicate := fun selected => value selected orbit = source selected orbit)

        (sparseIntegerVectorCheck_sound _ _ _
          (RootFineParent4FromWindow.numerator_nonnegative window 14 0)
          (RootFineParent4FromWindow.numerator_normalized window 14 0) checked0 orbit)

        (sparseIntegerVectorCheck_sound _ _ _
          (RootFineParent4FromWindow.numerator_nonnegative window 14 1)
          (RootFineParent4FromWindow.numerator_normalized window 14 1) checked1 orbit)

        (sparseIntegerVectorCheck_sound _ _ _
          (RootFineParent4FromWindow.numerator_nonnegative window 14 2)
          (RootFineParent4FromWindow.numerator_normalized window 14 2) checked2 orbit)

        axis
    exact checked.trans (RootFineParent4FromWindow.numerator_eq window 14 axis orbit))
end MatrixBounds.Numeric.SuppliedRootFineParent4Block014
