module

public import SuppliedRootCoarseExpression
public import RootCoarseEnumeration

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Semantic identification of the exact source-column root expression. -/
namespace MatrixBounds.Numeric.SuppliedRootCoarse

open Tensor Tensor.CW Entropy Empirical
open scoped BigOperators
noncomputable section
set_option maxRecDepth 100000
set_option maxHeartbeats 32000000

/-- Original finite-column masses equal the actual physically ordered root probabilities. -/
theorem mass_enumeration (column : Fin 153) :
    (CertifiedRoot.numerator (enumeration column) : ℚ)/17592186044416 = mass column := by
  change (CertifiedRoot.numerator (SuppliedRootPopulation.physicalChild (shapeColumnEquiv 16 column)) : ℚ)/_ = _
  rw [SuppliedRootPopulation.numerator_physical]
  simp only [SuppliedRootPopulation.numerator, (shapeColumnEquiv 16).symm_apply_apply column, mass, TypedProbabilityRow.rational, Nat.cast_ofNat]

/-- The directly computed source coordinate equals the actual physical coarse coordinate. -/
theorem coordinate_enumeration (column : Fin 153) (axis : Fin 3) :
    shapeCoordinate (enumeration column) axis = coordinate column axis := by
  change shapeCoordinate (shapeAlphabetPermutation SuppliedRootStage.axes 16 (shapeColumnEquiv 16 column)) axis = _
  rw [shapeCoordinate_permutation]
  rfl

/-- Each of the three actual root marginals equals its full finite-column calculation. -/
theorem marginal_enumeration (axis : Fin 3) (value : Fin 17) :
    rationalMarginal (fun child => (CertifiedRoot.numerator child : ℚ)/17592186044416)
      (fun child => shapeCoordinate child axis) value = marginalMass axis value := by
  rw [rationalMarginal_enumeration enumeration]
  simp only [coordinate_enumeration, mass_enumeration, marginalMass]

/-- The actual Gibbs sum and the directly computed original-column normalizer agree. -/
theorem normalizer_enumeration :
    rationalGibbsNormalizer (length := 8) (rootBox 16) (potential 0) (potential 1) (potential 2) = normalizer := by
  rw [rationalGibbsNormalizer_root_enumeration enumeration]
  change (∑ column, potential 0 (shapeCoordinate (enumeration column) 0)*
    potential 1 (shapeCoordinate (enumeration column) 1)*
    potential 2 (shapeCoordinate (enumeration column) 2)) = _
  simp only [coordinate_enumeration, normalizer]

/-- The complete exact expression is the expansion of the actual supplied coarse extraction rate. -/
theorem expression_eq :
    coarseRetentionExpression (length := 8) (rootBox 16) CertifiedRoot.numerator 17592186044416
      (potential 0) (potential 1) (potential 2) enumeration = expression := by
  unfold coarseRetentionExpression
  have mx := funext (marginal_enumeration 0)
  have my := funext (marginal_enumeration 1)
  have mz := funext (marginal_enumeration 2)
  have joint := funext mass_enumeration
  change rationalMarginal (fun child => (CertifiedRoot.numerator child : ℚ)/17592186044416) shapeXIndex = marginalMass 0 at mx
  change rationalMarginal (fun child => (CertifiedRoot.numerator child : ℚ)/17592186044416) shapeYIndex = marginalMass 1 at my
  change rationalMarginal (fun child => (CertifiedRoot.numerator child : ℚ)/17592186044416) shapeZIndex = marginalMass 2 at mz
  simp only [Nat.cast_ofNat, mx, my, mz, joint, normalizer_enumeration,
    expression, logExpectationExpression]

/-- Full semantic binding to the actual supplied physical root coarse retention. -/
theorem expression_value : rationalLogValue expression =
    SplitRestrictionData.rationalCoarseRetention (length := 8) (rootBox 16)
      CertifiedRoot.numerator 17592186044416
      (SuppliedRootStage.potential 0) (SuppliedRootStage.potential 1) (SuppliedRootStage.potential 2) := by
  rw [← expression_eq]
  exact coarseRetentionExpression_value (length := 8) (rootBox 16) CertifiedRoot.numerator 17592186044416
    (potential 0) (potential 1) (potential 2) enumeration

end
end MatrixBounds.Numeric.SuppliedRootCoarse
