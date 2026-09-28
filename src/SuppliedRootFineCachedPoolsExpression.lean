import SuppliedRootFinePoolCache
import RootFineCachedPoolExpressions

/-! Independently checked original parent laws, mixtures, and coordinate pools instantiate both actual root fine expressions. -/
namespace MatrixBounds.Numeric.SuppliedRootFineCachedPoolsExpression
noncomputable section

/-- Both complete original root fine expressions in the supplied certificate expansion convention. -/
def expression (axis : Fin 2) : RationalLogExpression :=
  RootFineCachedPoolExpressions.expression SuppliedRootFineParent4Cache.numerator SuppliedRootFinePoolCache.numerator axis

/-- Each independently checked complete expression equals the actual original root fine retention rate. -/
theorem expression_value (axis : Fin 2) :
    rationalLogValue (expression axis) = rationalLogValue (SuppliedRootFine.expression axis) :=
  RootFineCachedPoolExpressions.expression_value
    (parent4 := SuppliedRootFineParent4Cache.numerator)
    (vectors := SuppliedRootFinePoolCache.numerator)
    (vectorEq := SuppliedRootFinePoolCache.numerator_eq)
    SuppliedRootFineParent4Cache.numerator_eq axis

end
end MatrixBounds.Numeric.SuppliedRootFineCachedPoolsExpression
