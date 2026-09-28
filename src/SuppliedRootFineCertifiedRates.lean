import SuppliedRootFineRate1
import SuppliedRootFineRate2
import SuppliedRootFineRateExpressions
import CertifiedPipelineScalar

/-! All three actual supplied root components are identified with the original complete numerical certificate. -/
namespace MatrixBounds.Numeric.SuppliedRootFineCertifiedRates
noncomputable section

/-- The actual complete supplied root retention equals the certified three-axis bottleneck with no identification assumptions. -/
theorem retention_eq : SuppliedRootStage.retention = bottleneck CertifiedPipelineScalar.rootRates := by
  rw [SuppliedRootFine.retention_expression, SuppliedRootFineRate1.value_eq, SuppliedRootFineRate2.value_eq]
  rfl

/-- The original complete certified root bottleneck interval encloses the actual supplied root retention. -/
theorem retention_sound :
    (bottleneckBounds CertifiedPipelineScalar.rootBounds).Contains SuppliedRootStage.retention := by
  rw [retention_eq]
  exact bottleneckBounds_sound CertifiedPipelineScalar.root_sound

end
end MatrixBounds.Numeric.SuppliedRootFineCertifiedRates
