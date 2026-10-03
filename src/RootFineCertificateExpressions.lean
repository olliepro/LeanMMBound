module

public import RootFineIntegerPoolValidity
public import RootFineScaledPoolExpressions

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Root singleton sectors use the exact weighted child-entropy expansion of the supplied certificates. -/
namespace MatrixBounds.Numeric.RootFineCertificateExpressions

open scoped BigOperators
noncomputable section
set_option exponentiation.threshold 1000

/-- Complete exact root child laws remain normalized after converting their integer numerators. -/
theorem mass_normalized (parent4 : RootFineCachedRootExpression.Parent4Values)
    (sourceEq : ∀ parent axis orbit, parent4 parent axis orbit =
      SuppliedRootFineParent4Integers.numerator parent axis orbit)
    (axis : Fin 2) (column : Fin 153) :
    ∑ orbit, RootFineCachedRootExpression.mass parent4 axis column orbit = 1 := by
  have total := RootFineIntegerPools.law_normalized parent4 sourceEq axis column
  have rationalTotal : ∑ orbit, (RootFineIntegerPools.law parent4 axis column orbit : ℚ) = (2:ℚ)^406 := by
    exact_mod_cast total
  change (∑ orbit, (RootFineIntegerPools.law parent4 axis column orbit : ℚ)/(2:ℚ)^406) = 1
  rw [← Finset.sum_div, rationalTotal]
  exact div_self (by positivity)

/-- The entropy expression of a zero orbit vector has exactly zero real value. -/
theorem zero_value {width : ℕ} (sizes : Fin width → ℕ) :
    rationalLogValue (orbitMassEntropyExpression (fun _ => (0:ℚ)) sizes) = 0 := by
  simpa only [zero_mul, Rat.cast_zero] using
    (orbitMassEntropyExpression_scaled_value (0:ℚ) (fun _ : Fin width => (0:ℚ)) sizes)

/-- Every original sector is retained; singleton sectors factor out their original root probability. -/
def sectorExpression (parent4 : RootFineCachedRootExpression.Parent4Values) (axis : Fin 2)
    (sector : Fin 170) : RationalLogExpression :=
  match (finSumFinEquiv.symm sector : Fin 153 ⊕ Fin 17) with
  | Sum.inl selected => if RootFineExecutablePools.isolated axis selected then
      scaleLogExpression (SuppliedRootCoarse.mass selected)
        (orbitEntropyExpression (RootFineCachedRootExpression.mass parent4 axis selected) OrbitLevel4.sizes)
    else []
  | Sum.inr _ => orbitMassEntropyExpression (RootFineExecutablePools.pool parent4 axis sector) OrbitLevel4.sizes

/-- Factoring a singleton coefficient preserves the exact complete entropy value of every original sector. -/
theorem sectorExpression_value (parent4 : RootFineCachedRootExpression.Parent4Values)
    (sourceEq : ∀ parent axis orbit, parent4 parent axis orbit =
      SuppliedRootFineParent4Integers.numerator parent axis orbit)
    (axis : Fin 2) (sector : Fin 170) :
    rationalLogValue (sectorExpression parent4 axis sector) =
      rationalLogValue (orbitMassEntropyExpression (RootFineExecutablePools.pool parent4 axis sector) OrbitLevel4.sizes) := by
  unfold sectorExpression
  cases sectorCase : (finSumFinEquiv.symm sector : Fin 153 ⊕ Fin 17) with
  | inl selected =>
    have pooled : RootFineExecutablePools.pool parent4 axis sector =
        fun orbit => if RootFineExecutablePools.isolated axis selected then
          SuppliedRootCoarse.mass selected*RootFineCachedRootExpression.mass parent4 axis selected orbit else 0 := by
      funext orbit
      simp only [RootFineExecutablePools.pool, sectorCase]
    rw [pooled]
    dsimp only
    split_ifs with isolated
    · exact (orbitMassEntropyExpression_scaled_normalized (SuppliedRootCoarse.mass selected)
        (RootFineCachedRootExpression.mass parent4 axis selected) OrbitLevel4.sizes
        (mass_normalized parent4 sourceEq axis selected)).symm
    · rw [zero_value]
      rfl
  | inr selected => rfl

/-- Complete root fine entropy expression in precisely the supplied singleton-expansion convention. -/
def expression (parent4 : RootFineCachedRootExpression.Parent4Values) (axis : Fin 2) : RationalLogExpression :=
  orbitEntropyExpression (RootFineCachedRootExpression.mixture parent4 axis) OrbitLevel4.sizes++
    scaleLogExpression (-1) (finiteLogSum (sectorExpression parent4 axis))

/-- The supplied certificate convention has exactly the value of the original complete root fine retention. -/
theorem expression_value (parent4 : RootFineCachedRootExpression.Parent4Values)
    (sourceEq : ∀ parent axis orbit, parent4 parent axis orbit =
      SuppliedRootFineParent4Integers.numerator parent axis orbit) (axis : Fin 2) :
    rationalLogValue (expression parent4 axis) =
      rationalLogValue (SuppliedRootFine.expression axis) := by
  rw [← RootFineCachedRootExpression.expression_eq parent4 sourceEq axis,
    ← RootFineExecutablePools.expression_eq parent4 axis]
  simp only [expression, RootFineExecutablePools.expression, rationalLogValue_append,
    scaleLogExpression_value, finiteLogSum_value, sectorExpression_value parent4 sourceEq]

end
end MatrixBounds.Numeric.RootFineCertificateExpressions
