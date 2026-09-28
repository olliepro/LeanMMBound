import RationalLogExpressions

/-! Exact symbolic simplification combines repeated logarithms while preserving
their actual real value. Equality after normalization is a checkable bridge
from source entropy expansions to compact numerical certificate expressions. -/
namespace MatrixBounds.Numeric

/-- Continue a sorted run, combining identical arguments with exact rational coefficient addition. -/
def coalesceLogFrom (current : LogMonomial) : RationalLogExpression → RationalLogExpression
  | [] => logAtom current.argument current.coefficient
  | next :: rest =>
    if current.argument = next.argument then
      coalesceLogFrom ⟨current.argument, current.coefficient+next.coefficient⟩ rest
    else logAtom current.argument current.coefficient++coalesceLogFrom next rest

/-- Combining adjacent equal logarithms and eliminating zero terms preserves their exact real sum. -/
theorem coalesceLogFrom_value (current : LogMonomial) (rest : RationalLogExpression) :
    rationalLogValue (coalesceLogFrom current rest) = current.value+rationalLogValue rest := by
  induction rest generalizing current with
  | nil =>
    change rationalLogValue (logAtom current.argument current.coefficient) = current.value+0
    simpa only [add_zero, LogMonomial.value] using logAtom_value current.argument current.coefficient
  | cons next rest induction =>
    simp only [coalesceLogFrom]
    split_ifs with same
    · rw [induction]
      simp only [LogMonomial.value, Rat.cast_add, rationalLogValue, List.map_cons, List.sum_cons, same]
      ring
    · rw [rationalLogValue_append, logAtom_value, induction]
      simp only [rationalLogValue, List.map_cons, List.sum_cons, LogMonomial.value]

/-- Combine adjacent equal logarithm arguments throughout an expression. -/
def coalesceLogExpression : RationalLogExpression → RationalLogExpression
  | [] => []
  | current :: rest => coalesceLogFrom current rest

/-- Complete run coalescing preserves the exact real interpretation. -/
theorem coalesceLogExpression_value (expression : RationalLogExpression) :
    rationalLogValue (coalesceLogExpression expression) = rationalLogValue expression := by
  cases expression with
  | nil => rfl
  | cons current rest =>
    rw [coalesceLogExpression, coalesceLogFrom_value]
    rfl

/-- Any permutation of the exact terms preserves their actual finite real sum. -/
theorem rationalLogValue_perm {left right : RationalLogExpression} (permutation : left.Perm right) :
    rationalLogValue left = rationalLogValue right :=
  (permutation.map LogMonomial.value).sum_eq

/-- Sort by exact rational argument, then combine all repeated adjacent logarithms. -/
def normalizeLogExpression (expression : RationalLogExpression) : RationalLogExpression :=
  coalesceLogExpression (expression.mergeSort (fun left right => decide (left.argument ≤ right.argument)))

/-- The executable exact normalizer preserves the complete real logarithmic value. -/
theorem normalizeLogExpression_value (expression : RationalLogExpression) :
    rationalLogValue (normalizeLogExpression expression) = rationalLogValue expression := by
  rw [normalizeLogExpression, coalesceLogExpression_value]
  exact rationalLogValue_perm (List.mergeSort_perm _ _)

/-- Exact equality of normalized expressions proves equality of their actual real sums. -/
theorem rationalLogValue_of_normalized_eq {left right : RationalLogExpression}
    (checked : normalizeLogExpression left = normalizeLogExpression right) :
    rationalLogValue left = rationalLogValue right := by
  rw [← normalizeLogExpression_value left, checked, normalizeLogExpression_value]

/-- A checked symbolic identity transports an integer certificate bound to its source formula. -/
theorem integerLogCertificate_source {expression : RationalLogExpression} {terms : List IntegerLogTerm}
    {bounds : Interval} (inside : bounds.Contains (integerLogValue terms))
    (checked : normalizeLogExpression expression =
      normalizeLogExpression (terms.map IntegerLogTerm.monomial)) :
    bounds.Contains (rationalLogValue expression) := by
  rw [rationalLogValue_of_normalized_eq checked, ← integerLogValue_expression]
  exact inside

end MatrixBounds.Numeric
