import PairedCoarseColumns
import SuppliedDimensionMasses
import SuppliedPathStages

/-! Every actual paired coarse rate has a complete exact rational logarithmic
expression at the original root-normalized source weights and role allocations. -/
namespace MatrixBounds.Numeric.SuppliedPairedCoarse

open Tensor Tensor.CW Interface SuppliedPopulationWeights DyadicPopulationArithmetic
open scoped BigOperators
noncomputable section
set_option maxRecDepth 5000
set_option maxHeartbeats 2000000

/-- The complete original level-four child columns in one physical extraction role. -/
def enumeration4 (role : Fin 6) : Fin 45 ≃ ShapeAlphabet 8 :=
  (shapeColumnEquiv 8).trans (shapeAlphabetPermutation (SuppliedRoleIndex.order role).permutation 8)

/-- The complete original level-three child columns in one physical extraction role. -/
def enumeration3 (role : Fin 6) : Fin 15 ≃ ShapeAlphabet 4 :=
  (shapeColumnEquiv 4).trans (shapeAlphabetPermutation (SuppliedRoleIndex.order role).permutation 4)

/-- Exact original level-four Gibbs potentials in the selected source role. -/
def potential4 (source : Fin 105) (role : Fin 6) (axis : Fin 3) : Fin 9 → ℚ :=
  (SuppliedTypedParameters.potential4 source ((SuppliedRoleIndex.order role).permutation axis)).rational

/-- Exact original level-three Gibbs potentials in the selected source role. -/
def potential3 (source : SuppliedStage3.Source) (role : Fin 6) (axis : Fin 3) : Fin 5 → ℚ :=
  (SuppliedTypedParameters.potential3 source.1 source.2 ((SuppliedRoleIndex.order role).permutation axis)).rational

/-- Complete level-four coarse expression for one actual source and physical role. -/
def sourceExpression4 (source : Fin 105) (role : Fin 6) : RationalLogExpression :=
  let split := SuppliedStage4.split source (SuppliedRoleIndex.order role)
  PairedCoarseColumns.expression (length := 4) split.parent (enumeration4 role)
    (fun column => (split.numerator (enumeration4 role column) : ℚ)/17592186044416) (potential4 source role)

/-- Complete level-three coarse expression for one actual source, strategy, and physical role. -/
def sourceExpression3 (source : SuppliedStage3.Source) (role : Fin 6) : RationalLogExpression :=
  let split := SuppliedStage3.split source (SuppliedRoleIndex.order role)
  PairedCoarseColumns.expression (length := 2) split.parent (enumeration3 role)
    (fun column => (split.numerator (enumeration3 role column) : ℚ)/17592186044416) (potential3 source role)

/-- Original root-normalized source and role population for a level-four coarse extraction. -/
def mass4 (source : Fin 105) (role : Fin 6) : ℚ :=
  (rootNumerator source*SuppliedRoleIndex.allocation4 source (SuppliedRoleIndex.order role) : ℕ)/(denominator^2 : ℕ)

/-- Original root-normalized source, strategy, and role population for a level-three coarse extraction. -/
def mass3 (source : SuppliedStage3.Source) (role : Fin 6) : ℚ :=
  (strategyNumerator source*SuppliedRoleIndex.allocation3 source.1 source.2 (SuppliedRoleIndex.order role) : ℕ)/(denominator^4 : ℕ)

/-- Full level-four coarse expression, retaining each original source and role column. -/
def expression4 : RationalLogExpression := finiteLogSum (fun source : Fin 105 =>
  finiteLogSum (fun role => scaleLogExpression (mass4 source role) (sourceExpression4 source role)))

/-- Full level-three coarse expression, retaining each original node, strategy, and role column. -/
def expression3 : RationalLogExpression := finiteLogSum (fun node : Fin 945 =>
  finiteLogSum (fun strategy : Fin 6 => finiteLogSum (fun role =>
    scaleLogExpression (mass3 (node, strategy) role) (sourceExpression3 (node, strategy) role))))

/-- The original integer level-four population is exactly its normalized rational mass times the root scale. -/
theorem mass4_eq (source : Fin 105) (role : Fin 6) :
    (rootWeight : ℝ)*(mass4 source role : ℝ) = (role4Weight (source, SuppliedRoleIndex.order role) : ℝ) :=
  SuppliedDimensionRates.root_scaled_mass 6 2 _ rfl

/-- The original integer level-three population is exactly its normalized rational mass times the root scale. -/
theorem mass3_eq (source : SuppliedStage3.Source) (role : Fin 6) :
    (rootWeight : ℝ)*(mass3 source role : ℝ) = (role3Weight (source, SuppliedRoleIndex.order role) : ℝ) :=
  SuppliedDimensionRates.root_scaled_mass 4 4 _ rfl

/-- Each original level-four logarithmic expression is its actual permuted coarse extraction rate. -/
theorem sourceExpression4_value (source : Fin 105) (role : Fin 6) :
    rationalLogValue (sourceExpression4 source role) =
      (SuppliedStage4.split source (SuppliedRoleIndex.order role)).coarseRetention
        (SuppliedStage4.potential source (SuppliedRoleIndex.order role) 0)
        (SuppliedStage4.potential source (SuppliedRoleIndex.order role) 1)
        (SuppliedStage4.potential source (SuppliedRoleIndex.order role) 2) :=
  PairedCoarseColumns.expression_value (length := 4) _ (enumeration4 role) _ 17592186044416 (potential4 source role)

/-- Each original level-three logarithmic expression is its actual permuted coarse extraction rate. -/
theorem sourceExpression3_value (source : SuppliedStage3.Source) (role : Fin 6) :
    rationalLogValue (sourceExpression3 source role) =
      (SuppliedStage3.split source (SuppliedRoleIndex.order role)).coarseRetention
        (SuppliedStage3.potential source (SuppliedRoleIndex.order role) 0)
        (SuppliedStage3.potential source (SuppliedRoleIndex.order role) 1)
        (SuppliedStage3.potential source (SuppliedRoleIndex.order role) 2) :=
  PairedCoarseColumns.expression_value (length := 2) _ (enumeration3 role) _ 17592186044416 (potential3 source role)

end
end MatrixBounds.Numeric.SuppliedPairedCoarse
