module

public import FKLFine3.Node
public import FKLCert.WindowValue
public import FKL.Search

/-! An accepted fast block check gives the block boundary identity used by the certified assembly. -/

@[expose] public section

namespace MatrixBounds.Numeric.FKLFine3

open FKL FKLCert TerminalSourceNodeLookup SuppliedTerminalRates SuppliedPairedFine
open scoped BigOperators

theorem boundary_of_check (D : Data) (hD : D.Valid) {count : ℕ} (table : SourceTable IntegerLogTerm count)
    (tree : Tree) (KW MW : ℕ) (hreads : RawReads 134 310 KW MW tree table 0)
    (b : Fin 135) (axis : Fin 2) (a c : ℕ) (hc : c ≤ count) (L K kw nk depth : ℕ) (corr : List Raw)
    (h : check2 L K kw nk depth (blockRaw D b axis []) (windowRaw tree KW MW a (c - a) corr) = true) :
    (∑ offset : Fin 7, rationalLogValue (sourceSum3 (finProdFinEquiv (b, offset)) axis)) =
      rationalLogValue (certificateWindow table a c) + rawValue 134 310 corr := by
  have e := check2_sound 134 310 L K kw nk depth _ _ h
  rw [blockRaw_value D hD b axis [], windowRaw_value 134 310 KW MW tree table hreads a c hc corr,
    rawValue_nil, add_zero] at e
  exact e

theorem rawValue_flatten (S T : ℕ) (corrs : List (List Raw)) :
    rawValue S T corrs.flatten = (corrs.map (rawValue S T)).sum := by
  induction corrs with
  | nil => simp [rawValue]
  | cons l ls ih =>
    simp only [List.flatten_cons, List.map_cons, List.sum_cons, ← ih]
    simp [rawValue, List.map_append, List.sum_append]

/-- Corrections listed per block cancel when one accepted check compares their concatenation with `[]`. -/
theorem corrections_cancel (corrs : List (List Raw)) (L K kw nk depth : ℕ)
    (h : check2 L K kw nk depth corrs.flatten [] = true) :
    (corrs.map (rawValue 134 310)).sum = 0 := by
  have e := check2_sound 134 310 L K kw nk depth _ _ h
  rwa [rawValue_nil, rawValue_flatten] at e

theorem sum_getD (l : List (List Raw)) (n : ℕ) (h : l.length = n) (f : List Raw → ℝ) :
    (∑ i : Fin n, f (l.getD i.val [])) = (l.map f).sum := by
  subst h
  rw [← List.sum_ofFn]
  congr 1
  apply List.ext_getElem
  · simp
  · intro i h1 h2
    simp [List.getD_eq_getElem _ _ (by simpa using h1)]

end MatrixBounds.Numeric.FKLFine3
