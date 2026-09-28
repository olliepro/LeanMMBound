import SuppliedRootFineCheck2

/-! The supplied root fine certificate is identified with the actual complete original tensor rate. -/
namespace MatrixBounds.Numeric.SuppliedRootFineRate2
noncomputable section

/-- Complete actual root fine expression equals its original independently interval-certified logarithmic value. -/
theorem value_eq : rationalLogValue (SuppliedRootFine.expression 1) = CertifiedRootRate2.value := by
  rw [← SuppliedRootFineCachedPoolsExpression.expression_value 1,
    rationalLogValue_of_mergeNormalized_eq SuppliedRootFineCheck2.normalized_checked,
    SuppliedRootFineCheck2.certificateExpression, ← integerLogValue_expression,
    integerLogValue_append]
  simp only [CertifiedRootRate2.value, CertifiedRootRate2.blocks, certifiedBlocksValue,
    RateCertificateData.Root2Block000.certificate, RateCertificateData.Root2Block001.certificate, add_zero]

/-- The exact supplied sixty-bit enclosure contains the actual complete original root fine rate. -/
theorem rate_sound : (CertifiedRootRate2.bounds.interval (2^60)).Contains
    (rationalLogValue (SuppliedRootFine.expression 1)) := by
  rw [value_eq]
  exact CertifiedRootRate2.sound

end
end MatrixBounds.Numeric.SuppliedRootFineRate2
