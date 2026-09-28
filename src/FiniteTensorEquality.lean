import FiniteTensorFamily

/-! Equality of packaged finite tensors yields explicit coordinate maps,
including the dependent coordinate casts needed by a changing schedule. -/
namespace MatrixBounds.Tensor

noncomputable section
variable {K : Type} [CommSemiring K]

/-- Equal packaged tensors give a coordinate restriction with all dependent axes transported together. -/
def FiniteTensor.equalRestriction {source target : FiniteTensor K} (equal : source = target) :
    CoordinateRestriction source.coefficient target.coefficient := by
  cases equal
  exact CoordinateRestriction.refl _

end
end MatrixBounds.Tensor
