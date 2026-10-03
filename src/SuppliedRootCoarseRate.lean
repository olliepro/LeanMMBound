module

public import SuppliedRootCoarseBinding
public import FKLCoarseData.RootCheck

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! The checked root coarse numerical certificate is exactly the actual
supplied tensor-extraction rate, with no numerical identification hypothesis. -/
namespace MatrixBounds.Numeric.SuppliedRootCoarse

open Tensor.CW
noncomputable section

/-- Actual physically ordered root coarse retention equals its certified exact logarithmic value. -/
theorem rate_eq :
    SplitRestrictionData.rationalCoarseRetention (length := 8) (rootBox 16)
      CertifiedRoot.numerator 17592186044416
      (SuppliedRootStage.potential 0) (SuppliedRootStage.potential 1) (SuppliedRootStage.potential 2) =
      CertifiedRootRate0.value := by
  rw [← expression_value]
  rw [FKLCoarseData.Root.value_eq, ← integerLogValue_expression]
  simp only [CertifiedRootRate0.value, CertifiedRootRate0.blocks, certifiedBlocksValue,
    RateCertificateData.Root0Block000.certificate, add_zero]

/-- The existing exact sixty-bit interval encloses the actual supplied root coarse extraction rate. -/
theorem rate_sound : (CertifiedRootRate0.bounds.interval (2^60)).Contains
    (SplitRestrictionData.rationalCoarseRetention (length := 8) (rootBox 16)
      CertifiedRoot.numerator 17592186044416
      (SuppliedRootStage.potential 0) (SuppliedRootStage.potential 1) (SuppliedRootStage.potential 2)) := by
  rw [rate_eq]
  exact CertifiedRootRate0.sound

end
end MatrixBounds.Numeric.SuppliedRootCoarse
