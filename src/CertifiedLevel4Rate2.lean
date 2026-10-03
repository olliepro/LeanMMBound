module

public import RateCertificateData.Level42Block000
public import RateCertificateData.Level42Block001
public import RateCertificateData.Level42Block002
public import RateCertificateData.Level42Block003
public import RateCertificateData.Level42Block004
public import RateCertificateData.Level42Block005
public import RateCertificateData.Level42Block006
public import RateCertificateData.Level42Block007
public import RateCertificateData.Level42Block008

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

namespace MatrixBounds.Numeric.CertifiedLevel4Rate2
set_option maxRecDepth 100000
set_option maxHeartbeats 32000000

/-- All exact expression blocks, in their complete original order. -/
def blocks : List CertifiedLogBlock := [
  RateCertificateData.Level42Block000.certificate, RateCertificateData.Level42Block001.certificate, RateCertificateData.Level42Block002.certificate, RateCertificateData.Level42Block003.certificate, RateCertificateData.Level42Block004.certificate, RateCertificateData.Level42Block005.certificate, RateCertificateData.Level42Block006.certificate, RateCertificateData.Level42Block007.certificate, RateCertificateData.Level42Block008.certificate
]
/-- Complete real logarithmic expression; the `Supplied*Certified*` modules identify it with the actual tensor-pipeline rate. -/
noncomputable def value : ℝ := certifiedBlocksValue blocks
/-- Exact integer enclosure of the complete expression at scale 2^60. -/
def bounds : FixedBounds := ⟨1303679813758520810, 1303679813759980778⟩
/-- All block endpoint sums agree exactly with the reported complete rate interval. -/
theorem bounds_checked : certifiedBlocksBounds blocks = bounds := by decide +kernel
/-- The reported interval contains the complete exact real logarithmic expression. -/
theorem sound : (bounds.interval (2^60)).Contains value :=
  certifiedBlocks_sound blocks bounds bounds_checked

end MatrixBounds.Numeric.CertifiedLevel4Rate2
