import RateCertificateData.Dimension1Block000
import RateCertificateData.Dimension1Block001
import RateCertificateData.Dimension1Block002
import RateCertificateData.Dimension1Block003
import RateCertificateData.Dimension1Block004
import RateCertificateData.Dimension1Block005
import RateCertificateData.Dimension1Block006
import RateCertificateData.Dimension1Block007
import RateCertificateData.Dimension1Block008
import RateCertificateData.Dimension1Block009
import RateCertificateData.Dimension1Block010
import RateCertificateData.Dimension1Block011

namespace MatrixBounds.Numeric.CertifiedDimensionRate1
set_option maxRecDepth 100000
set_option maxHeartbeats 32000000

/-- All exact expression blocks, in their complete original order. -/
def blocks : List CertifiedLogBlock := [
  RateCertificateData.Dimension1Block000.certificate, RateCertificateData.Dimension1Block001.certificate, RateCertificateData.Dimension1Block002.certificate, RateCertificateData.Dimension1Block003.certificate, RateCertificateData.Dimension1Block004.certificate, RateCertificateData.Dimension1Block005.certificate, RateCertificateData.Dimension1Block006.certificate, RateCertificateData.Dimension1Block007.certificate, RateCertificateData.Dimension1Block008.certificate, RateCertificateData.Dimension1Block009.certificate, RateCertificateData.Dimension1Block010.certificate, RateCertificateData.Dimension1Block011.certificate
]
/-- Complete real logarithmic expression; the `Supplied*Certified*` modules identify it with the actual tensor-pipeline rate. -/
noncomputable def value : ℝ := certifiedBlocksValue blocks
/-- Exact integer enclosure of the complete expression at scale 2^60. -/
def bounds : FixedBounds := ⟨4812271319543510117, 4812271319543958811⟩
/-- All block endpoint sums agree exactly with the reported complete rate interval. -/
theorem bounds_checked : certifiedBlocksBounds blocks = bounds := by decide +kernel
/-- The reported interval contains the complete exact real logarithmic expression. -/
theorem sound : (bounds.interval (2^60)).Contains value :=
  certifiedBlocks_sound blocks bounds bounds_checked

end MatrixBounds.Numeric.CertifiedDimensionRate1
