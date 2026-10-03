module

public import RateCertificateData.Dimension2Block000
public import RateCertificateData.Dimension2Block001
public import RateCertificateData.Dimension2Block002
public import RateCertificateData.Dimension2Block003
public import RateCertificateData.Dimension2Block004
public import RateCertificateData.Dimension2Block005
public import RateCertificateData.Dimension2Block006
public import RateCertificateData.Dimension2Block007
public import RateCertificateData.Dimension2Block008
public import RateCertificateData.Dimension2Block009
public import RateCertificateData.Dimension2Block010
public import RateCertificateData.Dimension2Block011

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

namespace MatrixBounds.Numeric.CertifiedDimensionRate2
set_option maxRecDepth 100000
set_option maxHeartbeats 32000000

/-- All exact expression blocks, in their complete original order. -/
def blocks : List CertifiedLogBlock := [
  RateCertificateData.Dimension2Block000.certificate, RateCertificateData.Dimension2Block001.certificate, RateCertificateData.Dimension2Block002.certificate, RateCertificateData.Dimension2Block003.certificate, RateCertificateData.Dimension2Block004.certificate, RateCertificateData.Dimension2Block005.certificate, RateCertificateData.Dimension2Block006.certificate, RateCertificateData.Dimension2Block007.certificate, RateCertificateData.Dimension2Block008.certificate, RateCertificateData.Dimension2Block009.certificate, RateCertificateData.Dimension2Block010.certificate, RateCertificateData.Dimension2Block011.certificate
]
/-- Complete real logarithmic expression; the `Supplied*Certified*` modules identify it with the actual tensor-pipeline rate. -/
noncomputable def value : ℝ := certifiedBlocksValue blocks
/-- Exact integer enclosure of the complete expression at scale 2^60. -/
def bounds : FixedBounds := ⟨4835974309284659078, 4835974309285109581⟩
/-- All block endpoint sums agree exactly with the reported complete rate interval. -/
theorem bounds_checked : certifiedBlocksBounds blocks = bounds := by decide +kernel
/-- The reported interval contains the complete exact real logarithmic expression. -/
theorem sound : (bounds.interval (2^60)).Contains value :=
  certifiedBlocks_sound blocks bounds bounds_checked

end MatrixBounds.Numeric.CertifiedDimensionRate2
