module

public import SuppliedCertifiedAssembly
public import SuppliedRootFineCertifiedRates
public import PairedCoarse4Certified
public import PairedCoarse3Certified
public import SuppliedPairedFineCertified
public import SuppliedTerminalRateBinding
public import SuppliedDimensionRateBinding

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! The supplied pipeline's actual rectangular algorithms, with every rate identified with
its kernel-checked numerical certificate, bound the algebraic matrix multiplication exponent
strictly below 2.3710449. No identification hypothesis remains. -/
namespace MatrixBounds.Numeric.SuppliedCertifiedPipeline

open SuppliedCertifiedAssembly
noncomputable section

/-- The actual normalized level-four rates are exactly the certified level-four expressions. -/
theorem stages_level4 : SuppliedNormalizedRates.stages 0 = CertifiedPipelineScalar.level4Rates :=
  stages_level4_of SuppliedPairedCoarse.PairedCoarse4Certified.normalized_rate_eq
    SuppliedPairedFineCertified.level4_rate1 SuppliedPairedFineCertified.level4_rate2

/-- The actual normalized level-three rates are exactly the certified level-three expressions. -/
theorem stages_level3 : SuppliedNormalizedRates.stages 1 = CertifiedPipelineScalar.level3Rates :=
  stages_level3_of SuppliedPairedCoarse.PairedCoarse3Certified.normalized_rate_eq
    SuppliedPairedFineCertified.level3_rate1 SuppliedPairedFineCertified.level3_rate2

/-- The actual normalized terminal rates are exactly the certified terminal expressions. -/
theorem stages_terminal : SuppliedNormalizedRates.stages 2 = CertifiedPipelineScalar.terminalRates :=
  SuppliedTerminalRates.vector_eq

/-- The actual normalized million-batch retention is the certified finite retention. -/
theorem retention_eq : SuppliedNormalizedRates.retention batches = CertifiedPipelineScalar.retention :=
  retention_eq_of SuppliedRootFineCertifiedRates.retention_eq stages_level4 stages_level3 stages_terminal

/-- The actual normalized matrix volume is the certified dimension sum. -/
theorem volume_eq : SuppliedNormalizedRates.volume = CertifiedPipelineScalar.volume :=
  SuppliedDimensionRates.normalized_volume_eq

/-- The algebraic matrix multiplication exponent over any commutative ring is below 2.3710449. -/
theorem exponent_lt {K : Type} [CommRing K] : MatrixComplexity.exponent K < (23710449 : ℝ)/10000000 :=
  exponent_lt_of retention_eq volume_eq

/-- The rational matrix multiplication exponent is below 2.3710449. -/
theorem exponent_rat_lt : MatrixComplexity.exponent ℚ < (23710449 : ℝ)/10000000 := exponent_lt

end
end MatrixBounds.Numeric.SuppliedCertifiedPipeline
