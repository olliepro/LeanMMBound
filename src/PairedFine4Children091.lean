import SuppliedPairedFineTableReads
import RootFineCachedParent4
import RootFineIntegerVectorCheck
import SuppliedRootFineParent3Block880
import SuppliedRootFineParent3Block881
import SuppliedRootFineParent3Block882
import SuppliedRootFineParent3Block883
import SuppliedRootFineParent3Block884
import SuppliedRootFineParent3Block885
import SuppliedRootFineParent3Block886
import SuppliedRootFineParent3Block887

namespace MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4Children091
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Proof-free read of the checked complete parent3 table of original node 880. -/
def read880 (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  SuppliedRootFineParent3Block880.value 0 strategy axis orbit
/-- The proof-free read equals the complete original integer parent3 law of node 880. -/
theorem read880_eq (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) :
    read880 strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator ⟨880, by omega⟩ strategy axis orbit :=
  nodeRead_eq SuppliedRootFineParent3Block880.table read880 (fun _ _ _ => rfl) strategy axis orbit

/-- Proof-free read of the checked complete parent3 table of original node 881. -/
def read881 (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  SuppliedRootFineParent3Block881.value 0 strategy axis orbit
/-- The proof-free read equals the complete original integer parent3 law of node 881. -/
theorem read881_eq (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) :
    read881 strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator ⟨881, by omega⟩ strategy axis orbit :=
  nodeRead_eq SuppliedRootFineParent3Block881.table read881 (fun _ _ _ => rfl) strategy axis orbit

/-- Proof-free read of the checked complete parent3 table of original node 882. -/
def read882 (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  SuppliedRootFineParent3Block882.value 0 strategy axis orbit
/-- The proof-free read equals the complete original integer parent3 law of node 882. -/
theorem read882_eq (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) :
    read882 strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator ⟨882, by omega⟩ strategy axis orbit :=
  nodeRead_eq SuppliedRootFineParent3Block882.table read882 (fun _ _ _ => rfl) strategy axis orbit

/-- Proof-free read of the checked complete parent3 table of original node 883. -/
def read883 (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  SuppliedRootFineParent3Block883.value 0 strategy axis orbit
/-- The proof-free read equals the complete original integer parent3 law of node 883. -/
theorem read883_eq (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) :
    read883 strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator ⟨883, by omega⟩ strategy axis orbit :=
  nodeRead_eq SuppliedRootFineParent3Block883.table read883 (fun _ _ _ => rfl) strategy axis orbit

/-- Proof-free read of the checked complete parent3 table of original node 884. -/
def read884 (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  SuppliedRootFineParent3Block884.value 0 strategy axis orbit
/-- The proof-free read equals the complete original integer parent3 law of node 884. -/
theorem read884_eq (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) :
    read884 strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator ⟨884, by omega⟩ strategy axis orbit :=
  nodeRead_eq SuppliedRootFineParent3Block884.table read884 (fun _ _ _ => rfl) strategy axis orbit

/-- Proof-free read of the checked complete parent3 table of original node 885. -/
def read885 (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  SuppliedRootFineParent3Block885.value 0 strategy axis orbit
/-- The proof-free read equals the complete original integer parent3 law of node 885. -/
theorem read885_eq (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) :
    read885 strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator ⟨885, by omega⟩ strategy axis orbit :=
  nodeRead_eq SuppliedRootFineParent3Block885.table read885 (fun _ _ _ => rfl) strategy axis orbit

/-- Proof-free read of the checked complete parent3 table of original node 886. -/
def read886 (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  SuppliedRootFineParent3Block886.value 0 strategy axis orbit
/-- The proof-free read equals the complete original integer parent3 law of node 886. -/
theorem read886_eq (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) :
    read886 strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator ⟨886, by omega⟩ strategy axis orbit :=
  nodeRead_eq SuppliedRootFineParent3Block886.table read886 (fun _ _ _ => rfl) strategy axis orbit

/-- Proof-free read of the checked complete parent3 table of original node 887. -/
def read887 (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  SuppliedRootFineParent3Block887.value 0 strategy axis orbit
/-- The proof-free read equals the complete original integer parent3 law of node 887. -/
theorem read887_eq (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) :
    read887 strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator ⟨887, by omega⟩ strategy axis orbit :=
  nodeRead_eq SuppliedRootFineParent3Block887.table read887 (fun _ _ _ => rfl) strategy axis orbit

/-- Complete parent3 lookup through proof-free reads of the checked tables, with the exact source formula elsewhere. -/
def parent3 : RootFineCachedParent4.Parent3Values :=
  extendParent3 880 read880 (extendParent3 881 read881 (extendParent3 882 read882 (extendParent3 883 read883 (extendParent3 884 read884 (extendParent3 885 read885 (extendParent3 886 read886 (extendParent3 887 read887 (SuppliedRootFineParent3Integers.numerator))))))))
/-- Every parent3 value equals the complete original integer hierarchy. -/
theorem parent3_eq : ∀ node strategy axis orbit, parent3 node strategy axis orbit =
    SuppliedRootFineParent3Integers.numerator node strategy axis orbit :=
  (extendParent3_eq 880 (by omega) read880 read880_eq _ (extendParent3_eq 881 (by omega) read881 read881_eq _ (extendParent3_eq 882 (by omega) read882 read882_eq _ (extendParent3_eq 883 (by omega) read883 read883_eq _ (extendParent3_eq 884 (by omega) read884 read884_eq _ (extendParent3_eq 885 (by omega) read885 read885_eq _ (extendParent3_eq 886 (by omega) read886 read886_eq _ (extendParent3_eq 887 (by omega) read887 read887_eq _ (fun _ _ _ _ => rfl)))))))))

/-- Prepared complete child numerators at 2^178 in original column, physical axis, and orbit order. -/
def rows : Fin 45 → Fin 3 → Fin 21 → ℤ := ![
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 12924426772276136442123284536955984088407211159584768, 128411829595202949226920096970095459873707399625834496, 0, 0, 241787628848993128920543375280525851942570169760481280, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 12929896607573768947977110828354584441025450980933632, 128403366396573675532462207502179874135161706190471168, 0, 0, 241790622212324770109147438457042837328497623374495744, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 252466808635671778049213309721179682075369673850880, 0, 0, 0, 60138097771683324093172910741972652616024546596618240, 0, 1250676308684831923871027964163986799184069039083520, 25792883360524409133549543987890243884278261449777152, 0, 0, 295689760966943977660944060783829232923122533786570752, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 10170637885391221881129619297502350950451547593506816, 0, 0, 33348799057156763226420338611082523859915061009055744, 339604448273924229482036798878992421094318171943337984, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 383123885216472214589586756787577295904684780545900544, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 256456380333229896637254373167370590781791700779008, 0, 0, 0, 60263247226312322460210081078305572846628260332699648, 0, 520027311889560394263407525311787209129984, 31225458698666093240656600865554266131856834813624320, 0, 0, 291378722910640541680193260076286678810106106489667584, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 10129011603853740918116985051119010280812590726643712, 0, 0, 24419964367980913173287350414992771820676788464386048, 348574909244637560498182421321465513803195401354870784, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 6643328885580967027025473274299710492074770352308224, 135029540024991314682507955981344991242917473402486784, 0, 0, 241451016305899932880053327531932594169692536791105536, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 10115128551569577038378672352222456546385647122776064, 0, 0, 15986973715606551271251539404561012545369887752585216, 357021782949296086279956545030793826812929245670539264, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 1727652382070720312786544580306607406766850972844032, 0, 0, 0, 99560809571478408217035741171846516070513837076381696, 0, 2460653316831200010555445570666076702424861515972608, 51207461529316192859330749992221218464323395819405312, 0, 0, 228167308416775693189878275472536877260655835161296896, 0, 0, 0, 0, 0], ![383123885216472214589586756787577295904684780545900544, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 1727652382070720312786544580306607406766850972844032, 0, 0, 0, 99560809571478408217035741171846516070513837076381696, 0, 2460653316831200010555445570666076702424861515972608, 51207461529316192859330749992221218464323395819405312, 0, 0, 228167308416775693189878275472536877260655835161296896, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 107456828502351050968134587241047480562817360199680, 0, 0, 0, 56564319169006398124345915952492394516078255184805888, 0, 48426711351093054816127283408880615659514966556672, 30476914862188761427192969514520887426109196714147840, 0, 0, 295926767645423610932263609449914085866274996320190464, 0, 0, 0, 0, 0], ![0, 383123885216472214589586756787577295904684780545900544, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 10170564699702218760551074472757143584663446336045056, 0, 0, 32008702247913242560707308795539187943838923830067200, 340944618268856753268328373519280964376182410379788288, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 83980442130350050788436230140296981372358669369344, 0, 0, 0, 54885328083010026720018056319850006466149113011372032, 0, 1207561529383401334768741262352204108099046458893312, 23707268364310381496123698116088722520706314567727104, 0, 0, 303239746797638054987887824859146065828357947838538752, 0, 0, 0, 0, 0], ![0, 0, 12834351801224451030441536743895649770069009086021632, 128333199418489486323512554400434317665941201923080192, 0, 0, 241956333996758277235632665643247328468674569536798720, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 12832564179234757282045036081416584326091365666521088, 128336213493383799519969638819756068530275266383052800, 0, 0, 241955107543853657787572081886404643048318148496326656, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 24383462300586118129110025454607795253969029596971008, 0, 0, 35015285547321404059899875875103074660978450323472384, 0, 0, 323725137368564692400576855457866425989737300625457152, 0, 0, 0, 0], ![383123885216472214589586756787577295904684780545900544, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 24383462300586118129110025454607795253969029596971008, 0, 0, 35015285547321404059899875875103074660978450323472384, 323725137368564692400576855457866425989737300625457152, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 66126837812554117240756759050175422617461698068480, 0, 0, 13689925056614261435071114236095764128331652894031872, 0, 0, 369367833322045399037274885792431356353735665953800192, 0, 0, 0, 0], ![0, 383123885216472214589586756787577295904684780545900544, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 13692711343627277745979038816006852787292361665282048, 126301797373930948815393057331061623793700217538215936, 0, 0, 243129376498913988028214660640508819323692201342402560, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 84640824612625657115188618010614644749272187142144, 0, 0, 13840325925556770584799156462224120731227609850970112, 0, 0, 369198918466302818347672411707342560528707898507788288, 0, 0, 0, 0], ![0, 0, 13843892646326927517553335938561816130430888933588992, 126285110725761633810689304382288105624373766343622656, 0, 0, 242994881844383653261344116466727374149880125268688896, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 383123885216472214589586756787577295904684780545900544, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12379171500878044982373065720792010380911079206158336, 0, 0, 154739651823696742836698830011498460168050300103426048, 216005061891897426770514861055286825355723401236316160, 0, 0], ![383123885216472214589586756787577295904684780545900544, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 12379171500878044982373065720792010380911079206158336, 154739651823696742836698830011498460168050300103426048, 0, 0, 216005061891897426770514861055286825355723401236316160, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 388020560690836604354463794057850478657536, 0, 0, 1684059318800082391100335599937637348100014080, 383123883532024875228813529082887232172989581967228928, 0, 0], ![0, 383123885216472214589586756787577295904684780545900544, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 383123885216472214589586756787577295904684780545900544, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12317880964174060350450662948069960476319770025656320, 0, 0, 153973507146055366846862075836339797921108860336078848, 216832497106242787392274018003167537507256150184165376, 0, 0], ![0, 0, 12317880964174060350450662948069960476319770025656320, 153973507146055366846862075836339797921108860336078848, 0, 0, 216832497106242787392274018003167537507256150184165376, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![383123885216472214589586756787577295904684780545900544, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 383123885216472214589586756787577295904684780545900544, 0], ![383123885216472214589586756787577295904684780545900544, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 383123885216472214589586756787577295904684780545900544, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 383123885216472214589586756787577295904684780545900544, 0], ![0, 383123885216472214589586756787577295904684780545900544, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![383123885216472214589586756787577295904684780545900544, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 383123885216472214589586756787577295904684780545900544], ![383123885216472214589586756787577295904684780545900544, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![383123885216472214589586756787577295904684780545900544, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]]
]

/-- Column 0: prepared values equal the actual complete child law on every physical axis. -/
theorem checked0 : ∀ axis, integerVectorCheck (rows 0 axis)
    (fun orbit => RootFineCachedParent4.child parent3 91 0 axis orbit) = true := by decide +kernel
/-- Column 1: prepared values equal the actual complete child law on every physical axis. -/
theorem checked1 : ∀ axis, integerVectorCheck (rows 1 axis)
    (fun orbit => RootFineCachedParent4.child parent3 91 1 axis orbit) = true := by decide +kernel
/-- Column 2: prepared values equal the actual complete child law on every physical axis. -/
theorem checked2 : ∀ axis, integerVectorCheck (rows 2 axis)
    (fun orbit => RootFineCachedParent4.child parent3 91 2 axis orbit) = true := by decide +kernel
/-- Column 3: prepared values equal the actual complete child law on every physical axis. -/
theorem checked3 : ∀ axis, integerVectorCheck (rows 3 axis)
    (fun orbit => RootFineCachedParent4.child parent3 91 3 axis orbit) = true := by decide +kernel
/-- Column 4: prepared values equal the actual complete child law on every physical axis. -/
theorem checked4 : ∀ axis, integerVectorCheck (rows 4 axis)
    (fun orbit => RootFineCachedParent4.child parent3 91 4 axis orbit) = true := by decide +kernel
/-- Column 5: prepared values equal the actual complete child law on every physical axis. -/
theorem checked5 : ∀ axis, integerVectorCheck (rows 5 axis)
    (fun orbit => RootFineCachedParent4.child parent3 91 5 axis orbit) = true := by decide +kernel
/-- Column 6: prepared values equal the actual complete child law on every physical axis. -/
theorem checked6 : ∀ axis, integerVectorCheck (rows 6 axis)
    (fun orbit => RootFineCachedParent4.child parent3 91 6 axis orbit) = true := by decide +kernel
/-- Column 7: prepared values equal the actual complete child law on every physical axis. -/
theorem checked7 : ∀ axis, integerVectorCheck (rows 7 axis)
    (fun orbit => RootFineCachedParent4.child parent3 91 7 axis orbit) = true := by decide +kernel
/-- Column 8: prepared values equal the actual complete child law on every physical axis. -/
theorem checked8 : ∀ axis, integerVectorCheck (rows 8 axis)
    (fun orbit => RootFineCachedParent4.child parent3 91 8 axis orbit) = true := by decide +kernel
/-- Column 9: prepared values equal the actual complete child law on every physical axis. -/
theorem checked9 : ∀ axis, integerVectorCheck (rows 9 axis)
    (fun orbit => RootFineCachedParent4.child parent3 91 9 axis orbit) = true := by decide +kernel
/-- Column 10: prepared values equal the actual complete child law on every physical axis. -/
theorem checked10 : ∀ axis, integerVectorCheck (rows 10 axis)
    (fun orbit => RootFineCachedParent4.child parent3 91 10 axis orbit) = true := by decide +kernel
/-- Column 11: prepared values equal the actual complete child law on every physical axis. -/
theorem checked11 : ∀ axis, integerVectorCheck (rows 11 axis)
    (fun orbit => RootFineCachedParent4.child parent3 91 11 axis orbit) = true := by decide +kernel
/-- Column 12: prepared values equal the actual complete child law on every physical axis. -/
theorem checked12 : ∀ axis, integerVectorCheck (rows 12 axis)
    (fun orbit => RootFineCachedParent4.child parent3 91 12 axis orbit) = true := by decide +kernel
/-- Column 13: prepared values equal the actual complete child law on every physical axis. -/
theorem checked13 : ∀ axis, integerVectorCheck (rows 13 axis)
    (fun orbit => RootFineCachedParent4.child parent3 91 13 axis orbit) = true := by decide +kernel
/-- Column 14: prepared values equal the actual complete child law on every physical axis. -/
theorem checked14 : ∀ axis, integerVectorCheck (rows 14 axis)
    (fun orbit => RootFineCachedParent4.child parent3 91 14 axis orbit) = true := by decide +kernel
/-- Column 15: prepared values equal the actual complete child law on every physical axis. -/
theorem checked15 : ∀ axis, integerVectorCheck (rows 15 axis)
    (fun orbit => RootFineCachedParent4.child parent3 91 15 axis orbit) = true := by decide +kernel
/-- Column 16: prepared values equal the actual complete child law on every physical axis. -/
theorem checked16 : ∀ axis, integerVectorCheck (rows 16 axis)
    (fun orbit => RootFineCachedParent4.child parent3 91 16 axis orbit) = true := by decide +kernel
/-- Column 17: prepared values equal the actual complete child law on every physical axis. -/
theorem checked17 : ∀ axis, integerVectorCheck (rows 17 axis)
    (fun orbit => RootFineCachedParent4.child parent3 91 17 axis orbit) = true := by decide +kernel
/-- Column 18: prepared values equal the actual complete child law on every physical axis. -/
theorem checked18 : ∀ axis, integerVectorCheck (rows 18 axis)
    (fun orbit => RootFineCachedParent4.child parent3 91 18 axis orbit) = true := by decide +kernel
/-- Column 19: prepared values equal the actual complete child law on every physical axis. -/
theorem checked19 : ∀ axis, integerVectorCheck (rows 19 axis)
    (fun orbit => RootFineCachedParent4.child parent3 91 19 axis orbit) = true := by decide +kernel
/-- Column 20: prepared values equal the actual complete child law on every physical axis. -/
theorem checked20 : ∀ axis, integerVectorCheck (rows 20 axis)
    (fun orbit => RootFineCachedParent4.child parent3 91 20 axis orbit) = true := by decide +kernel
/-- Column 21: prepared values equal the actual complete child law on every physical axis. -/
theorem checked21 : ∀ axis, integerVectorCheck (rows 21 axis)
    (fun orbit => RootFineCachedParent4.child parent3 91 21 axis orbit) = true := by decide +kernel
/-- Column 22: prepared values equal the actual complete child law on every physical axis. -/
theorem checked22 : ∀ axis, integerVectorCheck (rows 22 axis)
    (fun orbit => RootFineCachedParent4.child parent3 91 22 axis orbit) = true := by decide +kernel
/-- Column 23: prepared values equal the actual complete child law on every physical axis. -/
theorem checked23 : ∀ axis, integerVectorCheck (rows 23 axis)
    (fun orbit => RootFineCachedParent4.child parent3 91 23 axis orbit) = true := by decide +kernel
/-- Column 24: prepared values equal the actual complete child law on every physical axis. -/
theorem checked24 : ∀ axis, integerVectorCheck (rows 24 axis)
    (fun orbit => RootFineCachedParent4.child parent3 91 24 axis orbit) = true := by decide +kernel
/-- Column 25: prepared values equal the actual complete child law on every physical axis. -/
theorem checked25 : ∀ axis, integerVectorCheck (rows 25 axis)
    (fun orbit => RootFineCachedParent4.child parent3 91 25 axis orbit) = true := by decide +kernel
/-- Column 26: prepared values equal the actual complete child law on every physical axis. -/
theorem checked26 : ∀ axis, integerVectorCheck (rows 26 axis)
    (fun orbit => RootFineCachedParent4.child parent3 91 26 axis orbit) = true := by decide +kernel
/-- Column 27: prepared values equal the actual complete child law on every physical axis. -/
theorem checked27 : ∀ axis, integerVectorCheck (rows 27 axis)
    (fun orbit => RootFineCachedParent4.child parent3 91 27 axis orbit) = true := by decide +kernel
/-- Column 28: prepared values equal the actual complete child law on every physical axis. -/
theorem checked28 : ∀ axis, integerVectorCheck (rows 28 axis)
    (fun orbit => RootFineCachedParent4.child parent3 91 28 axis orbit) = true := by decide +kernel
/-- Column 29: prepared values equal the actual complete child law on every physical axis. -/
theorem checked29 : ∀ axis, integerVectorCheck (rows 29 axis)
    (fun orbit => RootFineCachedParent4.child parent3 91 29 axis orbit) = true := by decide +kernel
/-- Column 30: prepared values equal the actual complete child law on every physical axis. -/
theorem checked30 : ∀ axis, integerVectorCheck (rows 30 axis)
    (fun orbit => RootFineCachedParent4.child parent3 91 30 axis orbit) = true := by decide +kernel
/-- Column 31: prepared values equal the actual complete child law on every physical axis. -/
theorem checked31 : ∀ axis, integerVectorCheck (rows 31 axis)
    (fun orbit => RootFineCachedParent4.child parent3 91 31 axis orbit) = true := by decide +kernel
/-- Column 32: prepared values equal the actual complete child law on every physical axis. -/
theorem checked32 : ∀ axis, integerVectorCheck (rows 32 axis)
    (fun orbit => RootFineCachedParent4.child parent3 91 32 axis orbit) = true := by decide +kernel
/-- Column 33: prepared values equal the actual complete child law on every physical axis. -/
theorem checked33 : ∀ axis, integerVectorCheck (rows 33 axis)
    (fun orbit => RootFineCachedParent4.child parent3 91 33 axis orbit) = true := by decide +kernel
/-- Column 34: prepared values equal the actual complete child law on every physical axis. -/
theorem checked34 : ∀ axis, integerVectorCheck (rows 34 axis)
    (fun orbit => RootFineCachedParent4.child parent3 91 34 axis orbit) = true := by decide +kernel
/-- Column 35: prepared values equal the actual complete child law on every physical axis. -/
theorem checked35 : ∀ axis, integerVectorCheck (rows 35 axis)
    (fun orbit => RootFineCachedParent4.child parent3 91 35 axis orbit) = true := by decide +kernel
/-- Column 36: prepared values equal the actual complete child law on every physical axis. -/
theorem checked36 : ∀ axis, integerVectorCheck (rows 36 axis)
    (fun orbit => RootFineCachedParent4.child parent3 91 36 axis orbit) = true := by decide +kernel
/-- Column 37: prepared values equal the actual complete child law on every physical axis. -/
theorem checked37 : ∀ axis, integerVectorCheck (rows 37 axis)
    (fun orbit => RootFineCachedParent4.child parent3 91 37 axis orbit) = true := by decide +kernel
/-- Column 38: prepared values equal the actual complete child law on every physical axis. -/
theorem checked38 : ∀ axis, integerVectorCheck (rows 38 axis)
    (fun orbit => RootFineCachedParent4.child parent3 91 38 axis orbit) = true := by decide +kernel
/-- Column 39: prepared values equal the actual complete child law on every physical axis. -/
theorem checked39 : ∀ axis, integerVectorCheck (rows 39 axis)
    (fun orbit => RootFineCachedParent4.child parent3 91 39 axis orbit) = true := by decide +kernel
/-- Column 40: prepared values equal the actual complete child law on every physical axis. -/
theorem checked40 : ∀ axis, integerVectorCheck (rows 40 axis)
    (fun orbit => RootFineCachedParent4.child parent3 91 40 axis orbit) = true := by decide +kernel
/-- Column 41: prepared values equal the actual complete child law on every physical axis. -/
theorem checked41 : ∀ axis, integerVectorCheck (rows 41 axis)
    (fun orbit => RootFineCachedParent4.child parent3 91 41 axis orbit) = true := by decide +kernel
/-- Column 42: prepared values equal the actual complete child law on every physical axis. -/
theorem checked42 : ∀ axis, integerVectorCheck (rows 42 axis)
    (fun orbit => RootFineCachedParent4.child parent3 91 42 axis orbit) = true := by decide +kernel
/-- Column 43: prepared values equal the actual complete child law on every physical axis. -/
theorem checked43 : ∀ axis, integerVectorCheck (rows 43 axis)
    (fun orbit => RootFineCachedParent4.child parent3 91 43 axis orbit) = true := by decide +kernel
/-- Column 44: prepared values equal the actual complete child law on every physical axis. -/
theorem checked44 : ∀ axis, integerVectorCheck (rows 44 axis)
    (fun orbit => RootFineCachedParent4.child parent3 91 44 axis orbit) = true := by decide +kernel

/-- Every prepared child row is exact. -/
theorem rows_checked : ∀ column axis, integerVectorCheck (rows column axis)
    (fun orbit => RootFineCachedParent4.child parent3 91 column axis orbit) = true := by
  intro column axis
  fin_cases column
  exacts [checked0 axis, checked1 axis, checked2 axis, checked3 axis, checked4 axis, checked5 axis, checked6 axis, checked7 axis, checked8 axis, checked9 axis, checked10 axis, checked11 axis, checked12 axis, checked13 axis, checked14 axis, checked15 axis, checked16 axis, checked17 axis, checked18 axis, checked19 axis, checked20 axis, checked21 axis, checked22 axis, checked23 axis, checked24 axis, checked25 axis, checked26 axis, checked27 axis, checked28 axis, checked29 axis, checked30 axis, checked31 axis, checked32 axis, checked33 axis, checked34 axis, checked35 axis, checked36 axis, checked37 axis, checked38 axis, checked39 axis, checked40 axis, checked41 axis, checked42 axis, checked43 axis, checked44 axis]

/-- Fast exact child lookup for original parent 91. -/
def numerator (column : Fin 45) (axis : Fin 3) (orbit : Fin 21) : ℤ := rows column axis orbit

/-- Every cached child value equals the complete original integer child hierarchy. -/
theorem numerator_eq : ∀ column axis orbit, numerator column axis orbit =
    SuppliedRootFineChild3Integers.numerator 91 (shapeColumnEquiv 8 column) axis orbit :=
  fun column axis orbit => (integerVectorCheck_sound _ _ (rows_checked column axis) orbit).trans
    (RootFineCachedParent4.child_eq parent3 parent3_eq 91 column axis orbit)

end MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4Children091
