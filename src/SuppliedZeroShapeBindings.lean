import SuppliedZeroSupportData
import OrientedZeroLawIdentities

/-! Original higher zero-coordinate shapes have the exact total and zero-axis
needed to orient their complete tensor windows into canonical matrix form. -/
namespace MatrixBounds.Numeric.SuppliedZeroShapeBindings

open Tensor SuppliedLeafLaws SuppliedZeroSupport
noncomputable section
set_option maxRecDepth 100000
set_option maxHeartbeats 8000000

/-- Every actual zero-node shape has the original four-letter total and its selected zero coordinate. -/
theorem shape3_valid : ∀ node : Fin 840,
    (shape3 node).total = 8 ∧ Shape.coordinates (shape3 node) (zeroAxis (shape3 node)) = 0 := by decide +kernel

/-- Every actual zero root-child shape has the original eight-letter total and its selected zero coordinate. -/
theorem shape4_valid : ∀ child : Fin 48,
    (shape4 child).total = 16 ∧ Shape.coordinates (shape4 child) (zeroAxis (shape4 child)) = 0 := by decide +kernel

/-- Canonical physical role for an actual original higher zero-node shape. -/
def order3 (node : Fin 840) : AxisOrder := zeroCanonicalOrder (zeroAxis (shape3 node)) (positiveAxis (shape3 node))

/-- Canonical physical role for an actual original zero root-child shape. -/
def order4 (child : Fin 48) : AxisOrder := zeroCanonicalOrder (zeroAxis (shape4 child)) (positiveAxis (shape4 child))

end
end MatrixBounds.Numeric.SuppliedZeroShapeBindings
