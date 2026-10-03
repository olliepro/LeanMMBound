module

public import SuppliedNormalizedExtraction
public import CertifiedPipelineScalar

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Final assembly. Once the actual normalized construction rates are identified with the
kernel-checked numerical expressions, the algebraic matrix multiplication exponent is below
the requested threshold. Every identification is an explicit hypothesis here; the modules that
prove them are combined in `SuppliedCertifiedPipeline`. -/
namespace MatrixBounds.Numeric.SuppliedCertifiedAssembly

open SuppliedPopulationWeights SuppliedRationalStages
noncomputable section

/-- The batch count of the certified finite schedule. -/
def batches : ℕ := 1000000

/-- The three normalized level-four axis identities give the certified level-four vector. -/
theorem stages_level4_of
    (axis0 : (SuppliedPathStages.fixed .level4).rates 0/(rootWeight : ℝ) = CertifiedLevel4Rate0.value)
    (axis1 : SuppliedFixedStages.level4.rates 1/(rootWeight : ℝ) = CertifiedLevel4Rate1.value)
    (axis2 : SuppliedFixedStages.level4.rates 2/(rootWeight : ℝ) = CertifiedLevel4Rate2.value) :
    SuppliedNormalizedRates.stages 0 = CertifiedPipelineScalar.level4Rates := by
  rw [SuppliedPathStages.fixed_rates] at axis0
  funext axis
  fin_cases axis
  · exact axis0
  · exact axis1
  · exact axis2

/-- The three normalized level-three axis identities give the certified level-three vector. -/
theorem stages_level3_of
    (axis0 : SuppliedPathStages.level3.rates 0/(rootWeight : ℝ) = CertifiedLevel3Rate0.value)
    (axis1 : SuppliedPathStages.level3.rates 1/(rootWeight : ℝ) = CertifiedLevel3Rate1.value)
    (axis2 : SuppliedPathStages.level3.rates 2/(rootWeight : ℝ) = CertifiedLevel3Rate2.value) :
    SuppliedNormalizedRates.stages 1 = CertifiedPipelineScalar.level3Rates := by
  rw [SuppliedPathStages.level3_rates] at axis0 axis1 axis2
  funext axis
  fin_cases axis
  · exact axis0
  · exact axis1
  · exact axis2

/-- The certified finite retention is the normalized actual retention at the certified batch count. -/
theorem retention_eq_of
    (root : SuppliedRootStage.retention = bottleneck CertifiedPipelineScalar.rootRates)
    (level4 : SuppliedNormalizedRates.stages 0 = CertifiedPipelineScalar.level4Rates)
    (level3 : SuppliedNormalizedRates.stages 1 = CertifiedPipelineScalar.level3Rates)
    (terminal : SuppliedNormalizedRates.stages 2 = CertifiedPipelineScalar.terminalRates) :
    SuppliedNormalizedRates.retention batches = CertifiedPipelineScalar.retention := by
  unfold SuppliedNormalizedRates.retention CertifiedPipelineScalar.retention finitePipelineRetention batches
  rw [root, level4, level3, terminal]

/-- The identified rates bound the algebraic exponent strictly below 2.3710449. -/
theorem exponent_lt_of {K : Type} [CommRing K]
    (retentionEq : SuppliedNormalizedRates.retention batches = CertifiedPipelineScalar.retention)
    (volumeEq : SuppliedNormalizedRates.volume = CertifiedPipelineScalar.volume) :
    MatrixComplexity.exponent K < (23710449 : ℝ)/10000000 := by
  refine CertifiedPipelineScalar.exponent_bound_of_actual_extractions (K := K) ?_
  intro error positive
  obtain ⟨scale, rank, copies, i, j, l, scalePositive, algorithm, rankBound, retained, dimensions⟩ :=
    SuppliedNormalizedExtraction.asymptotic_extractions (K := K) (batches := batches)
      (by norm_num [batches]) error positive
  rw [retentionEq] at retained
  rw [volumeEq] at dimensions
  exact ⟨scale, rank, copies, i, j, l, scalePositive, algorithm, rankBound, retained, dimensions⟩

end
end MatrixBounds.Numeric.SuppliedCertifiedAssembly
