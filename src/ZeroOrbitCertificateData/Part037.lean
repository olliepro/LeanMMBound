import CertificateData.Part059
import VerifiedOrbitSupportTables
import ZeroOrbitLawData

namespace MatrixBounds.Numeric.ZeroOrbitCertificateData.Part037
set_option maxRecDepth 100000
set_option maxHeartbeats 16000000

/-- Original source-row indices and their required nonzero-axis coarse totals. -/
def indices : List (ℕ × ℕ) := [
  (131,16),
  (132,1),
  (133,2),
  (134,3),
  (135,4),
  (136,5),
  (137,6),
  (138,7),
  (139,8),
  (140,9),
  (141,10),
  (142,11),
  (143,12),
  (144,13),
  (145,14),
  (146,15),
  (147,2),
  (148,2),
  (149,3),
  (150,3),
  (151,4),
  (152,4),
  (153,5),
  (154,5),
  (155,6),
  (156,6),
  (157,7),
  (158,7),
  (159,8),
  (160,8),
  (161,9),
  (162,9),
  (163,10),
  (164,10),
  (165,11),
  (166,11),
  (167,12),
  (168,12),
  (169,13),
  (170,13),
  (171,14),
  (172,14)
]

/-- Actual supplied zero-leaf rows, reusing the existing exact dyadic data. -/
def rows : List ZeroOrbitRow := indices.map (fun entry =>
  ⟨CertificateData.Part059.rows[entry.1]?.getD ⟨0, []⟩, entry.2⟩)

/-- Every selected original row has exact normalization, width, and complete coarse support. -/
theorem rows_checked : rows.all (fun entry => entry.check 231 17592186044416 OrbitLevel4.totalAt) = true := by decide

end MatrixBounds.Numeric.ZeroOrbitCertificateData.Part037
