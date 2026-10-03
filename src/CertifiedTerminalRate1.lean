module

public import RateCertificateData.Terminal1Block000
public import RateCertificateData.Terminal1Block001
public import RateCertificateData.Terminal1Block002
public import RateCertificateData.Terminal1Block003
public import RateCertificateData.Terminal1Block004
public import RateCertificateData.Terminal1Block005
public import RateCertificateData.Terminal1Block006
public import RateCertificateData.Terminal1Block007
public import RateCertificateData.Terminal1Block008
public import RateCertificateData.Terminal1Block009
public import RateCertificateData.Terminal1Block010
public import RateCertificateData.Terminal1Block011
public import RateCertificateData.Terminal1Block012
public import RateCertificateData.Terminal1Block013
public import RateCertificateData.Terminal1Block014
public import RateCertificateData.Terminal1Block015
public import RateCertificateData.Terminal1Block016
public import RateCertificateData.Terminal1Block017
public import RateCertificateData.Terminal1Block018
public import RateCertificateData.Terminal1Block019
public import RateCertificateData.Terminal1Block020
public import RateCertificateData.Terminal1Block021
public import RateCertificateData.Terminal1Block022
public import RateCertificateData.Terminal1Block023
public import RateCertificateData.Terminal1Block024
public import RateCertificateData.Terminal1Block025
public import RateCertificateData.Terminal1Block026
public import RateCertificateData.Terminal1Block027
public import RateCertificateData.Terminal1Block028
public import RateCertificateData.Terminal1Block029
public import RateCertificateData.Terminal1Block030
public import RateCertificateData.Terminal1Block031
public import RateCertificateData.Terminal1Block032
public import RateCertificateData.Terminal1Block033
public import RateCertificateData.Terminal1Block034
public import RateCertificateData.Terminal1Block035
public import RateCertificateData.Terminal1Block036
public import RateCertificateData.Terminal1Block037
public import RateCertificateData.Terminal1Block038

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

namespace MatrixBounds.Numeric.CertifiedTerminalRate1
set_option maxRecDepth 100000
set_option maxHeartbeats 32000000

/-- All exact expression blocks, in their complete original order. -/
def blocks : List CertifiedLogBlock := [
  RateCertificateData.Terminal1Block000.certificate, RateCertificateData.Terminal1Block001.certificate, RateCertificateData.Terminal1Block002.certificate, RateCertificateData.Terminal1Block003.certificate, RateCertificateData.Terminal1Block004.certificate, RateCertificateData.Terminal1Block005.certificate, RateCertificateData.Terminal1Block006.certificate, RateCertificateData.Terminal1Block007.certificate, RateCertificateData.Terminal1Block008.certificate, RateCertificateData.Terminal1Block009.certificate, RateCertificateData.Terminal1Block010.certificate, RateCertificateData.Terminal1Block011.certificate, RateCertificateData.Terminal1Block012.certificate, RateCertificateData.Terminal1Block013.certificate, RateCertificateData.Terminal1Block014.certificate, RateCertificateData.Terminal1Block015.certificate, RateCertificateData.Terminal1Block016.certificate, RateCertificateData.Terminal1Block017.certificate, RateCertificateData.Terminal1Block018.certificate, RateCertificateData.Terminal1Block019.certificate, RateCertificateData.Terminal1Block020.certificate, RateCertificateData.Terminal1Block021.certificate, RateCertificateData.Terminal1Block022.certificate, RateCertificateData.Terminal1Block023.certificate, RateCertificateData.Terminal1Block024.certificate, RateCertificateData.Terminal1Block025.certificate, RateCertificateData.Terminal1Block026.certificate, RateCertificateData.Terminal1Block027.certificate, RateCertificateData.Terminal1Block028.certificate, RateCertificateData.Terminal1Block029.certificate, RateCertificateData.Terminal1Block030.certificate, RateCertificateData.Terminal1Block031.certificate, RateCertificateData.Terminal1Block032.certificate, RateCertificateData.Terminal1Block033.certificate, RateCertificateData.Terminal1Block034.certificate, RateCertificateData.Terminal1Block035.certificate, RateCertificateData.Terminal1Block036.certificate, RateCertificateData.Terminal1Block037.certificate, RateCertificateData.Terminal1Block038.certificate
]
/-- Complete real logarithmic expression; the `Supplied*Certified*` modules identify it with the actual tensor-pipeline rate. -/
noncomputable def value : ℝ := certifiedBlocksValue blocks
/-- Exact integer enclosure of the complete expression at scale 2^60. -/
def bounds : FixedBounds := ⟨1206241769760482869, 1206241769760937914⟩
/-- All block endpoint sums agree exactly with the reported complete rate interval. -/
theorem bounds_checked : certifiedBlocksBounds blocks = bounds := by decide +kernel
/-- The reported interval contains the complete exact real logarithmic expression. -/
theorem sound : (bounds.interval (2^60)).Contains value :=
  certifiedBlocks_sound blocks bounds bounds_checked

end MatrixBounds.Numeric.CertifiedTerminalRate1
