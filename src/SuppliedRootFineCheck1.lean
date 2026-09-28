import SuppliedRootFineCachedPoolsExpression
import RootFineKernelMergeNormalization
import CertifiedRootRate1

/-! Complete exact comparison with the original root fine numerical certificate. -/
namespace MatrixBounds.Numeric.SuppliedRootFineCheck1
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option exponentiation.threshold 1000
set_option Elab.async false

/-- Every original independently certified logarithm term, retaining both complete certificate blocks. -/
def certificateExpression : RationalLogExpression :=
  (RateCertificateData.Root1Block000.terms++RateCertificateData.Root1Block001.terms).map IntegerLogTerm.monomial

/-- The original complete source expression and the original certificate have exactly equal rational logarithm coefficients. -/
theorem normalized_checked :
    mergeNormalizeLogExpression (SuppliedRootFineCachedPoolsExpression.expression 0) =
      mergeNormalizeLogExpression certificateExpression := by decide +kernel

end MatrixBounds.Numeric.SuppliedRootFineCheck1
