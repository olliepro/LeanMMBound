module

public import FKLTerm.Builder
public import FKLCert.WindowValue
public import FKL.Search
public import FKLFine3.Boundary

/-! An accepted fast block check gives the terminal block boundary identity. -/

@[expose] public section

namespace MatrixBounds.Numeric.FKLTerm

open FKL FKLCert TerminalSourceNodeLookup SuppliedTerminalRates
open scoped BigOperators

theorem boundary_of_check (b : Fin 135) (axis : Fin 3) {count : ℕ} (table : SourceTable IntegerLogTerm count)
    (tree : Tree) (KW MW : ℕ) (hreads : RawReads 44 264 KW MW tree table 0)
    (a c : ℕ) (hc : c ≤ count) (L K kw nk depth : ℕ) (corr : List Raw)
    (h : check2 L K kw nk depth (blockRaw b axis []) (windowRaw tree KW MW a (c - a) corr) = true) :
    rationalLogValue (blockExpression b axis) =
      rationalLogValue (certificateWindow table a c) + rawValue 44 264 corr := by
  have e := check2_sound 44 264 L K kw nk depth _ _ h
  rw [blockRaw_value b axis [], windowRaw_value 44 264 KW MW tree table hreads a c hc corr,
    rawValue_nil, add_zero] at e
  exact e

/-- Corrections listed per block cancel when one accepted check compares their concatenation with `[]`. -/
theorem corrections_cancel (corrs : List (List Raw)) (L K kw nk depth : ℕ)
    (h : check2 L K kw nk depth corrs.flatten [] = true) :
    (corrs.map (rawValue 44 264)).sum = 0 := by
  have e := check2_sound 44 264 L K kw nk depth _ _ h
  rwa [rawValue_nil, FKLFine3.rawValue_flatten] at e

end MatrixBounds.Numeric.FKLTerm
