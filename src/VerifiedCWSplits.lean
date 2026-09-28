import CWRegroup
import VerifiedSplitData

/-! The checked numerical split support is connected to genuine CW tensor
restrictions. Accepted child shapes and their complements reconstruct the parent. -/
namespace MatrixBounds.Tensor.CW

noncomputable section
variable {K : Type*} [CommRing K]

/-- Every supported supplied split has an exact parent/child coefficient identity. -/
theorem recorded_split_shape {data : Numeric.SplitRow} (recorded : data ∈ Numeric.SplitCertificateData.rows)
    {child : Numeric.Shape} (listed : child ∈ Numeric.shapes data.childTotal)
    (nonzero : data.massAt child ≠ 0) : addShape child (data.parent.complement child) = data.parent := by
  exact addShape_complement (Numeric.SplitCertificateData.supported_complement recorded listed nonzero).1

/-- A supplied supported split transports a parent degeneration to the actual product of its children.
The explicit child-length equality connects coarse totals to the lengths of CW words. -/
def recordedSplitCertificate {data : Numeric.SplitRow}
    (recorded : data ∈ Numeric.SplitCertificateData.rows) {child : Numeric.Shape}
    (listed : child ∈ Numeric.shapes data.childTotal) (nonzero : data.massAt child ≠ 0)
    {q childLength rank degree : ℕ} (length_eq : data.childTotal = 2*childLength)
    (certificate : Degeneration.Certificate (constituent (K := K) q data.childTotal data.parent) rank degree) :
    Degeneration.Certificate (product (constituent (K := K) q childLength child)
      (constituent q childLength (data.parent.complement child))) rank degree := by
  have shape_eq := recorded_split_shape recorded listed nonzero
  apply splitConstituentCertificate child (data.parent.complement child)
  rw [shape_eq, ← two_mul, ← length_eq]
  exact certificate

end
end MatrixBounds.Tensor.CW
