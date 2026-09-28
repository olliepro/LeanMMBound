import SuppliedPairedFine4Certified
import SuppliedPairedFine3Certified

/-! The four actual paired fine extraction rates equal their supplied certificates at the root unit. -/
namespace MatrixBounds.Numeric.SuppliedPairedFineCertified

/-- The actual level-three fine rate on physical axis 1 equals its supplied certificate. -/
theorem level3_rate1 : SuppliedPathStages.level3.rates 1/(SuppliedPopulationWeights.rootWeight : ℝ) =
    CertifiedLevel3Rate1.value :=
  SuppliedPairedFine.SuppliedPairedFine3Certified.level3_rate1

/-- The actual level-three fine rate on physical axis 2 equals its supplied certificate. -/
theorem level3_rate2 : SuppliedPathStages.level3.rates 2/(SuppliedPopulationWeights.rootWeight : ℝ) =
    CertifiedLevel3Rate2.value :=
  SuppliedPairedFine.SuppliedPairedFine3Certified.level3_rate2

/-- The actual level-four fine rate on physical axis 1 equals its supplied certificate. -/
theorem level4_rate1 : SuppliedFixedStages.level4.rates 1/(SuppliedPopulationWeights.rootWeight : ℝ) =
    CertifiedLevel4Rate1.value :=
  SuppliedPairedFine.SuppliedPairedFine4Certified.level4_rate1

/-- The actual level-four fine rate on physical axis 2 equals its supplied certificate. -/
theorem level4_rate2 : SuppliedFixedStages.level4.rates 2/(SuppliedPopulationWeights.rootWeight : ℝ) =
    CertifiedLevel4Rate2.value :=
  SuppliedPairedFine.SuppliedPairedFine4Certified.level4_rate2

end MatrixBounds.Numeric.SuppliedPairedFineCertified
