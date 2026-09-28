import TensorSymmetry

/-! The inverse-linear concentration bounds feed into explicit symmetric tensor repair. -/
namespace MatrixBounds.Symmetry

noncomputable section
variable {G B : Type*} [Group G] [Fintype G] [Fintype B]
variable [MulAction G B] [MulAction.IsPretransitive G B]

/-- Transitivity converts a scaled hole fraction into the same pointwise failure fraction. -/
theorem misses_scaled_fraction (holes : B → Prop) (part : B) (scale constant : ℕ)
    (small : Nat.card {b // holes b} * scale ≤ constant * Fintype.card B) :
    misses (G := G) holes part * scale ≤ constant * Fintype.card G := by
  have positive : 0 < Fintype.card B := Fintype.card_pos_iff.mpr ⟨part⟩
  have multiplied := Nat.mul_le_mul_left (Fintype.card G) small
  have identity := misses_identity (G := G) holes part
  have rearranged : Fintype.card B * (misses (G := G) holes part * scale) ≤
      Fintype.card B * (constant * Fintype.card G) := by nlinarith
  exact Nat.le_of_mul_le_mul_left rearranged positive

open Tensor Tensor.Repair RepairRates

/-- Inverse-linear hole fractions suffice to construct repair maps under a transitive part action. -/
theorem transitive_linear_repair {K X Y Z BX BY BZ : Type*} [CommSemiring K]
    [Fintype X] [Fintype Y] [Fintype Z] [DecidableEq X] [DecidableEq Y] [DecidableEq Z]
    [Fintype BX] [Fintype BY] [Fintype BZ] [Nonempty BX] [Nonempty BY] [Nonempty BZ]
    [MulAction G BX] [MulAction G BY] [MulAction G BZ]
    [MulAction.IsPretransitive G BX] [MulAction.IsPretransitive G BY] [MulAction.IsPretransitive G BZ]
    (tensor : Coeff K X Y Z) (partX : X → BX) (partY : Y → BY) (partZ : Z → BZ)
    (holesX : BX → Prop) (holesY : BY → Prop) (holesZ : BZ → Prop)
    (growth k constant : ℕ) (positive : 0 < k) (large : 3*constant ≤ k)
    (smallX : Nat.card {b // holesX b} * scale k ≤ constant * Fintype.card BX)
    (smallY : Nat.card {b // holesY b} * scale k ≤ constant * Fintype.card BY)
    (smallZ : Nat.card {b // holesZ b} * scale k ≤ constant * Fintype.card BZ)
    (size : Fintype.card (X × Y × Z) ≤ 2 ^ (growth * scale k)) :
    Nonempty (RepairCertificate tensor (keepPart (G := G) holesX partX)
      (keepPart (G := G) holesY partY) (keepPart (G := G) holesZ partZ) (coverLength growth k)) := by
  let baseX : BX := Classical.choice inferInstance
  let baseY : BY := Classical.choice inferInstance
  let baseZ : BZ := Classical.choice inferInstance
  apply inverse_linear_repair tensor _ _ _ growth k constant
    (misses (G := G) holesX baseX) (misses (G := G) holesY baseY)
    (misses (G := G) holesZ baseZ) positive large
  · intro x
    rw [keepPart_misses, misses_constant holesX (partX x) baseX]
  · intro y
    rw [keepPart_misses, misses_constant holesY (partY y) baseY]
  · intro z
    rw [keepPart_misses, misses_constant holesZ (partZ z) baseZ]
  · exact misses_scaled_fraction holesX baseX _ _ smallX
  · exact misses_scaled_fraction holesY baseY _ _ smallY
  · exact misses_scaled_fraction holesZ baseZ _ _ smallZ
  · exact size

end
end MatrixBounds.Symmetry

namespace MatrixBounds.Tensor.Symmetry

open MatrixBounds.Symmetry RepairRates
noncomputable section

/-- Copies of one symmetric tensor with inverse-linear holes repair it at subexponential rank cost. -/
theorem symmetric_linear_repair_rank {K G X Y Z BX BY BZ : Type*} [CommSemiring K]
    [Group G] [Fintype G] [Fintype X] [Fintype Y] [Fintype Z]
    [DecidableEq X] [DecidableEq Y] [DecidableEq Z]
    [MulAction G X] [MulAction G Y] [MulAction G Z]
    [Fintype BX] [Fintype BY] [Fintype BZ] [Nonempty BX] [Nonempty BY] [Nonempty BZ]
    [MulAction G BX] [MulAction G BY] [MulAction G BZ]
    [MulAction.IsPretransitive G BX] [MulAction.IsPretransitive G BY] [MulAction.IsPretransitive G BZ]
    (tensor : Coeff K X Y Z) (partX : X → BX) (partY : Y → BY) (partZ : Z → BZ)
    (equivX : ∀ (g : G) x, partX (g • x) = g • partX x)
    (equivY : ∀ (g : G) y, partY (g • y) = g • partY y)
    (equivZ : ∀ (g : G) z, partZ (g • z) = g • partZ z)
    (preserves : ∀ (g : G) x y z, tensor (g • x) (g • y) (g • z) = tensor x y z)
    (holesX : BX → Prop) (holesY : BY → Prop) (holesZ : BZ → Prop)
    (growth k constant rank : ℕ) (positive : 0 < k) (large : 3*constant ≤ k)
    (smallX : Nat.card {b // holesX b} * scale k ≤ constant * Fintype.card BX)
    (smallY : Nat.card {b // holesY b} * scale k ≤ constant * Fintype.card BY)
    (smallZ : Nat.card {b // holesZ b} * scale k ≤ constant * Fintype.card BZ)
    (size : Fintype.card (X × Y × Z) ≤ 2 ^ (growth * scale k))
    (budget : RankLE (Repair.broken tensor (keepPart holesX partX)
      (keepPart holesY partY) (keepPart holesZ partZ) (1 : G)) rank) :
    RankLE tensor (2 ^ (3 * coverLength growth k) * rank) := by
  classical
  obtain ⟨certificate⟩ := transitive_linear_repair (G := G) tensor partX partY partZ
    holesX holesY holesZ growth k constant positive large smallX smallY smallZ size
  apply rank_from_certificate tensor _ _ _ _ rank certificate
  intro g
  have moved := moved_holes_rank tensor (MulAction.toPerm g) (MulAction.toPerm g)
    (MulAction.toPerm g) (preserves g) (keepPart holesX partX (1 : G))
    (keepPart holesY partY (1 : G)) (keepPart holesZ partZ (1 : G)) rank budget
  simpa only [Repair.broken, keepPart, Function.comp_def, MulAction.toPerm_apply,
    one_smul, equivX, equivY, equivZ] using moved

end
end MatrixBounds.Tensor.Symmetry
