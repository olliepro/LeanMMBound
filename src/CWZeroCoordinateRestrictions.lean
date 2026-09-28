import CWZeroPower
import MatrixCoordinateRestrictions
import CWAxisPermutations

/-! Full zero-coordinate CW powers have explicit maps into matrix tensors.
All three physical orientations are retained at the coefficient level. -/
namespace MatrixBounds.Tensor.CW

open Empirical Numeric
noncomputable section
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {K P : Type*} [CommRing K] [Fintype P]

/-- The three physical maps realizing the complete zero-Z matrix factor. -/
def zeroZCoordinateRestriction (q length total : ℕ) :
    CoordinateRestriction
      (Interface.heterogeneous (fun _ : P => constituent (K := K) q length ⟨total, 2*length-total, 0⟩))
      (MatrixMul.tensor (K := K) (I := PUnit) (J := P → AxisVariable q length total) (L := PUnit)) where
  left pair := pair.2
  middle pair position := complementAxis (pair.1 position)
  right _ _ := zeroAxis q length
  coefficient x y z := congrFun (congrFun (congrFun (zero_power_matrix_identity q length total) x) y) z

/-- Cycling every factor of a full CW constituent power cycles its common coarse shape. -/
theorem cyclic_constituent_power (q length : ℕ) (shape : Shape) :
    cyclic (Interface.heterogeneous (fun _ : P => constituent (K := K) q length shape)) =
      Interface.heterogeneous (fun _ : P => constituent (K := K) q length (cyclicShape shape)) := by
  funext x y z
  apply Finset.prod_congr rfl
  intro position _
  exact word_tensor_cyclic (z position).val (x position).val (y position).val

/-- Cycling the zero-Z coordinate maps yields the full zero-Y matrix factor. -/
def zeroYCoordinateRestriction (q length total : ℕ) :
    CoordinateRestriction
      (Interface.heterogeneous (fun _ : P => constituent (K := K) q length ⟨2*length-total, 0, total⟩))
      (MatrixMul.tensor (K := K) (I := P → AxisVariable q length total) (J := PUnit) (L := PUnit)) := by
  have cycled := (zeroZCoordinateRestriction (K := K) (P := P) q length total).cyclic.trans
    MatrixMul.cyclicCoordinateRestriction
  rw [cyclic_constituent_power] at cycled
  exact cycled

/-- Cycling twice yields the full zero-X matrix factor with the corresponding column dimension. -/
def zeroXCoordinateRestriction (q length total : ℕ) :
    CoordinateRestriction
      (Interface.heterogeneous (fun _ : P => constituent (K := K) q length ⟨0, total, 2*length-total⟩))
      (MatrixMul.tensor (K := K) (I := PUnit) (J := PUnit) (L := P → AxisVariable q length total)) := by
  have cycled := (zeroYCoordinateRestriction (K := K) (P := P) q length total).cyclic.trans
    MatrixMul.cyclicCoordinateRestriction
  rw [cyclic_constituent_power] at cycled
  exact cycled

end
end MatrixBounds.Tensor.CW
