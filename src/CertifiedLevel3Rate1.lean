module

public import RateCertificateData.Level31Block000
public import RateCertificateData.Level31Block001
public import RateCertificateData.Level31Block002
public import RateCertificateData.Level31Block003
public import RateCertificateData.Level31Block004
public import RateCertificateData.Level31Block005
public import RateCertificateData.Level31Block006
public import RateCertificateData.Level31Block007
public import RateCertificateData.Level31Block008
public import RateCertificateData.Level31Block009
public import RateCertificateData.Level31Block010
public import RateCertificateData.Level31Block011
public import RateCertificateData.Level31Block012
public import RateCertificateData.Level31Block013
public import RateCertificateData.Level31Block014
public import RateCertificateData.Level31Block015
public import RateCertificateData.Level31Block016
public import RateCertificateData.Level31Block017
public import RateCertificateData.Level31Block018
public import RateCertificateData.Level31Block019
public import RateCertificateData.Level31Block020
public import RateCertificateData.Level31Block021
public import RateCertificateData.Level31Block022
public import RateCertificateData.Level31Block023
public import RateCertificateData.Level31Block024
public import RateCertificateData.Level31Block025
public import RateCertificateData.Level31Block026
public import RateCertificateData.Level31Block027
public import RateCertificateData.Level31Block028
public import RateCertificateData.Level31Block029
public import RateCertificateData.Level31Block030
public import RateCertificateData.Level31Block031
public import RateCertificateData.Level31Block032
public import RateCertificateData.Level31Block033
public import RateCertificateData.Level31Block034
public import RateCertificateData.Level31Block035
public import RateCertificateData.Level31Block036
public import RateCertificateData.Level31Block037
public import RateCertificateData.Level31Block038
public import RateCertificateData.Level31Block039
public import RateCertificateData.Level31Block040
public import RateCertificateData.Level31Block041
public import RateCertificateData.Level31Block042
public import RateCertificateData.Level31Block043
public import RateCertificateData.Level31Block044
public import RateCertificateData.Level31Block045
public import RateCertificateData.Level31Block046
public import RateCertificateData.Level31Block047

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

namespace MatrixBounds.Numeric.CertifiedLevel3Rate1
set_option maxRecDepth 100000
set_option maxHeartbeats 32000000

/-- All exact expression blocks, in their complete original order. -/
def blocks : List CertifiedLogBlock := [
  RateCertificateData.Level31Block000.certificate, RateCertificateData.Level31Block001.certificate, RateCertificateData.Level31Block002.certificate, RateCertificateData.Level31Block003.certificate, RateCertificateData.Level31Block004.certificate, RateCertificateData.Level31Block005.certificate, RateCertificateData.Level31Block006.certificate, RateCertificateData.Level31Block007.certificate, RateCertificateData.Level31Block008.certificate, RateCertificateData.Level31Block009.certificate, RateCertificateData.Level31Block010.certificate, RateCertificateData.Level31Block011.certificate, RateCertificateData.Level31Block012.certificate, RateCertificateData.Level31Block013.certificate, RateCertificateData.Level31Block014.certificate, RateCertificateData.Level31Block015.certificate, RateCertificateData.Level31Block016.certificate, RateCertificateData.Level31Block017.certificate, RateCertificateData.Level31Block018.certificate, RateCertificateData.Level31Block019.certificate, RateCertificateData.Level31Block020.certificate, RateCertificateData.Level31Block021.certificate, RateCertificateData.Level31Block022.certificate, RateCertificateData.Level31Block023.certificate, RateCertificateData.Level31Block024.certificate, RateCertificateData.Level31Block025.certificate, RateCertificateData.Level31Block026.certificate, RateCertificateData.Level31Block027.certificate, RateCertificateData.Level31Block028.certificate, RateCertificateData.Level31Block029.certificate, RateCertificateData.Level31Block030.certificate, RateCertificateData.Level31Block031.certificate, RateCertificateData.Level31Block032.certificate, RateCertificateData.Level31Block033.certificate, RateCertificateData.Level31Block034.certificate, RateCertificateData.Level31Block035.certificate, RateCertificateData.Level31Block036.certificate, RateCertificateData.Level31Block037.certificate, RateCertificateData.Level31Block038.certificate, RateCertificateData.Level31Block039.certificate, RateCertificateData.Level31Block040.certificate, RateCertificateData.Level31Block041.certificate, RateCertificateData.Level31Block042.certificate, RateCertificateData.Level31Block043.certificate, RateCertificateData.Level31Block044.certificate, RateCertificateData.Level31Block045.certificate, RateCertificateData.Level31Block046.certificate, RateCertificateData.Level31Block047.certificate
]
/-- Complete real logarithmic expression; the `Supplied*Certified*` modules identify it with the actual tensor-pipeline rate. -/
noncomputable def value : ℝ := certifiedBlocksValue blocks
/-- Exact integer enclosure of the complete expression at scale 2^60. -/
def bounds : FixedBounds := ⟨1812318011196192204, 1812318011197412766⟩
/-- All block endpoint sums agree exactly with the reported complete rate interval. -/
theorem bounds_checked : certifiedBlocksBounds blocks = bounds := by decide +kernel
/-- The reported interval contains the complete exact real logarithmic expression. -/
theorem sound : (bounds.interval (2^60)).Contains value :=
  certifiedBlocks_sound blocks bounds bounds_checked

end MatrixBounds.Numeric.CertifiedLevel3Rate1
