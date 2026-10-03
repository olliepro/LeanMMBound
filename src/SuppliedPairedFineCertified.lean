module

public import FKLFine4Data.A0Certified
public import FKLFine4Data.A1Certified
public import FKLFine3Data.A0Certified
public import FKLFine3Data.A1Certified
public import SuppliedPairedFineStageExpressions

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! The four actual paired fine extraction rates equal their supplied certificates at the root unit. -/
namespace MatrixBounds.Numeric.SuppliedPairedFineCertified

/-- The actual level-three fine rate on physical axis 1 equals its supplied certificate. -/
theorem level3_rate1 : SuppliedPathStages.level3.rates 1/(SuppliedPopulationWeights.rootWeight : ℝ) =
    CertifiedLevel3Rate1.value := by
  have identity := SuppliedPairedFine.normalized_stage_rate3 0
  rw [FKLFine3Data.A0.expression_eq] at identity
  exact identity

/-- The actual level-three fine rate on physical axis 2 equals its supplied certificate. -/
theorem level3_rate2 : SuppliedPathStages.level3.rates 2/(SuppliedPopulationWeights.rootWeight : ℝ) =
    CertifiedLevel3Rate2.value := by
  have identity := SuppliedPairedFine.normalized_stage_rate3 1
  rw [FKLFine3Data.A1.expression_eq] at identity
  exact identity

/-- The actual level-four fine rate on physical axis 1 equals its supplied certificate. -/
theorem level4_rate1 : SuppliedFixedStages.level4.rates 1/(SuppliedPopulationWeights.rootWeight : ℝ) =
    CertifiedLevel4Rate1.value :=
  FKLFine4Data.A0.level4_rate1

/-- The actual level-four fine rate on physical axis 2 equals its supplied certificate. -/
theorem level4_rate2 : SuppliedFixedStages.level4.rates 2/(SuppliedPopulationWeights.rootWeight : ℝ) =
    CertifiedLevel4Rate2.value :=
  FKLFine4Data.A1.level4_rate2

end MatrixBounds.Numeric.SuppliedPairedFineCertified
