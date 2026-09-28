import SuppliedPairedFineTableReads
import RootFineCachedParent4
import RootFineIntegerVectorCheck
import SuppliedRootFineParent3Block920
import SuppliedRootFineParent3Block921
import SuppliedRootFineParent3Block922
import SuppliedRootFineParent3Block923
import SuppliedRootFineParent3Block924
import SuppliedRootFineParent3Block925

namespace MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4Children097
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Proof-free read of the checked complete parent3 table of original node 920. -/
def read920 (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  SuppliedRootFineParent3Block920.value 0 strategy axis orbit
/-- The proof-free read equals the complete original integer parent3 law of node 920. -/
theorem read920_eq (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) :
    read920 strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator ⟨920, by omega⟩ strategy axis orbit :=
  nodeRead_eq SuppliedRootFineParent3Block920.table read920 (fun _ _ _ => rfl) strategy axis orbit

/-- Proof-free read of the checked complete parent3 table of original node 921. -/
def read921 (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  SuppliedRootFineParent3Block921.value 0 strategy axis orbit
/-- The proof-free read equals the complete original integer parent3 law of node 921. -/
theorem read921_eq (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) :
    read921 strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator ⟨921, by omega⟩ strategy axis orbit :=
  nodeRead_eq SuppliedRootFineParent3Block921.table read921 (fun _ _ _ => rfl) strategy axis orbit

/-- Proof-free read of the checked complete parent3 table of original node 922. -/
def read922 (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  SuppliedRootFineParent3Block922.value 0 strategy axis orbit
/-- The proof-free read equals the complete original integer parent3 law of node 922. -/
theorem read922_eq (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) :
    read922 strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator ⟨922, by omega⟩ strategy axis orbit :=
  nodeRead_eq SuppliedRootFineParent3Block922.table read922 (fun _ _ _ => rfl) strategy axis orbit

/-- Proof-free read of the checked complete parent3 table of original node 923. -/
def read923 (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  SuppliedRootFineParent3Block923.value 0 strategy axis orbit
/-- The proof-free read equals the complete original integer parent3 law of node 923. -/
theorem read923_eq (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) :
    read923 strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator ⟨923, by omega⟩ strategy axis orbit :=
  nodeRead_eq SuppliedRootFineParent3Block923.table read923 (fun _ _ _ => rfl) strategy axis orbit

/-- Proof-free read of the checked complete parent3 table of original node 924. -/
def read924 (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  SuppliedRootFineParent3Block924.value 0 strategy axis orbit
/-- The proof-free read equals the complete original integer parent3 law of node 924. -/
theorem read924_eq (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) :
    read924 strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator ⟨924, by omega⟩ strategy axis orbit :=
  nodeRead_eq SuppliedRootFineParent3Block924.table read924 (fun _ _ _ => rfl) strategy axis orbit

/-- Proof-free read of the checked complete parent3 table of original node 925. -/
def read925 (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  SuppliedRootFineParent3Block925.value 0 strategy axis orbit
/-- The proof-free read equals the complete original integer parent3 law of node 925. -/
theorem read925_eq (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) :
    read925 strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator ⟨925, by omega⟩ strategy axis orbit :=
  nodeRead_eq SuppliedRootFineParent3Block925.table read925 (fun _ _ _ => rfl) strategy axis orbit

/-- Complete parent3 lookup through proof-free reads of the checked tables, with the exact source formula elsewhere. -/
def parent3 : RootFineCachedParent4.Parent3Values :=
  extendParent3 920 read920 (extendParent3 921 read921 (extendParent3 922 read922 (extendParent3 923 read923 (extendParent3 924 read924 (extendParent3 925 read925 (SuppliedRootFineParent3Integers.numerator))))))
/-- Every parent3 value equals the complete original integer hierarchy. -/
theorem parent3_eq : ∀ node strategy axis orbit, parent3 node strategy axis orbit =
    SuppliedRootFineParent3Integers.numerator node strategy axis orbit :=
  (extendParent3_eq 920 (by omega) read920 read920_eq _ (extendParent3_eq 921 (by omega) read921 read921_eq _ (extendParent3_eq 922 (by omega) read922 read922_eq _ (extendParent3_eq 923 (by omega) read923 read923_eq _ (extendParent3_eq 924 (by omega) read924 read924_eq _ (extendParent3_eq 925 (by omega) read925 read925_eq _ (fun _ _ _ _ => rfl)))))))

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
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 10134318025305257526740632130003709808614773962571776, 0, 0, 25115491353402881777467083969826173659709404130312192, 347874075837764075285379040687747412436360602453016576, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 10086826275558372142505620688897945628447290817511424, 0, 0, 15056000472744933299487691928841131420306587894415360, 357981058468168909147593444169838218855930901833973760, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 6694638983154644069011220631732422804864499762331648, 135426916248381630992846229408035622587283787413979136, 0, 0, 241002329984935939527729306747809250512536493369589760, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 252466167668979424678829225092702697014521566855168, 0, 0, 0, 60138163910666530544229871406356942405825079785029632, 0, 1250677158855208674874722540455950733347802072657920, 25792909433426955233798141734727073892406720061939712, 0, 0, 295689668545854540712005191880944626176090657059418112, 0, 0, 0, 0, 0], ![0, 0, 12924432397980107530847287024616401187985127225950208, 128411838685062957296895335243181647248435152125165568, 0, 0, 241787614133429149761844134519779247468264501194784768, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 12929910564672498079786910468297286988170004545929216, 128403356530662284060051354247206104491028187516502016, 0, 0, 241790618121137432449748492072073904425486588483469312, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 256390302236274080319309990069482854914045283139584, 0, 0, 0, 60247525628807981578025859424541710476231887556706304, 0, 92173017651955548124724874235385312717651357472768, 31753214936161657629205833002213825660878764150083584, 0, 0, 290774581331614345753911029496516891599942432198498304, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 10170529691312577451429806361473943799428019537313792, 0, 0, 33100293387109982923582031366043060155817361628200960, 339853062138049654214574919060060291949439399380385792, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 383123885216472214589586756787577295904684780545900544, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1788032346565814133336124857608599727122072907808768, 0, 0, 13883037478946408876569743011411786005275869662150656, 0, 0, 367452815390959991579680888918556910172286837975941120, 0, 0, 0, 0], ![0, 383123885216472214589586756787577295904684780545900544, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 13958439821038685556061866732183710343918927216640000, 126356559564488429176938167014905656590870309165334528, 0, 0, 242808885830945099856586723040487928969895544163926016, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2237284168095051046857796408236445095178702549942272, 0, 0, 14353287997941211007936671789649552749015394353676288, 0, 0, 366533313050435952534792288589691298060490683642281984, 0, 0, 0, 0], ![0, 0, 14447634569919471873357475858548457460400240373792768, 126327058148892722125268001610273473801000103960379392, 0, 0, 242349192497660020590961279318755364643284436211728384, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 383123885216472214589586756787577295904684780545900544, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23576984291771492003599313859514415841994107569307648, 0, 0, 35579332807640937696054960306714124908494031285125120, 0, 0, 323967568117059784889932482621348755154196641691467776, 0, 0, 0, 0], ![0, 0, 0, 0, 23576984291771492003599313859514415841994107569307648, 0, 0, 35579332807640937696054960306714124908494031285125120, 323967568117059784889932482621348755154196641691467776, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![383123885216472214589586756787577295904684780545900544, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12653787228859882510889297541051678054012326227476480, 0, 0, 153176536226117333313718677093247996099819371124228096, 217293561761494998764978782153277621750853083194195968, 0, 0], ![383123885216472214589586756787577295904684780545900544, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 12653787228859882510889297541051678054012326227476480, 153176536226117333313718677093247996099819371124228096, 0, 0, 217293561761494998764978782153277621750853083194195968, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 85820240370267629362074421679433224254652416, 0, 0, 14265222469522253087253431985999067891310584630607872, 368858662661129721132065695439503806333940971660640256, 0, 0], ![0, 383123885216472214589586756787577295904684780545900544, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 383123885216472214589586756787577295904684780545900544, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12932943366263395675746522892015938660867829355511808, 0, 0, 155972894927138558275242791375416657037130574063468544, 214218046923070260638597442520144700206686377126920192, 0, 0], ![0, 0, 12932943366263395675746522892015938660867829355511808, 155972894927138558275242791375416657037130574063468544, 0, 0, 214218046923070260638597442520144700206686377126920192, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![383123885216472214589586756787577295904684780545900544, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 383123885216472214589586756787577295904684780545900544, 0], ![383123885216472214589586756787577295904684780545900544, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 383123885216472214589586756787577295904684780545900544, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 383123885216472214589586756787577295904684780545900544, 0], ![0, 383123885216472214589586756787577295904684780545900544, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![383123885216472214589586756787577295904684780545900544, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 383123885216472214589586756787577295904684780545900544], ![383123885216472214589586756787577295904684780545900544, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![383123885216472214589586756787577295904684780545900544, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]]
]

/-- Column 0: prepared values equal the actual complete child law on every physical axis. -/
theorem checked0 : ∀ axis, integerVectorCheck (rows 0 axis)
    (fun orbit => RootFineCachedParent4.child parent3 97 0 axis orbit) = true := by decide +kernel
/-- Column 1: prepared values equal the actual complete child law on every physical axis. -/
theorem checked1 : ∀ axis, integerVectorCheck (rows 1 axis)
    (fun orbit => RootFineCachedParent4.child parent3 97 1 axis orbit) = true := by decide +kernel
/-- Column 2: prepared values equal the actual complete child law on every physical axis. -/
theorem checked2 : ∀ axis, integerVectorCheck (rows 2 axis)
    (fun orbit => RootFineCachedParent4.child parent3 97 2 axis orbit) = true := by decide +kernel
/-- Column 3: prepared values equal the actual complete child law on every physical axis. -/
theorem checked3 : ∀ axis, integerVectorCheck (rows 3 axis)
    (fun orbit => RootFineCachedParent4.child parent3 97 3 axis orbit) = true := by decide +kernel
/-- Column 4: prepared values equal the actual complete child law on every physical axis. -/
theorem checked4 : ∀ axis, integerVectorCheck (rows 4 axis)
    (fun orbit => RootFineCachedParent4.child parent3 97 4 axis orbit) = true := by decide +kernel
/-- Column 5: prepared values equal the actual complete child law on every physical axis. -/
theorem checked5 : ∀ axis, integerVectorCheck (rows 5 axis)
    (fun orbit => RootFineCachedParent4.child parent3 97 5 axis orbit) = true := by decide +kernel
/-- Column 6: prepared values equal the actual complete child law on every physical axis. -/
theorem checked6 : ∀ axis, integerVectorCheck (rows 6 axis)
    (fun orbit => RootFineCachedParent4.child parent3 97 6 axis orbit) = true := by decide +kernel
/-- Column 7: prepared values equal the actual complete child law on every physical axis. -/
theorem checked7 : ∀ axis, integerVectorCheck (rows 7 axis)
    (fun orbit => RootFineCachedParent4.child parent3 97 7 axis orbit) = true := by decide +kernel
/-- Column 8: prepared values equal the actual complete child law on every physical axis. -/
theorem checked8 : ∀ axis, integerVectorCheck (rows 8 axis)
    (fun orbit => RootFineCachedParent4.child parent3 97 8 axis orbit) = true := by decide +kernel
/-- Column 9: prepared values equal the actual complete child law on every physical axis. -/
theorem checked9 : ∀ axis, integerVectorCheck (rows 9 axis)
    (fun orbit => RootFineCachedParent4.child parent3 97 9 axis orbit) = true := by decide +kernel
/-- Column 10: prepared values equal the actual complete child law on every physical axis. -/
theorem checked10 : ∀ axis, integerVectorCheck (rows 10 axis)
    (fun orbit => RootFineCachedParent4.child parent3 97 10 axis orbit) = true := by decide +kernel
/-- Column 11: prepared values equal the actual complete child law on every physical axis. -/
theorem checked11 : ∀ axis, integerVectorCheck (rows 11 axis)
    (fun orbit => RootFineCachedParent4.child parent3 97 11 axis orbit) = true := by decide +kernel
/-- Column 12: prepared values equal the actual complete child law on every physical axis. -/
theorem checked12 : ∀ axis, integerVectorCheck (rows 12 axis)
    (fun orbit => RootFineCachedParent4.child parent3 97 12 axis orbit) = true := by decide +kernel
/-- Column 13: prepared values equal the actual complete child law on every physical axis. -/
theorem checked13 : ∀ axis, integerVectorCheck (rows 13 axis)
    (fun orbit => RootFineCachedParent4.child parent3 97 13 axis orbit) = true := by decide +kernel
/-- Column 14: prepared values equal the actual complete child law on every physical axis. -/
theorem checked14 : ∀ axis, integerVectorCheck (rows 14 axis)
    (fun orbit => RootFineCachedParent4.child parent3 97 14 axis orbit) = true := by decide +kernel
/-- Column 15: prepared values equal the actual complete child law on every physical axis. -/
theorem checked15 : ∀ axis, integerVectorCheck (rows 15 axis)
    (fun orbit => RootFineCachedParent4.child parent3 97 15 axis orbit) = true := by decide +kernel
/-- Column 16: prepared values equal the actual complete child law on every physical axis. -/
theorem checked16 : ∀ axis, integerVectorCheck (rows 16 axis)
    (fun orbit => RootFineCachedParent4.child parent3 97 16 axis orbit) = true := by decide +kernel
/-- Column 17: prepared values equal the actual complete child law on every physical axis. -/
theorem checked17 : ∀ axis, integerVectorCheck (rows 17 axis)
    (fun orbit => RootFineCachedParent4.child parent3 97 17 axis orbit) = true := by decide +kernel
/-- Column 18: prepared values equal the actual complete child law on every physical axis. -/
theorem checked18 : ∀ axis, integerVectorCheck (rows 18 axis)
    (fun orbit => RootFineCachedParent4.child parent3 97 18 axis orbit) = true := by decide +kernel
/-- Column 19: prepared values equal the actual complete child law on every physical axis. -/
theorem checked19 : ∀ axis, integerVectorCheck (rows 19 axis)
    (fun orbit => RootFineCachedParent4.child parent3 97 19 axis orbit) = true := by decide +kernel
/-- Column 20: prepared values equal the actual complete child law on every physical axis. -/
theorem checked20 : ∀ axis, integerVectorCheck (rows 20 axis)
    (fun orbit => RootFineCachedParent4.child parent3 97 20 axis orbit) = true := by decide +kernel
/-- Column 21: prepared values equal the actual complete child law on every physical axis. -/
theorem checked21 : ∀ axis, integerVectorCheck (rows 21 axis)
    (fun orbit => RootFineCachedParent4.child parent3 97 21 axis orbit) = true := by decide +kernel
/-- Column 22: prepared values equal the actual complete child law on every physical axis. -/
theorem checked22 : ∀ axis, integerVectorCheck (rows 22 axis)
    (fun orbit => RootFineCachedParent4.child parent3 97 22 axis orbit) = true := by decide +kernel
/-- Column 23: prepared values equal the actual complete child law on every physical axis. -/
theorem checked23 : ∀ axis, integerVectorCheck (rows 23 axis)
    (fun orbit => RootFineCachedParent4.child parent3 97 23 axis orbit) = true := by decide +kernel
/-- Column 24: prepared values equal the actual complete child law on every physical axis. -/
theorem checked24 : ∀ axis, integerVectorCheck (rows 24 axis)
    (fun orbit => RootFineCachedParent4.child parent3 97 24 axis orbit) = true := by decide +kernel
/-- Column 25: prepared values equal the actual complete child law on every physical axis. -/
theorem checked25 : ∀ axis, integerVectorCheck (rows 25 axis)
    (fun orbit => RootFineCachedParent4.child parent3 97 25 axis orbit) = true := by decide +kernel
/-- Column 26: prepared values equal the actual complete child law on every physical axis. -/
theorem checked26 : ∀ axis, integerVectorCheck (rows 26 axis)
    (fun orbit => RootFineCachedParent4.child parent3 97 26 axis orbit) = true := by decide +kernel
/-- Column 27: prepared values equal the actual complete child law on every physical axis. -/
theorem checked27 : ∀ axis, integerVectorCheck (rows 27 axis)
    (fun orbit => RootFineCachedParent4.child parent3 97 27 axis orbit) = true := by decide +kernel
/-- Column 28: prepared values equal the actual complete child law on every physical axis. -/
theorem checked28 : ∀ axis, integerVectorCheck (rows 28 axis)
    (fun orbit => RootFineCachedParent4.child parent3 97 28 axis orbit) = true := by decide +kernel
/-- Column 29: prepared values equal the actual complete child law on every physical axis. -/
theorem checked29 : ∀ axis, integerVectorCheck (rows 29 axis)
    (fun orbit => RootFineCachedParent4.child parent3 97 29 axis orbit) = true := by decide +kernel
/-- Column 30: prepared values equal the actual complete child law on every physical axis. -/
theorem checked30 : ∀ axis, integerVectorCheck (rows 30 axis)
    (fun orbit => RootFineCachedParent4.child parent3 97 30 axis orbit) = true := by decide +kernel
/-- Column 31: prepared values equal the actual complete child law on every physical axis. -/
theorem checked31 : ∀ axis, integerVectorCheck (rows 31 axis)
    (fun orbit => RootFineCachedParent4.child parent3 97 31 axis orbit) = true := by decide +kernel
/-- Column 32: prepared values equal the actual complete child law on every physical axis. -/
theorem checked32 : ∀ axis, integerVectorCheck (rows 32 axis)
    (fun orbit => RootFineCachedParent4.child parent3 97 32 axis orbit) = true := by decide +kernel
/-- Column 33: prepared values equal the actual complete child law on every physical axis. -/
theorem checked33 : ∀ axis, integerVectorCheck (rows 33 axis)
    (fun orbit => RootFineCachedParent4.child parent3 97 33 axis orbit) = true := by decide +kernel
/-- Column 34: prepared values equal the actual complete child law on every physical axis. -/
theorem checked34 : ∀ axis, integerVectorCheck (rows 34 axis)
    (fun orbit => RootFineCachedParent4.child parent3 97 34 axis orbit) = true := by decide +kernel
/-- Column 35: prepared values equal the actual complete child law on every physical axis. -/
theorem checked35 : ∀ axis, integerVectorCheck (rows 35 axis)
    (fun orbit => RootFineCachedParent4.child parent3 97 35 axis orbit) = true := by decide +kernel
/-- Column 36: prepared values equal the actual complete child law on every physical axis. -/
theorem checked36 : ∀ axis, integerVectorCheck (rows 36 axis)
    (fun orbit => RootFineCachedParent4.child parent3 97 36 axis orbit) = true := by decide +kernel
/-- Column 37: prepared values equal the actual complete child law on every physical axis. -/
theorem checked37 : ∀ axis, integerVectorCheck (rows 37 axis)
    (fun orbit => RootFineCachedParent4.child parent3 97 37 axis orbit) = true := by decide +kernel
/-- Column 38: prepared values equal the actual complete child law on every physical axis. -/
theorem checked38 : ∀ axis, integerVectorCheck (rows 38 axis)
    (fun orbit => RootFineCachedParent4.child parent3 97 38 axis orbit) = true := by decide +kernel
/-- Column 39: prepared values equal the actual complete child law on every physical axis. -/
theorem checked39 : ∀ axis, integerVectorCheck (rows 39 axis)
    (fun orbit => RootFineCachedParent4.child parent3 97 39 axis orbit) = true := by decide +kernel
/-- Column 40: prepared values equal the actual complete child law on every physical axis. -/
theorem checked40 : ∀ axis, integerVectorCheck (rows 40 axis)
    (fun orbit => RootFineCachedParent4.child parent3 97 40 axis orbit) = true := by decide +kernel
/-- Column 41: prepared values equal the actual complete child law on every physical axis. -/
theorem checked41 : ∀ axis, integerVectorCheck (rows 41 axis)
    (fun orbit => RootFineCachedParent4.child parent3 97 41 axis orbit) = true := by decide +kernel
/-- Column 42: prepared values equal the actual complete child law on every physical axis. -/
theorem checked42 : ∀ axis, integerVectorCheck (rows 42 axis)
    (fun orbit => RootFineCachedParent4.child parent3 97 42 axis orbit) = true := by decide +kernel
/-- Column 43: prepared values equal the actual complete child law on every physical axis. -/
theorem checked43 : ∀ axis, integerVectorCheck (rows 43 axis)
    (fun orbit => RootFineCachedParent4.child parent3 97 43 axis orbit) = true := by decide +kernel
/-- Column 44: prepared values equal the actual complete child law on every physical axis. -/
theorem checked44 : ∀ axis, integerVectorCheck (rows 44 axis)
    (fun orbit => RootFineCachedParent4.child parent3 97 44 axis orbit) = true := by decide +kernel

/-- Every prepared child row is exact. -/
theorem rows_checked : ∀ column axis, integerVectorCheck (rows column axis)
    (fun orbit => RootFineCachedParent4.child parent3 97 column axis orbit) = true := by
  intro column axis
  fin_cases column
  exacts [checked0 axis, checked1 axis, checked2 axis, checked3 axis, checked4 axis, checked5 axis, checked6 axis, checked7 axis, checked8 axis, checked9 axis, checked10 axis, checked11 axis, checked12 axis, checked13 axis, checked14 axis, checked15 axis, checked16 axis, checked17 axis, checked18 axis, checked19 axis, checked20 axis, checked21 axis, checked22 axis, checked23 axis, checked24 axis, checked25 axis, checked26 axis, checked27 axis, checked28 axis, checked29 axis, checked30 axis, checked31 axis, checked32 axis, checked33 axis, checked34 axis, checked35 axis, checked36 axis, checked37 axis, checked38 axis, checked39 axis, checked40 axis, checked41 axis, checked42 axis, checked43 axis, checked44 axis]

/-- Fast exact child lookup for original parent 97. -/
def numerator (column : Fin 45) (axis : Fin 3) (orbit : Fin 21) : ℤ := rows column axis orbit

/-- Every cached child value equals the complete original integer child hierarchy. -/
theorem numerator_eq : ∀ column axis orbit, numerator column axis orbit =
    SuppliedRootFineChild3Integers.numerator 97 (shapeColumnEquiv 8 column) axis orbit :=
  fun column axis orbit => (integerVectorCheck_sound _ _ (rows_checked column axis) orbit).trans
    (RootFineCachedParent4.child_eq parent3 parent3_eq 97 column axis orbit)

end MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4Children097
