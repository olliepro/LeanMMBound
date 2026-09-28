import CWZeroContext
import CWOneLetterDimensions

/-! Full zero-coordinate constituent powers contain a matrix factor with the
complete coordinate-family dimension. These maps include the terminal leaves. -/
namespace MatrixBounds.Tensor.CW

universe v
open Empirical
open scoped BigOperators
noncomputable section
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {K P : Type*} [CommRing K] [Fintype P]

/-- Select complementary coordinate families to obtain exactly a matrix multiplication coefficient. -/
theorem zero_power_matrix_identity (q length total : ℕ) :
    (fun (x : PUnit × (P → AxisVariable q length total))
      (y : (P → AxisVariable q length total) × PUnit) (_z : PUnit × PUnit) =>
      Interface.heterogeneous (fun _ : P => constituent (K := K) q length ⟨total, 2*length-total, 0⟩)
        x.2 (fun p => complementAxis (y.1 p)) (fun _ => zeroAxis q length)) =
      MatrixMul.tensor (K := K) := by
  funext x y z
  change (∏ p, wordPower (tensor (K := K) q) length (x.2 p).val
    (wordComplement q length (y.1 p).val) (fun _ => 0)) = _
  rw [zero_z_family_pairing]
  have same : (fun p => (x.2 p).val) = (fun p => (y.1 p).val) ↔ x.2 = y.1 := by
    constructor
    · intro equal
      funext p
      exact Subtype.ext (congrFun equal p)
    · intro equal
      rw [equal]
  simp only [same, MatrixMul.tensor, Subsingleton.elim x.1 z.1,
    Subsingleton.elim y.2 z.2, true_and, and_true]

/-- A zero-coordinate power yields its complete matrix factor while preserving every companion tensor. -/
theorem contextReduction_zero_power_matrix (q length total : ℕ) :
    ContextReduction.{v}
      (Interface.heterogeneous (fun _ : P => constituent (K := K) q length ⟨total, 2*length-total, 0⟩))
      (MatrixMul.tensor (K := K) (I := PUnit) (J := P → AxisVariable q length total) (L := PUnit)) 1 := by
  rw [← zero_power_matrix_identity q length total]
  exact contextReduction_pullback _ _ _ _

/-- The nontrivial dimension of a one-letter zero-sector matrix is q to the pool size on a middle axis. -/
theorem one_letter_matrix_dimension (q : ℕ) (label : Fin 3) :
    Fintype.card (P → AxisVariable q 1 label.val) =
      if label = 1 then q^(Fintype.card P) else 1 := by
  rw [Fintype.card_fun, one_letter_axis_card]
  split_ifs <;> simp

end
end MatrixBounds.Tensor.CW
