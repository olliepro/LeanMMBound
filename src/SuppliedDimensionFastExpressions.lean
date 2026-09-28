import SuppliedDimensionSourceExpressions
import SuppliedWaitingZero2TargetTables
import SuppliedRootFineTerminalLookup

/-! Proved lookup substitutions make the original complete dimension expression
kernel-executable without unfolding fiber cardinalities or deep source tables. -/
namespace MatrixBounds.Numeric.SuppliedDimensionRates
noncomputable section
set_option maxRecDepth 5000
set_option maxHeartbeats 1000000

/-- Exact zero2 probability through the proved balanced original source reference lookup. -/
def fastZero2Mass (source : SuppliedStage3.Source) (child : Fin 12) (orbit : Fin 6) : ℚ :=
  ((IndexedCertificateRows.dyadic (SuppliedWaitingZero2TargetTables.references.get
    (SuppliedParameters.flat2 (SuppliedParameters.flat2 source.1 child) source.2))).val.orbitNumerator orbit : ℚ)/17592186044416

/-- Balanced zero2 references preserve every actual original source probability. -/
theorem fastZero2Mass_eq (source : SuppliedStage3.Source) (child : Fin 12) (orbit : Fin 6) :
    fastZero2Mass source child orbit = (SuppliedTypedParameters.zero2 source.1 child source.2).rational orbit := by
  unfold fastZero2Mass
  rw [SuppliedWaitingZero2TargetTables.references_get]
  rfl

/-- Complete zero4 source expression with its proved exact numerical orbit sizes. -/
def fastZero4Source (node : Fin 48) : RationalLogExpression :=
  zeroDimensionExpression 5 (SuppliedTypedParameters.zero4 node).rational OrbitLevel4.sizes OrbitLevel4.middle

/-- Complete zero3 source expression with its proved exact numerical orbit sizes. -/
def fastZero3Source (node : Fin 840) : RationalLogExpression :=
  zeroDimensionExpression 5 (SuppliedTypedParameters.zero3 node).rational OrbitLevel3.sizes OrbitLevel3.middle

/-- Complete zero2 source expression with its original balanced probabilities and proved exact orbit sizes. -/
def fastZero2Source (source : SuppliedStage3.Source) (child : Fin 12) : RationalLogExpression :=
  zeroDimensionExpression 5 (fastZero2Mass source child) OrbitLevel2.sizes OrbitLevel2.middle

/-- Complete terminal source volume through its original proved balanced parameter lookup. -/
def fastTerminalSource (source : SuppliedTerminalScaling.Source) : RationalLogExpression :=
  logAtom 5 (2-2*SuppliedRootFineTerminalLookup.mu source.node source.child source.strategy)

/-- The zero4 executable expression changes none of its actual complete source terms. -/
theorem fastZero4Source_eq (node : Fin 48) : fastZero4Source node = zero4SourceExpression node := by
  unfold fastZero4Source zero4SourceExpression
  rw [show OrbitLevel4.orbits.size = OrbitLevel4.sizes from funext OrbitLevel4.sizes_correct]

/-- The zero3 executable expression changes none of its actual complete source terms. -/
theorem fastZero3Source_eq (node : Fin 840) : fastZero3Source node = zero3SourceExpression node := by
  unfold fastZero3Source zero3SourceExpression
  rw [show OrbitLevel3.orbits.size = OrbitLevel3.sizes from funext OrbitLevel3.sizes_correct]

/-- The zero2 executable expression changes none of its actual complete source terms. -/
theorem fastZero2Source_eq (source : SuppliedStage3.Source) (child : Fin 12) :
    fastZero2Source source child = zero2SourceExpression source child := by
  unfold fastZero2Source zero2SourceExpression
  rw [show OrbitLevel2.orbits.size = OrbitLevel2.sizes from funext OrbitLevel2.sizes_correct,
    show fastZero2Mass source child = (SuppliedTypedParameters.zero2 source.1 child source.2).rational from
      funext (fastZero2Mass_eq source child)]

/-- The executable terminal expression changes no original source parameter. -/
theorem fastTerminalSource_eq (source : SuppliedTerminalScaling.Source) :
    fastTerminalSource source = terminalSourceExpression source := by
  simp only [fastTerminalSource, terminalSourceExpression, SuppliedRootFineTerminalLookup.mu_eq]

end
end MatrixBounds.Numeric.SuppliedDimensionRates
