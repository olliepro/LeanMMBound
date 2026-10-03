module

public import FKLFine4.Node4
public import FKLFine3.Boundary

/-! An accepted fast block check gives the level-four block boundary identity. -/

@[expose] public section

namespace MatrixBounds.Numeric.FKLFine4

open FKL FKLCert FKLFine3 TerminalSourceNodeLookup SuppliedTerminalRates SuppliedPairedFine
open scoped BigOperators

theorem boundary_of_check4 (D : Data4) (hD : D.Valid) {count : ℕ} (table : SourceTable IntegerLogTerm count)
    (tree : Tree) (KW MW : ℕ) (hreads : RawReads 406 494 KW MW tree table 0)
    (b : Fin 15) (axis : Fin 2) (a c : ℕ) (hc : c ≤ count) (L K kw nk depth : ℕ) (corr : List Raw)
    (h : check2 L K kw nk depth (blockRaw4 D b axis []) (windowRaw tree KW MW a (c - a) corr) = true) :
    (∑ offset : Fin 7, rationalLogValue (sourceSum4 (finProdFinEquiv (b, offset)) axis)) =
      rationalLogValue (certificateWindow table a c) + rawValue 406 494 corr := by
  have e := check2_sound 406 494 L K kw nk depth _ _ h
  rw [blockRaw4_value D hD b axis [], windowRaw_value 406 494 KW MW tree table hreads a c hc corr,
    rawValue_nil, add_zero] at e
  exact e

/-- Corrections listed per block cancel when one accepted check compares their concatenation with `[]`. -/
theorem corrections_cancel4 (corrs : List (List Raw)) (L K kw nk depth : ℕ)
    (h : check2 L K kw nk depth corrs.flatten [] = true) :
    (corrs.map (rawValue 406 494)).sum = 0 := by
  have e := check2_sound 406 494 L K kw nk depth _ _ h
  rwa [rawValue_nil, rawValue_flatten] at e

end MatrixBounds.Numeric.FKLFine4
