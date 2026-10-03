module

public import CWZeroExact
public import ContextRestrictions

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Exact zero-coordinate leaves become full-dimension matrix factors in every
finite tensor context, so earlier extracted copies and waiting sectors survive. -/
namespace MatrixBounds.Tensor.CW

universe v
open Empirical
noncomputable section
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {K P : Type*} [CommRing K] [Fintype P]

/-- The exact zero-Z leaf supplies its matrix tensor at unit cost beside every companion tensor. -/
theorem contextReduction_zero_exact_matrix {q length total : ℕ}
    (profile : (Fin length → Fin 3) → ℕ) :
    ContextReduction.{v} (zeroExact (K := K) (P := P) q length total profile)
      (MatrixMul.tensor (K := K) (I := PUnit)
        (J := Interface.Variable (P := P) (fun x : AxisVariable q length total => fineWord x.val) profile)
        (L := PUnit)) 1 := by
  rw [← zero_exact_matrix_identity profile]
  exact contextReduction_pullback _ _ _ _

end
end MatrixBounds.Tensor.CW
