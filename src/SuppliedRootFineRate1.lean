module

public import FKLRoot.Rates

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! The supplied root fine certificate is identified with the actual complete original tensor rate. -/
namespace MatrixBounds.Numeric.SuppliedRootFineRate1
noncomputable section

/-- Complete actual root fine expression equals its original independently interval-certified logarithmic value. -/
theorem value_eq : rationalLogValue (SuppliedRootFine.expression 0) = CertifiedRootRate1.value :=
  FKLRoot.value_eq1

/-- The exact supplied sixty-bit enclosure contains the actual complete original root fine rate. -/
theorem rate_sound : (CertifiedRootRate1.bounds.interval (2^60)).Contains
    (rationalLogValue (SuppliedRootFine.expression 0)) := by
  rw [value_eq]
  exact CertifiedRootRate1.sound

end
end MatrixBounds.Numeric.SuppliedRootFineRate1
