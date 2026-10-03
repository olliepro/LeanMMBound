module

public import CWTypedInterfaces
public import HeterogeneousInterface

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Explicit coordinate growth for the actual heterogeneous CW targets.
This supplies the size bound used by repair, uniformly over exact profiles. -/
namespace MatrixBounds.Tensor.CW

open scoped BigOperators
noncomputable section
local instance (A : Type*) : DecidableEq A := Classical.decEq A
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {T : Type*} [Fintype T] {Positions : T → Type*} [∀ t, Fintype (Positions t)]

/-- The actual axis variables of a heterogeneous exact CW interface. -/
abbrev ExactAxis (q : ℕ) (length total : T → ℕ)
    (profile : ∀ t, (Fin (length t) → Fin 3) → ℕ) :=
  ∀ t, Interface.Variable (P := Positions t)
    (fun entry : AxisVariable q (length t) (total t) => fineWord entry.val) (profile t)

/-- All exact child profiles share the same exponential upper bound on one axis's coordinates. -/
theorem exact_axis_card_le (q : ℕ) (length total : T → ℕ)
    (profile : ∀ t, (Fin (length t) → Fin 3) → ℕ) :
    Fintype.card (ExactAxis (Positions := Positions) q length total profile) ≤
      (q+2)^(∑ t, length t*Fintype.card (Positions t)) := by
  rw [Fintype.card_pi, ← Finset.prod_pow_eq_pow_sum]
  exact Finset.prod_le_prod' (fun t _ => exact_variable_card_le q (length t) (total t) (profile t))

/-- A binary alphabet-size bound converts the CW coordinate count into a power of two. -/
theorem exact_axis_binary_bound {q bits volume : ℕ} (length total : T → ℕ)
    (profile : ∀ t, (Fin (length t) → Fin 3) → ℕ)
    (alphabet : q+2 ≤ 2^bits) (volume_bound : (∑ t, length t*Fintype.card (Positions t)) ≤ volume) :
    Fintype.card (ExactAxis (Positions := Positions) q length total profile) ≤ 2^(bits*volume) := by
  apply (exact_axis_card_le q length total profile).trans
  calc
    (q+2)^(∑ t, length t*Fintype.card (Positions t)) ≤
        (2^bits)^(∑ t, length t*Fintype.card (Positions t)) := Nat.pow_le_pow_left alphabet _
    _ = 2^(bits*(∑ t, length t*Fintype.card (Positions t))) := (pow_mul _ _ _).symm
    _ ≤ 2^(bits*volume) := Nat.pow_le_pow_right (by decide) (Nat.mul_le_mul_left bits volume_bound)

/-- The full coordinate cube of a batch has explicit linear-exponent growth.
For q=5 one may take bits=3, since each original CW variable alphabet has size seven. -/
theorem exact_batch_cube_bound {E : Type*} [Fintype E] {q bits scale edgeGrowth wordGrowth : ℕ}
    (length totalX totalY totalZ : T → ℕ)
    (profileX profileY profileZ : ∀ t, (Fin (length t) → Fin 3) → ℕ)
    (alphabet : q+2 ≤ 2^bits) (edge_bound : Fintype.card E ≤ 2^(edgeGrowth*scale))
    (volume_bound : (∑ t, length t*Fintype.card (Positions t)) ≤ wordGrowth*scale) :
    Fintype.card ((E × ExactAxis (Positions := Positions) q length totalX profileX) ×
      (E × ExactAxis (Positions := Positions) q length totalY profileY) ×
      (E × ExactAxis (Positions := Positions) q length totalZ profileZ)) ≤
      2^((3*edgeGrowth+3*bits*wordGrowth)*scale) := by
  have bx := Nat.mul_le_mul edge_bound (exact_axis_binary_bound length totalX profileX alphabet volume_bound)
  have by_ := Nat.mul_le_mul edge_bound (exact_axis_binary_bound length totalY profileY alphabet volume_bound)
  have bz := Nat.mul_le_mul edge_bound (exact_axis_binary_bound length totalZ profileZ alphabet volume_bound)
  have combined := Nat.mul_le_mul bx (Nat.mul_le_mul by_ bz)
  simp only [Fintype.card_prod]
  convert combined using 1
  simp only [← pow_add]
  congr 1
  ring

end
end MatrixBounds.Tensor.CW
