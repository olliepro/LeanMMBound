import SuppliedRootPopulation
import RationalLogNormalization
import CoarseLogExpressions
import CertifiedRootRate0

/-! A finite-column expression for the actual supplied root coarse rate.
The column sums are executable exact rational calculations. -/
namespace MatrixBounds.Numeric.SuppliedRootCoarse

open Tensor Tensor.CW Entropy Empirical
open scoped BigOperators
noncomputable section
set_option maxRecDepth 100000
set_option maxHeartbeats 32000000

/-- Original root columns, expressed in the extraction's physical X-Z-Y order. -/
def enumeration : Fin 153 ≃ ShapeAlphabet 16 :=
  (shapeColumnEquiv 16).trans SuppliedRootPopulation.physicalChild

/-- Actual root probability at one original finite column. -/
def mass (column : Fin 153) : ℚ :=
  SuppliedTypedParameters.rootDistribution.rational column

/-- The exact source Gibbs potential on one of the physical root axes. -/
def potential (axis : Fin 3) (value : Fin 17) : ℚ :=
  (SuppliedTypedParameters.potentialRoot (SuppliedRootStage.axes axis)).rational value

/-- Read a physical coarse coordinate directly from the original shape list. -/
def coordinate (column : Fin 153) (axis : Fin 3) : Fin 17 :=
  ⟨Shape.coordinates ((shapes 16)[column.val]'column.isLt) (SuppliedRootStage.axes axis), by
    have bound := (shapeCoordinate (shapeColumnEquiv 16 column) (SuppliedRootStage.axes axis)).isLt
    exact bound⟩

/-- Finite-column marginal with executable equality on bounded coordinate symbols. -/
def marginalMass (axis : Fin 3) (value : Fin 17) : ℚ :=
  ∑ column : Fin 153, if coordinate column axis = value then mass column else 0

/-- Complete root Gibbs normalizer over all 153 original shape columns. -/
def normalizer : ℚ :=
  ∑ column : Fin 153, potential 0 (coordinate column 0)*
    potential 1 (coordinate column 1)*potential 2 (coordinate column 2)

/-- Full finite-column entropy and Gibbs expression for the actual root extraction. -/
def expression : RationalLogExpression :=
  entropyLogExpression (marginalMass 0)++entropyLogExpression mass++
    logAtom normalizer (-1)++
    finiteLogSum (fun value => logAtom (potential 0 value) (marginalMass 0 value))++
    finiteLogSum (fun value => logAtom (potential 1 value) (marginalMass 1 value))++
    finiteLogSum (fun value => logAtom (potential 2 value) (marginalMass 2 value))

end
end MatrixBounds.Numeric.SuppliedRootCoarse
