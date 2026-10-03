module

public import RateCertificateData.Terminal0Block000
public import RateCertificateData.Terminal0Block001
public import RateCertificateData.Terminal0Block002
public import RateCertificateData.Terminal0Block003
public import RateCertificateData.Terminal0Block004
public import RateCertificateData.Terminal0Block005
public import RateCertificateData.Terminal0Block006
public import RateCertificateData.Terminal0Block007
public import RateCertificateData.Terminal0Block008
public import RateCertificateData.Terminal0Block009
public import RateCertificateData.Terminal0Block010
public import RateCertificateData.Terminal0Block011
public import RateCertificateData.Terminal0Block012
public import RateCertificateData.Terminal0Block013
public import RateCertificateData.Terminal0Block014
public import RateCertificateData.Terminal0Block015
public import RateCertificateData.Terminal0Block016
public import RateCertificateData.Terminal0Block017
public import RateCertificateData.Terminal0Block018
public import RateCertificateData.Terminal0Block019
public import RateCertificateData.Terminal0Block020
public import RateCertificateData.Terminal0Block021
public import RateCertificateData.Terminal0Block022
public import RateCertificateData.Terminal0Block023
public import RateCertificateData.Terminal0Block024
public import RateCertificateData.Terminal0Block025
public import RateCertificateData.Terminal0Block026
public import RateCertificateData.Terminal0Block027
public import RateCertificateData.Terminal0Block028
public import RateCertificateData.Terminal0Block029
public import RateCertificateData.Terminal0Block030
public import RateCertificateData.Terminal0Block031
public import RateCertificateData.Terminal0Block032
public import RateCertificateData.Terminal0Block033
public import RateCertificateData.Terminal0Block034
public import RateCertificateData.Terminal0Block035
public import RateCertificateData.Terminal0Block036
public import RateCertificateData.Terminal0Block037
public import RateCertificateData.Terminal0Block038

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

namespace MatrixBounds.Numeric.CertifiedTerminalRate0
set_option maxRecDepth 100000
set_option maxHeartbeats 32000000

/-- All exact expression blocks, in their complete original order. -/
def blocks : List CertifiedLogBlock := [
  RateCertificateData.Terminal0Block000.certificate, RateCertificateData.Terminal0Block001.certificate, RateCertificateData.Terminal0Block002.certificate, RateCertificateData.Terminal0Block003.certificate, RateCertificateData.Terminal0Block004.certificate, RateCertificateData.Terminal0Block005.certificate, RateCertificateData.Terminal0Block006.certificate, RateCertificateData.Terminal0Block007.certificate, RateCertificateData.Terminal0Block008.certificate, RateCertificateData.Terminal0Block009.certificate, RateCertificateData.Terminal0Block010.certificate, RateCertificateData.Terminal0Block011.certificate, RateCertificateData.Terminal0Block012.certificate, RateCertificateData.Terminal0Block013.certificate, RateCertificateData.Terminal0Block014.certificate, RateCertificateData.Terminal0Block015.certificate, RateCertificateData.Terminal0Block016.certificate, RateCertificateData.Terminal0Block017.certificate, RateCertificateData.Terminal0Block018.certificate, RateCertificateData.Terminal0Block019.certificate, RateCertificateData.Terminal0Block020.certificate, RateCertificateData.Terminal0Block021.certificate, RateCertificateData.Terminal0Block022.certificate, RateCertificateData.Terminal0Block023.certificate, RateCertificateData.Terminal0Block024.certificate, RateCertificateData.Terminal0Block025.certificate, RateCertificateData.Terminal0Block026.certificate, RateCertificateData.Terminal0Block027.certificate, RateCertificateData.Terminal0Block028.certificate, RateCertificateData.Terminal0Block029.certificate, RateCertificateData.Terminal0Block030.certificate, RateCertificateData.Terminal0Block031.certificate, RateCertificateData.Terminal0Block032.certificate, RateCertificateData.Terminal0Block033.certificate, RateCertificateData.Terminal0Block034.certificate, RateCertificateData.Terminal0Block035.certificate, RateCertificateData.Terminal0Block036.certificate, RateCertificateData.Terminal0Block037.certificate, RateCertificateData.Terminal0Block038.certificate
]
/-- Complete real logarithmic expression; the `Supplied*Certified*` modules identify it with the actual tensor-pipeline rate. -/
noncomputable def value : ℝ := certifiedBlocksValue blocks
/-- Exact integer enclosure of the complete expression at scale 2^60. -/
def bounds : FixedBounds := ⟨1268811725556869392, 1268811725557312495⟩
/-- All block endpoint sums agree exactly with the reported complete rate interval. -/
theorem bounds_checked : certifiedBlocksBounds blocks = bounds := by decide +kernel
/-- The reported interval contains the complete exact real logarithmic expression. -/
theorem sound : (bounds.interval (2^60)).Contains value :=
  certifiedBlocks_sound blocks bounds bounds_checked

end MatrixBounds.Numeric.CertifiedTerminalRate0
