import SuppliedRootFineCheck1

/-! The supplied root fine certificate is identified with the actual complete original tensor rate. -/
namespace MatrixBounds.Numeric.SuppliedRootFineRate1
noncomputable section

/-- Complete actual root fine expression equals its original independently interval-certified logarithmic value. -/
theorem value_eq : rationalLogValue (SuppliedRootFine.expression 0) = CertifiedRootRate1.value := by
  rw [← SuppliedRootFineCachedPoolsExpression.expression_value 0,
    rationalLogValue_of_mergeNormalized_eq SuppliedRootFineCheck1.normalized_checked,
    SuppliedRootFineCheck1.certificateExpression, ← integerLogValue_expression,
    integerLogValue_append]
  simp only [CertifiedRootRate1.value, CertifiedRootRate1.blocks, certifiedBlocksValue,
    RateCertificateData.Root1Block000.certificate, RateCertificateData.Root1Block001.certificate, add_zero]

/-- The exact supplied sixty-bit enclosure contains the actual complete original root fine rate. -/
theorem rate_sound : (CertifiedRootRate1.bounds.interval (2^60)).Contains
    (rationalLogValue (SuppliedRootFine.expression 0)) := by
  rw [value_eq]
  exact CertifiedRootRate1.sound

end
end MatrixBounds.Numeric.SuppliedRootFineRate1
