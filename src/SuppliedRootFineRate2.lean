module

public import FKLRoot.Rates

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! The supplied root fine certificate is identified with the actual complete original tensor rate. -/
namespace MatrixBounds.Numeric.SuppliedRootFineRate2
noncomputable section

/-- Complete actual root fine expression equals its original independently interval-certified logarithmic value. -/
theorem value_eq : rationalLogValue (SuppliedRootFine.expression 1) = CertifiedRootRate2.value :=
  FKLRoot.value_eq2

/-- The exact supplied sixty-bit enclosure contains the actual complete original root fine rate. -/
theorem rate_sound : (CertifiedRootRate2.bounds.interval (2^60)).Contains
    (rationalLogValue (SuppliedRootFine.expression 1)) := by
  rw [value_eq]
  exact CertifiedRootRate2.sound

end
end MatrixBounds.Numeric.SuppliedRootFineRate2
