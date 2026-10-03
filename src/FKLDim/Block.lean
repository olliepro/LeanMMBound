module

public import FKLDim.Leaf
public import FKLDim.Higher
public import FKLCert.WindowValue
public import FKL.Search
public import SuppliedDimensionCertificateWindows

/-! Block builders in source order and the boundary identity of an accepted fast block check. -/

@[expose] public section

namespace MatrixBounds.Numeric.FKLDim

open FKL FKLCert TerminalSourceNodeLookup SuppliedDimensionRates
open scoped BigOperators

theorem leaf_ordered (b : Fin 135) :
    rawValue 44 220 (leafRaw b []) = rationalLogValue (orderedBlockExpression (Fin.castAdd (120 + 12) b)) := by
  rw [orderedBlockExpression, Fin.addCases_left]; exact leafRaw_value b

theorem zero3_ordered (b : Fin 120) :
    rawValue 44 220 (z3Raw b []) =
      rationalLogValue (orderedBlockExpression (Fin.natAdd 135 (Fin.castAdd 12 b))) := by
  rw [orderedBlockExpression, Fin.addCases_right, Fin.addCases_left]; exact z3Raw_value b

theorem zero4_ordered (b : Fin 12) :
    rawValue 44 220 (z4Raw b []) =
      rationalLogValue (orderedBlockExpression (Fin.natAdd 135 (Fin.natAdd 120 b))) := by
  rw [orderedBlockExpression, Fin.addCases_right, Fin.addCases_right]; exact z4Raw_value b

/-- An accepted check of a block builder against its three certificate windows plus a correction
gives the boundary identity. -/
theorem boundary_of_check {c0 c1 c2 : ℕ} (t0 : SourceTable IntegerLogTerm c0) (t1 : SourceTable IntegerLogTerm c1)
    (t2 : SourceTable IntegerLogTerm c2) (tr0 tr1 tr2 : Tree) (KW0 MW0 KW1 MW1 KW2 MW2 : ℕ)
    (h0 : RawReads 44 220 KW0 MW0 tr0 t0 0) (h1 : RawReads 44 220 KW1 MW1 tr1 t1 0)
    (h2 : RawReads 44 220 KW2 MW2 tr2 t2 0)
    (block win : RationalLogExpression) (raw : List Raw) (hv : rawValue 44 220 raw = rationalLogValue block)
    (a0 e0 a1 e1 a2 e2 : ℕ) (he0 : e0 ≤ c0) (he1 : e1 ≤ c1) (he2 : e2 ≤ c2)
    (hwin : win = SuppliedTerminalRates.certificateWindow t0 a0 e0 ++ SuppliedTerminalRates.certificateWindow t1 a1 e1 ++
      SuppliedTerminalRates.certificateWindow t2 a2 e2)
    (L K kw nk depth : ℕ) (corr : List Raw)
    (h : check2 L K kw nk depth raw (windowRaw tr0 KW0 MW0 a0 (e0 - a0) (windowRaw tr1 KW1 MW1 a1 (e1 - a1)
      (windowRaw tr2 KW2 MW2 a2 (e2 - a2) corr))) = true) :
    rationalLogValue block = rationalLogValue win + rawValue 44 220 corr := by
  have e := check2_sound 44 220 L K kw nk depth _ _ h
  rw [hv, windowRaw_value 44 220 KW0 MW0 tr0 t0 h0 a0 e0 he0, windowRaw_value 44 220 KW1 MW1 tr1 t1 h1 a1 e1 he1,
    windowRaw_value 44 220 KW2 MW2 tr2 t2 h2 a2 e2 he2] at e
  rw [e, hwin, rationalLogValue_append, rationalLogValue_append]
  ring

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
    (corrs.map (rawValue 44 220)).sum = 0 := by
  have e := check2_sound 44 220 L K kw nk depth _ _ h
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

/-- Window and correction boundaries identify the complete dimension expression with the certificate. -/
theorem expression_of_raw_corrections (corr : Fin 267 → List Raw)
    (boundaries : ∀ block, rationalLogValue (orderedBlockExpression block) =
      rationalLogValue (SuppliedDimensionRates.certificateWindow block) + rawValue 44 220 (corr block))
    (cancelled : (∑ block, rawValue 44 220 (corr block)) = 0) :
    rationalLogValue expression = CertifiedPipelineScalar.volume := by
  rw [SuppliedDimensionRates.ordered_blocks_value]
  simp_rw [boundaries]
  rw [Finset.sum_add_distrib, SuppliedDimensionRates.certificate_windows_value, cancelled, add_zero]

end MatrixBounds.Numeric.FKLDim
