module

public import RationalLogNormalization

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Structural merge sorting supports large exact source expressions in the
Lean kernel; all intermediate lists retain their complete term permutation. -/
namespace MatrixBounds.Numeric

/-- Merge two term lists with structural fuel; exhaustion preserves both tails. -/
def kernelMergeLogTerms : ℕ → RationalLogExpression → RationalLogExpression → RationalLogExpression
  | 0, left, right => left++right
  | _+1, [], right => right
  | _+1, left, [] => left
  | fuel+1, first::left, second::right =>
    if first.argument ≤ second.argument then
      first::kernelMergeLogTerms fuel left (second::right)
    else second::kernelMergeLogTerms fuel (first::left) right

/-- Every structural merge preserves the full multiset, for every fuel value. -/
theorem kernelMergeLogTerms_perm (fuel : ℕ) (left right : RationalLogExpression) :
    (kernelMergeLogTerms fuel left right).Perm (left++right) := by
  induction fuel generalizing left right with
  | zero => exact List.Perm.refl _
  | succ fuel induction =>
    cases left with
    | nil => simp only [kernelMergeLogTerms, List.nil_append]; exact List.Perm.refl _
    | cons first left =>
      cases right with
      | nil => simp only [kernelMergeLogTerms, List.append_nil]; exact List.Perm.refl _
      | cons second right =>
        simp only [kernelMergeLogTerms]
        split_ifs
        · exact (induction left (second::right)).cons first
        · exact ((induction (first::left) right).cons second).trans List.perm_middle.symm

/-- Sort by recursively halving the source list; merge fuel bounds its complete combined length. -/
def kernelMergeSortLogTerms : ℕ → RationalLogExpression → RationalLogExpression
  | 0, terms => terms
  | _+1, [] => []
  | _+1, [term] => [term]
  | fuel+1, first::second::rest =>
    let terms := first::second::rest
    let cut := terms.length/2
    kernelMergeLogTerms terms.length
      (kernelMergeSortLogTerms fuel (terms.take cut))
      (kernelMergeSortLogTerms fuel (terms.drop cut))

/-- Structural merge sorting preserves all original exact terms regardless of depth. -/
theorem kernelMergeSortLogTerms_perm (fuel : ℕ) (terms : RationalLogExpression) :
    (kernelMergeSortLogTerms fuel terms).Perm terms := by
  induction fuel generalizing terms with
  | zero => exact List.Perm.refl _
  | succ fuel induction =>
    cases terms with
    | nil => exact List.Perm.refl _
    | cons first rest =>
      cases rest with
      | nil => exact List.Perm.refl _
      | cons second rest =>
        dsimp only [kernelMergeSortLogTerms]
        exact (kernelMergeLogTerms_perm _ _ _).trans
          (((induction _).append (induction _)).trans (by rw [List.take_append_drop]))

/-- Kernel-executable logarithm normalization with balanced sorting and exact coefficient combination. -/
def mergeNormalizeLogExpression (expression : RationalLogExpression) : RationalLogExpression :=
  coalesceLogExpression (kernelMergeSortLogTerms expression.length expression)

/-- The balanced kernel normalizer preserves the full real weighted logarithmic sum. -/
theorem mergeNormalizeLogExpression_value (expression : RationalLogExpression) :
    rationalLogValue (mergeNormalizeLogExpression expression) = rationalLogValue expression := by
  rw [mergeNormalizeLogExpression, coalesceLogExpression_value]
  exact rationalLogValue_perm (kernelMergeSortLogTerms_perm _ _)

/-- Exact equality after balanced kernel normalization identifies complete real logarithmic expressions. -/
theorem rationalLogValue_of_mergeNormalized_eq {left right : RationalLogExpression}
    (checked : mergeNormalizeLogExpression left = mergeNormalizeLogExpression right) :
    rationalLogValue left = rationalLogValue right := by
  rw [← mergeNormalizeLogExpression_value left, checked, mergeNormalizeLogExpression_value]

end MatrixBounds.Numeric
