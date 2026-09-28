import SuppliedTerminalRateCertificates
import SuppliedRootFineTerminalLookup

/-! The same exact terminal expression with proved balanced parameter lookup. -/
namespace MatrixBounds.Numeric.SuppliedTerminalRates

open SuppliedTerminalScaling
noncomputable section

/-- Compute one original terminal source expression through the exact balanced input lookup. -/
def fastSourceExpression (record : Source) (axis : Fin 3) : RationalLogExpression :=
  terminalRetentionExpression (SuppliedRootFineTerminalLookup.mu record.node record.child record.strategy)
    ((SuppliedTerminalRoles.distribution record).rational axis)

/-- Compute every original source contribution with its proved original parameter value. -/
def fastExpression (axis : Fin 3) : RationalLogExpression :=
  finiteLogSum (fun node : Fin 945 => finiteLogSum (fun child : Fin 3 => finiteLogSum (fun strategy : Fin 6 =>
    scaleLogExpression (sourceMass (source node child strategy))
      (fastSourceExpression (source node child strategy) axis))))

/-- Balanced lookup changes no term, coefficient, source index, or role in the full terminal expression. -/
theorem fast_expression_eq (axis : Fin 3) : fastExpression axis = expression axis := by
  simp only [fastExpression, expression, fastSourceExpression, sourceExpression,
    SuppliedRootFineTerminalLookup.mu_eq]

end
end MatrixBounds.Numeric.SuppliedTerminalRates
