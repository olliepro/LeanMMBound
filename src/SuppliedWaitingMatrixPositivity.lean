import SuppliedWaitingZero3Sixfold
import SuppliedWaitingZero4Sixfold
import MatrixProductVolume

/-! All actual selected waiting matrix indices are nonempty at every original
population, including zero; logarithmic volumes can therefore be combined. -/
namespace MatrixBounds.Numeric

open Tensor WaitingZeroMatrix
noncomputable section
set_option synthInstance.maxSize 1000
set_option maxRecDepth 3000
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A

/-- Every complete sixfold waiting zero3 matrix has positive finite volume. -/
theorem SuppliedWaitingZero3.volume_positive (size : ℕ) :
    0 < Fintype.card (CombinedRows size)*Fintype.card (CombinedInner size)*Fintype.card (CombinedColumns size) := by
  rw [sixfold_volume]
  apply pow_pos
  have positive := MatrixMul.family_volume_positive (fun label : Active => Rows label.val size)
    (fun label : Active => Inner label.val size) (fun label : Active => Columns label.val size)
    (fun label => by rw [factor_volume]; exact indices_positive label.val size)
  simpa only [← Nat.card_eq_fintype_card] using positive

/-- Every complete sixfold waiting zero4 matrix has positive finite volume. -/
theorem SuppliedWaitingZero4.volume_positive (size : ℕ) :
    0 < Fintype.card (CombinedRows size)*Fintype.card (CombinedInner size)*Fintype.card (CombinedColumns size) := by
  rw [sixfold_volume]
  apply pow_pos
  have positive := MatrixMul.family_volume_positive (fun label : Active => Rows label.val size)
    (fun label : Active => Inner label.val size) (fun label : Active => Columns label.val size)
    (fun label => by rw [factor_volume]; exact indices_positive label.val size)
  simpa only [← Nat.card_eq_fintype_card] using positive

end
end MatrixBounds.Numeric
