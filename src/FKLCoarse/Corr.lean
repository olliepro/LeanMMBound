module

public import FKLCoarse.Hash
public import FKL.Build
public import Mathlib.Data.List.GetD

/-! Generic correction bookkeeping: per-block correction lists cancel when one accepted hashed check
compares their concatenation with `[]`. -/

@[expose] public section

namespace MatrixBounds.Numeric.FKLCoarse

open FKL
open scoped BigOperators

theorem rawValue_flatten (S T : ℕ) (corrs : List (List Raw)) :
    rawValue S T corrs.flatten = (corrs.map (rawValue S T)).sum := by
  induction corrs with
  | nil => simp [rawValue]
  | cons l ls ih =>
    simp only [List.flatten_cons, List.map_cons, List.sum_cons, ← ih]
    simp [rawValue, List.map_append, List.sum_append]

theorem corrections_cancel (S T : ℕ) (corrs : List (List Raw)) (L K kw nk P M1 : ℕ)
    (h : check2H L K kw nk P M1 corrs.flatten [] = true) :
    (corrs.map (rawValue S T)).sum = 0 := by
  have e := check2H_sound S T L K kw nk P M1 _ _ h
  rwa [rawValue_nil, rawValue_flatten] at e

theorem chunks_sum (S T : ℕ) : ∀ (chunks : List (List (List Raw))) (sums : List (List Raw)),
    List.Forall₂ (fun c s => rawValue S T c.flatten = rawValue S T s) chunks sums →
    ((chunks.flatten).map (rawValue S T)).sum = (sums.map (rawValue S T)).sum := by
  intro chunks sums h
  induction h with
  | nil => simp
  | cons hcs _ ih =>
    rw [rawValue_flatten] at hcs
    simp only [List.flatten_cons, List.map_append, List.sum_append, List.map_cons, List.sum_cons, ih, hcs]

/-- Two-level cancellation: each chunk of correction lists equals its summary, and the summaries cancel. -/
theorem cancel_chunks (S T : ℕ) (chunks : List (List (List Raw))) (sums : List (List Raw))
    (h : List.Forall₂ (fun c s => rawValue S T c.flatten = rawValue S T s) chunks sums)
    (htop : rawValue S T sums.flatten = 0) : ((chunks.flatten).map (rawValue S T)).sum = 0 := by
  rw [chunks_sum S T chunks sums h, ← rawValue_flatten, htop]

theorem sum_getD (l : List (List Raw)) (n : ℕ) (h : l.length = n) (f : List Raw → ℝ) :
    (∑ i : Fin n, f (l.getD i.val [])) = (l.map f).sum := by
  subst h
  rw [← List.sum_ofFn]
  congr 1
  apply List.ext_getElem
  · simp
  · intro i h1 h2
    simp [List.getD_eq_getElem _ _ (by simpa using h1)]

end MatrixBounds.Numeric.FKLCoarse
