module

public import FKLCert.Window
public import TerminalRateCertificateWindows

/-! Raw certificate windows read from a linked packed table have the value of `certificateWindow`. -/

@[expose] public section

namespace MatrixBounds.Numeric.FKLCert

open FKL TerminalSourceNodeLookup SuppliedTerminalRates
open scoped BigOperators

/-- Raw terms of the window `[a, a + n)` of the global packed table, consed onto `tail`. -/
noncomputable def windowRaw (tree : Tree) (KW MW a n : Nat) (tail : List Raw) : List Raw :=
  loopL n (fun j t => fastRaw tree KW MW (Nat.add a j) :: t) tail

theorem windowRaw_value (S T KW MW : Nat) (tree : Tree) {count : Nat} (table : SourceTable IntegerLogTerm count)
    (h : RawReads S T KW MW tree table 0) (a b : Nat) (hb : b ≤ count) (tail : List Raw) :
    rawValue S T (windowRaw tree KW MW a (b - a) tail) =
      rationalLogValue (certificateWindow table a b) + rawValue S T tail := by
  unfold windowRaw
  rw [rawValue_loopL S T (b - a) _ (fun j => (certificateTermAt table (a + j)).value)]
  · rw [certificateWindow_value, Finset.sum_Ico_eq_sum_range]
  · intro j hj t
    rw [rawValue_cons]
    congr 1
    have hlt : a + j < count := by omega
    have := h ⟨a + j, hlt⟩
    simp only [Nat.zero_add] at this
    rw [raw_add, this.1, rawOf_value S T _ this.2, certificateTermAt, dif_pos hlt]

end MatrixBounds.Numeric.FKLCert
