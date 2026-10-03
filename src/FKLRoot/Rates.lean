module

public import FKLRootData.Root1
public import FKLRootData.Root2
public import SuppliedRootFineRateExpressions
public import CertifiedPipelineScalar
public import CertifiedRootRate1
public import CertifiedRootRate2

/-! Fast replacements of `SuppliedRootFineRate1/2.value_eq` and `SuppliedRootFineCertifiedRates.retention_eq`. -/

@[expose] public section

namespace MatrixBounds.Numeric.FKLRoot

open FKL FKLCert

/-- Complete actual root fine expression on axis 0 equals its original certified value. -/
theorem value_eq1 : rationalLogValue (SuppliedRootFine.expression 0) = CertifiedRootRate1.value := by
  rw [← RootFineCertificateExpressions.expression_value P4 (fun _ _ _ => rfl) 0, ← rootRaw_value 0]
  change rawValue 450 450 (rootRaw 0) = _
  rw [FKLRootData.Root1.value, FKLRootData.Root1.terms, ← integerLogValue_expression, integerLogValue_append]
  simp only [CertifiedRootRate1.value, CertifiedRootRate1.blocks, certifiedBlocksValue,
    RateCertificateData.Root1Block000.certificate, RateCertificateData.Root1Block001.certificate, add_zero]

/-- Complete actual root fine expression on axis 1 equals its original certified value. -/
theorem value_eq2 : rationalLogValue (SuppliedRootFine.expression 1) = CertifiedRootRate2.value := by
  rw [← RootFineCertificateExpressions.expression_value P4 (fun _ _ _ => rfl) 1, ← rootRaw_value 1]
  change rawValue 450 450 (rootRaw 1) = _
  rw [FKLRootData.Root2.value, FKLRootData.Root2.terms, ← integerLogValue_expression, integerLogValue_append]
  simp only [CertifiedRootRate2.value, CertifiedRootRate2.blocks, certifiedBlocksValue,
    RateCertificateData.Root2Block000.certificate, RateCertificateData.Root2Block001.certificate, add_zero]

/-- The actual complete supplied root retention equals the certified three-axis bottleneck. -/
theorem retention_eq : SuppliedRootStage.retention = bottleneck CertifiedPipelineScalar.rootRates := by
  rw [SuppliedRootFine.retention_expression, value_eq1, value_eq2]
  rfl

/-- The original complete certified root bottleneck interval encloses the actual supplied root retention. -/
theorem retention_sound :
    (bottleneckBounds CertifiedPipelineScalar.rootBounds).Contains SuppliedRootStage.retention := by
  rw [retention_eq]
  exact bottleneckBounds_sound CertifiedPipelineScalar.root_sound

end MatrixBounds.Numeric.FKLRoot
