module

public import RateCertificateData.Terminal2Block000
public import RateCertificateData.Terminal2Block001
public import RateCertificateData.Terminal2Block002
public import RateCertificateData.Terminal2Block003
public import RateCertificateData.Terminal2Block004
public import RateCertificateData.Terminal2Block005
public import RateCertificateData.Terminal2Block006
public import RateCertificateData.Terminal2Block007
public import RateCertificateData.Terminal2Block008
public import RateCertificateData.Terminal2Block009
public import RateCertificateData.Terminal2Block010
public import RateCertificateData.Terminal2Block011
public import RateCertificateData.Terminal2Block012
public import RateCertificateData.Terminal2Block013
public import RateCertificateData.Terminal2Block014
public import RateCertificateData.Terminal2Block015
public import RateCertificateData.Terminal2Block016
public import RateCertificateData.Terminal2Block017
public import RateCertificateData.Terminal2Block018
public import RateCertificateData.Terminal2Block019
public import RateCertificateData.Terminal2Block020
public import RateCertificateData.Terminal2Block021
public import RateCertificateData.Terminal2Block022
public import RateCertificateData.Terminal2Block023
public import RateCertificateData.Terminal2Block024
public import RateCertificateData.Terminal2Block025
public import RateCertificateData.Terminal2Block026
public import RateCertificateData.Terminal2Block027
public import RateCertificateData.Terminal2Block028
public import RateCertificateData.Terminal2Block029
public import RateCertificateData.Terminal2Block030
public import RateCertificateData.Terminal2Block031
public import RateCertificateData.Terminal2Block032
public import RateCertificateData.Terminal2Block033
public import RateCertificateData.Terminal2Block034
public import RateCertificateData.Terminal2Block035
public import RateCertificateData.Terminal2Block036
public import RateCertificateData.Terminal2Block037
public import RateCertificateData.Terminal2Block038

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

namespace MatrixBounds.Numeric.CertifiedTerminalRate2
set_option maxRecDepth 100000
set_option maxHeartbeats 32000000

/-- All exact expression blocks, in their complete original order. -/
def blocks : List CertifiedLogBlock := [
  RateCertificateData.Terminal2Block000.certificate, RateCertificateData.Terminal2Block001.certificate, RateCertificateData.Terminal2Block002.certificate, RateCertificateData.Terminal2Block003.certificate, RateCertificateData.Terminal2Block004.certificate, RateCertificateData.Terminal2Block005.certificate, RateCertificateData.Terminal2Block006.certificate, RateCertificateData.Terminal2Block007.certificate, RateCertificateData.Terminal2Block008.certificate, RateCertificateData.Terminal2Block009.certificate, RateCertificateData.Terminal2Block010.certificate, RateCertificateData.Terminal2Block011.certificate, RateCertificateData.Terminal2Block012.certificate, RateCertificateData.Terminal2Block013.certificate, RateCertificateData.Terminal2Block014.certificate, RateCertificateData.Terminal2Block015.certificate, RateCertificateData.Terminal2Block016.certificate, RateCertificateData.Terminal2Block017.certificate, RateCertificateData.Terminal2Block018.certificate, RateCertificateData.Terminal2Block019.certificate, RateCertificateData.Terminal2Block020.certificate, RateCertificateData.Terminal2Block021.certificate, RateCertificateData.Terminal2Block022.certificate, RateCertificateData.Terminal2Block023.certificate, RateCertificateData.Terminal2Block024.certificate, RateCertificateData.Terminal2Block025.certificate, RateCertificateData.Terminal2Block026.certificate, RateCertificateData.Terminal2Block027.certificate, RateCertificateData.Terminal2Block028.certificate, RateCertificateData.Terminal2Block029.certificate, RateCertificateData.Terminal2Block030.certificate, RateCertificateData.Terminal2Block031.certificate, RateCertificateData.Terminal2Block032.certificate, RateCertificateData.Terminal2Block033.certificate, RateCertificateData.Terminal2Block034.certificate, RateCertificateData.Terminal2Block035.certificate, RateCertificateData.Terminal2Block036.certificate, RateCertificateData.Terminal2Block037.certificate, RateCertificateData.Terminal2Block038.certificate
]
/-- Complete real logarithmic expression; the `Supplied*Certified*` modules identify it with the actual tensor-pipeline rate. -/
noncomputable def value : ℝ := certifiedBlocksValue blocks
/-- Exact integer enclosure of the complete expression at scale 2^60. -/
def bounds : FixedBounds := ⟨1533544354609832024, 1533544354610224840⟩
/-- All block endpoint sums agree exactly with the reported complete rate interval. -/
theorem bounds_checked : certifiedBlocksBounds blocks = bounds := by decide +kernel
/-- The reported interval contains the complete exact real logarithmic expression. -/
theorem sound : (bounds.interval (2^60)).Contains value :=
  certifiedBlocks_sound blocks bounds bounds_checked

end MatrixBounds.Numeric.CertifiedTerminalRate2
