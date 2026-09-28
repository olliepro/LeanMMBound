import CertificateData.Part000
import VerifiedOrbitSupportTables
import ZeroOrbitLawData

namespace MatrixBounds.Numeric.ZeroOrbitCertificateData.Part000
set_option maxRecDepth 100000
set_option maxHeartbeats 16000000

/-- Original source-row indices and their required nonzero-axis coarse totals. -/
def indices : List (ℕ × ℕ) := [
  (11,3),
  (119,2)
]

/-- Actual supplied zero-leaf rows, reusing the existing exact dyadic data. -/
def rows : List ZeroOrbitRow := indices.map (fun entry =>
  ⟨CertificateData.Part000.rows[entry.1]?.getD ⟨0, []⟩, entry.2⟩)

/-- Every selected original row has exact normalization, width, and complete coarse support. -/
theorem rows_checked : rows.all (fun entry => entry.check 6 17592186044416 OrbitLevel2.totalAt) = true := by decide

end MatrixBounds.Numeric.ZeroOrbitCertificateData.Part000
