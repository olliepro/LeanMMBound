import SuppliedPairedFineTableReads
import RootFineCachedParent4
import RootFineIntegerVectorCheck
import SuppliedRootFineParent3Block942
import SuppliedRootFineParent3Block943

namespace MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4Children103
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Proof-free read of the checked complete parent3 table of original node 942. -/
def read942 (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  SuppliedRootFineParent3Block942.value 0 strategy axis orbit
/-- The proof-free read equals the complete original integer parent3 law of node 942. -/
theorem read942_eq (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) :
    read942 strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator ⟨942, by omega⟩ strategy axis orbit :=
  nodeRead_eq SuppliedRootFineParent3Block942.table read942 (fun _ _ _ => rfl) strategy axis orbit

/-- Proof-free read of the checked complete parent3 table of original node 943. -/
def read943 (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  SuppliedRootFineParent3Block943.value 0 strategy axis orbit
/-- The proof-free read equals the complete original integer parent3 law of node 943. -/
theorem read943_eq (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) :
    read943 strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator ⟨943, by omega⟩ strategy axis orbit :=
  nodeRead_eq SuppliedRootFineParent3Block943.table read943 (fun _ _ _ => rfl) strategy axis orbit

/-- Complete parent3 lookup through proof-free reads of the checked tables, with the exact source formula elsewhere. -/
def parent3 : RootFineCachedParent4.Parent3Values :=
  extendParent3 942 read942 (extendParent3 943 read943 (SuppliedRootFineParent3Integers.numerator))
/-- Every parent3 value equals the complete original integer hierarchy. -/
theorem parent3_eq : ∀ node strategy axis orbit, parent3 node strategy axis orbit =
    SuppliedRootFineParent3Integers.numerator node strategy axis orbit :=
  (extendParent3_eq 942 (by omega) read942 read942_eq _ (extendParent3_eq 943 (by omega) read943 read943_eq _ (fun _ _ _ _ => rfl)))

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
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5465071538984205406775620770107761137436941160022016, 0, 0, 15389093908378850206714827900457277227400666177077248, 0, 0, 362269719769109158976096308117012257539847173208801280, 0, 0, 0, 0], ![0, 0, 15611828744214722272177839850184512632678945224916992, 126404641373868978527719222683153378638390793286451200, 0, 0, 241107415098388513789689694254239404633615042034532352, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 383123885216472214589586756787577295904684780545900544, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 966460038480221958318553627555695494625755136, 0, 0, 18989821985350757495005068275070195080904684630704128, 364134062264661418614359730193953473268084601289441280, 0, 0], ![0, 383123885216472214589586756787577295904684780545900544, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 383123885216472214589586756787577295904684780545900544, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13099877999007425229650576697905345939329918609391616, 0, 0, 155842219391010845590749612368058769330799164639936512, 214181787826453943769186567721613180634555697296572416, 0, 0], ![0, 0, 13099877999007425229650576697905345939329918609391616, 155842219391010845590749612368058769330799164639936512, 0, 0, 214181787826453943769186567721613180634555697296572416, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![383123885216472214589586756787577295904684780545900544, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 383123885216472214589586756787577295904684780545900544, 0], ![383123885216472214589586756787577295904684780545900544, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 383123885216472214589586756787577295904684780545900544, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 383123885216472214589586756787577295904684780545900544, 0], ![0, 383123885216472214589586756787577295904684780545900544, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![383123885216472214589586756787577295904684780545900544, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
  ![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 383123885216472214589586756787577295904684780545900544], ![383123885216472214589586756787577295904684780545900544, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![383123885216472214589586756787577295904684780545900544, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]]
]

/-- Column 0: prepared values equal the actual complete child law on every physical axis. -/
theorem checked0 : ∀ axis, integerVectorCheck (rows 0 axis)
    (fun orbit => RootFineCachedParent4.child parent3 103 0 axis orbit) = true := by decide +kernel
/-- Column 1: prepared values equal the actual complete child law on every physical axis. -/
theorem checked1 : ∀ axis, integerVectorCheck (rows 1 axis)
    (fun orbit => RootFineCachedParent4.child parent3 103 1 axis orbit) = true := by decide +kernel
/-- Column 2: prepared values equal the actual complete child law on every physical axis. -/
theorem checked2 : ∀ axis, integerVectorCheck (rows 2 axis)
    (fun orbit => RootFineCachedParent4.child parent3 103 2 axis orbit) = true := by decide +kernel
/-- Column 3: prepared values equal the actual complete child law on every physical axis. -/
theorem checked3 : ∀ axis, integerVectorCheck (rows 3 axis)
    (fun orbit => RootFineCachedParent4.child parent3 103 3 axis orbit) = true := by decide +kernel
/-- Column 4: prepared values equal the actual complete child law on every physical axis. -/
theorem checked4 : ∀ axis, integerVectorCheck (rows 4 axis)
    (fun orbit => RootFineCachedParent4.child parent3 103 4 axis orbit) = true := by decide +kernel
/-- Column 5: prepared values equal the actual complete child law on every physical axis. -/
theorem checked5 : ∀ axis, integerVectorCheck (rows 5 axis)
    (fun orbit => RootFineCachedParent4.child parent3 103 5 axis orbit) = true := by decide +kernel
/-- Column 6: prepared values equal the actual complete child law on every physical axis. -/
theorem checked6 : ∀ axis, integerVectorCheck (rows 6 axis)
    (fun orbit => RootFineCachedParent4.child parent3 103 6 axis orbit) = true := by decide +kernel
/-- Column 7: prepared values equal the actual complete child law on every physical axis. -/
theorem checked7 : ∀ axis, integerVectorCheck (rows 7 axis)
    (fun orbit => RootFineCachedParent4.child parent3 103 7 axis orbit) = true := by decide +kernel
/-- Column 8: prepared values equal the actual complete child law on every physical axis. -/
theorem checked8 : ∀ axis, integerVectorCheck (rows 8 axis)
    (fun orbit => RootFineCachedParent4.child parent3 103 8 axis orbit) = true := by decide +kernel
/-- Column 9: prepared values equal the actual complete child law on every physical axis. -/
theorem checked9 : ∀ axis, integerVectorCheck (rows 9 axis)
    (fun orbit => RootFineCachedParent4.child parent3 103 9 axis orbit) = true := by decide +kernel
/-- Column 10: prepared values equal the actual complete child law on every physical axis. -/
theorem checked10 : ∀ axis, integerVectorCheck (rows 10 axis)
    (fun orbit => RootFineCachedParent4.child parent3 103 10 axis orbit) = true := by decide +kernel
/-- Column 11: prepared values equal the actual complete child law on every physical axis. -/
theorem checked11 : ∀ axis, integerVectorCheck (rows 11 axis)
    (fun orbit => RootFineCachedParent4.child parent3 103 11 axis orbit) = true := by decide +kernel
/-- Column 12: prepared values equal the actual complete child law on every physical axis. -/
theorem checked12 : ∀ axis, integerVectorCheck (rows 12 axis)
    (fun orbit => RootFineCachedParent4.child parent3 103 12 axis orbit) = true := by decide +kernel
/-- Column 13: prepared values equal the actual complete child law on every physical axis. -/
theorem checked13 : ∀ axis, integerVectorCheck (rows 13 axis)
    (fun orbit => RootFineCachedParent4.child parent3 103 13 axis orbit) = true := by decide +kernel
/-- Column 14: prepared values equal the actual complete child law on every physical axis. -/
theorem checked14 : ∀ axis, integerVectorCheck (rows 14 axis)
    (fun orbit => RootFineCachedParent4.child parent3 103 14 axis orbit) = true := by decide +kernel
/-- Column 15: prepared values equal the actual complete child law on every physical axis. -/
theorem checked15 : ∀ axis, integerVectorCheck (rows 15 axis)
    (fun orbit => RootFineCachedParent4.child parent3 103 15 axis orbit) = true := by decide +kernel
/-- Column 16: prepared values equal the actual complete child law on every physical axis. -/
theorem checked16 : ∀ axis, integerVectorCheck (rows 16 axis)
    (fun orbit => RootFineCachedParent4.child parent3 103 16 axis orbit) = true := by decide +kernel
/-- Column 17: prepared values equal the actual complete child law on every physical axis. -/
theorem checked17 : ∀ axis, integerVectorCheck (rows 17 axis)
    (fun orbit => RootFineCachedParent4.child parent3 103 17 axis orbit) = true := by decide +kernel
/-- Column 18: prepared values equal the actual complete child law on every physical axis. -/
theorem checked18 : ∀ axis, integerVectorCheck (rows 18 axis)
    (fun orbit => RootFineCachedParent4.child parent3 103 18 axis orbit) = true := by decide +kernel
/-- Column 19: prepared values equal the actual complete child law on every physical axis. -/
theorem checked19 : ∀ axis, integerVectorCheck (rows 19 axis)
    (fun orbit => RootFineCachedParent4.child parent3 103 19 axis orbit) = true := by decide +kernel
/-- Column 20: prepared values equal the actual complete child law on every physical axis. -/
theorem checked20 : ∀ axis, integerVectorCheck (rows 20 axis)
    (fun orbit => RootFineCachedParent4.child parent3 103 20 axis orbit) = true := by decide +kernel
/-- Column 21: prepared values equal the actual complete child law on every physical axis. -/
theorem checked21 : ∀ axis, integerVectorCheck (rows 21 axis)
    (fun orbit => RootFineCachedParent4.child parent3 103 21 axis orbit) = true := by decide +kernel
/-- Column 22: prepared values equal the actual complete child law on every physical axis. -/
theorem checked22 : ∀ axis, integerVectorCheck (rows 22 axis)
    (fun orbit => RootFineCachedParent4.child parent3 103 22 axis orbit) = true := by decide +kernel
/-- Column 23: prepared values equal the actual complete child law on every physical axis. -/
theorem checked23 : ∀ axis, integerVectorCheck (rows 23 axis)
    (fun orbit => RootFineCachedParent4.child parent3 103 23 axis orbit) = true := by decide +kernel
/-- Column 24: prepared values equal the actual complete child law on every physical axis. -/
theorem checked24 : ∀ axis, integerVectorCheck (rows 24 axis)
    (fun orbit => RootFineCachedParent4.child parent3 103 24 axis orbit) = true := by decide +kernel
/-- Column 25: prepared values equal the actual complete child law on every physical axis. -/
theorem checked25 : ∀ axis, integerVectorCheck (rows 25 axis)
    (fun orbit => RootFineCachedParent4.child parent3 103 25 axis orbit) = true := by decide +kernel
/-- Column 26: prepared values equal the actual complete child law on every physical axis. -/
theorem checked26 : ∀ axis, integerVectorCheck (rows 26 axis)
    (fun orbit => RootFineCachedParent4.child parent3 103 26 axis orbit) = true := by decide +kernel
/-- Column 27: prepared values equal the actual complete child law on every physical axis. -/
theorem checked27 : ∀ axis, integerVectorCheck (rows 27 axis)
    (fun orbit => RootFineCachedParent4.child parent3 103 27 axis orbit) = true := by decide +kernel
/-- Column 28: prepared values equal the actual complete child law on every physical axis. -/
theorem checked28 : ∀ axis, integerVectorCheck (rows 28 axis)
    (fun orbit => RootFineCachedParent4.child parent3 103 28 axis orbit) = true := by decide +kernel
/-- Column 29: prepared values equal the actual complete child law on every physical axis. -/
theorem checked29 : ∀ axis, integerVectorCheck (rows 29 axis)
    (fun orbit => RootFineCachedParent4.child parent3 103 29 axis orbit) = true := by decide +kernel
/-- Column 30: prepared values equal the actual complete child law on every physical axis. -/
theorem checked30 : ∀ axis, integerVectorCheck (rows 30 axis)
    (fun orbit => RootFineCachedParent4.child parent3 103 30 axis orbit) = true := by decide +kernel
/-- Column 31: prepared values equal the actual complete child law on every physical axis. -/
theorem checked31 : ∀ axis, integerVectorCheck (rows 31 axis)
    (fun orbit => RootFineCachedParent4.child parent3 103 31 axis orbit) = true := by decide +kernel
/-- Column 32: prepared values equal the actual complete child law on every physical axis. -/
theorem checked32 : ∀ axis, integerVectorCheck (rows 32 axis)
    (fun orbit => RootFineCachedParent4.child parent3 103 32 axis orbit) = true := by decide +kernel
/-- Column 33: prepared values equal the actual complete child law on every physical axis. -/
theorem checked33 : ∀ axis, integerVectorCheck (rows 33 axis)
    (fun orbit => RootFineCachedParent4.child parent3 103 33 axis orbit) = true := by decide +kernel
/-- Column 34: prepared values equal the actual complete child law on every physical axis. -/
theorem checked34 : ∀ axis, integerVectorCheck (rows 34 axis)
    (fun orbit => RootFineCachedParent4.child parent3 103 34 axis orbit) = true := by decide +kernel
/-- Column 35: prepared values equal the actual complete child law on every physical axis. -/
theorem checked35 : ∀ axis, integerVectorCheck (rows 35 axis)
    (fun orbit => RootFineCachedParent4.child parent3 103 35 axis orbit) = true := by decide +kernel
/-- Column 36: prepared values equal the actual complete child law on every physical axis. -/
theorem checked36 : ∀ axis, integerVectorCheck (rows 36 axis)
    (fun orbit => RootFineCachedParent4.child parent3 103 36 axis orbit) = true := by decide +kernel
/-- Column 37: prepared values equal the actual complete child law on every physical axis. -/
theorem checked37 : ∀ axis, integerVectorCheck (rows 37 axis)
    (fun orbit => RootFineCachedParent4.child parent3 103 37 axis orbit) = true := by decide +kernel
/-- Column 38: prepared values equal the actual complete child law on every physical axis. -/
theorem checked38 : ∀ axis, integerVectorCheck (rows 38 axis)
    (fun orbit => RootFineCachedParent4.child parent3 103 38 axis orbit) = true := by decide +kernel
/-- Column 39: prepared values equal the actual complete child law on every physical axis. -/
theorem checked39 : ∀ axis, integerVectorCheck (rows 39 axis)
    (fun orbit => RootFineCachedParent4.child parent3 103 39 axis orbit) = true := by decide +kernel
/-- Column 40: prepared values equal the actual complete child law on every physical axis. -/
theorem checked40 : ∀ axis, integerVectorCheck (rows 40 axis)
    (fun orbit => RootFineCachedParent4.child parent3 103 40 axis orbit) = true := by decide +kernel
/-- Column 41: prepared values equal the actual complete child law on every physical axis. -/
theorem checked41 : ∀ axis, integerVectorCheck (rows 41 axis)
    (fun orbit => RootFineCachedParent4.child parent3 103 41 axis orbit) = true := by decide +kernel
/-- Column 42: prepared values equal the actual complete child law on every physical axis. -/
theorem checked42 : ∀ axis, integerVectorCheck (rows 42 axis)
    (fun orbit => RootFineCachedParent4.child parent3 103 42 axis orbit) = true := by decide +kernel
/-- Column 43: prepared values equal the actual complete child law on every physical axis. -/
theorem checked43 : ∀ axis, integerVectorCheck (rows 43 axis)
    (fun orbit => RootFineCachedParent4.child parent3 103 43 axis orbit) = true := by decide +kernel
/-- Column 44: prepared values equal the actual complete child law on every physical axis. -/
theorem checked44 : ∀ axis, integerVectorCheck (rows 44 axis)
    (fun orbit => RootFineCachedParent4.child parent3 103 44 axis orbit) = true := by decide +kernel

/-- Every prepared child row is exact. -/
theorem rows_checked : ∀ column axis, integerVectorCheck (rows column axis)
    (fun orbit => RootFineCachedParent4.child parent3 103 column axis orbit) = true := by
  intro column axis
  fin_cases column
  exacts [checked0 axis, checked1 axis, checked2 axis, checked3 axis, checked4 axis, checked5 axis, checked6 axis, checked7 axis, checked8 axis, checked9 axis, checked10 axis, checked11 axis, checked12 axis, checked13 axis, checked14 axis, checked15 axis, checked16 axis, checked17 axis, checked18 axis, checked19 axis, checked20 axis, checked21 axis, checked22 axis, checked23 axis, checked24 axis, checked25 axis, checked26 axis, checked27 axis, checked28 axis, checked29 axis, checked30 axis, checked31 axis, checked32 axis, checked33 axis, checked34 axis, checked35 axis, checked36 axis, checked37 axis, checked38 axis, checked39 axis, checked40 axis, checked41 axis, checked42 axis, checked43 axis, checked44 axis]

/-- Fast exact child lookup for original parent 103. -/
def numerator (column : Fin 45) (axis : Fin 3) (orbit : Fin 21) : ℤ := rows column axis orbit

/-- Every cached child value equals the complete original integer child hierarchy. -/
theorem numerator_eq : ∀ column axis orbit, numerator column axis orbit =
    SuppliedRootFineChild3Integers.numerator 103 (shapeColumnEquiv 8 column) axis orbit :=
  fun column axis orbit => (integerVectorCheck_sound _ _ (rows_checked column axis) orbit).trans
    (RootFineCachedParent4.child_eq parent3 parent3_eq 103 column axis orbit)

end MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4Children103
