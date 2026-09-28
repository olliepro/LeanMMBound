import RationalLogNormalization
import Mathlib.Data.List.Sort

/-! Kernel-executable normalization uses a structural insertion sort.
The logarithmic meaning is unchanged, including all repeated arguments. -/
namespace MatrixBounds.Numeric

/-- Sort exact logarithm arguments by structural recursion, then combine equal adjacent arguments. -/
def kernelNormalizeLogExpression (expression : RationalLogExpression) : RationalLogExpression :=
  coalesceLogExpression (expression.insertionSort (fun left right => left.argument ≤ right.argument))

/-- The structurally recursive exact normalizer preserves the complete real expression. -/
theorem kernelNormalizeLogExpression_value (expression : RationalLogExpression) :
    rationalLogValue (kernelNormalizeLogExpression expression) = rationalLogValue expression := by
  rw [kernelNormalizeLogExpression, coalesceLogExpression_value]
  exact rationalLogValue_perm (List.perm_insertionSort _ expression)

/-- Equality of kernel-normalized rational expressions proves equality of the full actual logarithmic sums. -/
theorem rationalLogValue_of_kernelNormalized_eq {left right : RationalLogExpression}
    (checked : kernelNormalizeLogExpression left = kernelNormalizeLogExpression right) :
    rationalLogValue left = rationalLogValue right := by
  rw [← kernelNormalizeLogExpression_value left, checked, kernelNormalizeLogExpression_value]

/-- An interval certificate for a normalized numerical block also encloses the exact source expression. -/
theorem integerLogCertificate_kernel_source {expression : RationalLogExpression} {terms : List IntegerLogTerm}
    {bounds : Interval} (inside : bounds.Contains (integerLogValue terms))
    (checked : kernelNormalizeLogExpression expression =
      kernelNormalizeLogExpression (terms.map IntegerLogTerm.monomial)) :
    bounds.Contains (rationalLogValue expression) := by
  rw [rationalLogValue_of_kernelNormalized_eq checked, ← integerLogValue_expression]
  exact inside

end MatrixBounds.Numeric
