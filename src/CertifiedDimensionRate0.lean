import RateCertificateData.Dimension0Block000
import RateCertificateData.Dimension0Block001
import RateCertificateData.Dimension0Block002
import RateCertificateData.Dimension0Block003
import RateCertificateData.Dimension0Block004
import RateCertificateData.Dimension0Block005
import RateCertificateData.Dimension0Block006
import RateCertificateData.Dimension0Block007
import RateCertificateData.Dimension0Block008
import RateCertificateData.Dimension0Block009
import RateCertificateData.Dimension0Block010
import RateCertificateData.Dimension0Block011

namespace MatrixBounds.Numeric.CertifiedDimensionRate0
set_option maxRecDepth 100000
set_option maxHeartbeats 32000000

/-- All exact expression blocks, in their complete original order. -/
def blocks : List CertifiedLogBlock := [
  RateCertificateData.Dimension0Block000.certificate, RateCertificateData.Dimension0Block001.certificate, RateCertificateData.Dimension0Block002.certificate, RateCertificateData.Dimension0Block003.certificate, RateCertificateData.Dimension0Block004.certificate, RateCertificateData.Dimension0Block005.certificate, RateCertificateData.Dimension0Block006.certificate, RateCertificateData.Dimension0Block007.certificate, RateCertificateData.Dimension0Block008.certificate, RateCertificateData.Dimension0Block009.certificate, RateCertificateData.Dimension0Block010.certificate, RateCertificateData.Dimension0Block011.certificate
]
/-- Complete real logarithmic expression; the `Supplied*Certified*` modules identify it with the actual tensor-pipeline rate. -/
noncomputable def value : ℝ := certifiedBlocksValue blocks
/-- Exact integer enclosure of the complete expression at scale 2^60. -/
def bounds : FixedBounds := ⟨4872780160599575210, 4872780160600028467⟩
/-- All block endpoint sums agree exactly with the reported complete rate interval. -/
theorem bounds_checked : certifiedBlocksBounds blocks = bounds := by decide +kernel
/-- The reported interval contains the complete exact real logarithmic expression. -/
theorem sound : (bounds.interval (2^60)).Contains value :=
  certifiedBlocks_sound blocks bounds bounds_checked

end MatrixBounds.Numeric.CertifiedDimensionRate0
