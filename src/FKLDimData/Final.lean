module

public import FKLDimData.Certified
public import SuppliedNormalizedRates

@[expose] public section

namespace MatrixBounds.Numeric.SuppliedDimensionRates

/-- The actual complete six-orientation tensor construction has exactly the certified normalized volume. -/
theorem normalized_volume_eq : SuppliedNormalizedRates.volume = CertifiedPipelineScalar.volume := by
  rw [SuppliedNormalizedRates.volume, SuppliedCompletedMatrix.volumeRate]
  have nonzero : (6 : ℝ) ≠ 0 := by norm_num
  rw [mul_div_mul_left _ _ nonzero]
  exact volume_eq

end MatrixBounds.Numeric.SuppliedDimensionRates
