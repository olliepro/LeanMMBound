import SuppliedRootCoarseExpression
import RootCoarseKernelNormalization

namespace MatrixBounds.Numeric.SuppliedRootCoarse
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000

/-- Complete symbolic equality with the independently interval-certified numerical block. -/
theorem normalized_checked : kernelNormalizeLogExpression expression =
    kernelNormalizeLogExpression (RateCertificateData.Root0Block000.terms.map IntegerLogTerm.monomial) := by
  decide +kernel

end MatrixBounds.Numeric.SuppliedRootCoarse
